autoload -Uz promptinit
promptinit

OHMY=/home/michal/build/oh-my-zsh
# load the configs
for config_file ($OHMY/lib/*.zsh) source $config_file

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3 numeric
zstyle :compinstall filename '/home/michal/.zshrc'

unsetopt nomatch

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
# End of lines configured by zsh-newuser-install

#source /etc/profile.d/autojump.zsh
source $HOME/.nix-profile/etc/profile.d/autojump.sh
# Autojump
#function autojmp {
#    echo `autojump $1`
#    cd `autojump $1`
#}

function randhex {
    cat /dev/urandom | hexdump -C | grep --color=auto 'ca fe'
}

#alias j=autojmp

## My stuff
alias ls='ls --color'
alias l='ls -lh'
alias lh='ls --hide="*.pyc"'
alias ys='yaourt -S --noconfirm'
alias yss='yaourt -Ss'
alias ysu='yaourt -Suy --aur'
alias mplayer="mplayer -softvol -cache 8912 -cache-min 40"
alias ssa='ssh samba@192.168.1.200'
alias compile_vbox='dkms install vboxhost/$(pacman -Q virtualbox|awk {'print $2'}|sed 's/\-.\+//') -k $(uname -rm|sed 's/\ /\//')'
alias get-webcam='ffmpeg -f alsa -i default -f v4l2 -r 25 -s 1280x720 -input_format mjpeg -i /dev/video0 -vcodec libx264 -b 2772k -bt 2772k -s hd720 -sws_flags lanczos -threads 0 -strict -2'
alias record_webcam='ffmpeg -f v4l2 -r 25 -s 1280x720 -input_format mjpeg -i /dev/video0 -b 5000k '
alias chromium='chromium --disk-cache-dir=/tmp/chromium'
alias ci='cabal install -j3'
alias fucking='sudo'
alias fail='echo -e "\n\033[1;31m   YOURE DOING IT WRONG\033[0m\n"'
alias emerge='emerge --quiet'
alias xclip='xclip -selection c'
alias ci='cabal install -j4 --disable-library-profiling --disable-executable-profiling --disable-documentation --disable-coverage --disable-benchmarks'

export EDITOR='vim'
export PATH=$PATH:$HOME/.cabal/bin:/home/michal/.bin/npm/bin:/home/michal/.bin/gem/bin
export GEM_HOME=/home/michal/.bin/gem
export CHROME_BIN=chromium


# Keychain management
#keychain -q $HOME/.ssh/id_rsa
#source $HOME/.keychain/epic-sh-gpg

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

# load the theme
DEFAULT_USER=michal
THEME='kardan'
THEME_PATH=/home/michal/build/oh-my-zsh/themes/$THEME.zsh-theme
source $THEME_PATH

# 32 bit java
#export JAVA_HOME=/usr/lib/jvm/bin32-java-7-openjdk/jre
#export PATH=/usr/lib/jvm/bin32-java-7-openjdk/jre/bin:$PATH

export TERM="xterm-256color"
export FFMPEG_PATH=`which ffmpeg`
export FFPROBE_PATH=`which ffprobe` 


genpasswd() {
    local l=$1
        [ "$l" == "" ] && l=16
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

export POSTGRES_URL=postgres:postgres:colony@localhost/database

alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias riot='openconnect --juniper -u ext.mkawalec secure.riotgames.com'

export PORT=8001
export JIRA_USER='itengdashmon'
#export JIRA_PASSWORD='Q&PbGPJ9uiUS'
export JIRA_PASSWORD='qeD3QMY-UZJ)'
export RIOTER_API_KEY='719aff7dcd2592383727a0871426cf34'
