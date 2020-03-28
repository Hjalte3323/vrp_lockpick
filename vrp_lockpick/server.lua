local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_lockpick")


vRP.defInventoryItem({"lockpick","Låse Sæt","Bruges til at dirke låse op med!",
		function(args)
				local choices = {}
				choices["> Brug"] = {function(source,choice)
						local xPlayer = vRP.getUserId({source})
						if xPlayer ~= nil then
							if vRP.tryGetInventoryItem({xPlayer, "lockpick", 1, true}) then
								TriggerClientEvent("hjalte:open", xPlayer)
						end
					vRP.closeMenu({xPlayer})
				end
		end,"Brug den med omhu, du kan ende i spjældet!!"}

		return choices
end, 1.50
})