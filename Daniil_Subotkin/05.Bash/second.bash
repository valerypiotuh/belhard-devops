#!/bin/bash

folder=~/linux-5

find $folder -type f -exec ls -s {} \; | sort -n | head -10

#result:
#0 /home/user/linux-5/arch/arm/mach-imx/Makefile.boot
#0 /home/user/linux-5/arch/loongarch/Kconfig.debug
#0 /home/user/linux-5/arch/riscv/Kconfig.debug
#0 /home/user/linux-5/drivers/staging/axis-fifo/README
#0 /home/user/linux-5/tools/build/tests/ex/empty/Build
#0 /home/user/linux-5/tools/include/linux/nmi.h
#0 /home/user/linux-5/tools/perf/util/help-unknown-cmd.h
#0 /home/user/linux-5/tools/testing/kunit/test_data/test_insufficient_memory.log
#0 /home/user/linux-5/tools/testing/selftests/powerpc/copyloops/asm/asm-compat.h
#0 /home/user/linux-5/tools/testing/selftests/powerpc/copyloops/asm/feature-fixups.h

