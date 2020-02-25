#
# ~/.bash_profile
#

# Bash Completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

for file in ~/.{bashrc,bash_prompt,bash_aliases,bash_keybinds}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file

export EDITOR="nvim"

export http_proxy="http://proxy.ameritas.com:8080"
export https_proxy="http://proxy.ameritas.com:8080"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

