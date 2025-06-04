#!/usr/bin/env bash

export PROFILE_NAME="Avalution (Pine Green + 4% Blue Tinge)"

export COLOR_01="#E1E8E8"           # Black (Host)
export COLOR_02="#147A7D"           # Red (Syntax string)
export COLOR_03="#147A7D"           # Green (Command)
export COLOR_04="#147A7D"           # Yellow (Command second)
export COLOR_05="#147A7D"           # Blue (Path)
export COLOR_06="#147A7D"           # Magenta (Syntax var)
export COLOR_07="#147A7D"           # Cyan (Prompt)
export COLOR_08="#147A7D"           # White

export COLOR_09="#147A7D"           # Bright Black
export COLOR_10="#147A7D"           # Bright Red (Command error)
export COLOR_11="#147A7D"           # Bright Green (Exec)
export COLOR_12="#147A7D"           # Bright Yellow
export COLOR_13="#147A7D"           # Bright Blue (Folder)
export COLOR_14="#147A7D"           # Bright Magenta
export COLOR_15="#147A7D"           # Bright Cyan
export COLOR_16="#147A7D"           # Bright White

export BACKGROUND_COLOR="#E1E8E8"   # Background
export FOREGROUND_COLOR="#147A7D"   # Foreground (Text)

export CURSOR_COLOR="#147A7D" # Cursor

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
