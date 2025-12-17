return {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
        { "<leader>cp", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
        {
            "<leader>cP",
            "<cmd>CodeSnapSave<cr>",
            mode = "x",
            desc = "Save selected code snapshot in ~/Pictures/Codesnaps",
        },
        {
            "<leader>cA",
            "<cmd>CodeSnapASCII<CR>",
            mode = "x",
            desc = "Save selected code snapshot into clipboard in ASCII format",
        },
    },
    opts = {
        save_path = "~/Pictures/Codesnaps",
        has_breadcrumbs = true,
        show_workspace = true,
        bg_padding = 0,
        bg_theme = "summer",
        watermark = "Guillaume Claudon",
        code_font_family = "JetBrainsMono Nerd Font",
        has_line_number = false,
        mac_window_bar = true,
    },
}
