#!/bin/bash

qemu-system-x86_64 -serial stdio -nographic -monitor none -hda ./boot.bin
