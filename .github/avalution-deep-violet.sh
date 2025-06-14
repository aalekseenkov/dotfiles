#!/usr/bin/env bash

export PROFILE_NAME="Avalution Deep Violet"

export COLOR_01="#E4CED0"           # Black (Host)
export COLOR_02="#330066"           # Red (Syntax string)
export COLOR_03="#330066"           # Green (Command)
export COLOR_04="#330066"           # Yellow (Command second)
export COLOR_05="#330066"           # Blue (Path)
export COLOR_06="#330066"           # Magenta (Syntax var)
export COLOR_07="#330066"           # Cyan (Prompt)
export COLOR_08="#330066"           # White

export COLOR_09="#330066"           # Bright Black
export COLOR_10="#330066"           # Bright Red (Command error)
export COLOR_11="#330066"           # Bright Green (Exec)
export COLOR_12="#330066"           # Bright Yellow
export COLOR_13="#330066"           # Bright Blue (Folder)
export COLOR_14="#330066"           # Bright Magenta
export COLOR_15="#330066"           # Bright Cyan
export COLOR_16="#330066"           # Bright White

export BACKGROUND_COLOR="#E4CED0"   # Background
export FOREGROUND_COLOR="#330066"   # Foreground (Text)

export CURSOR_COLOR="#330066" # Cursor

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
