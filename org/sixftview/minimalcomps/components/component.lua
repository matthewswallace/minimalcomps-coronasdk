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
Component = {}

function Component:new(xpos, ypos)
	if xpos == nil then xpos = 0 end
	if ypos == nil then ypos = 0 end
	
	local group = display.newGroup()
	
	group.enabled = true
	group.tag = nil
	
	
	function group.addChildren()
		
	end
	
	function group.move(xpos, ypos)
		group.x, group.y = xpos, ypos
	end

	group.x = xpos
	group.y = ypos
	
	return group
end



return Component