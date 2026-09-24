-- Servidor: Crea un panel y botones, y configura las funciones de velocidad
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Crea un RemoteEvent para comunicar el estado del panel
local panelEvent = Instance.new("RemoteEvent")
panelEvent.Name = "PanelEvent"
panelEvent.Parent = ReplicatedStorage

-- Crea un RemoteFunction para aumentar y bajar la velocidad
local velocidadFunction = Instance.new("RemoteFunction")
velocidadFunction.Name = "VelocidadFunction"
velocidadFunction.Parent = ReplicatedStorage

-- Función para aumentar la velocidad
function aumentarVelocidad(player)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = humanoid.WalkSpeed + 1
            print("Velocidad aumentada a: " .. humanoid.WalkSpeed)
        end
    end
end

-- Función para bajar la velocidad
function bajarVelocidad(player)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = humanoid.WalkSpeed - 1
            print("Velocidad bajada a: " .. humanoid.WalkSpeed)
        end
    end
end

-- Conecta las funciones al RemoteFunction
velocidadFunction.OnServerInvoke = function(player, action)
    if action == "aumentar" then
        aumentarVelocidad(player)
    elseif action == "bajar" then
        bajarVelocidad(player)
    end
end

-- Evento para abrir/cerrar el panel
panelEvent.OnServerEvent:Connect(function(player, action)
    if action == "toggle" then
        -- Aquí podrías manejar el estado del panel en el servidor si es necesario
    end
end)
