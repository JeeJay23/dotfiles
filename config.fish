alias ls="ls -hN --color=auto --group-directories-first"

abbr -a aptL 'apt list --installed | less'
abbr -a e exit
abbr -a g git
abbr -a gc 'cd ~/repos/dotfiles'
abbr -a gco 'git checkout'
abbr -a gf 'git fetch'
abbr -a gp 'git push'
abbr -a mkd 'mkdir -pv'
abbr -a r ranger
abbr -a s 'sudo apt-get'
abbr -a sn 'shutdown now'
abbr -a v vim
abbr -a ws '/home/silver/repos/pipes.sh/bin/bin/pipes.sh -p 3 -t 1 -r 3000 -R'
abbr -a xc 'xclip -sel clip'

function fish_greeting
    date +%B\ %d\ -\ %A
end

uncap
cat ~/.cache/wal/sequences
