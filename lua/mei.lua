-- ,---.    ,---.    .-''-.  .-./`)
-- |    \  /    |  .'_ _   \ \ .-.')
-- |  ,  \/  ,  | / ( ` )   '/ `-' \
-- |  |\_   /|  |. (_ o _)  | `-'`"`
-- |  _( )_/ |  ||  (_,_)___| .---.
-- | (_ o _) |  |'  \   .---. |   |
-- |  (_,_)  |  | \  `-'    / |   |
-- |  |      |  |  \       /  |   |
-- '--'      '--'   `'-..-'   '---'
-- File:         mei.lua
-- URL:          github.com/shoukoo/lua/mei.vim
-- Author:       Andy Hsieh(shoukoo.koike@gmail.com)
-- License:      MPL-2.0
--
-- Useful tips
-- :h highlight-groups to look for the existing groups
-- :so $VIMRUNTIME/syntax/hitest.vim

local mei = {
	bg = "#3a3a3a",
	fg = "#ffebe5",
	-- mainly for telescope
	bg_popup = "#0b0b0b",
	-- mainly for pmenu
	bg_alt = "#73797e",

	pink = "#f73a84",
	light_pink = "#f85396",
	lighter_pink = "#f96ba5",
	white_pink = "#fb9dc3",
	pink_white = "#fdcee1",

	green = "#b1d182",
	brown = "#c78f70",
	blue = "#7aa0c7",
	dark_blue = "#34597e",
	red = "#eb4034",
	yellow = "#ffe841",
	dark_yellow = "#ffc211",
	light_orange = "#ffe577",
	orange = "#ff8d00",
	purple = "#ba4ddb",
	light_purple = "#e06ee0",
}

function mei.highlight(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""
	vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
end

function mei.load_syntax()
	local syntax = {
		Normal = { fg = mei.fg, bg = mei.bg },

		LineNr = { fg = mei.white_pink, bg = mei.bg_alt },
		Visual = { fg = mei.bg, bg = mei.white_pink },
		VisualNOS = { bg = mei.white_pink },

		String = { fg = mei.white_pink },
		Number = { fg = mei.brown },
		Float = { fg = mei.brown },
		Boolean = { fg = mei.orange },
		Constant = { fg = mei.orange },
		Character = { fg = mei.green },
		NonText = { fg = mei.pink },

		-- require() or pairs()
		Identifier = { fg = mei.fg },
		-- types int, long char
		Type = { fg = mei.pink },

		-- #define #include
		Define = { fg = mei.pink },
		Macro = { fg = mei.pink },
		Include = { fg = mei.pink },
		PreCondit = { fg = mei.pink },
		PreProc = { fg = mei.pink },
		-- general if statement
		Conditional = { fg = mei.pink },
		---- while loop
		Repeat = { fg = mei.pink },
		-- case default
		Label = { fg = mei.pink },
		-- other keywords
		--
		Keyword = { fg = mei.yellow },
		-- Search /<search keyword>
		IncSearch = { fg = mei.bg, bg = mei.pink, style = mei.none },
		Search = { fg = mei.bg, bg = mei.pink },
		-- comment
		Comment = { fg = mei.dark_blue },
		-- variables
		Statement = { fg = mei.yellow },
		-- function()
		Function = { fg = mei.pink },
		--Typedef = { fg = mei.red },
		Operator = { fg = mei.light_orange },
		-- try catch and throw
		Exception = { fg = mei.pink },
		Error = { fg = mei.red },
		Debug = { fg = mei.orange },
		debugBreakpoint = { fg = mei.bg, bg = mei.fg },
		-- set cursorline cursorcolumn
		Cursor = { fg = mei.orange, bg = mei.none, style = "reverse" },
		CursorLineNr = { fg = mei.pink, bg = mei.bg_alt },
		-- diff
		DiffAdd = { fg = mei.bg_alt, bg = mei.green },
		DiffChange = { fg = mei.bg_alt, bg = mei.yellow },
		DiffDelete = { fg = mei.bg_alt, bg = mei.red },
		DiffText = { fg = mei.bg_alt, bg = mei.fg },
		WarningMsg = { fg = mei.yellow, bg = mei.none, style = "bold" },
		ModeMsg = { fg = mei.fg, bg = mei.none, style = "bold" },
		ErrorMsg = { fg = mei.red, bg = mei.none, style = "bold" },

		SpecialKey = { fg = mei.bg_alt },
		-- bracket
		Structure = { fg = mei.pink },
		-- end of file
		EndOfBuffer = { fg = mei.bg, bg = mei.none },
		-- popup menu
		Pmenu = { fg = mei.fg, bg = mei.bg_popup },
		PmenuSel = { fg = mei.bg_popup, bg = mei.white_pink },
		Directory = { fg = mei.orange, bg = mei.bg },
		FoldColumn = { fg = mei.pink, bg = mei.bg_alt },
		-- set colorcolumn=<num>
		ColorColumn = { bg = mei.bg_alt },
		-- Match parameter
		MatchParen = { fg = mei.light_pink, bg = mei.bg_alt },
		Whitespace = { fg = mei.bg_alt },
		Question = { fg = mei.yellow },
		NormalFloat = { fg = mei.purple, bg = mei.bg_popup },
		-- Status line of current window
		StatusLine = { fg = mei.pink, bg = mei.bg, style = mei.none },
		-- Status line of not current window
		StatusLineNC = { fg = mei.fg, bg = mei.bg, style = mei.none },
		-- Spelling stuff
		SpellBad = { fg = mei.red, bg = mei.none, style = "undercurl" },
		SpellCap = { fg = mei.blue, bg = mei.none, style = "undercurl" },
		SpellLocal = { fg = mei.purple, bg = mei.none, style = "undercurl" },
		SpellRare = { fg = mei.orange, bg = mei.none, style = "undercurl" },
		QuickFixLine = { fg = mei.yellow, style = "bold" },

		SpecialComment = { fg = mei.bg_alt },
		Todo = { fg = mei.bg, bg = mei.dark_yellow },
		Delimiter = { fg = mei.dark_yellow },
		Ignore = { fg = mei.grey },
		Underlined = { fg = mei.none, style = "underline" },
	}
	return syntax
end

function mei.load_plugin_syntax()
	local plugin_syntax = {
		-- Treesitter
		TSFunction = { fg = mei.fg },
		TSMethod = { fg = mei.fg },
		TSKeywordFunction = { fg = mei.pink },
		TSProperty = { fg = mei.fg },
		TSType = { fg = mei.fg },
		TSVariable = { fg = mei.fg },
		TSPunctBracket = { fg = mei.light_pink },

		-- LSP config
		LspDiagnosticsSignError = { fg = mei.red },
		LspDiagnosticsSignWarning = { fg = mei.yellow },
		LspDiagnosticsSignInformation = { fg = mei.blue },
		LspDiagnosticsSignHint = { fg = mei.purple },

		LspDiagnosticsVirtualTextError = { fg = mei.red },
		LspDiagnosticsVirtualTextWarning = { fg = mei.yellow },
		LspDiagnosticsVirtualTextInformation = { fg = mei.blue },
		LspDiagnosticsVirtualTextHint = { fg = mei.purple },

		LspDiagnosticsUnderlineError = { style = "undercurl", sp = mei.red },
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = mei.yellow },
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = mei.blue },
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = mei.purple },

    -- Orgmode
    OrgAgendaDay = { fg = mei.fg },
    OrgDONE = { fg = mei.green },
    OrgTODO = { fg =  mei.pink },

		-- Telescope
		TelescopeBorder = { fg = mei.white_pink },
		TelescopePromptBorder = { fg = mei.pink },
		TelescopeMatching = { fg = mei.pink },
		TelescopeSelection = { fg = mei.yellow, bg = mei.bg_popup, style = "bold" },
		TelescopeSelectionCaret = { fg = mei.yellow },
		TelescopeMultiSelection = { fg = mei.pink },
	}
	return plugin_syntax
end

function mei.colorscheme()
	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end
	vim.o.background = "dark"
	vim.o.termguicolors = true
	vim.g.colors_name = "mei"
	local syntax = mei.load_syntax()
	for group, colors in pairs(syntax) do
		mei.highlight(group, colors)
	end
	local syntax_plugin = mei.load_plugin_syntax()
	for group, colors in pairs(syntax_plugin) do
		mei.highlight(group, colors)
	end
end

mei.colorscheme()

return mei
