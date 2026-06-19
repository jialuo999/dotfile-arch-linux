return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "OceanicNext",
        globalstatus = true,--横跨屏幕
        --符号效果
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },
    })
  end,
}
