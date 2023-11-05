--https://github.com/hrsh7th/nvim-cmp
--https://github.com/L3MON4D3/LuaSnip

local cmp_status_ok, cmp = pcall(require, "cmp")
local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not (cmp_status_ok and luasnip_status_ok) then
  return
end

local mapping = {
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<C-n>"] = cmp.mapping.select_next_item(),
  ["<C-e>"] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ["<CR>"] = cmp.mapping.confirm({ select = true }),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}

local format = {
  Text = "ⓣ ",
  Method = "ⓜ ",
  Function = "ⓕ ",
  Constructor = "ⓒ ",
  Field = "ⓕ ",
  Variable = "ⓥ ",
  Class = "ⓒ ",
  Interface = "ⓘ ",
  Module = "ⓜ ",
  Property = "ⓟ ",
  Unit = "ⓤ ",
  Value = "ⓥ ",
  Enum = "ⓔ ",
  Keyword = "ⓚ ",
  Snippet = "ⓢ ",
  Color = "ⓒ ",
  File = "ⓕ ",
  Reference = "ⓡ ",
  Folder = "ⓕ ",
  EnumMember = "ⓔ ",
  Constant = "ⓒ ",
  Struct = "ⓢ ",
  Event = "ⓔ ",
  Operator = "ⓞ ",
  TypeParameter = "ⓣ ",
  Misc = "ⓜ ",
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = mapping,
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", format[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
