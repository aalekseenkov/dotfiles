-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28
config.window_padding = {
  left = 5,
  right = 5,
  top = 4,
  bottom = 0
}

-- Changing the font size and color scheme.

config.font = wezterm.font 'FiraCode Nerd Font'

config.font_size = 15
config.line_height = 1.1

-- Default Color Scheme
config.color_scheme = 'Avalution'
-- config.color_scheme = 'Neobones_light'
-- config.color_scheme = 'Nova (base16)'
-- config.color_scheme = 'Nord (base16)'

-- Avalution's Color Schemes
-- config.color_scheme = 'Avalution'
-- config.color_scheme = 'Avalution_Paper'
-- config.color_scheme = 'Avalution_Flow'

-- favourite light background schemes
-- config.color_scheme = 'Zenbones_light'
-- config.color_scheme = 'Mexico Light (base16)'
-- config.color_scheme = 'Harmonic16 Light (base16)'
-- config.color_scheme = 'Atelier Savanna Light (base16)'

-- favourite dark background schemes
-- config.color_scheme = 'Seoulbones_dark'
-- config.color_scheme = 'Silk Dark (base16)'
-- config.color_scheme = 'Rebecca (base16)'
-- config.color_scheme = 'Ryuuko'

-- to look into in the future to delete or use
-- config.color_scheme = 'Duckbones'
-- config.color_scheme = 'Forestbones_dark'
-- config.color_scheme = 'Forestbones_light'
-- config.color_scheme = 'Kanagawabones'
-- config.color_scheme = 'Neobones_dark'
-- config.color_scheme = 'Neobones_light'
-- config.color_scheme = 'Nordbones'
-- config.color_scheme = 'Rosebones_dark'
-- config.color_scheme = 'Rosebones_light'
-- config.color_scheme = 'Seoulbones_dark'
-- config.color_scheme = 'Seoulbones_light'
-- config.color_scheme = 'Tokyobones_dark'
-- config.color_scheme = 'Tokyobones_light'
-- config.color_scheme = 'Vimbones'
-- config.color_scheme = 'Zenbones_dark'
-- config.color_scheme = 'Zenbones_light'
-- config.color_scheme = 'Zenbones'
-- config.color_scheme = 'Zenburned'
-- config.color_scheme = 'Zenwritten_dark'
-- config.color_scheme = 'Zenwritten_light'
-- config.color_scheme = 'BlueDolphin'
-- config.color_scheme = 'nord'
-- config.color_scheme = 'Windows 95 Light (base16)'
-- config.color_scheme = 'Vaughn'
-- config.color_scheme = 'Violet Light'
-- config.color_scheme = 'Sakura (base16)'
-- config.color_scheme = 'Selenized Dark (Gogh)'
-- config.color_scheme = 'Shades of Purple (base16)'
-- config.color_scheme = 'Silk Light (base16)'
-- config.color_scheme = 'Railscasts (light) (terminal.sexy)'
-- config.color_scheme = 'Relaxed'
-- config.color_scheme = 'Rosé Pine Dawn (base16)'
-- config.color_scheme = 'PaleNightHC'
-- config.color_scheme = 'Paper (Gogh)'
-- config.color_scheme = 'Ocean (light) (terminal.sexy)'
-- config.color_scheme = 'Nord (base16)'
-- config.color_scheme = 'nord-light'
-- config.color_scheme = 'Nova (base16)'
-- config.color_scheme = 'NvimLight'
-- config.color_scheme = 'Mar (Gogh)'
-- config.color_scheme = 'Material Palenight (base16)'
-- config.color_scheme = 'Mocha (light) (terminal.sexy)'
-- config.color_scheme = 'Modus-Operandi-Tinted'
-- config.color_scheme = 'Lunaria Light (Gogh)'
-- config.color_scheme = 'IC_Green_PPL'
-- config.color_scheme = 'iceberg-light'
-- config.color_scheme = 'iTerm2 Tango Light'
-- config.color_scheme = 'iTerm2 Tango Dark'
-- config.color_scheme = 'Horizon Bright (Gogh)'
-- config.color_scheme = 'Humanoid light (base16)'
-- config.color_scheme = 'Gogh (Gogh)'
-- config.color_scheme = 'Grayscale (light) (terminal.sexy)'
-- config.color_scheme = 'GruvboxLight'
-- config.color_scheme = 'Fairyfloss'
-- config.color_scheme = 'Flat (base16)'
-- config.color_scheme = 'flexoki-light'
-- config.color_scheme = 'Edge Light (base16)'
-- config.color_scheme = 'Ef-Arbutus'
-- config.color_scheme = 'Ef-Cyprus'
-- config.color_scheme = 'Ef-Day'
-- config.color_scheme = 'Ef-Duo-Light'
-- config.color_scheme = 'Ef-Elea-Light'
-- config.color_scheme = 'Ef-Kassio'
-- config.color_scheme = 'Ef-Maris-Light'
-- config.color_scheme = 'Ef-Reverie'
-- config.color_scheme = 'Ef-Spring'
-- config.color_scheme = 'Ef-Summer'
-- config.color_scheme = 'Ef-Trio-Light'
-- config.color_scheme = 'Ef-Tritanopia-Light'
-- config.color_scheme = 'Equilibrium Light (base16)'
-- config.color_scheme = 'dawnfox'
-- config.color_scheme = 'dayfox'
-- config.color_scheme = 'DjangoSmooth'
-- config.color_scheme = 'Catppuccin Latte'
-- config.color_scheme = 'Bamboo Light'
-- config.color_scheme = 'Bim (Gogh)'
-- config.color_scheme = 'Breadog (Gogh)'
-- config.color_scheme = 'Brush Trees (base16)'
-- config.color_scheme = 'Brush Trees Dark (base16)'
-- config.color_scheme = 'Ashes (light) (terminal.sexy)'
-- config.color_scheme = 'Atelier Cave Light (base16)'
-- config.color_scheme = 'Atelier Dune Light (base16)'
-- config.color_scheme = 'Atelier Estuary Light (base16)'
-- config.color_scheme = 'Atelier Forest Light (base16)'
-- config.color_scheme = 'Atelier Heath Light (base16)'
-- config.color_scheme = 'Atelier Lakeside Light (base16)'
-- config.color_scheme = 'Atelier Plateau Light (base16)'
-- config.color_scheme = 'Atelier Seaside Light (base16)'
-- config.color_scheme = 'Atelier Sulphurpool Light (base16)'
-- config.color_scheme = 'Everforest Dark Hard (Gogh)'
-- config.color_scheme = 'Everforest Dark Medium (Gogh)'
-- config.color_scheme = 'Everforest Dark Soft (Gogh)'
-- config.color_scheme = 'Everforest Light Hard (Gogh)'
-- config.color_scheme = 'Everforest Light Medium (Gogh)'
-- config.color_scheme = 'Everforest Light Soft (Gogh)'

-- Spawn a fish shell in login mode
config.default_prog = { '/usr/bin/fish', '-l' }

-- Finally, return the configuration to wezterm:
return config
