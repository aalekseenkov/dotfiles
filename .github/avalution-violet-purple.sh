#!/usr/bin/env bash

export PROFILE_NAME="Avalution Violet Purple"

export COLOR_01="#F7F0F1"           # Black (Host)
export COLOR_02="#3A2F52"           # Red (Syntax string)
export COLOR_03="#3A2F52"           # Green (Command)
export COLOR_04="#3A2F52"           # Yellow (Command second)
export COLOR_05="#3A2F52"           # Blue (Path)
export COLOR_06="#3A2F52"           # Magenta (Syntax var)
export COLOR_07="#3A2F52"           # Cyan (Prompt)
export COLOR_08="#3A2F52"           # White

export COLOR_09="#3A2F52"           # Bright Black
export COLOR_10="#3A2F52"           # Bright Red (Command error)
export COLOR_11="#3A2F52"           # Bright Green (Exec)
export COLOR_12="#3A2F52"           # Bright Yellow
export COLOR_13="#3A2F52"           # Bright Blue (Folder)
export COLOR_14="#3A2F52"           # Bright Magenta
export COLOR_15="#3A2F52"           # Bright Cyan
export COLOR_16="#3A2F52"           # Bright White

export BACKGROUND_COLOR="#F7F0F1"   # Background
export FOREGROUND_COLOR="#3A2F52"   # Foreground (Text)

export CURSOR_COLOR="#3A2F52" # Cursor

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
