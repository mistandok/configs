-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- indent

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent Settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Other
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Fillchars
vim.opt.fillchars = {
	vert = "│",
	fold = "⠀",
	eob = " ", -- suppress ~ at EndOfBuffer
	-- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

if vim.g.neovide then
	vim.g.neovide_window_blurred = true
	vim.g.neovide_transparency = 0.5
	vim.g.neovide_show_border = true
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_cursor_vfx_opacity = 1000.0
end

-- Enable autoindent for all files
vim.o.autoindent = true

-- Optionally, you could use smartindent for programming languages
vim.o.smartindent = true
