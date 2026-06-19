return {
    "OXY2DEV/markview.nvim",
    lazy = false, -- 确保打开 Markdown 文件时立即生效
    
    -- 如果你用的是最近很火的 blink.cmp 补全插件，可以取消下面的注释
    -- dependencies = { "saghen/blink.cmp" },

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    }
}
