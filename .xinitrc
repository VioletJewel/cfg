#!/usr/bin/dash

if [ "$1" = "xterm" ];
then
  prog="${2:-dwm}";
else
  prog="${1:-dwm}";
fi;

if [ "$prog" = dwmlite ]; then
  xsetroot -cursor_name left_ptr&
  hsetroot -solid '#121212'&
  xset r rate 300 30&
  xset m 5/1 10&
  {
    id="$(xinput --list --id-only 'Elan Touchpad')";
    xinput set-prop $id 'libinput Disable While Typing Enabled' 0;
    xinput set-prop $id 'libinput Horizontal Scroll Enabled' 1;
    xinput set-prop $id 'libinput Tapping Enabled' 0;
    xinput set-prop $id 'libinput Accel Speed' '0.55';

    xmodmap -e "keysym F1 = Pointer_Button1 Pointer_Button1 Pointer_Button1 Pointer_Button1"
    xmodmap -e "keysym F2 = Pointer_Button2 Pointer_Button2 Pointer_Button2 Pointer_Button2"
    xmodmap -e "keysym F3 = Pointer_Button3 Pointer_Button3 Pointer_Button3 Pointer_Button3"

    xmodmap -e "keysym Alt_L = Pointer_Button3 Pointer_Button3 Pointer_Button3 Pointer_Button3"
    # xmodmap -e "keysym Space = Pointer_Button3 Pointer_Button3 Pointer_Button3 Pointer_Button3"

    xkbset m
    xkbset exp '=m'

    xrdb "$HOME"/.Xresources

  }&
  { exec "dwm"; exit "$?"; }
fi;

if [ -f "$HOME"/.Xresources ];
then
  xrdb "$HOME"/.Xresources&
fi;

if [ "$prog" != awesome ];
then
  dunst&
fi;

if [ "$prog" = dwm ];
then
  # "$HOME"/.local/bin/dwmstatus.sh&
  "$HOME"/.local/bin/dwmstatus&
fi;

urxvtd -q -f -o &
# picom --experimental-backends -b&
# picom -b &
# { emacs --daemon && notify-send 'emacs daemon ready'; }&
# nm-applet&
# { redshift -x; redshift -r -P& }&
# { sleep 1; pkill -USR1 -x redshift; }&
"$HOME"/.local/bin/mouse_kbd_setup&

exec "$prog";

# vim: set ft=sh:
