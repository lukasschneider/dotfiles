sleep 2 && {
  jetbrains-toolbox --minimize &
  picom &
  nm-applet &
  betterlockscreen ~/Pictures/backgrounds/bg.png &
} &

xset r rate 300 40

setxkbmap -option caps:none

xrdb <(echo "Xcursor.size: 24")
xrdb ~/.Xresources

exec i3
