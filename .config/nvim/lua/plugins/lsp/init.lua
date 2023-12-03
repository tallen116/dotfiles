return {
    {
        "neovim/nvim-lspconfig",
        cmd = "LspInfo",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            -- Global mappings
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.set_log_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

--            lspconfig.qml_lsp.setup {
--                capabilities = lsp_capabilities,
--                on_attach = function(client, bufnr)
--                    client.server_capabilities.semanticTokensProvider = nil
--                end,
--            }

--            lspconfig.lua_ls.setup {
--                on_init = function(client)
--                    local path = client.workspace_folders[1].name
--                    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
--                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
--                            Lua = {
--                                runtime = {
--                                    -- Tell the language server which version of Lua you're using
--                                    -- (most likely LuaJIT in the case of Neovim)
--                                    version = 'LuaJIT'
--                                },
--                                -- Make the server aware of Neovim runtime files
--                                workspace = {
--                                    checkThirdParty = false,
--                                    library = {
--                                        vim.env.VIMRUNTIME
--                                        -- "${3rd}/luv/library"
--                                        -- "${3rd}/busted/library",
--                                    }
--                                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--                                    -- library = vim.api.nvim_get_runtime_file("", true)
--                                }
--                            }
--                        })
--
--                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
--                    end
--                    return true
--                end
--            }

--            lspconfig.omnisharp.setup {
--                capabilities = lsp_capabilities,
--                cmd = { "dotnet", "/usr/lib/omnisharp-roslyn/OmniSharp.dll" },
--                enable_editorconfig_support = true,
--                enable_ms_build_load_projects_on_demand = false,
--                enable_roslyn_analyzers = true,
--                organize_imports_on_format = false,
--                enable_import_completion = true,
--                sdk_include_prereleases = true,
--                analyze_open_documents_only = true,
--            }


            local servers = {
                bashls = {},
                pyright = {},
                lua_ls = require("plugins.lsp.servers.lua_ls")(),
                omnisharp = require("plugins.lsp.servers.omnisharp")(),
                qml_lsp = require("plugins.lsp.servers.qml_lsp")(),
            }

            local default_lsp_config = {
                capabilities = lsp_capabilities
            }

            -- Setup list of lsp servers
            --local server_names = {}
            --for server_name, _ in pairs(servers) do
            --    table.insert(server_names, server_name)
            --end
            -- Can setup mason if needed here

            for server_name, server_config in pairs(servers) do
                local merged_config = vim.tbl_deep_extend("force", default_lsp_config, server_config)
                lspconfig[server_name].setup(merged_config)
            end

        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local luasnip = require("luasnip")
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    --{ name = "buffer" },
                }),
            })
        end,
    },
}
