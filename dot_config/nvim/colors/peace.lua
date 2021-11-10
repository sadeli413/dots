-- Source Config
-- local plugin_path = vim.fn.stdpath('config')
-- require(plugin_path .. '/init.lua')

package.loaded['peace'] = nil
package.loaded['peace.util'] = nil
package.loaded['peace.colors'] = nil
package.loaded['peace.theme'] = nil
package.loaded['peace.functions'] = nil

vim.g.peace_transparentbg = false
require('peace').set()
-- Make ghost text different from comment colorscheme
vim.api.nvim_command [[ hi Comment guifg=#5C4A5F ]]
