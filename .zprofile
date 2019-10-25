#!/bin/zsh

#Add auto completion support to zsh
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Load the dotfiles
for file in ~/.{aliases,dockerfunc,functions}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file

# Add tab completion for SSH hostnames based on ~/.ssh/config
# ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" \
	-o "nospace" \
	-W "$(grep "^Host" ~/.ssh/config | \
	grep -v "[?*]" | cut -d " " -f2 | \
	tr ' ' '\n')" scp sftp ssh
