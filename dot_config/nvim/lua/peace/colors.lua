-- LuaFormatter off
local peace = {
	-- Common colors
	white    =		'#ede1f5',
	gray     =      '#a59dab',
	black    = 		'#1F1522',
    red      =   	'#D46CA5',
	green    = 		'#72E2C1',
	yellow   =		'#E9EB9E',
	blue     =  	'#E397F3',
	paleblue =		'#ede1f5',
	cyan     =  	'#A2EFFD',
	purple   =		'#A39AE8',
    orange   =		'#ED7D3A',
    pink     =  	'#F7B1F9',

	error    =		'#D46CA5',
	link     =		'#72E2C1',
	cursor   =		'#E9EB9E',

	none     =      'NONE'
}

-- Style specific colors

-- Darker theme style hall

peace.bg =			'#1F1522'
peace.bg_alt =		'#1F1522'
peace.fg =			'#ede1f5'
peace.text =			'#F2CEFA'
peace.comments =		'#705071'
peace.selection = 	'#3C2B3C'
peace.contrast =		'#251929'
peace.active =		'#312833'
peace.border =		'#9D719E'
peace.line_numbers =	'#433044'
peace.highlight =		'#67456E'
peace.disabled =		'#5C4A5F'
peace.accent =		'#67456E'

peace.indentHlDefault ='#433044'
peace.indentHlContext ='#FF0000'
peace.popupbg = '#423544'
peace.popupbgActive = '#FF0000'
peace.refTextBg = '#FF0000'
peace.refTextFg = '#FF0000'
peace.nvimTreeTxt = '#533758'
peace.cursorLineBG = peace.active
-- Optional colors

-- LuaFormatter on

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.peace_contrast == false then
    peace.sidebar = peace.bg
    peace.float = peace.bg
else
    peace.sidebar = peace.contrast
    peace.float = peace.popupbg
end

-- Enable custom variable colors
if vim.g.peace_variable_color == nil then
    peace.variable = peace.paleblue
else
    peace.variable = vim.g.peace_variable_color
end

-- Set BG Transparent
if vim.g.peace_transparent_bg == true then
    peace.bg = 'NONE'
    peace.comments = '#7272AB'
    peace.cursorLineBG = 'NONE'
    peace.line_numbers = peace.gray
end

-- Set black titles for lighter style
peace.title = '#474775'

-- Apply user defined colors

-- Check if vim.g.peace_custom_colors = is a table
if type(vim.g.peace_custom_colors) == "table" then
    -- Iterate trough the table
    for key, value in pairs(vim.g.peace_custom_colors) do
        -- If the key doesn't exist:
        if not peace[key] then
            error("Color " .. key .. " does not exist")
        end
        -- If it exists and the sting starts with a "#"
        if string.sub(value, 1, 1) == "#" then
            -- Hex override
            peace[key] = value
            -- IF it doesn't, dont accept it
        else
            -- Another group
            if not peace[value] then
                error("Color " .. value .. " does not exist")
            end
            peace[key] = peace[value]
        end
    end
end

return peace
