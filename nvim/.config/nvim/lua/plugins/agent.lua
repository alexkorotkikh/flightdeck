-- OpenCode in a right-hand Snacks terminal, with editor context and edit review.
-- For isolated parallel agents use `wt` instead.
local command = "opencode"
local terminal = {
  win = { position = "right", enter = false },
}

return {
  {
    "nickjvandyke/opencode.nvim",
    branch = "main", -- V2 support; stable release tags target V1
    dependencies = { "folke/snacks.nvim" },
    config = function()
      require("opencode.config").opts.server.start = function()
        require("snacks.terminal").open(command, terminal)
      end
    end,
    keys = {
      { "<leader>a", nil, desc = "AI/OpenCode" },
      {
        "<leader>ac",
        function()
          require("snacks.terminal").toggle(command, terminal)
        end,
        desc = "Toggle OpenCode",
      },
      {
        "<leader>as",
        function()
          require("opencode").ask("@this: ")
        end,
        mode = { "n", "x" },
        desc = "Ask OpenCode about selection/cursor",
      },
      {
        "<leader>am",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "OpenCode actions and prompts",
      },
    },
  },
}
