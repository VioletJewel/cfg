
if [ "$0" = "-dash" ] || [ "$0" = "dash" ];
then
  set -o emacs
fi;

PS1='`pwd` $ '

# if [ "$0" = "dash" ] && [ "$TERM" = "linux" ] && [ -z "$DISPLAY" ]; then
#   startx >.xorg.log;
# fi;

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/bin/core_perl:"$HOME"/.local/bin:/bin
export SUDO_EDITOR="/usr/bin/nvim -u NONE"
export EDITOR="/usr/bin/nvim"
export VISUAL="$EDITOR"
export BROWSER="/usr/bin/firefox"
export TERMINAL="/usr/bin/urxvtc"
export XCURSOR_THEME="BMZ-cursor"
export MOZ_USE_XINPUT2=1

# export PYTHONSTARTUP=~/.pythonrc
# export SAL_USE_VCLPLUGIN=gtk # libreoffice
# export _JAVA_AWT_WM_NONREPARENTING=1 # pycharm
# export WINIT_X11_SCALE_FACTOR=1

# autostart venv in new tmux window
# if [ -f "./env/bin/activate" ]; then
#     source ./env/bin/activate
# fi
