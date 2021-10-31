-- LuaFormatter off
local halloween = {
	-- Common colors
	white    =		'#f4e6e1',
	gray     =      '#aaa19d',
	black    = 		'#1e181b',
    red      =   	'#F76594',
	green    = 		'#82D4BB',
	yellow   =		'#F7E5A0',
	blue     =  	'#FF9753',
	paleblue =		'#FFE0CE',
	cyan     =  	'#FAA9C3',
	purple   =		'#88D1FE',
    orange   =		'#FF9753',
    pink     =  	'#E6A0AA',

	error    =		'#F76594',
	link     =		'#82D4BB',
	cursor   =		'#F7E5A0',

	none     =      'NONE'
}

-- Style specific colors

-- Darker theme style hall

halloween.bg =			'#1e181b'
halloween.bg_alt =		'#1e181b'
halloween.fg =			'#f4e6e1'
halloween.text =			'#FFC9A8'
halloween.comments =		'#615664'
halloween.selection = 	'#2E2532'
halloween.contrast =		'#171013'
halloween.active =		'#2A222D'
halloween.border =		'#3D2942'
halloween.line_numbers =	'#565154'
halloween.highlight =		'#403243'
halloween.disabled =		'#322D30'
halloween.accent =		'#403243'

halloween.indentHlDefault ='#2A2B2E'
halloween.indentHlContext ='#FF0000'
halloween.popupbg = '#3D3640'
halloween.popupbgActive = '#FF0000'
halloween.refTextBg = '#FF0000'
halloween.refTextFg = '#FF0000'
halloween.nvimTreeTxt = '#615664'
halloween.cursorLineBG = halloween.active
-- Optional colors

-- LuaFormatter on

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.halloween_contrast == false then
    halloween.sidebar = halloween.bg
    halloween.float = halloween.bg
else
    halloween.sidebar = halloween.contrast
    halloween.float = halloween.popupbg
end

-- Enable custom variable colors
if vim.g.halloween_variable_color == nil then
    halloween.variable = halloween.paleblue
else
    halloween.variable = vim.g.halloween_variable_color
end

-- Set BG Transparent
if vim.g.halloween_transparent_bg == true then
    halloween.bg = 'NONE'
    halloween.comments = '#7272AB'
    halloween.cursorLineBG = 'NONE'
    halloween.line_numbers = halloween.gray
end

-- Set black titles for lighter style
halloween.title = '#474775'

-- Apply user defined colors

-- Check if vim.g.halloween_custom_colors = is a table
if type(vim.g.halloween_custom_colors) == "table" then
    -- Iterate trough the table
    for key, value in pairs(vim.g.halloween_custom_colors) do
        -- If the key doesn't exist:
        if not halloween[key] then
            error("Color " .. key .. " does not exist")
        end
        -- If it exists and the sting starts with a "#"
        if string.sub(value, 1, 1) == "#" then
            -- Hex override
            halloween[key] = value
            -- IF it doesn't, dont accept it
        else
            -- Another group
            if not halloween[value] then
                error("Color " .. value .. " does not exist")
            end
            halloween[key] = halloween[value]
        end
    end
end

return halloween
