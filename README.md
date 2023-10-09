# Table of Contents
1. [What is yocto project?](#what-is-yocto-project)
2. [Downloading Yocto](#downloading-yocto)
3. [Create layer and Add wifi](#create-layer-and-add-wifi)
4. [Building a Yocto environment on Raspberry Pi](#building-a-yocto-environment-on-raspberry-pi)
5. [Write Yocto OS on SD card](#write-yocto-os-on-sd-card)
6. [How to add CAN](#how-to-add-can)

## What is Yocto project?

The Yocto Project is an open-source project that provides tools, templates, and methods to help developers create custom Linux-based operating systems and distributions for embedded and IoT (Internet of Things) devices. It is not an operating system itself, but rather a set of tools and guidelines for building customized Linux distributions.

Key components and concepts of the Yocto Project include:

1. Poky: Poky is the reference build system and reference distribution for the Yocto Project. It includes a set of metadata and tools for building Linux distributions.
2. OpenEmbedded-Core: This is the core build system within the Yocto Project, providing recipes (configuration files) for building packages and images.
3. BitBake: BitBake is the build tool used by the Yocto Project to execute tasks, such as fetching source code, compiling software, and creating package feeds.
4. Layers: The Yocto Project uses a layered architecture where you can add custom layers to extend and customize your distribution. Layers can contain recipes, configuration files, and other resources.
5. Metadata and Recipes: Recipes are configuration files that describe how to build a specific package or component. Metadata includes these recipes and other configuration information.
6. Images: The Yocto Project allows you to create custom Linux images tailored to the requirements of your embedded or IoT device. These images can include the kernel, file system, and user-space software.
7. Cross-Compilation: Since embedded and IoT devices often have limited resources compared to traditional desktop or server systems, cross-compilation is a common practice in the Yocto Project. It allows developers to build software on a more powerful host system and target the architecture of the embedded device.
8. Extensibility: The Yocto Project is highly extensible, and developers can customize their Linux distributions to include specific packages, configurations, and features tailored to their project's needs.

The Yocto Project is widely used in the embedded and IoT industry because it provides a standardized and reproducible way to create customized Linux distributions for a wide range of hardware platforms. It enables developers to have full control over their software stack, optimize for resource-constrained environments, and manage their software supply chain efficiently.

## Downloading Yocto

bitbake in the qemu environment is faster, things that can be run with qemu are built first.

1. **Download poky (we used kirkstone)**

```cpp
git clone -b kirkstone git://git.yoctoproject.org/poky.git
```

2. **Download essential layer**

```cpp
cd poky
git clone -b kirkstone git://git.openembedded.org/meta-openembedded
```

- All layers have to set same version ( In this case, kirkstone)

3. ****************************************Add on bblayers.conf****************************************

```cpp
cd poky/build/conf
nano bblayers.conf
```

- Add following this line
    
    ```cpp
    /home/username/yocto/poky/meta-openembedded/meta-oe \
    /home/username/yocto/poky/meta-openembedded/meta-multimedia \
    /home/username/yocto/poky/meta-openembedded/meta-networking \
    /home/username/yocto/poky/meta-openembedded/meta-perl \
    /home/username/yocto/poky/meta-openembedded/meta-python \
    ```
    

4. **Define the number of cores to use in local.conf**

```cpp
cd poky/build/conf
nano local.conf
```

- Add following this line
    - Check the number of cores of the CPU  ( In this case, 20)
    
    ```cpp
    # Uncomment and set to allow bitbake to execute multiple tasks at once. 
    # For a quadcore, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would 
    # be appropriate. 
    BB_NUMBER_THREADS = "20" 
    # Also, make can be passed flags so it run parallel threads e.g.: 
    PARALLEL_MAKE = "-j 20"
    ```
    

## Create layer and Add wifi

1. **Enable systemd**

```cpp
cd ~/yocto/poky/build/conf
nano local.conf
```

- Add following this line
    
    ```cpp
    # To use init manager as systemd
    DISTRO_FEATURES:append = " systemd"
    DISTRO_FEATURES:remove = " sysvinit"
    VIRTUAL-RUNTIME_init_manager = "systemd"
    VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
    DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
    VIRTUAL-RUNTIME_initscript = "systemd-compat-units"
    ```
    

2. **Enable wifi**

```cpp
cd ~/yocto/poky/build/conf
nano local.conf
```

- Add this line
    
    ```cpp
    # Wifi
    IMAGE_INSTALL:append = " wpa-supplicant"
    ```
    
    (When entering IMAGE_INSTALL:append, you must enter a space as shown above to add it.)
    
3. ************************Create layer************************

```cpp
cd ~/yocto/poky
bitbake-layers create-layer meta-mylayer
```

When u make your layer first, don’t use mkdir. You must use above command line.

```cpp
cd poky/meta-mylayer
mkdir -p recipes-example/wifi
cd recipes-example/wifi
nano systemd_%.bbappend
```

- systemd_%.bbapend
    
    ```cpp
    FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
    PACKAGECONFIG:append = " networkd resolved"
    SRC_URI += " file://wlan.network"
    FILES:${PN} += " ${sysconfdir}/systemd/network/wlan.network"
    do_install:append() {
        install -d ${D}${sysconfdir}/systemd/network
        install -m 0644 ${WORKDIR}/wlan.network ${D}${sysconfdir}/systemd/network
    }
    ```
    

```cpp
cd ~/yocto/poky/meta-mylayer/recipes-example/wifi
vim wpa-supplicant_%.bbappend
```

- wpa-supplicant_%.bbappend
    
    ```cpp
    FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
    SRC_URI += "file://wpa_supplicant-nl80211-wlan0.conf"
    ### SYSTEMD_SERVICE:${PN}:append = " wpa_supplicant-nl80211@wlan0.service"
    do_install:append () {
       install -d ${D}${sysconfdir}/wpa_supplicant/
       install -D -m 600 ${WORKDIR}/wpa_supplicant-nl80211-wlan0.conf \ 
           ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant-nl80211-wlan0.conf
       install -d ${D}${sysconfdir}/systemd/system/multi-user.target.wants/
       ln -s ${systemd_unitdir}/system/wpa_supplicant-nl80211@.service \
       	   ${D}${sysconfdir}/systemd/system/multi-user.target.wants/wpa_supplicant-nl80211@wlan0.service
    }
    ```
    

```cpp
cd ~/yocto/poky/meta-mylayer/recipes-example/wifi
mkdir files
cd files
nano wlan.network
```

- wlan.network
    
    ```cpp
    [Match]
    Name=wlan*
        
    [Network]
    DHCP=v4
        
    [DHCPv4]
    UseHostname=false
    ```
    

```cpp
cd ~/yocto/poky/meta-mylayer/recipes-example/wifi/files
nano wpa_supplicant-nl80211-wlan0.conf
```

- wpa_supplicant-nl80211-wlan0.conf
    
    ```cpp
    ctrl_interface=/var/run/wpa_supplicant
    update_config=1
    network={
        ssid="MYSSID"
        psk="MY-SECURE-PASSKEY"
    }
    ```

## **Building a Yocto environment on Raspberry Pi**

1. **Install meta-raspberrypi layer**

```cpp
cd poky
git clone -b kirkstone git://git.yoctoproject.org/meta-raspberrypi
```

2. **Add meta-raspberrypi layer on bblayers.conf**

```cpp
cd poky/build
bitbake-layers add-layer ../meta-raspberrypi
```

3. **Update machine and set for sdcard**

```cpp
cd ~/yocto/poky/build/conf
nano local.conf
```

- Add this line
    
    `MACHINE ??= "qemux86-64"` -> `MACHINE = "raspberrypi4-64"`
    
    ```cpp
    MACHINE = "raspberrypi4-64"
    
    # For SD card image 
    IMAGE_FSTYPES = "rpi-sdimg"
    ```
    

4. **Edit raspberrypi4-64.conf**

```cpp
cd ~/yocto/poky/meta-raspberrypi/conf/machine
vim raspberrypi4-64.conf
```

- Add this line
    
    ```cpp
    //VC4DTBO ?= "vc4-kms-v3d"
    VC4DTBO ?= "vc4-fkms-v3d-pi4"
    ```
    
5. **build**

```cpp
cd ~/yocto/poky
source oe-init-build-env
bitbake core-image-base
```

## Write **Yocto OS on SD card**

1. Find SD card

```cpp
sudo fdisk -l
```

2. After bitbake, write on your SD card

```cpp
cd ~/yocto/poky/build/tmp/deploy/images/raspberrypi4-64
sudo dd if=core-image-base-raspberrypi4-64-20231001112357.rootfs.rpi-sdimg of=/dev/sda
sync
```

don’t miss sync

## How to add CAN

[Model : waveshare 2ch CAN FD Hat](https://www.waveshare.com/wiki/2-CH_CAN_FD_HAT)

```cpp
cd poky/build/conf
nano local.conf
```

- Add this line
    
    ```cpp
    IMAGE_INSTALL:append = " can-utils libsocketcan"
    ENABLE_I2C = "1"
    KERNEL_MODULE_AUTOLOAD:rpi += "i2c-dev i2c-bcm2708"
    ENABLE_SPI_BUS = "1"
    
    RPI_EXTRA_CONFIG = " \n\
    dtoverlay=spil-3cs \n\
    dtoverlay=mcp251xfd,spi0-0,interrupt=25 \n\
    dtoverlay=mcp251xfd,spi1-0,interrupt=24 \n\
    "
    
    KERNEL_DEVICETREE:append = "overlays/mcp251xfd.dtbo"
    ```
