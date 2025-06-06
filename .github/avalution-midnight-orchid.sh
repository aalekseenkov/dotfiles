#!/usr/bin/env bash

export PROFILE_NAME="Avalution Midnight Orchid"

export COLOR_01="#F7F2F0"           # Black (Host)
export COLOR_02="#895281"           # Red (Syntax string)
export COLOR_03="#895281"           # Green (Command)
export COLOR_04="#895281"           # Yellow (Command second)
export COLOR_05="#895281"           # Blue (Path)
export COLOR_06="#895281"           # Magenta (Syntax var)
export COLOR_07="#895281"           # Cyan (Prompt)
export COLOR_08="#895281"           # White

export COLOR_09="#895281"           # Bright Black
export COLOR_10="#895281"           # Bright Red (Command error)
export COLOR_11="#895281"           # Bright Green (Exec)
export COLOR_12="#895281"           # Bright Yellow
export COLOR_13="#895281"           # Bright Blue (Folder)
export COLOR_14="#895281"           # Bright Magenta
export COLOR_15="#895281"           # Bright Cyan
export COLOR_16="#895281"           # Bright White

export BACKGROUND_COLOR="#F7F2F0"   # Background
export FOREGROUND_COLOR="#895281"   # Foreground (Text)

export CURSOR_COLOR="#895281" # Cursor

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
