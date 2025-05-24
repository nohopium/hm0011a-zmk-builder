#!/bin/bash

TARGET=$1
CONFIG_DIR=$2
case "$TARGET" in
  "hm0011a_central_dongle" | \
  "hm0011a_central_left" | \
  "hm0011a_central_right" | \
  "hm0011a_peripheral_left" | \
  "hm0011a_peripheral_right")
    echo "TARGET: ${TARGET}"
    ;;
  *)
   echo "Argument must be one of build targets:"
   echo "- hm0011a_central_dongle"
   echo "- hm0011a_central_left"
   echo "- hm0011a_central_right"
   echo "- hm0011a_peripheral_left"
   echo "- hm0011a_peripheral_right"
   exit 1
esac

cd /workspace/zmk/app/
west update
west build \
  -d build/${TARGET} \
  -b seeeduino_xiao_ble \
  -- \
  -DSHIELD="${TARGET} rgbled_adapter" \
  -DZMK_EXTRA_MODULES="/workspace/zmk-modules/zmk-module-hm0011a/;/workspace/zmk-modules/zmk-rgbled-widget/" \
  -DZMK_CONFIG="/workspace/zmk-modules/zmk-config/config"

exit 0
