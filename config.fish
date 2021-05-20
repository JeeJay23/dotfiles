alias ls="ls -hN --color=auto --group-directories-first"

abbr -a aptL 'apt list --installed | less'
abbr -a sa 'sudo apt-get'
abbr -a e exit
abbr -a g git
abbr -a gc 'git commit -m '
abbr -a gco 'git checkout'
abbr -a gf 'git fetch'
abbr -a gp 'git push'
abbr -a gs 'git status'
abbr -a mkd 'mkdir -pv'
abbr -a r ranger
abbr -a p python
abbr -a p3 python3
abbr -a sn 'myshutdown'
abbr -a v vim
abbr -a xc 'xclip -sel clip'
abbr -a t 'task'

function fish_greeting

end

# example for adding dir to PATH
# set PATH $PATH /home/silver/scripts/
