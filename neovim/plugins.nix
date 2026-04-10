{	pkgs,	...	}:
{
		programs.nixvim	=	{
			keymaps = [
				# DAP UI
				{
				  mode = "n";
				  key = "<leader>du";
				  action = "<cmd>lua require('dapui').toggle()<CR>";
				  options.desc = "DAP UI Toggle";
				}
				# Breakpoint toggle
				{
				  mode = "n";
				  key = "<leader>db";
				  action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
				  options.desc = "Toggle Breakpoint";
				}
				# Continue / Start
				{
				  mode = "n";
				  key = "<F5>";
				  action = "<cmd>lua require('dap').continue()<CR>";
				}
				# Step over
				{
				  mode = "n";
				  key = "<F10>";
				  action = "<cmd>lua require('dap').step_over()<CR>";
				}
				# Step into
				{
				  mode = "n";
				  key = "<F11>";
				  action = "<cmd>lua require('dap').step_into()<CR>";
				}
				# Step out
				{
				  mode = "n";
				  key = "<F12>";
				  action = "<cmd>lua require('dap').step_out()<CR>";
				}
			];
		};
		programs.nixvim.plugins	=	{
				luasnip	=	{
						enable	=	true;
						fromVscode	=	[
							{
								include	=	[
									"bash"
									"c"
									"cpp"
									"python"
									"nix"
									"r"
								];
							}
						];
				};
				lualine	=	{
						enable	=	true;
				};
				notify	=	{
						enable				=	true;
						settings	=	{
							background_colour	=	"#1e1e2e";
							render				=	"default";
							top_down				=	true;
						};
				};
				lsp	=	{
					enable	=	true;
					servers	=	{
						clangd.enable	=	true;
						nil_ls.enable	=	true;
						pyright.enable	=	true;
						r_language_server	= {
							enable	=	true;
							package	=	null;
							cmd	=	[	"R"	"--no-echo"	"-e"	"languageserver::run()"];
						};
						rust_analyzer	=	{
							enable	=	true;
							installRustc	=	true;
							installCargo	=	true;
						};
						ltex	=	{
							enable	=	true;
							settings	=	{
								enabled	=	[	"latex" "markdown" "tex" "gitcommit"	];
								completionEnabled	=	true;
								language			=	"en-US";
							};
						};
						marksman.enable	=	true;
					};
				};
				cmp	=	{
					enable		=	true;
					settings	=	{
						completion	=	{
							completeopt	=	"menu,menuone,noinsert";
						};
						autoEnableSources	=	true;
						performance	=	{
							debounce		=	60;
							fetchingTimeout	=	200;
							maxViewEntries	=	30;
						};
					####mapping = {
					####	"<C-n>"		=	"cmp.mapping.select_next_item()";
					####	"<C-p>"		=	"cmp.mapping.select_prev_item()";
					####	"<CR>"		=	"cmp.mapping.confirm({ select = true })";
					####	"<C-Space>"	=	"cmp.mapping.complete()";
					#	};
						sources = [
							{ name = "nvim_lsp"; }
							{ name = "buffer"; }
							{ name = "path"; }
							{ name = "luasnip"; }
						];
					};
				};
				cmp-nvim-lsp	=	{
					enable	=	true;
				};
				cmp-buffer		=	{
					enable	=	true;
				};
				cmp-path		=	{
					enable	=	true;
				};
				cmp_luasnip		=	{
					enable	=	true;
				};
				dap	=	{
					enable	=	true;	
				};
				dap-ui	=	{
					enable	=	true;
				};
		};
		programs.nixvim	=	{
			extraConfigLua = ''
			local dap = require("dap")

			-- C/C++/Rust
			dap.adapters.lldb = {
			  type = "executable",
			  command = "${pkgs.llvmPackages_latest.lldb}/bin/lldb-vscode",
			  name = "lldb"
			}

			dap.configurations.c = {
			  {
				name = "Launch C",
				type = "lldb",
				request = "launch",
				program = function()
				  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = vim.fn.getcwd(),
				stopOnEntry = false,
				args = {},
			  }
			}
			dap.configurations.cpp = dap.configurations.c
			dap.configurations.rust = dap.configurations.c

			-- Python
			dap.adapters.python = {
			  type = "executable",
			  command = "${pkgs.python3Packages.debugpy}/bin/python",
			  args = { "-m", "debugpy.adapter" }
			}

			dap.configurations.python = {
			  {
				type = "python";
				request = "launch";
				name = "Launch file";

				program = function()
					return	vim.fn.expand("%:p")
				end,

				pythonPath = "${pkgs.python3}/bin/python3";
			  },
			}

			vim.lsp.config('rust_analyzer', {
				on_attach = function(client, bufnr)
					local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
					local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
					
					-- Enable completion triggered by <C-Space>
					buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

					-- Key bindings
					buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
					-- Add more key mappings for LSP functions as needed
				end,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = true;
					},
				},
			})

			local cmp = require("cmp")
			-- Global mapping for all filetypes
			cmp.setup({
			  mapping = {
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<CR>"]  = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}
			})

			-- Rust-specific sources (ensures rust_analyzer works)
			cmp.setup.filetype('rust', {
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
			}),
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<CR>"]  = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			})
			})
		'';
			};
}
