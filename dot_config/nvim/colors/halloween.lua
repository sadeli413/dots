-- Source Config
-- local plugin_path = vim.fn.stdpath('config')
-- require(plugin_path .. '/init.lua')

package.loaded['halloween'] = nil
package.loaded['halloween.util'] = nil
package.loaded['halloween.colors'] = nil
package.loaded['halloween.theme'] = nil
package.loaded['halloween.functions'] = nil

vim.g.halloween_transparentbg = false
require('halloween').set()
