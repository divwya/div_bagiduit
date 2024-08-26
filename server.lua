local QBCore = exports["qb-core"]:GetCoreObject()

lib.callback.register('div:bagiduit:target', function(source, tId, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local target = QBCore.Functions.GetPlayer(tId)
    local cash = Player.Functions.GetMoney('cash')
    if cash >= amount then
        Player.Functions.RemoveMoney('cash', amount)
        target.Functions.AddMoney('cash', amount)
        return true
    else
        return false
    end
end)
