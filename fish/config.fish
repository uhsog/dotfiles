# Alias
alias cl='clear'
alias cdw='cd $HOME/workspace'
alias gg='git grep'

# ENV
set -U FZF_LEGACY_KEYBINDINGS 0

# PATH
# set -x PATH /target/path $PATH

# Fish git prompt
set __fish_git_prompt_show_informative_status 'yes'

# Status Chars
set __fish_git_prompt_char_cleanstate '✔'
set __fish_git_prompt_char_dirtystate '∆'
set __fish_git_prompt_char_stagedstate '≫'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'
