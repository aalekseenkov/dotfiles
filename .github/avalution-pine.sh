#!/usr/bin/env bash

export PROFILE_NAME="Avalution Pine"

export COLOR_01="#158078"           # Black (Host)
export COLOR_02="#D8F0EE"           # Red (Syntax string)
export COLOR_03="#D8F0EE"           # Green (Command)
export COLOR_04="#D8F0EE"           # Yellow (Command second)
export COLOR_05="#D8F0EE"           # Blue (Path)
export COLOR_06="#D8F0EE"           # Magenta (Syntax var)
export COLOR_07="#D8F0EE"           # Cyan (Prompt)
export COLOR_08="#D8F0EE"           # White

export COLOR_09="#D8F0EE"           # Bright Black
export COLOR_10="#D8F0EE"           # Bright Red (Command error)
export COLOR_11="#D8F0EE"           # Bright Green (Exec)
export COLOR_12="#D8F0EE"           # Bright Yellow
export COLOR_13="#D8F0EE"           # Bright Blue (Folder)
export COLOR_14="#D8F0EE"           # Bright Magenta
export COLOR_15="#D8F0EE"           # Bright Cyan
export COLOR_16="#D8F0EE"           # Bright White

export BACKGROUND_COLOR="#158078"   # Background
export FOREGROUND_COLOR="#D8F0EE"   # Foreground (Text)

export CURSOR_COLOR="#D8F0EE" # Cursor

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
