------- NO TOCAR -------

ESX = exports['es_extended']:getSharedObject()

------- NO TOCAR -------

print('Configurado by fxDopa #ARGRP')

-------------- STAFF TRON --------------------
RegisterNetEvent('fx:admin')
AddEventHandler('fx:admin', function()
		if not admin then
			TriggerEvent('chatMessage', 'Entraste a moderar')
						TriggerEvent('skinchanger:getSkin', function(skin)
							local couleur = 3
							local model = GetEntityModel(PlayerPedId())
							armor = GetPedArmour(PlayerPedId())
							SetEntityInvincible(PlayerPedId(), true)
							SetEntityProofs(PlayerPedId(), true, true, true, true, true, true, true, true)
							if model == GetHashKey("mp_m_freemode_01") then
								admin = true
								clothesSkin = {
									['bags_1'] = 0, ['bags_2'] = 0,
									['tshirt_1'] = 15, ['tshirt_2'] = 0,
									['torso_1'] = 208, ['torso_2'] = 0,
									['arms'] = 41,
									['pants_1'] = 87, ['pants_2'] = 0,
									['shoes_1'] = 25, ['shoes_2'] = 0,
									['mask_1'] = 0, ['mask_2'] = 0,
									['bproof_1'] = 0,
									['chain_1'] = 0,
									['helmet_1'] = -1, ['helmet_2'] = 0,
								}
							else
								admin = true
								clothesSkin = {
									['bags_1'] = 0, ['bags_2'] = 0,
									['tshirt_1'] = 15, ['tshirt_2'] = 0,
									['torso_1'] = 249, ['torso_2'] = 0,
									['arms'] = 41,
									['pants_1'] = 87, ['pants_2'] = 0,
									['shoes_1'] = 25, ['shoes_2'] = 0,
									['mask_1'] = 0, ['mask_2'] = 0,
									['bproof_1'] = 0,
									['chain_1'] = 0,
									['helmet_1'] = -1, ['helmet_2'] = 0,
								}
							end
						 TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
						end)
				else
					admin = false
					TriggerEvent('chatMessage', 'Saliste de moderar ')
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
							local isMale = skin.sex == 0
							TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
								ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
									TriggerEvent('skinchanger:loadSkin', skin)
									TriggerEvent('esx:restoreLoadout')
									
								end)
							end)
						end)
						SetPedArmour(PlayerPedId(), 0)
						FreezeEntityPosition(PlayerPedId(), false)
						SetEntityVisible(PlayerPedId(), 1, 0)
						NetworkSetEntityInvisibleToNetwork(PlayerPedId(), 0)

				end
end)
