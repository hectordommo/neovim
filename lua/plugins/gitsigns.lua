return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup({
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation
        map('n', '<leader>hn', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '<leader>hp', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)
        map('n', '<leader>hv', gitsigns.preview_hunk)
        map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)

      end
    })
    -- Function to get the current Git branch
    local function git_branch()
      local branch = vim.b.gitsigns_head or ''
      return branch ~= '' and ('  ' .. branch) or ''
    end

    -- Set the statusline
    -- vim.opt.statusline = vim.opt.statusline + '%{v:lua.git_branch()}'
  end, -- end of config

}
