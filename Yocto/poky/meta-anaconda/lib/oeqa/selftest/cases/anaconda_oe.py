from oeqa.selftest.case import OESelftestTestCase
from oeqa.core.decorator.depends import OETestDepends
from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_var, runqemu
from oeqa.utils.sshcontrol import SSHControl
import os
import time
import sys

class TestAnacondaOE(OESelftestTestCase):

    # We only want to print runqemu stdout/stderr if there is a test case failure
    buffer = True

    def setUpLocal(self):
        super(TestAnacondaOE, self).setUpLocal()
        self.machine =  'qemux86-64'
        features = 'MACHINE = "%s"\n' % self.machine
        features += 'PACKAGE_CLASSES = "package_rpm"\n'
        features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
        features += 'DISTRO_FEATURES:append = " systemd"\n'
        features += 'DISTRO_FEATURES:append = " pam"\n'
        features += 'DISTRO_FEATURES:append = " ldconfig"\n'
        features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"\n'
        self.write_config(features)
        self.logger.info('local.conf:\n%s' % features)

        bbvars = get_bb_vars(['TOPDIR', 'DEPLOY_DIR_IMAGE', 'BBLAYERS', 'STAGING_BINDIR_NATIVE'], 'qemu-helper-native')

        self.anaconda_distro = "anaconda"
        self.target_recipe = "core-image-minimal"
        self.anaconda_recipe = "core-image-anaconda"
        self.topdir = bbvars['TOPDIR']
        self.vdisk = '%s/hd0.vdisk' % self.topdir
        self.cmd_common = "runqemu slirp kvm"
        self.qemuparams = "-smp 8 -drive file=%s,if=virtio,format=qcow -m 1024 -vnc :4" % self.vdisk
        self.install_timeout = 14400
        self.target_deploy_dir_image = bbvars['DEPLOY_DIR_IMAGE']
        for d in bbvars['BBLAYERS'].split():
            if d.endswith('/meta-anaconda'):
                self.layer_path = d
                break

    def __start_qemu_shutdown_check_if_shutdown_succeeded(self, qemu, timeout):
        # Stop thread will stop the LoggingThread instance used for logging
        # qemu through serial console, stop thread will prevent this code
        # from facing exception (Console connection closed unexpectedly)
        # when qemu was shutdown by the above shutdown command
        qemu.runner.stop_thread()
        time_track = 0
        while True:
            is_alive = qemu.check()
            if not is_alive:
                return True
            if time_track > timeout:
                return False
            time.sleep(1)
            time_track += 1

    def _start_runqemu(self):
        # Test runqemu machine iso
        self.logger.info("start runqemu")
        cmd = "%s %s iso" % (self.cmd_common, self.machine)
        with runqemu(self.anaconda_recipe, ssh=False, launch_cmd=cmd, qemuparams=self.qemuparams) as qemu:
            self.logger.info("runqemu as qemu")
            qemu_shutdown_succeeded = self.__start_qemu_shutdown_check_if_shutdown_succeeded(qemu, self.install_timeout)
            if not qemu_shutdown_succeeded:
                ssh = SSHControl(ip="127.0.0.1", logfile=qemu.sshlog, port="2222")
                for log in ['anaconda.log', 'program.log', 'packaging.log']:
                    self.logger.error("-----------%s----------" % log)
                    status, output = ssh.run("/bin/cat /tmp/%s" % log)
                    self.logger.error(output)

            self.assertTrue(qemu_shutdown_succeeded, 'Failed: %s does not shutdown within timeout(%s)' % (self.machine, self.install_timeout))

            with open(qemu.qemurunnerlog) as f:
                self.assertTrue('media=cdrom' in f.read(), "Failed: %s" % cmd)

    def test_testanaconda_create_target_disk(self):
        # Provide qemu-img
        try:
            bitbake("qemu-helper-native")
        except AssertionError as err:
            self.logger.error("Command failed: %s", str(err))
            sys.exit(1)

        bindir_native = get_bb_var('STAGING_BINDIR_NATIVE', 'qemu-helper-native')
        try:
            runCmd("%s/qemu-img create -f qcow %s 5000M" % (bindir_native, self.vdisk))
        except AssertionError as err:
            self.logger.error("Command failed: %s", str(err))
            runCmd("find %s" % bindir_native)
            sys.exit(1)
        self.logger.info("Create qemu image %s successfully" % self.vdisk)

    @OETestDepends(['anaconda_oe.TestAnacondaOE.test_testanaconda_create_target_disk'])
    def test_testanaconda_build_target_image(self):
        features = 'DISTRO_FEATURES:append = " anaconda-support"\n'
        self.logger.info('extra local.conf:\n%s' % features)
        self.append_config(features)

        # The 1st target build
        try:
            bitbake(self.target_recipe)
        except AssertionError as err:
            self.logger.error("Command failed: %s", str(err))
            sys.exit(1)

        self.logger.info("Build %s successfully" % self.target_recipe)
        res = runCmd("ls %s -al" % self.target_deploy_dir_image, ignore_status=True)
        self.logger.info("ls %s -al\n%s" % (self.target_deploy_dir_image, res.output))

    @OETestDepends(['anaconda_oe.TestAnacondaOE.test_testanaconda_build_target_image'])
    def test_testanaconda_build_pkg_installer_image(self):
        # The 2nd host build with kickstart
        ks_file = os.path.join(self.layer_path, 'example/ks-pkg.cfg')
        features = 'TMPDIR .= "_host"\n'
        features += 'DISTRO = "%s"\n' % self.anaconda_distro
        features += 'INSTALLER_TARGET_BUILD = "%s"\n' % self.topdir
        features += 'INSTALLER_TARGET_IMAGE = "%s"\n' % self.target_recipe
        features += 'KICKSTART_FILE = "%s"\n' % ks_file
        features += 'SYSLINUX_TIMEOUT = "10"\n'
        features += 'INSTALLER_SERIAL = ""\n'
        self.logger.info('extra local.conf:\n%s' % features)
        self.append_config(features)

        try:
            bitbake(self.anaconda_recipe)
        except AssertionError as err:
            self.logger.error("Command failed: %s", str(err))
            sys.exit(1)

    @OETestDepends(['anaconda_oe.TestAnacondaOE.test_testanaconda_build_pkg_installer_image'])
    def test_testanaconda_pkg_install(self):
        features = 'TMPDIR .= "_host"\n'
        features += 'DISTRO = "%s"\n' % self.anaconda_distro
        features += 'INSTALLER_TARGET_BUILD = "%s"\n' % self.topdir
        features += 'INSTALLER_TARGET_IMAGE = "%s"\n' % self.target_recipe
        self.logger.info('extra local.conf:\n%s' % features)
        self.append_config(features)

        self._start_runqemu()

    @OETestDepends(['anaconda_oe.TestAnacondaOE.test_testanaconda_pkg_install'])
    def test_testanaconda_build_imagecopy_installer_image(self):
        # The 2nd host build with kickstart
        ks_file = os.path.join(self.layer_path, 'example/ks-imagecopy.cfg')
        features = 'TMPDIR .= "_host"\n'
        features += 'DISTRO = "%s"\n' % self.anaconda_distro
        features += 'INSTALLER_TARGET_BUILD = "%s/%s-%s.ext4"\n' % (self.target_deploy_dir_image, self.target_recipe, self.machine)
        features += 'KICKSTART_FILE = "%s"\n' % ks_file
        features += 'SYSLINUX_TIMEOUT = "10"\n'
        features += 'APPEND:append = " textinst"\n'
        features += 'INSTALLER_SERIAL = ""\n'
        self.logger.info('extra local.conf:\n%s' % features)
        self.append_config(features)

        try:
            bitbake(self.anaconda_recipe)
        except AssertionError as err:
            self.logger.error("Command failed: %s", str(err))
            sys.exit(1)

    @OETestDepends(['anaconda_oe.TestAnacondaOE.test_testanaconda_build_imagecopy_installer_image'])
    def test_testanaconda_imagecopy_install(self):
        features = 'TMPDIR .= "_host"\n'
        features += 'DISTRO = "%s"\n' % self.anaconda_distro
        features += 'INSTALLER_TARGET_BUILD = "%s/%s-%s.ext4"\n' % (self.target_deploy_dir_image, self.target_recipe, self.machine)
        self.logger.info('extra local.conf:\n%s' % features)
        self.append_config(features)

        self._start_runqemu()

