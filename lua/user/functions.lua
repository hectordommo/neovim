function ReplaceImagePaths()
  vim.api.nvim_command([[ %s/src="https:\/\/kumu-backoffice\.test\/assets\/\(.\{-}\)"/src="{{ asset('assets\/\1') }}"/g ]])
end
