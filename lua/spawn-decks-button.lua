local Spawner = require("lua.spawner")
local decks = require("lua.decks")

function onClickSpawn()
    print("Spawning MCL decks...")
    local spawner = Spawner()
    local position = self.positionToWorld({0, 0, 0}) + Vector({0, 0, 5})
    for _, deck in ipairs(decks) do
        position = position + Vector({0, 0, 2})
        spawner:spawnDeckOfCards({
            cards = deck,
            position = position,
            rotation = Vector({0, 0, 0}),
        })
    end

    self.destruct()
end

function onLoad()
    self.createButton({
        click_function = "onClickSpawn",
        function_owner = self,
        label = "Spawn\nMCL Decks",
        position = Vector(0, 0.1, 0),
        width = 1500,
        height = 1500,
        font_size = 300,
        tooltip = "Click to spawn MCL decks!",
    })
end