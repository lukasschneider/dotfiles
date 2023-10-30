require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "javascript", 
	"typescript", 
	"python", 
	"rust", 
	"go", 
	"c", 
	"lua", 
	"vim", 
	"vimdoc", 
	"gosum",
	"gowork",
	"graphql",
	"html",
	"http",
	"json",
	"make",
	"passwd",
	"prql",
	"r",
	"regex",
	"sql",
	"ssh_config",
	"toml",
	"tsx",
	"twig",
	"tsv",
	"yaml",
	"xml",
	"svelte",
	"terraform",
	"markdown",
	"latex",
	"kotlin",
	"java",
	"cpp",
	"css",
	"comment",
	"c_sharp",
	"bibtex",
	"bash",
	"query" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
}
