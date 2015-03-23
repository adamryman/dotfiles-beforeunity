
#to find out more check man pages and 'man xkeyboard-config'
setxkbmap -option caps:escape
#setxkbmap -option ctrl:swap_lwin_lctl

xmodmap .Xmodmap

#Default
. /etc/X11/Xsession
