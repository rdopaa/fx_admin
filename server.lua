-------- NO TOCAR --------

ESX = exports['es_extended']:getSharedObject()

-------- NO TOCAR --------

local tron = false

RegisterCommand("staff", function(source, args, rawCommand)
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)
			if havePermission(xPlayer) then
				if not tron then 
					tron = true
					TriggerClientEvent('tron:admin', xPlayer.source, tron)
				else
					tron = false
					TriggerClientEvent('tron:admin', xPlayer.source, tron)
				end      
			end

end, false)


function havePermission(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if exclude and type(exclude) ~= 'table' then exclude = nil;print("^3[esx_admin] ^1ERROR ^0exclude argument is not table..^0") end	-- will prevent from errors if you pass wrong argument

	local playerGroup = xPlayer.getGroup()
	for k,v in pairs(Config.adminRanks) do
		if v == playerGroup then
			if not exclude then
				return true
			else
				for a,b in pairs(exclude) do
					if b == v then
						return false
					end
				end
				return true
			end
		end
	end
	return false
end