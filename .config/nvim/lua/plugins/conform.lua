return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        yaml = { "yamlfix" },
      },
      formatters = {
        yamlfix = {
          env = {
            YAMLFIX_WHITELINES = "1",
            YAMLFIX_SECTION_WHITELINES = "1",
          },
        },
      },
    },
  },
}
