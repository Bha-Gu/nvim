return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		-- check ":h bufferline-configuration" for more options
		options = {
			mode = "buffers", -- set to "tabs" to only show tabpages instead
			themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
			right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
			indicator = {
				style = "underline",
			},
			buffer_close_icon = "󰅖",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			--- name_formatter can be used to change the buffer's label in the bufferline.
			--- Please note some names can/will break the
			--- bufferline so use this at your discretion knowing that it has
			--- some limitations that will *NOT* be fixed.
			name_formatter = function(buf) -- buf contains:
				-- local user = os.getenv("USER")
				-- local mods = {
				--     ["/home/" .. user] = "󰚡",
				--     ["/Downloads"] = "/󰮏",
				--     ["/Documents"] = "/󱔘",
				--     ["/Desktop"] = "/",
				--     ["/Music"] = "/󰽴",
				--     ["/Pictures"] = "/",
				--     ["/Videos"] = "/",
				--     ["/.config"] = "/",
				--     ["/nvim"] = "/",
				--     --["vim"] = "",
				--     ["/lua"] = "/󰢱",
				--     ["/plugins"] = "/",
				-- }
				--
				-- local path = buf.path
				--
				-- for old_value, new_value in pairs(mods) do
				--     path = path:gsub(old_value, new_value)
				-- end

				return buf.name
				-- name                | str        | the basename of the active file
				-- path                | str        | the full path of the active file
				-- bufnr (buffer only) | int        | the number of the active buffer
				-- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
				-- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
			end,
			max_name_length = 18,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			truncate_names = false, -- whether or not tab names should be truncated
			tab_size = 18,
			diagnostics = "nvim_lsp",
			-- NOTE: this will be called a lot so don't do any heavy processing here
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
			show_buffer_icons = true, -- disable filetype icons for buffers
			show_buffer_close_icons = true,
			show_close_icon = false,
			show_tab_indicators = false,
			show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
			duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
			-- can also be a table containing 2 custom separators
			-- [focused and unfocused]. eg: { '|', '|' }
			separator_style = "slant",
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			auto_toggle_bufferline = false,
			hover = {
				enabled = true,
				delay = 150,
				reveal = { "close" },
			},
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
		},
		highlights = {
			-- Custom highlight for the underline of the selected buffer
			indicator_visible = {
				fg = "#ff0000",
				bg = "#00ff00",
			},
			indicator_selected = {
				fg = "#0000ff",
				bg = "#ff00ff",
			},
		},
	},
}
