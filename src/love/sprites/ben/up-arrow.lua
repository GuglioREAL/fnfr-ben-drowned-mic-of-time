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
		{x = 507, y = 10, width = 157, height = 154, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: arrowUP0000
		{x = 730, y = 178, width = 157, height = 154, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 14: green0000
		{x = 718, y = 416, width = 51, height = 64, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: green hold end0000
		{x = 779, y = 416, width = 51, height = 44, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 13: green hold piece0000
		{x = 10, y = 898, width = 228, height = 225, offsetX = -4, offsetY = -3, offsetWidth = 232, offsetHeight = 229}, -- 29: up confirm0000
		{x = 248, y = 898, width = 228, height = 225, offsetX = -4, offsetY = -3, offsetWidth = 232, offsetHeight = 229}, -- 30: up confirm0001
		{x = 486, y = 898, width = 232, height = 229, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 31: up confirm0002
		{x = 486, y = 898, width = 232, height = 229, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 32: up confirm0003
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
