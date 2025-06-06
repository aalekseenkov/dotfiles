#!/usr/bin/env bash

export PROFILE_NAME="Avalution Purple Rain"

export COLOR_01="#F7EFF2"           # Black (Host)
export COLOR_02="#230F5A"           # Red (Syntax string)
export COLOR_03="#230F5A"           # Green (Command)
export COLOR_04="#230F5A"           # Yellow (Command second)
export COLOR_05="#230F5A"           # Blue (Path)
export COLOR_06="#230F5A"           # Magenta (Syntax var)
export COLOR_07="#230F5A"           # Cyan (Prompt)
export COLOR_08="#230F5A"           # White

export COLOR_09="#230F5A"           # Bright Black
export COLOR_10="#230F5A"           # Bright Red (Command error)
export COLOR_11="#230F5A"           # Bright Green (Exec)
export COLOR_12="#230F5A"           # Bright Yellow
export COLOR_13="#230F5A"           # Bright Blue (Folder)
export COLOR_14="#230F5A"           # Bright Magenta
export COLOR_15="#230F5A"           # Bright Cyan
export COLOR_16="#230F5A"           # Bright White

export BACKGROUND_COLOR="#F7EFF2"   # Background
export FOREGROUND_COLOR="#230F5A"   # Foreground (Text)

export CURSOR_COLOR="#230F5A" # Cursor

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
