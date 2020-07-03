#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

ln -sf $SCRIPT_DIR/xmonad/xmonad.hs ~/.config/xmonad/xmonad.hs
