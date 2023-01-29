#default programs
export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ANDROID_SDK_ROOT=$HOME/android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$HOME/android/flutter/bin/

export PATH=$PATH:~/.local/bin:~/.local/bin/statusbar
export MOZ_USE_XINPUT2=1

GPG_TTY=$(tty)
export GPG_TTY
