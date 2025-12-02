return {
  -- https://github.com/kaiuri/nvim-juliana
  {
    "kaiuri/nvim-juliana",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("juliana")
    end,
  },

  -- https://github.com/zenbones-theme/zenbones.nvim
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    -- vim.cmd("set background=light")
    -- vim.cmd("colorscheme zenbones")
    -- end,
  },

  -- https://github.com/EdenEast/nightfox.nvim
  {
    "EdenEast/nightfox.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    -- vim.cmd.colorscheme("nightfox")
    -- vim.cmd.colorscheme("dayfox")
    -- vim.cmd.colorscheme("dawnfox")
    -- vim.cmd.colorscheme("duskfox")
    -- vim.cmd.colorscheme("nordfox")
    -- vim.cmd.colorscheme("terafox")
    -- vim.cmd.colorscheme("carbonfox")
    -- end,
  },

  -- https://github.com/savq/melange-nvim
  {
    "savq/melange-nvim",
  },
}
