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
            YAMLFIX_LINE_LENGTH = "9999",
            YAMLFIX_SEQUENCE_STYLE = "block_style",
          },
        },
      },
    },
  },
}
