local Spawner = {
    _ix = 100000
}
Spawner.__index = Spawner

setmetatable(Spawner, {
    __call = function()
        local this = setmetatable({}, Spawner)
        return this
    end
})

function Spawner:spawnDeckOfCards(params)
    local deck = nil
    for ix, cardInfo in ipairs(params.cards) do
        Spawner._ix = Spawner._ix + 1
        local spawned = spawnObjectData({
            data = {
                Transform = {
                    posX = 0,
                    posY = 0,
                    posZ = 0,
                    rotX = 0,
                    rotY = 0,
                    rotZ = 0,
                    scaleX = 1,
                    scaleY = 1,
                    scaleZ = 1
                },
                Name = "Card",
                Nickname = cardInfo.name,
                Description = cardInfo.description,
                GMNotes = params.gm_notes,
                CardID = Spawner._ix * 100,
                Tags = params.tags or {},
                CustomDeck = {
                    [Spawner._ix] = {
                        FaceURL = cardInfo.face,
                        BackURL = cardInfo.back or params.back or cardInfo.face,
                        NumWidth = 1,
                        NumHeight = 1,
                        Type = 0,
                        BackIsHidden = true,
                        UniqueBack = false
                    }
                }
            },
            position = Vector(params.position) + Vector(0, ix * 0.1, 0),
            rotation = params.rotation,
            callback_function = params.callback,
        })
        if deck == nil then
            deck = spawned
        else
            deck = deck.putObject(spawned)
        end
    end
    return deck
end

return Spawner