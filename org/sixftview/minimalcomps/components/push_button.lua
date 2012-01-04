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
PushButton = {}

function PushButton:new(xpos, ypos, label)
	local group = require("org.sixftview.minimalcomps.components.component"):new(xpos, ypos)
	if label == nil then label = "" end
	
	local background = display.newRect(0,0,100, 30)
	background:setReferencePoint(display.TopLeftReferencePoint)
	background.alpha = 0
	background:setFillColor(255,255,255)
	background.strokeWidth = 1
	background:setStrokeColor(102, 102, 102)
	group:insert(background)
	
	local boarder
	
	local txt_label = display.newText(label, 0,0, "PFRondaSeven", 15)
	txt_label.alpha = 0
	txt_label:setTextColor(102, 102, 102)
	group:insert(txt_label)
	
	--you have to wait for text to render before you can set x,y, width, height stuff
	local function onTimer(event)
		local bn_width = txt_label.width + 20
		local bn_height = txt_label.height + 5
		
		if bn_width <= 20 then bn_width = 100 end
		if bn_height <= 5 then bn_height = 30 end
		
		background.width, background.height = bn_width, bn_height
		background:setReferencePoint(display.TopLeftReferencePoint)
		background.x = 0
		background.y = 0
		background.alpha = 1
		
		boarder = display.newLine(background.x + 2, 
									background.y + background.height -1,
									background.x + 2, background.y + 2)
		boarder:append(background.x + background.width - 1, background.y + 2)
		boarder:setColor(102, 102, 102)
		boarder.alpha = 0
		boarder.width = 1
		group:insert(boarder)
		
		txt_label.alpha = 1
		txt_label:setReferencePoint(display.TopLeftReferencePoint)
		txt_label.x = (bn_width * 0.5) - ((txt_label.width * 0.5) -2.5)
	end
	timer.performWithDelay(100, onTimer, 1)
	
	local function onTouch(event)
		if event.phase == "began" then
			background:setFillColor(238, 238, 238)
			boarder.alpha = 1
		elseif event.phase == "ended" then
			background:setFillColor(255,255,255)
			boarder.alpha = 0
		end
	end
	
	group:addEventListener("touch", onTouch)
	
	return group
end

return PushButton