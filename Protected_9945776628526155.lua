--!strict

repeat task.wait() until _G.WindUI and _G.Functions and _G.Connections and _G.Connections.OnLocalPlayerViewed

local RespawnFunction

for i, v in getgc(true) do
	if typeof(v) == "table" and rawget(v, "Respawn") then 
		RespawnFunction = v.Respawn;
	end
end

if not RespawnFunction then 
	warn("Failed to find the respawn function")
	return
end

warn("Respawn shit is activated.");

local PlayerViewedEventFn = function(playerInfo) 
	if not playerInfo or typeof(playerInfo) ~= "table" then return end

	if _G.Invisibility or _G.AutoArrest then 
		warn("Respawning because you're being viewed while invis or autoarresting by", playerInfo.PlayerName)


        -- This still dosent affect the ui visuals, but works better with the UI Toggle On/Off

        _G.Window.TabModule.Tabs[1].Elements[8].Callback(false)
        _G.Window.TabModule.Tabs[2].Elements[1].Callback(true)

        ---------------

        if _G.SpeedModify then _G.SpeedModify = false end;

		RespawnFunction()
	else
		warn("Someone viewed you, but you weren't invis or autoarresting, so ignoring.")
	end
end

_G.Connections.OnLocalPlayerViewed.Event:Connect(PlayerViewedEventFn)
