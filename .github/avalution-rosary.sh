#!/usr/bin/env bash

export PROFILE_NAME="Avalution Rosary"

export COLOR_01="#E9D9E2"           # Black (Host)
export COLOR_02="#BD0067"           # Red (Syntax string)
export COLOR_03="#00AC7E"           # Green (Command)
export COLOR_04="#BF9C00"           # Yellow (Command second)
export COLOR_05="#006BA9"           # Blue (Path)
export COLOR_06="#A9009A"           # Magenta (Syntax var)
export COLOR_07="#008AB1"           # Cyan (Prompt)
export COLOR_08="#B7B7C6"           # White

export COLOR_09="#535373"           # Bright Black
export COLOR_10="#BD0067"           # Bright Red (Command error)
export COLOR_11="#00AC7E"           # Bright Green (Exec)
export COLOR_12="#BF9C00"           # Bright Yellow
export COLOR_13="#006BA9"           # Bright Blue (Folder)
export COLOR_14="#A9009A"           # Bright Magenta
export COLOR_15="#008AB1"           # Bright Cyan
export COLOR_16="#B7B7C6"           # Bright White

export BACKGROUND_COLOR="#E9D9E2"   # Background
export FOREGROUND_COLOR="#000099"   # Foreground (Text)

export CURSOR_COLOR="#000099" # Cursor

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
