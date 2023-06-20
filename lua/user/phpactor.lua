local status_ok, phpactor = pcall(require, "phpactor")
if not status_ok then
	return
end

phpactor.setup({})
phpactor.rpc('context_menu',{})
