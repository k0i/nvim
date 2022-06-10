local config = function()
   require('dap.ext.vscode').load_launchjs()
   require('dapui').setup({
      icons = { expanded = '-', collapsed = '+' },
      sidebar = {
         elements = {
            { id = 'watches', size = 0.00 },
            { id = 'breakpoints', size = 0.2 },
            {
               id = 'scopes',
               size = 0.8,

            },
            { id = 'stacks', size = 0.0 },
         },
         size = 100
         ,
         position = 'right',
      },
      tray = {
         elements = { 'repl' },
         size = 10,
         position = 'top',
      },
      floating = {
         max_height = 0.8,
         max_width = 0.9,
         border = 'rounded',
         mappings = {
            close = { 'q', '<Esc>' },
         },
      },
      windows = { indent = 1 },
   })
   local dap, dapui = require('dap'), require('dapui')
   dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
   end
   dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
   end
   dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
   end
end
return config
