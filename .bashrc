# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# history size
export HISTSIZE=100000
export HISTFILESIZE=100000

# set window title
export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

# background image
# export BACKGROUND='/home/shiroha/Pictures/Wallpapers/nord/nordic-wallpapers/wallpapers/earth-in-space.png'
# export BACKGROUND='/home/shiroha/Pictures/Wallpapers/TinySnow/Snipaste_2022-02-02_00-49-18_waifu2x_4x_3n_png.png'
export BACKGROUND='/home/shiroha/Pictures/Wallpapers/genshin/102983717_p0-fotor-20231122233647.png'
# export LOCKSCREEN='/home/shiroha/Pictures/Wallpapers/TinySnow/Snipaste_2022-02-04_22-36-37_waifu2x_4x_3n_png.png'
# export LOCKSCREEN='/home/shiroha/Pictures/Wallpapers/TinySnow/Snipaste_2022-02-06_00-48-21_waifu2x_4x_3n_png.png'
export LOCKSCREEN=$BACKGROUND

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

################################################################################

# alias
. ~/.alias

# unset proxy
git config --unset --global http.proxy

# modulefile path
export MODULEPATH=/usr/local/modulefiles:/opt/nvidia/hpc_sdk/modulefiles:/opt/intel/modulefiles:$MODULEPATH

# LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:/usr/lib64:/usr/lib:$LD_LIBRARY_PATH

# c include path 
export CPATH=/usr/include/eigen3/:/usr/local/include/optim

## softwares
# cuda
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

## gaussian
#export g16root=/home/shiroha/Programs/gaussian/g16c01_avx2
#export GAUSS_SCRDIR=/home/shiroha/scratch/gaussian
#source $g16root/g16/bsd/g16.profile

# cargo softwares
export PATH=/home/shiroha/.cargo/bin:$PATH




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shiroha/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shiroha/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shiroha/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shiroha/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

