local opts_with_decs = function(desc)
    return { noremap = true, silent = true, desc = desc }
end

-- Shorten function name
local keymap = vim.keymap.set

-- Smart Splits Mappings
keymap("n", "<C-h>", function()
    require("smart-splits").move_cursor_left()
end, opts_with_decs("Move to Left Split"))
keymap("n", "<C-j>", function()
    require("smart-splits").move_cursor_down()
end, opts_with_decs("Move to Below Split"))
keymap("n", "<C-k>", function()
    require("smart-splits").move_cursor_up()
end, opts_with_decs("Move to Above Split"))
keymap("n", "<C-l>", function()
    require("smart-splits").move_cursor_right()
end, opts_with_decs("Move to Right Split"))
keymap("n", "<C-Up>", function()
    require("smart-splits").resize_up()
end, opts_with_decs("Resize Split Up"))
keymap("n", "<C-Down>", function()
    require("smart-splits").resize_down()
end, opts_with_decs("Resize Split Down"))
keymap("n", "<C-Left>", function()
    require("smart-splits").resize_left()
end, opts_with_decs("Resize Split Left"))
keymap("n", "<C-Right>", function()
    require("smart-splits").resize_right()
end, opts_with_decs("Resize Split Right"))

-- Swapping Buffers Between Windows with Ctrl + Shift
keymap("n", "<C-S-h>", require("smart-splits").swap_buf_left, opts_with_decs("Swap Buffer to Left Split"))
keymap("n", "<C-S-j>", require("smart-splits").swap_buf_down, opts_with_decs("Swap Buffer to Below Split"))
keymap("n", "<C-S-k>", require("smart-splits").swap_buf_up, opts_with_decs("Swap Buffer to Above Split"))
keymap("n", "<C-S-l>", require("smart-splits").swap_buf_right, opts_with_decs("Swap Buffer to Right Split"))

-- Toggle Comment Line and Block
keymap("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Comment Line" })
keymap("x", "<leader>/", "gc", { remap = true, desc = "Toggle Comment Block" })

-- Map Redo to U
keymap("n", "U", "<C-r>", opts_with_decs("Redo"))
keymap("n", "u", "u", opts_with_decs("Undo"))

-- Stay in indent mode
keymap("v", "<", "<gv^", opts_with_decs("Reduce Indent"))
keymap("v", ">", ">gv^", opts_with_decs("Increase Indent"))

-- Move Text Up and Down in Visual Mode
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts_with_decs("Move Text Down"))
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts_with_decs("Move Text Up"))
-- Move Text Up and Down in Visual Line Mode
keymap("x", "J", ":m '>+1<CR>gv=gv", opts_with_decs("Move Text Down"))
keymap("x", "K", ":m '<-2<CR>gv=gv", opts_with_decs("Move Text Up"))
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts_with_decs("Move Text Down"))
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts_with_decs("Move Text Up"))

-- Telescope Extensions
pcall(require("telescope").load_extension, "ui-select")

-- Telescope Commands
local builtin = require("telescope.builtin")

-- File Pickers
keymap("n", "<leader>fff", builtin.find_files, opts_with_decs("[f]ind [f]iles"))
keymap("n", "<leader>ffg", builtin.git_files, opts_with_decs("[f]ind git files"))
keymap("n", "<leader>ffw", builtin.grep_string, opts_with_decs("[f]ind current [w]ord"))
keymap("n", "<leader>ffe", builtin.live_grep, opts_with_decs("[f]ind by [g]rep in files"))

-- Vim Pickers
keymap("n", "<leader>fva", builtin.autocommands, opts_with_decs("find autocommands"))
keymap("n", "<leader>fvb", builtin.buffers, opts_with_decs("find open buffers"))
keymap("n", "<leader>fvc", builtin.commands, opts_with_decs("find commands"))
keymap("n", "<leader>fvC", builtin.command_history, opts_with_decs("find history of commands"))
keymap("n", "<leader>fvf", builtin.filetypes, opts_with_decs("find filetypes"))
keymap("n", "<leader>fvh", builtin.help_tags, opts_with_decs("find help tags"))
keymap("n", "<leader>fvH", builtin.highlights, opts_with_decs("find highlights"))
keymap("n", "<leader>fvj", builtin.jumplist, opts_with_decs("find jump list entries"))
keymap("n", "<leader>fvk", builtin.marks, opts_with_decs("find key marks"))
keymap("n", "<leader>fvK", builtin.keymaps, opts_with_decs("find keymaps"))
keymap("n", "<leader>fvl", builtin.colorscheme, opts_with_decs("find light and dark themes"))
keymap("n", "<leader>fvL", builtin.loclist, opts_with_decs("find location list"))
keymap("n", "<leader>fvm", builtin.man_pages, opts_with_decs("find man pages"))
keymap("n", "<leader>fvo", builtin.vim_options, opts_with_decs("find options"))
keymap("n", "<leader>fvq", builtin.quickfix, opts_with_decs("find quickfix list"))
keymap("n", "<leader>fvr", builtin.registers, opts_with_decs("find registers"))
keymap("n", "<leader>fvR", builtin.resume, opts_with_decs("find and resume previous picker"))
keymap("n", "<leader>fvs", builtin.search_history, opts_with_decs("find search history"))
keymap("n", "<leader>fvS", builtin.spell_suggest, opts_with_decs("find spelling suggestions"))
keymap("n", "<leader>fvT", builtin.tags, opts_with_decs("find tags"))
keymap("n", "<leader>fvt", builtin.current_buffer_tags, opts_with_decs("find tags in current buffer"))
keymap("n", "<leader>fvx", builtin.quickfixhistory, opts_with_decs("find quickfix history"))
keymap("n", "<leader>fvz", builtin.pickers, opts_with_decs("find past pickers"))
keymap("n", "<leader>fv.", builtin.oldfiles, opts_with_decs("find recently opened files"))
keymap("n", "<leader>fv/", builtin.current_buffer_fuzzy_find, opts_with_decs("find in current buffer"))

-- Neovim LSP Pickers
keymap("n", "<leader>flr", builtin.lsp_references, opts_with_decs("find LSP references"))
keymap("n", "<leader>flI", builtin.lsp_incoming_calls, opts_with_decs("find LSP incoming calls"))
keymap("n", "<leader>flO", builtin.lsp_outgoing_calls, opts_with_decs("find LSP outgoing calls"))
keymap("n", "<leader>fls", builtin.lsp_document_symbols, opts_with_decs("find LSP document symbols"))
keymap("n", "<leader>flw", builtin.lsp_workspace_symbols, opts_with_decs("find LSP workspace symbols"))
keymap("n", "<leader>flW", builtin.lsp_dynamic_workspace_symbols, opts_with_decs("find dynamic workspace symbols"))
keymap("n", "<leader>fld", builtin.diagnostics, opts_with_decs("find diagnostics"))
keymap("n", "<leader>fli", builtin.lsp_implementations, opts_with_decs("find LSP implementations"))
keymap("n", "<leader>flD", builtin.lsp_definitions, opts_with_decs("find LSP definitions"))
keymap("n", "<leader>flt", builtin.lsp_type_definitions, opts_with_decs("find LSP type definitions"))

-- Git Pickers
keymap("n", "<leader>fgc", builtin.git_commits, opts_with_decs("list git commits"))
keymap("n", "<leader>fgB", builtin.git_bcommits, opts_with_decs("list buffer's git commits"))
keymap("n", "<leader>fgR", builtin.git_bcommits_range, opts_with_decs("list buffer's git commits in range"))
keymap("n", "<leader>fgb", builtin.git_branches, opts_with_decs("list git branches"))
keymap("n", "<leader>fgs", builtin.git_status, opts_with_decs("list git status changes"))
keymap("n", "<leader>fgS", builtin.git_stash, opts_with_decs("list git stash items"))

-- keymap("n", "<leader>fa", builtin.autocommands, opts_with_decs("[f]ind [a]utocommands"))
-- keymap("n", "<leader>fs", builtin.builtin, opts_with_decs("[f]ind [s]earch Telescope functions"))
-- keymap("n", "<leader>fc", builtin.colorscheme, opts_with_decs("[f]ind [c]olorscheme"))
-- keymap("n", "<leader>fh", builtin.help_tags, opts_with_decs("[f]ind [h]elp tags"))
-- keymap("n", "<leader>fd", builtin.diagnostics, opts_with_decs("[f]ind [d]iagnostics"))
-- keymap("n", "<leader>f/", function()
-- 	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
-- 		winblend = 10,
-- 		previewer = false,
-- 	}))
-- end, opts_with_decs("[f]ind in current buffer fuzzily"))
--
-- -- Live Grep in Open Files
-- keymap("n", "<leader>fF", function()
-- 	builtin.live_grep({
-- 		grep_open_files = true,
-- 		prompt_title = "Grep in Open Files",
-- 	})
-- end, opts_with_decs("[f]ind by grep in open [f]iles"))
--
-- Neovim Config Search
keymap("n", "<leader>fn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, opts_with_decs("[f]ind [n]eovim config files"))

-- LSP Keymaps
keymap("n", "<leader>lD", builtin.lsp_definitions, opts_with_decs("[l]sp [D]efinitions"))
keymap("n", "<leader>lR", builtin.lsp_references, opts_with_decs("[l]sp [R]eferences"))
keymap("n", "<leader>li", builtin.lsp_implementations, opts_with_decs("[l]sp [I]mplementations"))
keymap("n", "<leader>lT", builtin.lsp_type_definitions, opts_with_decs("[l]sp [T]ype definitions"))
keymap("n", "<leader>lsd", builtin.lsp_document_symbols, opts_with_decs("[l]sp [D]ocument symbols"))
keymap("n", "<leader>lsw", builtin.lsp_dynamic_workspace_symbols, opts_with_decs("[l]sp [W]orkspace symbols"))
keymap("n", "<leader>lr", vim.lsp.buf.rename, opts_with_decs("[l]sp [R]ename symbol"))
keymap({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, opts_with_decs("[l]sp [A]ction"))
keymap("n", "<leader>ld", vim.lsp.buf.declaration, opts_with_decs("[l]sp [D]eclaration"))

-- NeoTree Mappings
keymap("n", "<leader>e", "<Cmd>Neotree toggle<CR>", opts_with_decs("Toggle Explorer"))
keymap("n", "<leader>o", function()
    if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd("p")
    else
        vim.cmd.Neotree("focus")
    end
end, opts_with_decs("Toggle Explorer Focus"))

-- buffers
keymap("n", "<leader><Tab>", "<Cmd>BufferLineCycleNext<CR>", opts_with_decs("Next Tab"))
keymap("n", "<leader><S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts_with_decs("Previous Tab"))
keymap("n", "]<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts_with_decs("Next Tab"))
keymap("n", "[<Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts_with_decs("Previous Tab"))

-- save
keymap("n", "<leader>w", "<Cmd>w<CR>", opts_with_decs("Save Curr File"))
keymap("n", "<leader>q", "<Cmd>bd<CR>", opts_with_decs("Close Tab"))

-- DAP Mappings
keymap("n", "<leader>db", function()
    require("dap").toggle_breakpoint()
end, opts_with_decs("Toggle Breakpoint"))
keymap("n", "<leader>dB", function()
    require("dap").clear_breakpoints()
end, opts_with_decs("Clear Breakpoints"))
keymap("n", "<leader>dc", function()
    require("dap").continue()
end, opts_with_decs("Start/Continue"))
keymap("n", "<leader>dC", function()
    vim.ui.input({ prompt = "Condition: " }, function(condition)
        if condition then
            require("dap").set_breakpoint(condition)
        end
    end)
end, opts_with_decs("Conditional Breakpoint"))
keymap("n", "<leader>di", function()
    require("dap").step_into()
end, opts_with_decs("Step Into"))
keymap("n", "<leader>do", function()
    require("dap").step_over()
end, opts_with_decs("Step Over"))
keymap("n", "<leader>dO", function()
    require("dap").step_out()
end, opts_with_decs("Step Out"))
keymap("n", "<leader>dq", function()
    require("dap").close()
end, opts_with_decs("Close Session"))
keymap("n", "<leader>dQ", function()
    require("dap").terminate()
end, opts_with_decs("Terminate Session"))
keymap("n", "<leader>dp", function()
    require("dap").pause()
end, opts_with_decs("Pause"))
keymap("n", "<leader>dr", function()
    require("dap").restart_frame()
end, opts_with_decs("Restart"))
keymap("n", "<leader>dR", function()
    require("dap").repl.toggle()
end, opts_with_decs("Toggle REPL"))
keymap("n", "<leader>ds", function()
    require("dap").run_to_cursor()
end, opts_with_decs("Run To Cursor"))

-- ToggleTerm
keymap("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", opts_with_decs("ToggleTerm Float"))
keymap(
    "n",
    "<leader>th",
    "<Cmd>ToggleTerm size=10 direction=horizontal<CR>",
    opts_with_decs("ToggleTerm Horizontal Split")
)
keymap("n", "<leader>tv", "<Cmd>ToggleTerm size=80 direction=vertical<CR>", opts_with_decs("ToggleTerm Vertical Split"))

local Terminal = require("toggleterm.terminal").Terminal
local gitui = Terminal:new({ cmd = "gitui", hidden = true })
function _GITUI_TOGGLE()
    gitui:toggle()
end

local TeleClip = require("telescope").extensions.neoclip
function _CLIPBOARD()
    TeleClip.default({
        initial_mode = "normal",
        prompt_title = "Clipboard History ([p] to paste)",
        layout_strategy = "center",
        previewer = false,
        layout_config = {
            prompt_position = "top", -- Position the prompt at the top
        },
        truncate = false,
    })
end

keymap("n", "<leader>gg", "<Cmd>lua _GITUI_TOGGLE()<CR>", opts_with_decs("Gitui interface"))

keymap("n", "<leader>c", "<Cmd>lua _CLIPBOARD()<CR>", opts_with_decs("Open Clipboard"))

local wk = require("which-key")
wk.add({
    { "<leader>f", group = "find" },  -- group
    { "<leader>d", group = "debug" }, -- group
    { "<leader>l", group = "LSP" },   -- group
    { "<leader>t", group = "Terminal" }, -- group
    { "<leader>g", group = "git" },   -- group
    { "[",         group = "Prev" },  -- group
    { "]",         group = "Next" },  -- group
    { "<leader>",  group = "Custom" }, -- group
})
