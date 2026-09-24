-- Cliente: Crea la interfaz del panel y maneja los eventos de toque
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Obtiene el RemoteEvent y el RemoteFunction
local panelEvent = ReplicatedStorage:WaitForChild("PanelEvent")
local velocidadFunction = ReplicatedStorage:WaitForChild("VelocidadFunction")

-- Crea el panel
local panel = Instance.new("ScreenGui")
panel.Name = "VelocidadPanel"
panel.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = panel

local aumentarButton = Instance.new("TextButton")
aumentarButton.Text = "Aumentar Velocidad"
aumentarButton.Size = UDim2.new(0, 100, 0, 30)
aumentarButton.Position = UDim2.new(0.5, -50, 0.2, 0)
aumentarButton.Parent = frame

local bajarButton = Instance.new("TextButton")
bajarButton.Text = "Bajar Velocidad"
bajarButton.Size = UDim2.new(0, 100, 0, 30)
bajarButton.Position = UDim2.new(0.5, -50, 0.6, 0)
bajarButton.Parent = frame

-- Eventos de toque para los botones
aumentarButton.MouseButton1Click:Connect(function()
    velocidadFunction:InvokeServer("aumentar")
end)

bajarButton.MouseButton1Click:Connect(function()
    velocidadFunction:InvokeServer("bajar")
end)

-- Evento de toque para el panel
frame.MouseButton1Click:Connect(function()
    panelEvent:FireServer("toggle")
    panel.Enabled = not panel.Enabled
end)

-- Asegúrate de que el panel esté abierto al inicio
panel.Enabled = true
