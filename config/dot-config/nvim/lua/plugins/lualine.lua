return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
            color = {fg = "#ff8800", gui = "bold"},
          },
        },
      },
    },
  },
}
