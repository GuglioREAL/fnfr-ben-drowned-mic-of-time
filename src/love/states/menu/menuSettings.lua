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

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")
local menuBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/title-bg")))

newlinesMoment = {
    "",
    "\n\n",
    "\n\n\n\n",
    "\n\n\n\n\n\n",
    "\n\n\n\n\n\n\n\n\n\n"
}

local function switchMenu(menu)
	function backFunc()
		status.setLoading(true)
		Gamestate.switch(menuSelect)
        status.setLoading(false)
	end
    
end

return {
	enter = function(self, previous)

		songNum = 0
        settingSelect = 1

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)

		if useDiscordRPC then
			presence = {
				state = "Changing Settings",
				details = "In the Settings Menu",
				largeImageKey = "logo",
				startTimestamp = now,
			}
			nextPresenceUpdate = 0
		end
	end,

	update = function(self, dt)
		if not graphics.isFading() then
			if input:pressed("confirm") then
                function confirmFunc()
                    if settingSelect == 1 then
                        if settings.downscroll then
                            settings.downscroll = false
                        else
                            settings.downscroll = true
                        end
                    elseif settingSelect == 2 then
                        if settings.ghostTapping then
                            settings.ghostTapping = false
                        else
                            settings.ghostTapping = true
                        end
                    elseif settingSelect == 3 then
                        if settings.hardwareCompression then
                            settings.hardwareCompression = false
                        else
                            settings.hardwareCompression = true
                        end
                    elseif settingSelect == 4 then
                        if not settings.showDebug then
                            settings.showDebug = "fps"
                        elseif settings.showDebug == "fps" then
                            settings.showDebug = "detailed" 
                        elseif settings.showDebug == "detailed" then
                            settings.showDebug = false
                        end
                    else
                        
                        if settings.hardwareCompression ~= data.saveSettingsMoment.hardwareCompression  then
                            data = {}
                            if settings.hardwareCompression then
                                imageTyppe = "dds" 
                            else
                                imageTyppe = "png"
                            end
                            data.saveSettingsMoment = {
                                hardwareCompression = settings.hardwareCompression,
                                downscroll = settings.downscroll,
                                ghostTapping = settings.ghostTapping,
                                showDebug = settings.showDebug,
                                setImageType = imageTyppe
                            }
                            serialized = lume.serialize(data)
                            love.filesystem.write("settings.data", serialized)
                            love.window.showMessageBox("Settings Saved!", "Settings saved. Funkin Vasion will now restart to make sure your settings saved")
                            love.event.quit("restart")
                        else
                            data = {}
                            if settings.hardwareCompression then
                                imageTyppe = "dds" 
                            else
                                imageTyppe = "png"
                            end
                            data.saveSettingsMoment = {
                                hardwareCompression = settings.hardwareCompression,
                                downscroll = settings.downscroll,
                                ghostTapping = settings.ghostTapping,
                                showDebug = settings.showDebug,
                                setImageType = imageTyppe
                            }
                            serialized = lume.serialize(data)
                            love.filesystem.write("settings.data", serialized)
                            Gamestate.switch(menuSelect)
                        end
                    end
                end
				audio.playSound(confirmSound)

                confirmFunc()
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				backFunc()
            elseif input:pressed("up") then
                if settingSelect ~= 1 then
                    settingSelect = settingSelect - 1
                else
                    settingSelect = 5
                end
            elseif input:pressed("down") then
                if settingSelect ~= 5 then
                    settingSelect = settingSelect + 1
                else
                    settingSelect = 1
                end
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
                menuBG:draw()

                graphics.setColor(1,1,0)
                love.graphics.print("Downscroll = " .. tostring(settings.downscroll), -628, -100)
                love.graphics.print("\n\nGhost Tapping = " .. tostring(settings.ghostTapping), -628, -100)
                love.graphics.print("\n\n\n\nHardware Compression = " .. tostring(settings.hardwareCompression) .. "  (RESTART REQUIRED)", -628, -100) 
                love.graphics.print("\n\n\n\n\n\nShow Debug = " .. tostring(settings.showDebug), -628, -100)
                love.graphics.print(newlinesMoment[settingSelect] .. ">", -640, -100)
                if settings.hardwareCompression ~= data.saveSettingsMoment.hardwareCompression then
                    love.graphics.print("\n\n\n\n\n\n\n\n\n\nSave settings & Restart", -628, -100)
                else
                    love.graphics.print("\n\n\n\n\n\n\n\n\n\nSave settings", -628, -100)
                end
                

                graphics.setColor(1,1,1)
				love.graphics.scale(cam.sizeX, cam.sizeY)

				love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		

		Timer.clear()
	end
}
