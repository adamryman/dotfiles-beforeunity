#!/bin/bash
scrot -s "$HOME/dropbox/Dropbox/devbook/upload/%Y-%m-%dT%T%z.png" -e '/home/adamryman/bin/dropbox sharelink $f | xsel -i -b'
