local spawnedNPCs = {}

CreateThread(function()
    for i, npc in pairs(Config.NPCs) do
        local model = GetHashKey(npc.model)

        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10)
        end

        local spawnZ = npc.coords.z - 1.0
        local ped = CreatePed(4, model, npc.coords.x, npc.coords.y, spawnZ, npc.coords.w, false, true)
        SetEntityAsMissionEntity(ped, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetPedDiesWhenInjured(ped, false)
        SetPedCanPlayAmbientAnims(ped, true)
        SetPedCanRagdollFromPlayerImpact(ped, false)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)

        table.insert(spawnedNPCs, {
            ped = ped,
            coords = vec3(npc.coords.x, npc.coords.y, spawnZ),
            text = npc.text
        })
    end
end)

-- 3D text
CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())

        for _, data in pairs(spawnedNPCs) do
            if data.text then
                local dist = #(playerCoords - data.coords.xyz)
                if dist <= 5.0 then
                    Draw3DText(data.coords.xyz + vec3(0.0, 0.0, 1.0), data.text)
                end
            end
        end

        Wait(0)
    end
end)

function Draw3DText(coords, text)
    local s = Config.TextSettings
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z + 1.0)
    local camCoords = GetGameplayCamCoords()
    local distance = #(camCoords - coords)
    local scale = s.scale / distance * 2
    if scale > 0.5 then scale = 0.5 end

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(s.font)
        SetTextProportional(1)
        SetTextColour(s.color.r, s.color.g, s.color.b, s.color.a)
        SetTextCentre(1)

        BeginTextCommandWidth("STRING")
        AddTextComponentSubstringPlayerName(text)
        local baseWidth = EndTextCommandGetWidth(s.font)

        local textWidth = baseWidth * scale * s.boxScaleX
        local boxHeight = 0.03 * scale * s.boxScaleY

        if s.drawBox then
            DrawRect(_x, _y + 0.012, textWidth + s.boxPadding, boxHeight, s.boxColor.r, s.boxColor.g, s.boxColor.b, s.boxColor.a)
        end

        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(_x, _y)
    end
end
