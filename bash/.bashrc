# ~/.bashrc

# Aliases
alias ll="ls -l" 
alias la="ls -a"

# Colors -- ANSI
RESET="\[\e[0m\]"
BLACK="\[\e[30m\]" 
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]" 
CYAN="\[\e[36m\]"
BOLD="\[\e[1m\]"

USER="\u"
HOST="@\h: " 
WDIR="\w "
SEPARATOR="\n$ "


# Git stuff
parse_git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }
# count of commits ahead of branch we currently are
git_ahead_count() {
  # Check if we're in a Git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Get ahead count relative to upstream
  ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
  echo "${ahead:-0}"
}
git_modified_count() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Count modified but unstaged files
  modified=$(git diff --name-only 2>/dev/null | wc -l)

  # Total tracked but not committed
  echo "$modified"
}
git_staged_count() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Count staged files
  staged=$(git diff --cached --name-only 2>/dev/null | wc -l)

  # Total tracked but not committed
  echo "$staged"
}
git_untracked_count() {
  # Exit early if not in a Git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Count untracked files
  count=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l)
  echo "$count"
}
set_git_info() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch=$(parse_git_branch)
    local ahead=$(git_ahead_count)
    local staged=$(git_staged_count)
    local untracked=$(git_untracked_count)
    local modified=$(git_modified_count)

    GIT_INFO="${CYAN}${branch}${RESET} [${BOLD}${GREEN}Ahead: ↑${ahead}${RESET} ${BOLD}${YELLOW}Staged: ~${staged}${RESET} ${BOLD}${MAGENTA}Modified ?${modified}${RESET} ${BOLD}${RED}Untracked: !${untracked}${RESET}]" 
  else
    GIT_INFO=""
  fi
}
__prompt_venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    local venv_name
    venv_name=$(basename "$VIRTUAL_ENV")
    echo "\[\e[38;5;70m\]($venv_name)\[\e[0m\]"
  fi
}

update_prompt(){
  set_git_info
  PS1="$(__prompt_venv) ${BOLD}${MAGENTA}${USER}${HOST}${RESET}${WDIR} ${GIT_INFO}${RESET}${SEPARATOR}"

}

PROMPT_COMMAND=update_prompt
  
