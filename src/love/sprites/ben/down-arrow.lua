--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

return graphics.newSprite(
	images.notesB,
	{
		{x = 175, y = 10, width = 157, height = 155, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: arrowDOWN0000
		{x = 796, y = 10, width = 158, height = 154, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: blue0000
		{x = 674, y = 10, width = 51, height = 64, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: blue hold end0000
		{x = 735, y = 10, width = 51, height = 44, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: blue hold piece0000
		{x = 10, y = 178, width = 229, height = 225, offsetX = -1, offsetY = -2, offsetWidth = 232, offsetHeight = 228}, -- 8: down confirm0000
		{x = 249, y = 178, width = 229, height = 225, offsetX = -1, offsetY = -2, offsetWidth = 232, offsetHeight = 228}, -- 9: down confirm0001
		{x = 488, y = 178, width = 232, height = 228, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: down confirm0002
		{x = 488, y = 178, width = 232, height = 228, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 11: down confirm0003
	},
	{
		["off"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["on"] = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
		["end"] = {start = 3, stop = 3, speed = 0, offsetX = 0, offsetY = 0},
		["hold"] = {start = 4, stop = 4, speed = 0, offsetX = 0, offsetY = 0},
		["confirm"] = {start = 5, stop = 8, speed = 24, offsetX = 0, offsetY = 0}
	},
	"off",
	false
)
