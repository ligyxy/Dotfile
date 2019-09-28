# ZSH plugins
plugins=(fast-syntax-highlighting zsh-autosuggestions git z aws pip forklift)

# Add option+arrow support to embedded terminal in JetBrains IDE
bindkey "\e\eOD" backward-word
bindkey "\e\eOC" forward-word

# Fix copy&paste issue when suggestion pops up
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste accept-line)

# Remove symbol for partial line
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

# For brew
export PATH="/usr/local/sbin:$PATH"
