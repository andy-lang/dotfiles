setopt completealiases

# Currently using bash aliases to preserve legacy on uni servers
#if [ -f ~/.bash_aliases ]; then
	#. ~/.bash_aliases
#fi

# Basic terminal commands
function help () {
	help $* | less
}
alias cls='clear'
alias quit='exit'
alias :q='exit'
alias :qa='exit'

# Directory movement & management
function brow() {
	if [ $# = 0 ]; then
		nautilus . &
	else
		nautilus $* &
	fi
}

function cs() {
	# cd to a directory and list it
	cd $1
	ls
}

function mc() {
	# Make a directory, cd to it
	mkdir $*
	cd $1
}

function size() {
	du -k $*
}
alias cd..='cd ..'
alias ll='ls -alF'
alias la='ls -A'
alias mkdir='mkdir -p'
alias mk='mkdir'

# Programming
function sv() {
    upperdir=~/svnRepo/2015/s2
    if [ $# != 0 ]; then
        if [ -d $upperdir/$1 ]; then
            cd $upperdir/$1
        fi
    elif [ $# = 0 ]; then
		cd $upperdir
    fi
}
alias gfort='gfortran'
# alias viml="~/.tmux/scripts/omnivim.sh --vimcmd gvim --vimflags \"-v\" --lit"
# alias vim="~/.tmux/scripts/omnivim.sh --vimcmd gvim --vimflags \"-v\""
alias viml="python ~/.tmux/scripts/omnivim.py --lit"
alias vim="python ~/.tmux/scripts/omnivim.py"
export OMNIVIM_EDITOR=nvim

# Git. Most of the others are covered by OMZ's git plugin
alias git=hub # always use Github's nifty plugin
alias gpom='git push origin master'
alias gun='git checkout --' # "git undo"

# aliases for svn
alias sva='svn add'
alias svc='svn commit'
alias svd='svn diff'
alias svl='svn log'
alias svm='svn move'
alias svmk='svn mkdir --parents'
alias svr='svn revert'
alias svrr='svn revert --depth=infinity'
alias svs='svn status'
alias svu='svn update'
alias svrm='svn delete'
alias svrmk='svn delete --keep-local'

# command to start streaming to Twitch
streaming() {
     INRES="1366x768" # input resolution
     OUTRES="1366x768" # output resolution
     FPS="15" # target FPS
     GOP="30" # i-frame interval, should be double of FPS, 
     GOPMIN="15" # min i-frame interval, should be equal to fps, 
     THREADS="2" # max 6
     CBR="1000k" # constant bitrate (should be between 1000k - 3000k)
     QUALITY="ultrafast"  # one of the many FFMPEG preset
     AUDIO_RATE="44100"
     STREAM_KEY="$1" # use the terminal command Streaming streamkeyhere to stream your video to twitch or justin
     SERVER="live-fra" # twitch server in frankfurt, see http://bashtech.net/twitch/ingest.php for list
     
     ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f alsa -i pulse -f flv -ac 2 -ar $AUDIO_RATE \
       -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
       -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
       -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
 }
