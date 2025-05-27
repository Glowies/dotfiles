---@module 'lazy'

return {
  -- override the default options for snacks.nvim
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
        _               _           
       | |             (_)          
   __ _| | _____      ___  ___  ___ 
  / _` | |/ _ \ \ /\ / / |/ _ \/ __|
 | (_| | | (_) \ V  V /| |  __/\__ \
  \__, |_|\___/ \_/\_/ |_|\___||___/
   __/ |                            
  |___/                             
]],
        },
      },
      picker = {
        explorer = {
          auto_close = false,
        },
        files = {
          hidden = true,
        },
      },
      notifier = {
        timeout = 3000,
        style = "fancy",
      },
      styles = {
        notification = {
          wo = {
            wrap = true,
          },
        },
        notification_history = {
          width = 0.99,
          height = 0.8,
          minimal = false,
        },
      },
    },
  },
}
