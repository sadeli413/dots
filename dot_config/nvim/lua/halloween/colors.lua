-- LuaFormatter off
local halloween = {
	-- Common colors
	white    =		'#f4e6e1',
	gray     =      '#aaa19d',
	black    = 		'#1e181b',
	red      =   	'#F76594',
	green    = 		'#82D4BB',
	yellow   =		'#F7E5A0',
	blue     =  	'#88D1FE',
	paleblue =		'#DEFFF2',
	cyan     =  	'#88D1FE',
	purple   =		'#E6A0AA',
	orange   =		'#FF9753',
	pink     =  	'#BE96BD',

	error    =		'#F76594',
	link     =		'#82D4BB',
	cursor   =		'#F7E5A0',

	none     =      'NONE'
}

-- Style specific colors

-- Darker theme style


halloween.bg =			'#1e181b'
halloween.bg_alt =		'#322D30'
halloween.fg =			'#f4e6e1'
halloween.text =			'#1e181b'
halloween.comments =		'#aaa19d'
halloween.selection = 	'#565154'
halloween.contrast =		'#322D30'
halloween.active =		'#C9C8C9'
halloween.border =		'#aaa19d'
halloween.line_numbers =	'#F7E5A0'
halloween.highlight =		'#322D30'
halloween.disabled =		'#41415F'
halloween.accent =		'#FF9753'

halloween.indentHlDefault ='#2A2B2E'
halloween.indentHlContext ='#FF0000'
halloween.popupbg = '#322D30'
halloween.popupbgActive = '#FF0000'
halloween.refTextBg = halloween.cyan
halloween.refTextFg = halloween.fg
halloween.nvimTreeTxt = '#FF0000'
halloween.cursorLineBG = '#454043'
halloween.statuslinebg = '#2E2532'
-- Optional colors

-- LuaFormatter on

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.halloween_contrast == false then
    halloween.sidebar = halloween.bg
    halloween.float = halloween.bg
else
    halloween.sidebar = halloween.contrast
    halloween.float = halloween.contrast
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
    halloween.comments = '#A7ACC9'
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
