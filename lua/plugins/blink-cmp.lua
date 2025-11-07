return {
    { "L3MON4D3/LuaSnip", keys = {} },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        config = function()
            require("blink.cmp").setup({
                snippets = {
                    expand = function(snippet) vim.snippet.expand(snippet) end,
                    active = function(filter)
                        return vim.snippet.active(filter)
                    end,
                    jump = function(direction)
                        vim.snippet.jump(direction)
                    end,
                },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                        snippets = {
                            should_show_items = function(ctx)
                                return ctx.trigger.initial_kind ~= 'trigger_character'
                            end
                        }
                    },
                },
                keymap = {
                    ["<CR>"] = { "accept", "fallback" },
                    ['<Tab>'] = { 'snippet_forward', 'fallback' },
                    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                    ["<C-f>"] = {},
                },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<CR>"] = { "accept_and_enter", "fallback" },
                    },
                },
                completion = {
                    menu = {
                        border = "rounded",
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label",      "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = "rounded",
                            scrollbar = false,
                            winhighlight =
                            "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500,
                    },
                },
            })
            -- vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#c48282", blend = vim.o.pumblend })
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
