local QBCore = exports["qb-core"]:GetCoreObject()
local cfg = require 'config'

if cfg.target == 'ox_target' then
    exports.ox_target:addGlobalPlayer({
        label = 'Give Money',
        name = 'target_bagiduit',
        distance = 1.0,
        onSelect = function(data)
            local net = NetworkGetPlayerIndexFromPed(data.entity)
            local id = GetPlayerServerId(net)
            local input = lib.inputDialog('Give money', {
                {
                    type = 'number',
                    label = 'Amount',
                    description = 'Max 10,000',
                    min = 1,
                    max = 10000, -- ikut korunk !
                    default = 1,
                }
            })
            if input then
                local memberi = lib.callback.await('div:bagiduit:target', false, id, input[1])
                if not memberi then
                    QBCore.Functions.Notify('No enough money')
                end
            end
        end,
    })
elseif cfg.target == 'qb-target' then
    exports['qb-target']:AddGlobalPed({
            options = {
                {
                    label = 'Give Money',
                    icon = 'fas fa-user',
                    action = function(entity)
                        local net = NetworkGetPlayerIndexFromPed(entity)
                        local id = GetPlayerServerId(net)
                        local input = lib.inputDialog('Give money', {
                            {
                                type = 'number',
                                label = 'Amount',
                                description = 'Max 10,000',
                                min = 1,
                                max = 10000, 
                                default = 1,
                            }
                        })
                        if input then
                            local memberi = lib.callback.await('div:bagiduit:target', false, id, input[1])
                            if not memberi then
                                QBCore.Functions.Notify('No enough money')
                            end
                        end
                    end,
                }
            },
        distance = 1.0,
    })
end
