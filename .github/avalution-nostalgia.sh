#!/usr/bin/env bash

export PROFILE_NAME="Avalution Nostalgia"

export COLOR_01="#147A7D"           # Black (Host)
export COLOR_02="#D8EFF0"           # Red (Syntax string)
export COLOR_03="#D8EFF0"           # Green (Command)
export COLOR_04="#D8EFF0"           # Yellow (Command second)
export COLOR_05="#D8EFF0"           # Blue (Path)
export COLOR_06="#D8EFF0"           # Magenta (Syntax var)
export COLOR_07="#D8EFF0"           # Cyan (Prompt)
export COLOR_08="#D8EFF0"           # White

export COLOR_09="#D8EFF0"           # Bright Black
export COLOR_10="#D8EFF0"           # Bright Red (Command error)
export COLOR_11="#D8EFF0"           # Bright Green (Exec)
export COLOR_12="#D8EFF0"           # Bright Yellow
export COLOR_13="#D8EFF0"           # Bright Blue (Folder)
export COLOR_14="#D8EFF0"           # Bright Magenta
export COLOR_15="#D8EFF0"           # Bright Cyan
export COLOR_16="#D8EFF0"           # Bright White

export BACKGROUND_COLOR="#147A7D"   # Background
export FOREGROUND_COLOR="#D8EFF0"   # Foreground (Text)

export CURSOR_COLOR="#D8EFF0" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+no}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
