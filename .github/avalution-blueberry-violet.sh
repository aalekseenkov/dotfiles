#!/usr/bin/env bash

export PROFILE_NAME="Avalution Blueberry Violet"

export COLOR_01="#F7F0F1"           # Black (Host)
export COLOR_02="#3E2A59"           # Red (Syntax string)
export COLOR_03="#3E2A59"           # Green (Command)
export COLOR_04="#3E2A59"           # Yellow (Command second)
export COLOR_05="#3E2A59"           # Blue (Path)
export COLOR_06="#3E2A59"           # Magenta (Syntax var)
export COLOR_07="#3E2A59"           # Cyan (Prompt)
export COLOR_08="#3E2A59"           # White

export COLOR_09="#3E2A59"           # Bright Black
export COLOR_10="#3E2A59"           # Bright Red (Command error)
export COLOR_11="#3E2A59"           # Bright Green (Exec)
export COLOR_12="#3E2A59"           # Bright Yellow
export COLOR_13="#3E2A59"           # Bright Blue (Folder)
export COLOR_14="#3E2A59"           # Bright Magenta
export COLOR_15="#3E2A59"           # Bright Cyan
export COLOR_16="#3E2A59"           # Bright White

export BACKGROUND_COLOR="#F7F0F1"   # Background
export FOREGROUND_COLOR="#3E2A59"   # Foreground (Text)

export CURSOR_COLOR="#3E2A59" # Cursor

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
