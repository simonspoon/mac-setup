autoload -Uz compinit
compinit

export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/Users/simonspoon/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
source <(jotdwn completion zsh)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

function mkcd() {
  mkdir -p "$@" && cd "${@: -1}"
}

alias du1="du -h -d 1"
alias cleanobjbin='find . -type d \( -name "obj" -o -name "bin" \) -print0 | xargs -0 rm -rf'
alias ls="eza --icons=always"
alias l="ls -la"
alias cy="pnpm install -g @anthropic-ai/claude-code && claude --dangerously-skip-permissions"
alias cry="crush -y"
# Added by LM Studio CLI (lms)
export PATH="$PATH:~/.cache/lm-studio/bin"
# End of LM Studio CLI section
alias ta="tmux attach-session -t"
alias startdev="~/mac-setup/scripts/dev.applescript"
alias oc='opencode'
alias shelleditlocal="nvim ~/local.zshrc && reloadzsh"
alias shelledit="nvim ~/.zshrc && reloadzsh"
alias reloadzsh='source ~/.zshrc'

export PATH="$PATH:/Users/simonspoon/Library/Android/sdk/platform-tools"
export PATH="$PATH:/Users/simonspoon/Library/Android/sdk/cmdline-tools/latest/bin/"
export PATH="$PATH:/Users/simonspoon/Library/Android/sdk/emulator"
export ANDROID_SDK_ROOT="/Users/simonspoon/Library/Android/sdk"

if [ -f ~/.envs ]; then
  source ~/.envs
fi

if [ -f ~/local.zshrc ]; then
  source ~/local.zshrc
fi
