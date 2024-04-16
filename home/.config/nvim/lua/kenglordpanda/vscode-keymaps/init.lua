-- file for VSCode key mappings

-- call for synchronous, action for async
vim.keymap.set("n", "]p", "<CMD>lua require('vscode-neovim').call('editor.action.marker.next')<CR>")
vim.keymap.set("n", "[p", "<CMD>lua require('vscode-neovim').call('-editor.action.marker.next')<CR>")
