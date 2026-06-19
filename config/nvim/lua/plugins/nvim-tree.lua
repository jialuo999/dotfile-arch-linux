return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- 1. 禁用 netrw (Vim 自带的文件浏览器)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup ({
        sort = {
        sorter = "case_sensitive", -- 按文件名大小写敏感排序
      },
      view = {
        width = 25,      -- 侧边栏宽度
        side = "left",   -- 靠左显示
      },
      renderer = {
        group_empty = true, -- 把空目录折叠在一行显示
      },
      filters = {
        dotfiles = false, --显示隐藏文件
      },
    })

    -- 3. 设置全局快捷键（Ctrl + n 都能开关目录树）
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })
  end,
}
