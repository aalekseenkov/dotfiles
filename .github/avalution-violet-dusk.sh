#!/usr/bin/env bash

export PROFILE_NAME="Avalution Violet Dusk"

export COLOR_01="#F6EFF2"           # Black (Host)
export COLOR_02="#4A447A"           # Red (Syntax string)
export COLOR_03="#4A447A"           # Green (Command)
export COLOR_04="#4A447A"           # Yellow (Command second)
export COLOR_05="#4A447A"           # Blue (Path)
export COLOR_06="#4A447A"           # Magenta (Syntax var)
export COLOR_07="#4A447A"           # Cyan (Prompt)
export COLOR_08="#4A447A"           # White

export COLOR_09="#4A447A"           # Bright Black
export COLOR_10="#4A447A"           # Bright Red (Command error)
export COLOR_11="#4A447A"           # Bright Green (Exec)
export COLOR_12="#4A447A"           # Bright Yellow
export COLOR_13="#4A447A"           # Bright Blue (Folder)
export COLOR_14="#4A447A"           # Bright Magenta
export COLOR_15="#4A447A"           # Bright Cyan
export COLOR_16="#4A447A"           # Bright White

export BACKGROUND_COLOR="#F6EFF2"   # Background
export FOREGROUND_COLOR="#4A447A"   # Foreground (Text)

export CURSOR_COLOR="#4A447A" # Cursor

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
