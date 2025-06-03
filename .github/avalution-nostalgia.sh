#!/usr/bin/env bash

export PROFILE_NAME="Avalution Nostalgia"

export COLOR_01="#147A7D"           # Black (Host)
export COLOR_02="#E9EFEF"           # Red (Syntax string)
export COLOR_03="#E9EFEF"           # Green (Command)
export COLOR_04="#E9EFEF"           # Yellow (Command second)
export COLOR_05="#E9EFEF"           # Blue (Path)
export COLOR_06="#E9EFEF"           # Magenta (Syntax var)
export COLOR_07="#E9EFEF"           # Cyan (Prompt)
export COLOR_08="#E9EFEF"           # White

export COLOR_09="#E9EFEF"           # Bright Black
export COLOR_10="#E9EFEF"           # Bright Red (Command error)
export COLOR_11="#E9EFEF"           # Bright Green (Exec)
export COLOR_12="#E9EFEF"           # Bright Yellow
export COLOR_13="#E9EFEF"           # Bright Blue (Folder)
export COLOR_14="#E9EFEF"           # Bright Magenta
export COLOR_15="#E9EFEF"           # Bright Cyan
export COLOR_16="#E9EFEF"           # Bright White

export BACKGROUND_COLOR="#147A7D"   # Background
export FOREGROUND_COLOR="#E9EFEF"   # Foreground (Text)

export CURSOR_COLOR="#E9EFEF" # Cursor

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
