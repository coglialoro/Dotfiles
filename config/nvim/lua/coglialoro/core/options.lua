vim.g.have_nerd_font = true

local options = {
	-- Visuals
	number = true,
	relativenumber = true,
	cursorline = true,
	termguicolors = true,
	background = "dark",
	signcolumn = "yes",
	wrap = false,
	showmode = false,
	-- Tabbing
	expandtab = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	smarttab = true,
	smartindent = true,
	autoindent = true,
	breakindent = true,
	-- Completion
	completeopt = { "menuone", "preview", "noselect", "noinsert" }, --"noselect", "noinsert"
	pumheight = 10,
	-- Search
	hlsearch = true,
	ignorecase = true,
	smartcase = true,
	-- Misc
	fileencoding = "utf-8",
	clipboard = "unnamedplus",
	undofile = true,
	mouse = "a",
	scrolloff = 10,
	backspace = "indent,eol,start",
	updatetime = 250,
	timeoutlen = 300,
	splitright = true,
	splitbelow = true,
	inccommand = "split",
	-- Obsidian
	conceallevel = 1,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
