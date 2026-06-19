return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", 
      transparent_background = true, -- 开启透明
      integrations = {
        nvimtree = true,     -- 自动美化nvim-tree
        lualine = true,      -- 自动美化lualine
        bufferline = true,
        gitsigns = true,
        treesitter = true,
      },
    })

    -- 设为当前配色
    vim.cmd.colorscheme("catppuccin")
  end,
}
