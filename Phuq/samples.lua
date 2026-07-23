local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/soxlarmxxsery/Library/refs/heads/main/Phuq/Library.lua"))()

Library.Folders = {
    Directory = "Phuq",
    Configs = "Phuq/Configs",
    Assets = "Phuq/Assets"
}

for Index, Value in pairs(Library.Folders) do
    if not isfolder(Value) then
        makefolder(Value)
    end
end

local Window = Library:Window({Name = "Phuq.zxc", Logo = "92076780674896", MobileButtonText = ""})
local Watermark = Library:Watermark("This is a watermark")
local KeybindList = Library:KeybindList()

local TargetHud = Library:TargetHud()
TargetHud:SetVisibility(true) -- the library creates this hidden and never shows it on its own

TargetHud:SetPlayer(game.Players.LocalPlayer)

local Bar1 = TargetHud:AddBar(Color3.fromRGB(255, 0, 0))

task.spawn(function()
    while task.wait(1.5) do
        Bar1:SetPercentage(math.random(1, 100))
    end
end)

local CombatPage = Window:Page({Name = "Combat", Columns = 2})
local VisualsPage = Window:Page({Name = "Visuals", Columns = 2})
local MiscPage = Window:Page({Name = "Misc", Columns = 2})
local SettingsPage = Library:CreateSettingsPage(Window, KeybindList, Watermark)

local AimbotSection = CombatPage:Section({Name = "Aimbot", Side = 1})
local VisualsSection = VisualsPage:Section({Name = "Visuals", Side = 1})
local MiscSection = MiscPage:Section({Name = "Misc", Side = 1})

local Toggle = AimbotSection:Toggle({
    Name = "Enabled",
    Flag = "AimbotEnabled",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})

local ToggleWithKeybind = AimbotSection:Toggle({
    Name = "Toggle with Keybind",
    Flag = "AimbotToggleKeybind",
    Default = false,
    Callback = function(Value)
        print("Toggle with keybind is now:", Value)
    end
}):Keybind({
    Default = Enum.KeyCode.Backspace,
    Mode = "Toggle",
    Callback = function(Value)
        print("Keybind is now:", Value)
    end
})

local Button = AimbotSection:Button({
    Name = "Button",
    Callback = function()
        print("Button Pressed")
    end
})

local NotifyButton = AimbotSection:Button({
    Name = "Notify Target",
    Callback = function()
        local RealColor = "#FFBF24" -- gold, matches the theme accent - swap per notification if you want different colors

        Library:Notification(
            "Target Locked: <font color='" .. RealColor .. "'>" .. "Test Works!" .. "</font>",
            2
        )
    end
})

local Slider = AimbotSection:Slider({
    Name = "Slider",
    Flag = "Slider",
    Min = 0,
    Default = 0,
    Max = 100,
    Suffix = "%",
    Decimals = 1,
    Callback = function(Value)
        print(Value)
    end
})

local Dropdown = AimbotSection:Dropdown({
    Name = "Dropdown",
    Flag = "Dropdown",
    Default = "Option 1",
    Items = {"Option 1", "Option 2", "Option 3"},
    MaxSize = 100,
    Callback = function(Value)
        print(Value)
    end
})

local MultiDropdown = AimbotSection:Dropdown({
    Name = "Multi Dropdown",
    Flag = "MultiDropdown",
    Default = {"Option 1", "Option 2"},
    Items = {"Option 1", "Option 2", "Option 3"},
    Multi = true,
    MaxSize = 100,
    Callback = function(Value)
        print("Selected:", table.concat(Value, ", "))
    end
})

AimbotSection:Label("Colorpicker"):Colorpicker({
    Name = "Colorpicker",
    Flag = "Colorpicker",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        print(Value)
    end
})

AimbotSection:Label("Keybind"):Keybind({
    Name = "Keybind",
    Flag = "Keybind",
    Default = Enum.UserInputType.MouseButton2,
    Mode = "Toggle",
    Callback = function(Value)
        print(Value)
    end
})

AimbotSection:Textbox({
    Name = "Textbox",
    Placeholder = "...",
    Numeric = false,
    Finished = false,
    Flag = "Textbox",
    Callback = function(Value)
        print(Value)
    end
})

Library:Notification("this is a notification", 5)

local AvatarImage = MiscSection:Image({
    Height = 100,
    ScaleType = Enum.ScaleType.Fit,
})

task.spawn(function()
    AvatarImage:SetPlayerThumbnail(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
end)

MiscSection:Label("Test Works!")

MiscSection:Label("<font color='#FFBF24'>Colored Label</font>")

MiscSection:Toggle({
    Name = "Target Hud",
    Flag = "TargetHudVisible",
    Default = true,
    Callback = function(Value)
        TargetHud:SetVisibility(Value)
    end
})

MiscSection:Listbox({
    Name = "Example Listbox",
    Flag = "ExampleListbox",
    Items = {"Apple", "Banana", "Orange", "Grape", "Strawberry"},
    Default = "Apple",
    MaxSize = 150,
    Callback = function(Value)
        print("Selected Listbox Item:", Value)
    end
})
