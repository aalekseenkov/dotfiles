#!/usr/bin/env bash

export PROFILE_NAME="Avalution Mono"

export COLOR_01="#334D67"           # Black (Host)
export COLOR_02="#F19378"           # Red (Syntax string)
export COLOR_03="#6ABED4"           # Green (Command)
export COLOR_04="#70CAE1"           # Yellow (Command second)
export COLOR_05="#B8BFC7"           # Blue (Path)
export COLOR_06="#68D0AB"           # Magenta (Syntax var)
export COLOR_07="#68ACD0"           # Cyan (Prompt)
export COLOR_08="#B8BFC7"           # White

export COLOR_09="#6ABED4"           # Bright Black
export COLOR_10="#F19378"           # Bright Red (Command error)
export COLOR_11="#6ABED4"           # Bright Green (Exec)
export COLOR_12="#70CAE1"           # Bright Yellow
export COLOR_13="#B8BFC7"           # Bright Blue (Folder)
export COLOR_14="#68D0AB"           # Bright Magenta
export COLOR_15="#68ACD0"           # Bright Cyan
export COLOR_16="#B8BFC7"           # Bright White

export BACKGROUND_COLOR="#334D67"   # Background
export FOREGROUND_COLOR="#D6E6F5"   # Foreground (Text)

export CURSOR_COLOR="#D6E6F5" # Cursor

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
