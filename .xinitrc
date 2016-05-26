

# to find out more check man pages and 'man xkeyboard-config'
# switchs caps and escape mostly for vim
#setxkbmap -option caps:escape
#setxkbmap -option ctrl:swap_lwin_lctl

# Change key repeat delay and rate
# xset r rate DELAY RATE
# xset r rate 250 50


# more keyboard stuff in here
xmodmap .Xmodmap
xrdb -merge .Xresources
xset r rate 250 50

# Default
. /etc/X11/Xsession
