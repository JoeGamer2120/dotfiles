local options = {
  ensure_installed = { -- Add new languages to Table
    "bash",
    "fish",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "printf",
    "python",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
