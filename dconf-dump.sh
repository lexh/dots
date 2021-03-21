#!/usr/bin/env bash

dconf dump /org/gnome/desktop/input-sources/ > org.gnome.desktop.input-sources.dconf
dconf dump /org/gnome/desktop/peripherals/keyboard/ > org.gnome.desktop.peripherals.keyboard.dconf
