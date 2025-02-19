-- Script to fire when holding 'x'
-- Script generated by SimpleSpy - credits to exx#9394

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local uis = game:GetService("UserInputService")
local isFiring = false

local function fireAtPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Team ~= game.Teams.Spectators then
            local args = {
                [1] = "Fire",
                [2] = {
                    [1] = {
                        [1] = "Hit",
                        [2] = Vector3.new(537.1044921875, 1.0778781175613403, 1459.1669921875),
                        [3] = Vector3.new(574.0000610351562, 12.430750846862793, 1456.210205078125),
                        [4] = player.Character.Head,
                        [5] = Vector3.new(-1, 0, 0),
                        [6] = 41.306060791015625,
                        [7] = Enum.Material.Concrete
                    }
                }
            }

            game:GetService("Players").LocalPlayer.Character.Item.Script.UserAction:FireServer(unpack(args))
        end
    end
end

local function onInputBegan(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.X and not gameProcessed then
        isFiring = true
        while isFiring do
            fireAtPlayers()
            wait(0.1)  -- Adjust the delay as needed
        end
    end
end

local function onInputEnded(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.X and not gameProcessed then
        isFiring = false
    end
end

uis.InputBegan:Connect(onInputBegan)
uis.InputEnded:Connect(onInputEnded)
