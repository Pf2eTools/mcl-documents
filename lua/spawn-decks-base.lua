local Spawner = require("lua.spawner")

function onClickSpawn()
    print("Spawning decks...")
    local spawner = Spawner()
    local position = self.positionToWorld({0, 0, 0}) + Vector({0, 0, 1})
    for _, deck in ipairs(decks) do
        position = position + Vector({0, 0, 4})
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
        label = "Spawn\nDecks",
        position = Vector(0, 0.1, 0),
        width = 1500,
        height = 1500,
        font_size = 300,
        tooltip = "Click to spawn decks!",
    })
end