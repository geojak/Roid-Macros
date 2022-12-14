--[[
	Author: Dennis Werner Garske (DWG)
	License: MIT License
]]
local _G = _G or getfenv(0)
local Roids = _G.Roids or {}
Roids.mouseoverUnit = Roids.mouseoverUnit or nil;

local Extension = Roids.RegisterExtension("BlizzardPartyFrame");

function Extension.SetUnit(_, unit)
    Roids.mouseoverUnit = unit;
end

function Extension.SetText()
    Roids.mouseoverUnit = "player";
	--print(Roids.mouseoverUnit)
end


function Extension.OnClose()
    Roids.mouseoverUnit = nil;
end

function Extension.OnLoad()
	Extension.HookMethod(_G["GameTooltip"], "SetText", "SetText");
    Extension.HookMethod(_G["GameTooltip"], "SetUnit", "SetUnit");
    Extension.HookMethod(_G["GameTooltip"], "Hide", "OnClose");
    Extension.HookMethod(_G["GameTooltip"], "FadeOut", "OnClose");
end

_G["Roids"] = Roids;