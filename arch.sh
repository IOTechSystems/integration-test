#!/bin/bash

export EX_ARCH=`uname -m`
case $EX_ARCH in
  armv7l)
    EX_ARCH=arm
  ;;
  aarch64)
    EX_ARCH=arm64
  ;;
  x86_64)
    EX_ARCH=x86_64
  ;;
  *)
    echo "Unsupported: $EX_ARCH"
    exit 2
  ;;
esac
