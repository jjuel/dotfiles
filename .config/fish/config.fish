if not set -q __fish_prompt_hostname
	set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
end

# set RUST_SRC_PATH ~/.local/src/rust
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'no'
set __fish_git_prompt_showuntrackedfiles 'no'
set __fish_git_prompt_showupstream 'no'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars

function fish_prompt
	set last_status $status

	set_color red 
	printf "["
	set_color yellow
	printf "%s" "$USER"
	set_color green
	printf "@"
	set_color blue
	printf "%s" "$__fish_prompt_hostname"
	set_color magenta
	printf " %s" "$PWD"
	set_color red
	printf "] "
	set_color normal

	printf "%s" (__fish_git_prompt)
	set_color normal

	printf "%s\n" ""
	set_color yellow
	printf "%s" "❯"
	set_color blue
	printf "%s" "❯"
	set_color magenta
	printf "%s " "❯"
	set_color normal
end

# Abbreviations
abbr g "git"
abbr gs "git status"
abbr ga "git add"
abbr gpl "git pull"
abbr gpu "git push"
abbr gcm "git commit -m"
abbr gd "git diff"
abbr gco "git checkout"
abbr gb "git branch"

abbr ll "ls -la"
abbr la "ls -a"
abbr sudo "doas"
abbr gcc "egcc"
