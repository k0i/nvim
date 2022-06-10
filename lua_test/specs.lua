local config = function() require('specs').setup {
      show_jumps       = true,
      min_jump         = 10,
      popup            = {
         delay_ms = 0,
         inc_ms = 20,
         blend = 10,
         width = 50,
         winhl = "PMenu",
         fader = require('specs').pulse_fader,
         resizer = require('specs').shrink_resizer
      },
      ignore_filetypes = {},
      ignore_buftypes  = {
         nofile = true,
      },
   }
end
return config
