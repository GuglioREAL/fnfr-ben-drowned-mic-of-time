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
		{x = 342, y = 10, width = 155, height = 157, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: arrowRIGHT0000
		{x = 10, y = 657, width = 154, height = 157, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 24: red0000
		{x = 674, y = 10, width = 51, height = 64, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 22: red hold end0000
		{x = 735, y = 10, width = 51, height = 44, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 23: red hold piece0000
		{x = 174, y = 657, width = 225, height = 228, offsetX = -1, offsetY = -2, offsetWidth = 228, offsetHeight = 231}, -- 25: right confirm0000
		{x = 409, y = 657, width = 225, height = 228, offsetX = -1, offsetY = -2, offsetWidth = 228, offsetHeight = 231}, -- 26: right confirm0001
		{x = 644, y = 657, width = 228, height = 231, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 27: right confirm0002
		{x = 644, y = 657, width = 228, height = 231, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 28: right confirm0003
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
