def create_telescope_functions(file_names, output_file="telescope_functions.lua"):
    with open(output_file, "w") as f:
        for name in file_names:
            lua_function = f"""
_{name.upper()} = function()
\trequire("telescope.builtin").{name}()
end
"""
            f.write(lua_function.strip() + "\n\n")


# Example usage
create_telescope_functions(
    [
        "find_files",
        "git_files",
        "live_grep",
        "grep_string",
    ]
)
