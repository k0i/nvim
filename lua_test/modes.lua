local config = function() require('modes').setup {
      colors = {
         copy = "#59f5de",
         delete = "#f5aec8",
         insert = "#ccffb0",
         visual = "#de99ff",
      },
      line_opacity = 0.4,
   }
end
return config
