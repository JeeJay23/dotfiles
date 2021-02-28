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
abbr -a ws '/home/silver/repos/pipes.sh/bin/bin/pipes.sh -p 3 -t 5 -r 3000 -R'
abbr -a xc 'xclip -sel clip'
abbr -a t 'task'
abbr -a qnd '~/notebook/quick-notes/'
abbr -a qn 'vim ~/notebook/quick-notes/quick.md'

set PATH ~/.local/bin $PATH

function fish_greeting

end

# cat ~/.cache/wal/sequences
set PATH $PATH /home/silver/scripts/
