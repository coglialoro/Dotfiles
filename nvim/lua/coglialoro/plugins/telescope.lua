return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")

    local is_git = function()
      local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })

      return ret == 0
    end

    vim.keymap.set("n", "<Leader>pf", builtin.find_files, { silent = true, desc = "Find in project" })
    vim.keymap.set("n", "<Leader>gf", function()
      if not is_git() then
        print("Not in a git repo!")
        return
      end

      builtin.git_files()
    end, { silent = true, desc = "Find in git repo" })

    vim.keymap.set("n", "<Leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { silent = true, desc = "Search in project" })
  end
}
