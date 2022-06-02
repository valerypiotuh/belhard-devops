#!/bin/bash

echo ===============================================================================

set -e

bash ./avrdude-chip-erase.sh

bash ./avrdude-fuse-program.sh
bash ./avrdude-fuse-verify.sh

bash ./avrdude-eeprom-program.sh
bash ./avrdude-eeprom-verify.sh

bash ./avrdude-flash-program.sh
bash ./avrdude-flash-verify.sh

bash ./avrdude-lock-program.sh
bash ./avrdude-lock-verify.sh
bash ./avrdude-lock-verify-extra.sh

echo "SUCCESS ALL!"