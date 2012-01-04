display.setStatusBar ( display.HiddenStatusBar )

local RadioButton = require "org.sixftview.minimalcomps.components.radio_button"
local ButtonGroup = require "org.sixftview.minimalcomps.components.button_group"
local PushButton = require "org.sixftview.minimalcomps.components.push_button"

local radio1 = RadioButton:new(100, 100, "here is some text")
local radio2 = RadioButton:new(100, 130, "here is some text 2")
local radio3 = RadioButton:new(100, 160, "here is some text 3")

local group_array = {radio1, radio2, radio3}
local group1 = ButtonGroup:new(group_array, 2)

local push_button = PushButton:new(100, 200, "PushButton")

local function onTimer(event)
	
end

timer.performWithDelay(1000,onTimer,1)