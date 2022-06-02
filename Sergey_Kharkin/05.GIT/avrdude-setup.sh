#!/bin/bash

AVRDUDE=avrdude
AVRDUDEFLAGS="-p m168p -c usbasp -B5"
#AVRDUDEFLAGS="-p m168p -c stk500"
echo AVRDUDEFLAGS:$AVRDUDEFLAGS

FLASHFILE="default/ring.hex"
EEPROMFILE="default/ring.eep"
#FLASHFILE="C:\\Users\\dtatarkin\\prj\\atollit-prj\\ring\\tags\\ring-4.0\\zvonok5m-bin\\zvonok5m-4.0rc-flash.hex"
#EEPROMFILE="C:\\Users\\dtatarkin\\prj\\atollit-prj\\ring\\tags\\ring-4.0\\zvonok5m-bin\\zvonok5m-4.0rc-eeprom.hex"
echo FLASHFILE:$FLASHFILE
echo EEPROMFILE:$EEPROMFILE

LFUSE=0x62
HFUSE=0xd6
EFUSE=0xff

echo LFUSE: $LFUSE
echo HFUSE: $HFUSE
echo EFUSE: $EFUSE

LOCK=0x3c
#LOCK=0x00
#LOCK=0xFF
echo LOCK: $LOCK

function testExitCode {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        echo "ERROR! $@" >&2
    else 
        echo "SUCCESS! $@"
    fi
    return $status
}

function testExitCodeError {
    "$@"
    local status=$?
    if [ $status -eq 0 ]; then
        echo "ERROR! $@" >&2
	return 1
    else 
        echo "SUCCESS! $@"
	return 0
    fi
    
}
