# Amethyst by m0nica
# Author: Monica Powell
# Repository: https://github.com/m0nica/dotfiles

# Note: designed to be used with a Nerd Font like CaskaydiaCove NF

# a remix of the MIT-licensed Oxide theme for Zsh: https://github.com/dikiaap/dotfiles

# Prompt:
# %F => Color codes
# %f => Reset color
# %~ => Current path
# %(x.true.false) => Specifies a ternary expression
#   ! => True if the shell is running with root privileges
#   ? => True if the exit status of the last command was success
#
# Git:
# %a => Current action (rebase/merge)
# %b => Current branch
# %c => Staged changes
# %u => Unstaged changes
#
# Terminal:
# \n => Newline/Line Feed (LF)



#  echo "_._______"
#  echo "| _______ |"
#  echo "||,-----.||"
#  echo "|||     |||    __  __             _                _"
#  echo "|||_____|||   |  \/  | ___  _ __ (_) ___ __ _   __| | _____   __"
#  echo "|\`-------'|   | |\/| |/ _ \| '_ \| |/ __/ _\` | / _\` |/ _ \ \ / /" 
#  echo "| +     O |   | |  | | (_) | | | | | (_| (_| || (_| |  __/\ V /" 
#  echo "|      O  |   |_|  |_|\___/|_| |_|_|\___\__,_(_)__,_|\___| \_/            "
#  echo "| / /  ##,|"
#  echo " -------' "

#  echo "___"
#  echo "|[_]|"
#  echo "|+ ;|"
#  echo "`---'"


setopt PROMPT_SUBST

autoload -U add-zsh-hook
autoload -Uz vcs_info

# Use True color (24-bit) if available.
if [[ "${terminfo[colors]}" -ge 256 ]]; then
    oxide_turquoise="%F{80}"
    oxide_orange="%F{179}"
    oxide_red="%F{167}"
    oxide_lavendar="%F{141}"
else
    oxide_turquoise="%F{cyan}"
    oxide_orange="%F{yellow}"
    oxide_red="%F{red}"
    oxide_lavendar="%F{purple}"
fi

# Reset color.
oxide_reset_color="%f"

# VCS style formats.
FMT_UNSTAGED="%{$oxide_reset_color%} %{$oxide_orange%}●"
FMT_STAGED="%{$oxide_reset_color%} %{$oxide_lavendar%}✚"
FMT_ACTION="(%{$oxide_lavendar%}%a%{$oxide_reset_color%})"
# Updated the git branch icon in default 'Oxide theme' from  => 
FMT_VCS_STATUS=" %{$oxide_turquoise%} %b%u%c%{$oxide_reset_color%}"

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr    "${FMT_UNSTAGED}"
zstyle ':vcs_info:*' stagedstr      "${FMT_STAGED}"
zstyle ':vcs_info:*' actionformats  "${FMT_VCS_STATUS} ${FMT_ACTION}"
zstyle ':vcs_info:*' formats        "${FMT_VCS_STATUS}"
zstyle ':vcs_info:*' nvcsformats    ""
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Check for untracked files.
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
            git status --porcelain | grep --max-count=1 '^??' &> /dev/null; then
        hook_com[staged]+="%{$oxide_reset_color%} %{$oxide_red%}●"
    fi
}

# Executed before each prompt.
add-zsh-hook precmd vcs_info

# Oxide prompt style.
PROMPT=$'\n%{$oxide_lavendar%}%~%{$oxide_reset_color%} ${vcs_info_msg_0_}\n%(?.%{%F{white}%}.%{$oxide_red%})%(!.#.❯)%{$oxide_reset_color%} '




 echo -e " ___"
 echo "|[_]|"
 echo "|+ ;|"
 echo "\`---'" 


#   echo "             *"
#   echo "           * | *"
#   echo "     * * * \\|O|/ * * *"
#   echo "      \\o\\o\\o|O|o/o/o/"
#   echo "      (<><><>O<><><>)"
#   echo "       '==========='"

 export QUOTEY_CUSTOM_FOLDER="/Users/monica/Dev/dotfiles/"
 # npm install -g  quotey in order to display quotes on startup
 quotey -c "terminal-quotes.json"


