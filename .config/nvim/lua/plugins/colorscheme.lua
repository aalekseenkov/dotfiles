return {
  -- https://github.com/zenbones-theme/zenbones.nvim
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()

      -- neobones
      -- vim.g.neobones_lightness = "dim" -- dim, default, bright

      -- forestbones
      -- vim.g.forestbones_lightness = "dim" -- dim, default, bright
      -- vim.g.forestbones_darkness = "warm" -- warm, stark

      -- zenbones
      -- vim.g.zenbones_lightness = "dim" -- dim, default, bright

      -- zenwritten
      -- vim.g.zenwritten_lightness = "dim" -- dim, default, bright

      -- rosebones
      -- vim.g.rosebones_lightness = "dim" -- dim, default, bright

      -- seoulbones
      -- vim.g.seoulbones_lightness = "dim" -- dim, default, bright

      -- tokyobones
      -- vim.g.tokyobones_lightness = "dim" -- dim, default, bright

      -- vimbones
      -- vim.g.vimbones_lightness = "dim" -- dim, default, bright

      -- nordbones
      -- vim.g.nordbones_darkness = "warm" -- warm, stark

      -- zenburned
      -- vim.g.zenburned_darkness = "warm" -- warm, stark

      -- vim.cmd("set background=light")
      -- vim.cmd("colorscheme zenbones")
    end,
  },
  -- https://github.com/EdenEast/nightfox.nvim
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("nightfox")
      vim.cmd.colorscheme("dayfox")
      -- vim.cmd.colorscheme("dawnfox")
      -- vim.cmd.colorscheme("duskfox")
      -- vim.cmd.colorscheme("nordfox")
      -- vim.cmd.colorscheme("terafox")
      -- vim.cmd.colorscheme("carbonfox")
    end,
  },
  -- https://github.com/savq/melange-nvim
  {
    "savq/melange-nvim",
  },
}
