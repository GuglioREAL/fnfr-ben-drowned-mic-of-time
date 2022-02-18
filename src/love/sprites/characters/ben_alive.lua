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
	love.graphics.newImage(graphics.imagePath("characters/alive_ben")),
		-- Automatically generated from alive_ben.xml
	{
		{x = 10, y = 10, width = 883, height = 454, offsetX = -1, offsetY = -12, offsetWidth = 884, offsetHeight = 467}, -- 1: alive ben down0000
		{x = 10, y = 10, width = 883, height = 454, offsetX = -1, offsetY = -12, offsetWidth = 884, offsetHeight = 467}, -- 2: alive ben down0001
		{x = 893, y = 10, width = 883, height = 467, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 467}, -- 3: alive ben down0002
		{x = 893, y = 10, width = 883, height = 467, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 467}, -- 4: alive ben down0003
		{x = 1776, y = 10, width = 883, height = 465, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 467}, -- 5: alive ben down0004
		{x = 1776, y = 10, width = 883, height = 465, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 467}, -- 6: alive ben down0005
		{x = 2659, y = 10, width = 883, height = 466, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 467}, -- 7: alive ben down0006
		{x = 3542, y = 10, width = 883, height = 466, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 467}, -- 8: alive ben down0007
		{x = 4425, y = 10, width = 883, height = 466, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 467}, -- 9: alive ben down0008
		{x = 5308, y = 10, width = 883, height = 466, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 467}, -- 10: alive ben down0009
		{x = 6191, y = 10, width = 883, height = 555, offsetX = -1, offsetY = 0, offsetWidth = 885, offsetHeight = 556}, -- 11: alive ben idle0000
		{x = 6191, y = 10, width = 883, height = 555, offsetX = -1, offsetY = 0, offsetWidth = 885, offsetHeight = 556}, -- 12: alive ben idle0001
		{x = 7074, y = 10, width = 883, height = 555, offsetX = 0, offsetY = -1, offsetWidth = 885, offsetHeight = 556}, -- 13: alive ben idle0002
		{x = 7074, y = 10, width = 883, height = 555, offsetX = 0, offsetY = -1, offsetWidth = 885, offsetHeight = 556}, -- 14: alive ben idle0003
		{x = 10, y = 565, width = 883, height = 552, offsetX = 0, offsetY = -2, offsetWidth = 885, offsetHeight = 556}, -- 15: alive ben idle0004
		{x = 10, y = 565, width = 883, height = 552, offsetX = 0, offsetY = -2, offsetWidth = 885, offsetHeight = 556}, -- 16: alive ben idle0005
		{x = 893, y = 565, width = 883, height = 551, offsetX = 0, offsetY = -4, offsetWidth = 885, offsetHeight = 556}, -- 17: alive ben idle0006
		{x = 1776, y = 565, width = 883, height = 551, offsetX = 0, offsetY = -4, offsetWidth = 885, offsetHeight = 556}, -- 18: alive ben idle0007
		{x = 2659, y = 565, width = 883, height = 548, offsetX = -1, offsetY = -7, offsetWidth = 885, offsetHeight = 556}, -- 19: alive ben idle0008
		{x = 3542, y = 565, width = 883, height = 548, offsetX = -1, offsetY = -7, offsetWidth = 885, offsetHeight = 556}, -- 20: alive ben idle0009
		{x = 4425, y = 565, width = 885, height = 543, offsetX = 0, offsetY = -11, offsetWidth = 885, offsetHeight = 556}, -- 21: alive ben idle0010
		{x = 4425, y = 565, width = 885, height = 543, offsetX = 0, offsetY = -11, offsetWidth = 885, offsetHeight = 556}, -- 22: alive ben idle0011
		{x = 5310, y = 565, width = 884, height = 540, offsetX = -1, offsetY = -15, offsetWidth = 885, offsetHeight = 556}, -- 23: alive ben idle0012
		{x = 5310, y = 565, width = 884, height = 540, offsetX = -1, offsetY = -15, offsetWidth = 885, offsetHeight = 556}, -- 24: alive ben idle0013
		{x = 6194, y = 565, width = 883, height = 536, offsetX = -1, offsetY = -18, offsetWidth = 885, offsetHeight = 556}, -- 25: alive ben idle0014
		{x = 6194, y = 565, width = 883, height = 536, offsetX = -1, offsetY = -18, offsetWidth = 885, offsetHeight = 556}, -- 26: alive ben idle0015
		{x = 7077, y = 565, width = 884, height = 534, offsetX = 0, offsetY = -21, offsetWidth = 885, offsetHeight = 556}, -- 27: alive ben idle0016
		{x = 7077, y = 565, width = 884, height = 534, offsetX = 0, offsetY = -21, offsetWidth = 885, offsetHeight = 556}, -- 28: alive ben idle0017
		{x = 10, y = 1117, width = 883, height = 531, offsetX = -1, offsetY = -23, offsetWidth = 885, offsetHeight = 556}, -- 29: alive ben idle0018
		{x = 10, y = 1117, width = 883, height = 531, offsetX = -1, offsetY = -23, offsetWidth = 885, offsetHeight = 556}, -- 30: alive ben idle0019
		{x = 893, y = 1117, width = 885, height = 532, offsetX = 0, offsetY = -23, offsetWidth = 885, offsetHeight = 556}, -- 31: alive ben idle0020
		{x = 893, y = 1117, width = 885, height = 532, offsetX = 0, offsetY = -23, offsetWidth = 885, offsetHeight = 556}, -- 32: alive ben idle0021
		{x = 1778, y = 1117, width = 883, height = 533, offsetX = -1, offsetY = -22, offsetWidth = 885, offsetHeight = 556}, -- 33: alive ben idle0022
		{x = 1778, y = 1117, width = 883, height = 533, offsetX = -1, offsetY = -22, offsetWidth = 885, offsetHeight = 556}, -- 34: alive ben idle0023
		{x = 2661, y = 1117, width = 883, height = 538, offsetX = 0, offsetY = -18, offsetWidth = 885, offsetHeight = 556}, -- 35: alive ben idle0024
		{x = 2661, y = 1117, width = 883, height = 538, offsetX = 0, offsetY = -18, offsetWidth = 885, offsetHeight = 556}, -- 36: alive ben idle0025
		{x = 3544, y = 1117, width = 883, height = 542, offsetX = 0, offsetY = -12, offsetWidth = 885, offsetHeight = 556}, -- 37: alive ben idle0026
		{x = 3544, y = 1117, width = 883, height = 542, offsetX = 0, offsetY = -12, offsetWidth = 885, offsetHeight = 556}, -- 38: alive ben idle0027
		{x = 4427, y = 1117, width = 883, height = 548, offsetX = 0, offsetY = -7, offsetWidth = 885, offsetHeight = 556}, -- 39: alive ben idle0028
		{x = 5310, y = 1117, width = 883, height = 548, offsetX = 0, offsetY = -7, offsetWidth = 885, offsetHeight = 556}, -- 40: alive ben idle0029
		{x = 6193, y = 1117, width = 883, height = 553, offsetX = -1, offsetY = -2, offsetWidth = 885, offsetHeight = 556}, -- 41: alive ben idle0030
		{x = 7076, y = 1117, width = 883, height = 553, offsetX = -1, offsetY = -2, offsetWidth = 885, offsetHeight = 556}, -- 42: alive ben idle0031
		{x = 10, y = 1670, width = 885, height = 554, offsetX = 0, offsetY = 0, offsetWidth = 885, offsetHeight = 556}, -- 43: alive ben idle0032
		{x = 10, y = 1670, width = 885, height = 554, offsetX = 0, offsetY = 0, offsetWidth = 885, offsetHeight = 556}, -- 44: alive ben idle0033
		{x = 895, y = 1670, width = 883, height = 558, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 45: alive ben left0000
		{x = 895, y = 1670, width = 883, height = 558, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 46: alive ben left0001
		{x = 1778, y = 1670, width = 883, height = 559, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 47: alive ben left0002
		{x = 1778, y = 1670, width = 883, height = 559, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 48: alive ben left0003
		{x = 2661, y = 1670, width = 883, height = 557, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 49: alive ben left0004
		{x = 2661, y = 1670, width = 883, height = 557, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 50: alive ben left0005
		{x = 3544, y = 1670, width = 883, height = 558, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 51: alive ben left0006
		{x = 3544, y = 1670, width = 883, height = 558, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 52: alive ben left0007
		{x = 4427, y = 1670, width = 883, height = 558, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 53: alive ben left0008
		{x = 4427, y = 1670, width = 883, height = 558, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 559}, -- 54: alive ben left0009
		{x = 5310, y = 1670, width = 883, height = 554, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 55: alive ben right0000
		{x = 5310, y = 1670, width = 883, height = 554, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 56: alive ben right0001
		{x = 6193, y = 1670, width = 883, height = 555, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 57: alive ben right0002
		{x = 6193, y = 1670, width = 883, height = 555, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 58: alive ben right0003
		{x = 7076, y = 1670, width = 883, height = 553, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 59: alive ben right0004
		{x = 7076, y = 1670, width = 883, height = 553, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 60: alive ben right0005
		{x = 10, y = 2229, width = 883, height = 554, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 61: alive ben right0006
		{x = 893, y = 2229, width = 883, height = 554, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 62: alive ben right0007
		{x = 1776, y = 2229, width = 883, height = 554, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 63: alive ben right0008
		{x = 2659, y = 2229, width = 883, height = 554, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 555}, -- 64: alive ben right0009
		{x = 3542, y = 2229, width = 883, height = 583, offsetX = -1, offsetY = -15, offsetWidth = 884, offsetHeight = 599}, -- 65: alive ben up0000
		{x = 3542, y = 2229, width = 883, height = 583, offsetX = -1, offsetY = -15, offsetWidth = 884, offsetHeight = 599}, -- 66: alive ben up0001
		{x = 4425, y = 2229, width = 883, height = 599, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 599}, -- 67: alive ben up0002
		{x = 4425, y = 2229, width = 883, height = 599, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 599}, -- 68: alive ben up0003
		{x = 5308, y = 2229, width = 883, height = 597, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 599}, -- 69: alive ben up0004
		{x = 5308, y = 2229, width = 883, height = 597, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 599}, -- 70: alive ben up0005
		{x = 6191, y = 2229, width = 883, height = 598, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 599}, -- 71: alive ben up0006
		{x = 7074, y = 2229, width = 883, height = 598, offsetX = 0, offsetY = 0, offsetWidth = 884, offsetHeight = 599}, -- 72: alive ben up0007
		{x = 10, y = 2828, width = 883, height = 598, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 599}, -- 73: alive ben up0008
		{x = 893, y = 2828, width = 883, height = 598, offsetX = -1, offsetY = 0, offsetWidth = 884, offsetHeight = 599} -- 74: alive ben up0009
	},
	{
		["down"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = -44},
		["left"] = {start = 45, stop = 54, speed = 24, offsetX = 0, offsetY = 0},
		["right"] = {start = 55, stop = 64, speed = 24, offsetX = 0, offsetY = 0},
		["up"] = {start = 65, stop = 74, speed = 24, offsetX = 0, offsetY = 22},
		["idle"] = {start = 11, stop = 44, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle",
	false
)
