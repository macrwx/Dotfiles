return {
  {
    "TimUntersberger/neogit",
    config = function()
      require("neogit").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup()
    end,
  },
}
