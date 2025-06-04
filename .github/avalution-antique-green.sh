#!/usr/bin/env bash

export PROFILE_NAME="Avalution (Antique Green)"

export COLOR_01="#FFFAED"           # Black (Host)
export COLOR_02="#29675C"           # Red (Syntax string)
export COLOR_03="#29675C"           # Green (Command)
export COLOR_04="#29675C"           # Yellow (Command second)
export COLOR_05="#29675C"           # Blue (Path)
export COLOR_06="#29675C"           # Magenta (Syntax var)
export COLOR_07="#29675C"           # Cyan (Prompt)
export COLOR_08="#29675C"           # White

export COLOR_09="#29675C"           # Bright Black
export COLOR_10="#29675C"           # Bright Red (Command error)
export COLOR_11="#29675C"           # Bright Green (Exec)
export COLOR_12="#29675C"           # Bright Yellow
export COLOR_13="#29675C"           # Bright Blue (Folder)
export COLOR_14="#29675C"           # Bright Magenta
export COLOR_15="#29675C"           # Bright Cyan
export COLOR_16="#29675C"           # Bright White

export BACKGROUND_COLOR="#FFFAED"   # Background
export FOREGROUND_COLOR="#29675C"   # Foreground (Text)

export CURSOR_COLOR="#29675C" # Cursor

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
