local config = function()
   require("notify").setup {
      stages = "slide"
   }
   vim.notify = require("notify")
end
return config
