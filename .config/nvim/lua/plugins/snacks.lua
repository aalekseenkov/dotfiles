return {
  "folke/snacks.nvim",
  opts = {
    zen = {
      -- Set the desired padding (number of spaces on both sides)
      -- padding = 5, -- Adjust this value to your preference

      -- Other zen mode options can be added here
      win = {
        -- You can also set a specific width if desired
        width = 88,
        backdrop = {
          transparent = true, -- Example option
          blend = 40,
        },
      },
      toggles = {
        dim = false, -- Example option
      },
    },
    -- other snacks options for different components (picker, explorer, etc.)
  },
}
