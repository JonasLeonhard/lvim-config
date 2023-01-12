local ok, neoscroll = pcall(require, "neoscroll")

if not ok then
  return
end

neoscroll.setup()

local t    = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '75' } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '75' } }
t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '150' } }
t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '150' } }
t['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
t['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }

require('neoscroll.config').set_mappings(t)
