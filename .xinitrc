sleep 2 && {
  vmware-user &
  jetbrains-toolbox --minimize &
  feh --bg-fill ~/Pictures/backgrounds/bg.jpg
  picom &
  nm-applet &
} &

xset r rate 300 40

setxkbmap -option caps:none

xrdb <(echo "Xcursor.size: 24")

exec i3
