local lspsaga_ok, lspsaga = pcall(require, 'lspsaga')
if not lspsaga_ok then return end

lspsaga.init_lsp_saga {
	move_in_saga = {
		prev = "<C-p>",
		next = "<C-n>"
	},
	finder_action_keys = {
		open = "<CR>"
	},
	definition_action_keys = {
		edit = "<CR>"
	},
	code_action_lightbulb = {
		enable = false
	}
}
