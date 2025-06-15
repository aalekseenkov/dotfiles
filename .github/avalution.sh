#!/usr/bin/env bash

export PROFILE_NAME="Avalution"

export COLOR_01="#2E465D"           # Black (Host)
export COLOR_02="#F17C78"           # Red (Syntax string)
export COLOR_03="#68D0AB"           # Green (Command)
export COLOR_04="#F1D078"           # Yellow (Command second)
export COLOR_05="#6699CC"           # Blue (Path)
export COLOR_06="#D6C7DD"           # Magenta (Syntax var)
export COLOR_07="#6ABED4"           # Cyan (Prompt)
export COLOR_08="#B8BFC7"           # White

export COLOR_09="#5179A2"           # Bright Black
export COLOR_10="#F17C78"           # Bright Red (Command error)
export COLOR_11="#68D0AB"           # Bright Green (Exec)
export COLOR_12="#F1D078"           # Bright Yellow
export COLOR_13="#6699CC"           # Bright Blue (Folder)
export COLOR_14="#D6C7DD"           # Bright Magenta
export COLOR_15="#6ABED4"           # Bright Cyan
export COLOR_16="#B8BFC7"           # Bright White

export BACKGROUND_COLOR="#2E465D"   # Background
export FOREGROUND_COLOR="#E0EBF6"   # Foreground (Text)

export CURSOR_COLOR="#E0EBF6" # Cursor

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
