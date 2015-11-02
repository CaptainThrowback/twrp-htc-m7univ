#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    "/sys/devices/virtual/mem/null",
    "/sys/devices/virtual/misc/fuse",

    "/sys/class/graphics/fb0",


    "/sys/block/mmcblk0",
    "/sys/devices/platform/msm_sdcc.1",
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0",
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001",
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0",


    // M7_U/UL/WLV (GSM & Verizon) "boot"
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p33",

    // M7_U/UL/WLV (GSM & Verizon) "system"     or M7_WLS (Sprint) "boot"
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p35", 

    // M7_U/UL/WLV (GSM & Verizon) "cache"      or M7_WLS (Sprint) "recovery"
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p36", 

    // M7_U/UL/WLV (GSM & Verizon) "userdata"   or M7_WLS (Sprint) "system"
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p37",

    // M7_U/UL/WLV (GSM & Verizon) <dont exist> or M7_WLS (Sprint) "cache" & "userdata"
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p38",
    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p39",


    "/sys/bus/mmc",
    "/sys/bus/mmc/drivers/mmcblk",
    "/sys/bus/sdio/drivers/bcmsdh_sdmmc",
    "/sys/module/mmc_core",
    "/sys/module/mmcblk",

    "/sys/devices/virtual/input*",
    "/sys/class/misc/uinput",

    // for adb
    "/sys/class/tty/ptmx",
//    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p35", //system
//    "/sys/devices/platform/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p36", //cache
    "/sys/class/misc/android_adb",
    "/sys/class/android_usb/android0/f_adb",
    "/sys/bus/usb",

    // USB Drive is in here
    "/sys/devices/platform/msm_hsusb_host*",


    NULL
};
