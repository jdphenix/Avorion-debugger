local player = Player()

if onServer() then 
    player:addScriptOnce("autoscaler.lua")
end