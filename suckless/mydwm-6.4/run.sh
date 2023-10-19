#!/usr/bin/bash
rm config.h patches.h
make clean && make && sudo make install

