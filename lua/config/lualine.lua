local navic = require("nvim-navic")
local colors = {
   red = '#ca1243',
   blue = '#0088dc',
   purple = '#ecb0f5',
   grey = '#a0a1a7',
   black = '#383a42',
   white = '#f3f3f3',
   green = '#BEF6CC',
   orange = '#fe8019',
   green = '#8ec07c',
 }
local theme = {
   normal = {
     a = { fg = colors.black, bg = colors.grey },
     b = { fg = colors.black, bg = colors.white },
     c = { fg = colors.white, bg = colors.blue },
     x = { fg = colors.white, bg = colors.red },
     y = { fg = colors.white, bg = colors.red },
     z = { fg = colors.white, bg = colors.red },
   },
   insert = { a = { fg = colors.black, bg = colors.green } },
   visual = { a = { fg = colors.black, bg = colors.orange } },
   replace = { a = { fg = colors.black, bg = colors.green } },
}
local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end
-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end
local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end
local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end
require('lualine').setup{
      options = {
        theme = theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
     sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
        {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } }
        },
        {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
        },
        { 'filename', file_status = false, path = 1 },
        { modified, color = { bg = colors.red } },
        {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
        },
        {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
        },
        {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
        }
        },
        lualine_c = {
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end}
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'searchcount' },
        lualine_z = { '%l:%c' },
      },
      inactive_sections = {
      lualine_c = { '%f %y %m' },
      lualine_x = {},
      }
}
