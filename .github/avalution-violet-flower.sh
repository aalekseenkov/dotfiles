#!/usr/bin/env bash

export PROFILE_NAME="Avalution Violet Flower"

export COLOR_01="#F7F0F1"           # Black (Host)
export COLOR_02="#42137A"           # Red (Syntax string)
export COLOR_03="#42137A"           # Green (Command)
export COLOR_04="#42137A"           # Yellow (Command second)
export COLOR_05="#42137A"           # Blue (Path)
export COLOR_06="#42137A"           # Magenta (Syntax var)
export COLOR_07="#42137A"           # Cyan (Prompt)
export COLOR_08="#42137A"           # White

export COLOR_09="#42137A"           # Bright Black
export COLOR_10="#42137A"           # Bright Red (Command error)
export COLOR_11="#42137A"           # Bright Green (Exec)
export COLOR_12="#42137A"           # Bright Yellow
export COLOR_13="#42137A"           # Bright Blue (Folder)
export COLOR_14="#42137A"           # Bright Magenta
export COLOR_15="#42137A"           # Bright Cyan
export COLOR_16="#42137A"           # Bright White

export BACKGROUND_COLOR="#F7F0F1"   # Background
export FOREGROUND_COLOR="#42137A"   # Foreground (Text)

export CURSOR_COLOR="#42137A" # Cursor

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
