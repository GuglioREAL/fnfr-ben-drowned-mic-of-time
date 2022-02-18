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
		{x = 10, y = 10, width = 155, height = 158, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: arrowLEFT0000
        {x = 10, y = 416, width = 225, height = 228, offsetX = -1, offsetY = -2, offsetWidth = 228, offsetHeight = 231}, -- 15: left confirm0000
		{x = 245, y = 416, width = 225, height = 228, offsetX = -1, offsetY = -2, offsetWidth = 228, offsetHeight = 231}, -- 16: left confirm0001
		{x = 480, y = 416, width = 228, height = 231, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 17: left confirm0002
		{x = 480, y = 416, width = 228, height = 231, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 18: left confirm0003
		{x = 718, y = 416, width = 51, height = 64, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 19: pruple end hold0000
		{x = 840, y = 416, width = 154, height = 157, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 21: purple0000
		{x = 779, y = 416, width = 51, height = 44, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 20: purple hold piece0000
	},
	{
		["off"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["confirm"] = {start = 2, stop = 5, speed = 24, offsetX = 0, offsetY = 0},
		["end"] = {start = 10, stop = 10, speed = 0, offsetX = 0, offsetY = 0},
		["on"] = {start = 11, stop = 11, speed = 0, offsetX = 0, offsetY = 0},
		["hold"] = {start = 12, stop = 12, speed = 0, offsetX = 0, offsetY = 0}
	},
	"off",
	false
)
