--[[
 * component.lua
 * Matthew Wallace
 * version 0.1.0
 * 
 * Base class for all components
 * 
 * Copyright (c) 2012 Matthew Wallace - port of Keith Peters (minimalcomps AS3 lib)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 * 
 * 
 * Components with text make use of the font PF Ronda Seven by Yuusuke Kamiyamane
 * This is a free font obtained from http://www.dafont.com/pf-ronda-seven.font
 --]]

--[[ 
This is a helper class that allows you to 
add buttons that have a selected state and 
will manage wich one is selected for you.

this is a bit different than the AS3 version because 
lua doesn't allow static methods and variables.
--]]
module(..., package.seeall)

function new(buttons, default_index)
	
	local button_group = display.newGroup()
	
	if buttons == nil then buttons = {} end
	button_group.buttons = buttons
	
	if default_index == nil then default_index = 1 end
	button_group.selected_index = default_index
	
	local function onSelected(event)
		local button = event.target
		
		for i=1, table.getn(button_group.buttons) do
			local cur_button = button_group.buttons[i]
			
			if cur_button == button then
				button.setSelected(true)
				button_group.selected_index = i
			else
				cur_button.setSelected(false)
			end
		end
		
		local e = {name="selectionChanged", value=button_group.selected_index}
		button_group:dispatchEvent(e)
	end
	
	for i=1, table.getn(button_group.buttons) do
		local button = button_group.buttons[i]
		button:addEventListener("onSelectedButton", onSelected)
		if i == button_group.selected_index then
			button.setSelected(true)
		end
	end
	
	return button_group
end