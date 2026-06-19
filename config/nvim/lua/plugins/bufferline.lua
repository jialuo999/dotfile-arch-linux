return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        -- 这里的 mode = "buffers" 就是你想要的选项卡模式
        mode = "buffers", 
        -- 配合 Catppuccin 主题
        themable = true,
        -- 显示关闭按钮
        show_buffer_close_icons = true,
        show_close_icon = true,
        -- 分隔符风格 (可以选 "slant" 斜角, "thick" 粗线, "thin" 细线)
        separator_style = "thin",
        --是否总是显示
        always_show_bufferline = false, 
        -- 让它避开左边的 nvim-tree 侧边栏
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          }
        },
      }
    })
  end,
}
