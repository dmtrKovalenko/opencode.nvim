vim.api.nvim_create_autocmd("FileType", {
  pattern = "opencode_terminal",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "<C-u>", function()
      require("opencode.api.command").command("session.half.page.up")
    end, vim.tbl_extend("force", opts, { desc = "Scroll up half page" }))

    vim.keymap.set("n", "<C-d>", function()
      require("opencode.api.command").command("session.half.page.down")
    end, vim.tbl_extend("force", opts, { desc = "Scroll down half page" }))

    vim.keymap.set("n", "gg", function()
      require("opencode.api.command").command("session.first")
    end, vim.tbl_extend("force", opts, { desc = "Go to first message" }))

    vim.keymap.set("n", "G", function()
      require("opencode.api.command").command("session.last")
    end, vim.tbl_extend("force", opts, { desc = "Go to last message" }))

    vim.keymap.set("n", "<Esc>", function()
      require("opencode.api.command").command("session.interrupt")
    end, vim.tbl_extend("force", opts, { desc = "Interrupt current session (esc)" }))
  end,
})
