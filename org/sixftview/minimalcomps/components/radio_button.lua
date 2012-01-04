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
RadioButton = {}

function RadioButton:new(xpos, ypos, label, checked)
	local group = require("org.sixftview.minimalcomps.components.component"):new(xpos, ypos)
	
	if label == nil then label = "" end
	if checked == nil then checked = false end
	
	group.selected = checked
	group.groupName = "defaultGroupName"
	group.label = label
	
	local box = display.newCircle(10,10,10)
	box:setFillColor(169, 169, 169)
	group:insert(box)
	
	local inner_box = display.newCircle(10,10,5)
	inner_box:setFillColor(255, 255, 255)
	if group.selected == false then inner_box.alpha = 0 end
	
	group:insert(inner_box)
	
	local box_width = box.width
	local box_height = box.height
	
	local label = display.newText(group.label, 0,0, "PFRondaSeven", 15)
	label:setTextColor(102, 102, 102)
	label.alpha = 0
	label:setReferencePoint(display.CenterReferencePoint)
	
	local function labelTimer(event)
		label.x = (box.x + (label.width * 0.5)) + 25 
		label.y = box.y - (label.height * 0.1)
		if label.alpha == 0 then label.alpha = 1 end
	end
	
	group:insert(label)
	timer.performWithDelay(100, labelTimer, 1)
	
	local function onTouch(event)
		if event.phase == "ended" then
			if group.selected == true then
				group.selected = false
				inner_box.alpha = 0
			else
				group.selected = true
				inner_box.alpha = 1
			end

			local e = {name="onSelectedButton", value=group.selected, target=group }
			group:dispatchEvent(e)
		end
	end
	
	function group.setLabelColor(R,G,B,A)
		if A == nil then A = 255 end
		label:setTextColor(R,G,B,A)
	end
	
	function group.setLabelText(value)
		label.alpha = 0
		label.text = value
		label:setReferencePoint(display.CenterReferencePoint)
		timer.performWithDelay(100, labelTimer, 1)
	end
	
	function group.setSelected(selected)
		if selected == true then
			inner_box.alpha = 1
		else
			inner_box.alpha = 0
		end
		group.selected = selected
	end
	
	group:addEventListener("touch", onTouch)

	return group
end

return RadioButton
