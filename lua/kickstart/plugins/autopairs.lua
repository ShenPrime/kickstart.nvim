-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'

    npairs.setup {}

    -- Custom rules for HEEx-style delimiters
    npairs.add_rules {
      Rule('<%', '%>', { 'heex', 'elixir' }):with_pair(function(opts)
        local line = opts.line
        local col = opts.col
        local before_cursor = line:sub(1, col)
        return before_cursor:match '~H""".*<%$'
      end),
    }
  end,
}
