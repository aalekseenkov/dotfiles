#!/usr/bin/env bash

export PROFILE_NAME="Avalution Hibiscus Purple"

export COLOR_01="#F7F0F0"           # Black (Host)
export COLOR_02="#5B406A"           # Red (Syntax string)
export COLOR_03="#5B406A"           # Green (Command)
export COLOR_04="#5B406A"           # Yellow (Command second)
export COLOR_05="#5B406A"           # Blue (Path)
export COLOR_06="#5B406A"           # Magenta (Syntax var)
export COLOR_07="#5B406A"           # Cyan (Prompt)
export COLOR_08="#5B406A"           # White

export COLOR_09="#5B406A"           # Bright Black
export COLOR_10="#5B406A"           # Bright Red (Command error)
export COLOR_11="#5B406A"           # Bright Green (Exec)
export COLOR_12="#5B406A"           # Bright Yellow
export COLOR_13="#5B406A"           # Bright Blue (Folder)
export COLOR_14="#5B406A"           # Bright Magenta
export COLOR_15="#5B406A"           # Bright Cyan
export COLOR_16="#5B406A"           # Bright White

export BACKGROUND_COLOR="#F7F0F0"   # Background
export FOREGROUND_COLOR="#5B406A"   # Foreground (Text)

export CURSOR_COLOR="#5B406A" # Cursor

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
