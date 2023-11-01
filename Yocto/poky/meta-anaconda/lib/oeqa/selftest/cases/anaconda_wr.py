from anaconda_oe import TestAnacondaOE
from oeqa.core.decorator.depends import OETestDepends

class TestAnaconda(TestAnacondaOE):
    def setUpLocal(self):
        super(TestAnaconda, self).setUpLocal()
        self.anaconda_distro = "wrlinux-installer"
        self.anaconda_recipe = 'wrlinux-image-installer'

    def test_testanaconda_create_target_disk(self):
        super(TestAnaconda, self).test_testanaconda_create_target_disk()

    @OETestDepends(['anaconda_wr.TestAnaconda.test_testanaconda_create_target_disk'])
    def test_testanaconda_build_target_image(self):
        super(TestAnaconda, self).test_testanaconda_build_target_image()

    @OETestDepends(['anaconda_wr.TestAnaconda.test_testanaconda_build_target_image'])
    def test_testanaconda_build_pkg_installer_image(self):
        super(TestAnaconda, self).test_testanaconda_build_pkg_installer_image()

    @OETestDepends(['anaconda_wr.TestAnaconda.test_testanaconda_build_pkg_installer_image'])
    def test_testanaconda_pkg_install(self):
        pass

    @OETestDepends(['anaconda_wr.TestAnaconda.test_testanaconda_pkg_install'])
    def test_testanaconda_build_imagecopy_installer_image(self):
        super(TestAnaconda, self).test_testanaconda_build_imagecopy_installer_image()

    @OETestDepends(['anaconda_wr.TestAnaconda.test_testanaconda_build_imagecopy_installer_image'])
    def test_testanaconda_imagecopy_install(self):
        pass
