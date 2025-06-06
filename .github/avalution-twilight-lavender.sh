#!/usr/bin/env bash

export PROFILE_NAME="Avalution Twilight Lavender"

export COLOR_01="#F7F3F0"           # Black (Host)
export COLOR_02="#8A496B"           # Red (Syntax string)
export COLOR_03="#8A496B"           # Green (Command)
export COLOR_04="#8A496B"           # Yellow (Command second)
export COLOR_05="#8A496B"           # Blue (Path)
export COLOR_06="#8A496B"           # Magenta (Syntax var)
export COLOR_07="#8A496B"           # Cyan (Prompt)
export COLOR_08="#8A496B"           # White

export COLOR_09="#8A496B"           # Bright Black
export COLOR_10="#8A496B"           # Bright Red (Command error)
export COLOR_11="#8A496B"           # Bright Green (Exec)
export COLOR_12="#8A496B"           # Bright Yellow
export COLOR_13="#8A496B"           # Bright Blue (Folder)
export COLOR_14="#8A496B"           # Bright Magenta
export COLOR_15="#8A496B"           # Bright Cyan
export COLOR_16="#8A496B"           # Bright White

export BACKGROUND_COLOR="#F7F3F0"   # Background
export FOREGROUND_COLOR="#8A496B"   # Foreground (Text)

export CURSOR_COLOR="#8A496B" # Cursor

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
