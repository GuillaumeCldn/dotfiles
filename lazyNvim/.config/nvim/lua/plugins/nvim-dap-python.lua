return {
    "mfussenegger/nvim-dap-python",
    config = function()
        require("dap-python").setup("/Users/guiguiclaudon/.pyenv/versions/3.12.4/bin/python")
    end,
    keys = {
        {
            "<leader>dxp",
            function()
                require("dap-python").test_method()
            end,
            desc = "Debug Python file",
        },
    },
}
