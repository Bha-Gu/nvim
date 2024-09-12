return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		auto_clean_after_session_restore = true,
		close_if_last_window = false,
		sources = { "filesystem", "buffers", "git_status" },
		source_selector = {
			winbar = true,
			content_layout = "center",
			sources = {
				{ source = "filesystem", display_name = " Files" },
				{ source = "buffers", display_name = "󰓩 Buffers" },
				{ source = "git_status", display_name = " Git" },
				{ source = "diagnostics", display_name = " Diagnostics" },
			},
		},
		open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
		filesystem = {
			bind_to_cwd = true,
			cwd_target = {
				sidebar = "global", -- sidebar is when position = left or right
				current = "global", -- current is when position = current
			},
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		window = {
			mappings = {
				["<F5>"] = "refresh",
				["l"] = "open",
				["h"] = "close_node",
				["<space>"] = "none",
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path, "c")
					end,
					desc = "Copy Path to Clipboard",
				},
				["O"] = {
					function(state)
						require("lazy.util").open(state.tree:get_node().path, { system = true })
					end,
					desc = "Open with System Application",
				},
				["P"] = { "toggle_preview", config = { use_float = false } },
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			git_status = {
				symbols = {
					unstaged = "󰄱",
					staged = "󰱒",
				},
			},
		},
		nesting_rules = {
			["/home/" .. os.getenv("USER")] = "󰚡",
			["/Downloads"] = "/󰮏",
			["/Documents"] = "/󱔘",
			["/Desktop"] = "/",
			["/Music"] = "/󰽴",
			["/Pictures"] = "/",
			["/Videos"] = "/",
			["/.config"] = "/",
			["/nvim"] = "/",
			--["vim"] = "",
			["/lua"] = "/󰢱",
			["/plugins"] = "/",
		},
	},
}
