# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Keep 100,000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.



# All system files
for file in $(find $HOME/system/system -mindepth 1 | sort);
do
    if [ -f $file ]; then
        . $file
    fi
done

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Load aliases and shortcuts if existent.
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"

source ~/.zsh/zsh_highlight

# Load Plugins; should be last.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# source /usr/share/autojump/autojump.zsh 2>/dev/null
[[ -s /home/steven/.autojump/etc/profile.d/autojump.sh ]] && source /home/steven/.autojump/etc/profile.d/autojump.sh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
