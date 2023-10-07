#!/bin/bash

make clean && make mrproper

# Kernel compilation specific details
export KBUILD_BUILD_USER="Chanz22"
KERNEL_BUILD="Re-EvolutionKernel-v1.4-Chanz22-`date '+%Y%m%d-%H%M'`"
TOOLCHAIN=/home/chanz22/toolchains/Linaro_4.9.4/GCC/bin/arm-cortex_a9-linux-gnueabihf-

# zip name
VERSION=Re-evolution-Chanz22

make cm_i9082_defconfig

make -j12

IMAGE="arch/arm/boot/zImage"
if [[ -f "$IMAGE" ]]; then
        KERNELZIP="$VERSION.zip"
	rm AnyKernel3/zImage > /dev/null 2>&1
	rm AnyKernel3/dtb > /dev/null 2>&1
	rm AnyKernel3/*.zip > /dev/null 2>&1
	mv out/dtb.img AnyKernel3/dtb
	mv $IMAGE AnyKernel3/zImage
	cd AnyKernel3
	zip -r9 $KERNELZIP .
fi
