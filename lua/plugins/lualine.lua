return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  config =function ()
    require('lualine').setup({
          sections = {
        lualine_c = {
            {
                'filename',
                file_status = 2,
                path = 1
            }
        }
    }

    })
  end
}
