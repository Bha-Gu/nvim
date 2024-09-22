return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "neo-tree", "alpha", "dashboard", "Outline" },
			},
			ignore_focus = { "neo-tree" },
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					on_click = function(n, mouse_btn, modifiers)
						if mouse_btn == "l" then
							-- Switch to insert mode
							vim.cmd("startinsert")
						elseif mouse_btn == "r" then
							-- Switch to normal mode
							vim.cmd("stopinsert")
						elseif mouse_btn == "m" then
							-- Switch to visual mode
							vim.cmd("normal! v")
						end
						print(
							string.format(
								"Switched mode with %d clicks | Button: %s | Modifiers: %s",
								n,
								mouse_btn,
								modifiers
							)
						)
					end,
				},
			},
			lualine_b = {
				"branch",
				{
					"diff",
					colored = true, -- Displays a colored diff status if set to true
					symbols = { added = "", modified = "", removed = "" }, -- Changes the symbols used by the diff.
				},
				{
					"diagnostics",
					sources = { "nvim_lsp", "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					colored = true, -- Displays diagnostics status in color if set to true.
					update_in_insert = false, -- Update diagnostics in insert mode.
					always_visible = false,
					on_click = function(n, mouse_btn, modifiers)
						if mouse_btn == "l" then
							require("telescope.builtin").diagnostics()
						elseif mouse_btn == "r" then
							vim.diagnostic.setqflist({ open = true })
						end
						print(string.format("Clicked: %d times | Button: %s | Modifiers: %s", n, mouse_btn, modifiers))
					end,
				},
			},
			lualine_c = {
				{
					"filename",
					file_status = true, -- Displays file status (readonly status, modified status)
					newfile_status = false, -- Display new file status (new file means no write after created)
					path = 1, -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory

					shorting_target = 40, -- Shortens path to leave 40 spaces in the window
					-- for other components. (terrible name, any suggestions?)
					symbols = {
						modified = "", -- Text to show when the file is modified.
						readonly = "", -- Text to show when the file is non-modifiable or readonly.
						unnamed = "󰑕", -- Text to show for unnamed buffers.
						newfile = "", -- Text to show for newly created file before first write
					},
				},
			},
			lualine_x = {
				"encoding",
				{
					"fileformat",
					symbols = {
						unix = "", -- e712
						dos = "", -- e70f
						mac = "", -- e711
					},
				},
				{
					"filetype",
					colored = true, -- Displays filetype icon in color if set to true
					icon_only = false, -- Display only an icon for filetype
					icon = { align = "left" }, -- Display filetype icon on the right hand side
					-- icon =    {'X', align='right'}
					-- Icon string ^ in table is ignored in filetype component
				},
			},
			lualine_y = { "progress", "filesize", "searchcount", "selectioncount" },
			lualine_z = { "location", { "datetime", style = "%H:%M:%S" } },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
