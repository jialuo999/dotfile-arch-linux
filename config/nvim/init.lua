--24位真彩色
vim.opt.termguicolors=true
--开启行号
vim.opt.number=true
--深色背景
vim.opt.background="dark"
--配色设置
--vim.cmd ('colorscheme pablo')
--tab为4格
vim.o.tabstop=4
--插入退格tab按4格处理
vim.o.softtabstop=4
--自动缩进、>>/<<缩进宽度
vim.o.shiftwidth=4
--tab转为空格
vim.o.expandtab=true
--语法智能缩放
vim.o.autoindent=true
-- 行高光
vim.opt.cursorline = true
-- 必开：真彩色（透明度生效前提）
vim.opt.termguicolors = true
-- 开启光标行高亮
vim.opt.cursorline = true

-- 自定义光标行：只加亮度蒙版，不改原颜色
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- 核心配置：blend控制透明度，bg是蒙版颜色（决定调亮/调暗）
    vim.api.nvim_set_hl(0, "CursorLine", {
      -- 调亮（推荐暗黑模式）：用浅灰色蒙版，blend越小越亮
      bg = "#383D53",  -- 白色蒙版（调亮），若想调暗则改为#000000
      blend = 100,      -- 透明度（0=不透明，100=全透明），95=仅5%白色叠加，只提亮度
      nocombine=true -- 避免样式冲突
    })
    -- 行号保持原样式，只加粗（可选）
    vim.api.nvim_set_hl(0, "CursorLineNr", {
      bold = true,
      bg = "none" -- 行号背景透明，不改动
    })
  end,
})

-- 快速切换标签页
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
-- 关闭当前标签
local function smart_close_buffer()
  local cur_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.tbl_filter(function(b)
    return vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted
  end, vim.api.nvim_list_bufs())

  if #buffers <= 1 then
    vim.cmd('close')
    return
  end

  local ok = pcall(vim.cmd, 'BufferLineCycleNext')
  if not ok then vim.cmd('bnext') end

  if vim.api.nvim_get_current_buf() == cur_buf then
    ok = pcall(vim.cmd, 'BufferLineCyclePrev')
    if not ok then vim.cmd('bprev') end
  end
  require('mini.bufremove').delete(cur_buf, true)
end
-- 在含有多个标签页时执行:q关闭顶部标签卡
vim.keymap.set("n", "<leader>x", smart_close_buffer, { desc = "Smart close current buffer" })
vim.api.nvim_create_autocmd("WinClosed", {
  callback = function(args)
    local win = tonumber(args.match)
    local buf = vim.api.nvim_win_get_buf(win)

    -- 只处理普通列出的 buffer
    if not vim.bo[buf].buflisted then return end

    -- 检查这个 buffer 是否还在其他窗口里，有的话不删
    local remaining_wins = vim.tbl_filter(function(w)
      return w ~= win
    end, vim.fn.win_findbuf(buf))

    if #remaining_wins == 0 then
      vim.schedule(function()
        pcall(vim.cmd, 'bdelete! ' .. buf)
      end)
    end
  end
})
--启用lazy.vimi
require("config.lazy")

