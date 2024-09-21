return {
    "MagicDuck/grug-far.nvim",
    config = function()
        require("grug-far").setup(
            {
                engine = "ripgrep"
            }
        )
    end
}
