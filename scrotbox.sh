#!/bin/bash
scrot -s "$HOME/dropbox/Dropbox/devbook/upload/%Y-%m-%dT%T%z.png" -e '/home/adamryman/bin/dropbox sharelink $f | xsel -i -b'
paste -d '\0' <(xsel -b) <(echo "&raw=1") | xsel -i -b
