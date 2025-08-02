-- Script Path: game:GetService("Workspace").Vehicles["Chevlon Captain 1992"]["Drive Controller"]["Vehicle Interface"].Drive
-- Took 0.29s to decompile.
-- Executor: Potassium (v1.8.0)

script.Parent:WaitForChild("Car")
script.Parent:WaitForChild("IsOn")
script.Parent:WaitForChild("ControlsOpen")
script.Parent:WaitForChild("Values")
local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = v_u_1.ClientBinds
local v_u_3 = v_u_1.FE
local v_u_4 = v_u_3:WaitForChild("SetWheels")
local v_u_5 = game.Players.LocalPlayer
local v6 = v_u_5:WaitForChild("PlayerGui")
local v_u_7 = v_u_5:GetMouse()
local v_u_8 = game:GetService("UserInputService")
local v_u_9 = script.Parent.Car.Value
local v_u_10 = require(v_u_9["Drive Controller"])
local v11 = script:WaitForChild("TabletDrift")
local v_u_12 = v_u_9.Control_Values
local v_u_13 = v6:WaitForChild("GameGui")
local v14 = v_u_1.Modules
local v15 = require(v14.Network)("amor")
local v_u_16 = require(v_u_1.LocalPackages.Janitor).new()
local v_u_17 = require(v_u_1.Utils.Vehicle.RemoveWheelForce)
v_u_10.Controls.ToggleTransMode = Enum.KeyCode.N
v_u_10.ClutchMode = "Old"
v_u_10.AutoShiftMode = "RPM"
if not v_u_10.AdjustedHP then
    v_u_10.AdjustedHP = true
    if v_u_9.Name ~= "Dump Truck" and (v_u_9.Name ~= "Forklift" and v_u_9.Name ~= "Front Loader Tractor") then
        v_u_10.Horsepower = v_u_10.Horsepower + 100
    end
    v_u_10.FCamber = -2
    v_u_10.RCamber = -2
end
if not v_u_10.BaseFDMult then
    v_u_10.BaseFDMult = v_u_10.FDMult
end
if not v_u_10.BaseBrakeForce then
    v_u_10.BaseBrakeForce = v_u_10.BrakeForce
end
if v_u_9:FindFirstChild("Body") and (v_u_9.Body:FindFirstChild("TowHitch") and (v_u_9.Body.TowHitch:FindFirstChild("HitchConstraint") and v_u_9.Body.TowHitch.HitchConstraint.Attachment1)) then
    v_u_10.FDMult = v_u_10.BaseFDMult + 0.9
    v_u_10.BrakeForce = v_u_10.BaseBrakeForce * 1.1
else
    v_u_10.FDMult = v_u_10.BaseFDMult
    v_u_10.BrakeForce = v_u_10.BaseBrakeForce
end
local v_u_18 = v_u_9.Input_Events:FindFirstChild("Reverse")
local v_u_19 = v_u_9.Input_Events:FindFirstChild("Brake")
v_u_1.ClientBinds.IsDrivingVehicle:Fire(v_u_9)
v_u_5.Character:WaitForChild("Humanoid"):UnequipTools()
spawn(function()
    wait()
    v_u_5.Character:WaitForChild("Humanoid"):UnequipTools()
end)
v_u_9:WaitForChild("DriverSeat")
if v_u_9.Name == "Bank Truck" then
    for _, v20 in pairs(v_u_9.Body.Doors:GetChildren()) do
        if v20:IsA("BasePart") then
            v20.CanCollide = false
        end
    end
end
local v_u_21 = v_u_10.WeightScaling * 10
local v_u_22 = v_u_10.BrakeForce * v_u_10.BrakeBias
local v_u_23 = v_u_10.BrakeForce * (1 - v_u_10.BrakeBias)
local v_u_24 = v_u_10.PBrakeForce * v_u_10.PBrakeBias
local v_u_25 = v_u_10.PBrakeForce * (1 - v_u_10.PBrakeBias)
local v_u_26 = v_u_10.EBrakeForce
local v_u_27 = v_u_10.SteerOuter
local v_u_28 = v_u_10.SteerInner
local v_u_29 = v_u_10.RSteerOuter
local v_u_30 = v_u_10.RSteerInner
if not workspace:PGSIsEnabled() then
    error("PGS is not enabled: A-Chassis will not work.")
end
local v_u_31 = v_u_10.AutoStart
if v_u_10.AutoStart and (v_u_10.Engine or v_u_10.Electric) then
    script.Parent.IsOn.Value = true
end
if v_u_9.Control_Values.Team.Value == "Civilian" then
    v_u_10.Controls.ToggleTCS = Enum.KeyCode.T
    v_u_10.Controls.ToggleABS = Enum.KeyCode.Y
end
local v_u_32 = 0
local v_u_33 = 0
local v_u_34 = 0
local v_u_35 = 0
local v_u_36 = v_u_10.IdleThrottle / 100
local v_u_37 = v_u_36
local v_u_38 = 0
local v_u_39 = 0
local v_u_40 = 0
local v_u_41 = false
local v_u_42 = false
local v_u_43 = 0
local v_u_44 = 0
local v_u_45 = 0
local v_u_46 = 0
local v_u_47 = 0
local v_u_48 = 0
local v_u_49 = 0
local v_u_50 = false
local v_u_51 = false
local v_u_52 = false
local v_u_53 = 0
local v_u_54 = 0
local v_u_55 = 0
local v_u_56 = 0
local v_u_57 = 0
local v_u_58 = 0
local v_u_59 = 0
local v_u_60 = 0
local v_u_61 = 0
local v_u_62 = 0
local v_u_63 = 0
local v_u_64 = 0
local v_u_65 = 0
local v_u_66 = false
local v_u_67 = v_u_10.TransModes[1]
local v_u_68 = false
local v_u_69 = false
local v_u_70 = false
local v_u_71 = false
local v_u_72 = false
local v_u_73 = v_u_10.TCSEnabled
local v_u_74 = false
local v_u_75 = 0
local v_u_76 = v_u_10.ABSEnabled
local v_u_77 = false
local v_u_78 = tick()
local v_u_79 = false
local v_u_80 = false
local v_u_81 = false
local v_u_82 = 0
game:GetService("RunService")
v_u_2.ManageMobileButtons:Fire("CreateCategory", "Vehicle")
if _G.IsTablet() then
    v_u_13.BottomLeft.MobileVehicleFrame.Visible = true
end
local v83 = false
for _, v84 in pairs(script.Parent:GetChildren()) do
    if (v84:IsA("Frame") or (v84:IsA("ImageLabel") or v84:IsA("ImageButton"))) and v84:GetAttribute("SafeMobileUI") == nil then
        v83 = true
        break
    end
end
if not v83 then
    v_u_2.ManageMobileButtons:Fire("DeleteButton", "ToggleESUI")
end
local function v_u_86()
    for _, v85 in pairs(v_u_9.Wheels:GetChildren()) do
        if v85:IsA("BasePart") then
            v85.CustomPhysicalProperties = PhysicalProperties.new(v85.CustomPhysicalProperties.Density, 1, v85.CustomPhysicalProperties.Elasticity, v85.CustomPhysicalProperties.FrictionWeight, v85.CustomPhysicalProperties.ElasticityWeight)
        end
    end
end
local function v_u_90()
    if v_u_10.Config == "RWD" then
        for _, v87 in pairs(v_u_9.Wheels:GetChildren()) do
            if v87:IsA("BasePart") then
                if v87.Name == "RL" or v87.Name == "RR" then
                    v87.CustomPhysicalProperties = PhysicalProperties.new(v87.CustomPhysicalProperties.Density, 0.25, v87.CustomPhysicalProperties.Elasticity, v87.CustomPhysicalProperties.FrictionWeight, v87.CustomPhysicalProperties.ElasticityWeight)
                elseif v87.Name == "FR" or v87.Name == "FL" then
                    v87.CustomPhysicalProperties = PhysicalProperties.new(v87.CustomPhysicalProperties.Density, 0.45, v87.CustomPhysicalProperties.Elasticity, v87.CustomPhysicalProperties.FrictionWeight, v87.CustomPhysicalProperties.ElasticityWeight)
                end
            end
        end
        return
    elseif v_u_10.Config == "FWD" then
        for _, v88 in pairs(v_u_9.Wheels:GetChildren()) do
            if v88:IsA("BasePart") then
                if v88.Name == "RL" or v88.Name == "RR" then
                    v88.CustomPhysicalProperties = PhysicalProperties.new(v88.CustomPhysicalProperties.Density, 0.45, v88.CustomPhysicalProperties.Elasticity, v88.CustomPhysicalProperties.FrictionWeight, v88.CustomPhysicalProperties.ElasticityWeight)
                elseif v88.Name == "FR" or v88.Name == "FL" then
                    v88.CustomPhysicalProperties = PhysicalProperties.new(v88.CustomPhysicalProperties.Density, 0.25, v88.CustomPhysicalProperties.Elasticity, v88.CustomPhysicalProperties.FrictionWeight, v88.CustomPhysicalProperties.ElasticityWeight)
                end
            end
        end
    elseif v_u_10.Config == "AWD" then
        for _, v89 in pairs(v_u_9.Wheels:GetChildren()) do
            if v89:IsA("BasePart") then
                if v89.Name == "RL" or v89.Name == "RR" then
                    v89.CustomPhysicalProperties = PhysicalProperties.new(v89.CustomPhysicalProperties.Density, 0.35, v89.CustomPhysicalProperties.Elasticity, v89.CustomPhysicalProperties.FrictionWeight, v89.CustomPhysicalProperties.ElasticityWeight)
                elseif v89.Name == "FR" or v89.Name == "FL" then
                    v89.CustomPhysicalProperties = PhysicalProperties.new(v89.CustomPhysicalProperties.Density, 0.5, v89.CustomPhysicalProperties.Elasticity, v89.CustomPhysicalProperties.FrictionWeight, v89.CustomPhysicalProperties.ElasticityWeight)
                end
            end
        end
    end
end
v_u_86()
v_u_9.ChildAdded:Connect(function(p_u_91)
    if p_u_91.Name == "PITManeuver" then
        spawn(function()
            v_u_36 = 0
            v_u_69 = false
            v_u_70 = false
            v_u_32 = p_u_91.Value
            if v_u_32 == -1 then
                v_u_69 = true
            else
                v_u_70 = true
            end
            v_u_71 = true
            wait(0.4)
            v_u_71 = false
            repeat
                wait()
            until not v_u_9:FindFirstChild("PITManeuver")
            v_u_69 = false
            v_u_70 = false
            v_u_32 = 0
        end)
    end
end)
if v_u_10.CanDrift then
    v11.Event:Connect(function(p92)
        if p92 then
            v_u_90()
        else
            v_u_86()
        end
    end)
end
v_u_9.DriverSeat.ChildRemoved:connect(function(p93)
    if p93.Name == "SeatWeld" and p93:IsA("Weld") then
        v_u_16:destroy()
        v_u_17(v_u_9)
        v_u_4:FireServer(v_u_9, v_u_9.Wheels.FL.Arm.Steer.CFrame, v_u_9.Wheels.FR.Arm.Steer.CFrame)
        v_u_36 = 0
        v_u_40 = 0
        v_u_86()
        v_u_1.ClientBinds.IsDrivingVehicle:Fire()
        script.Parent.Parent.ControlsWindow:TweenPosition(UDim2.new(0.5, 0, -0.5, 0), "In", "Quad", 0.3, true)
        v_u_2.ManageMobileButtons:Fire("DeleteCategory", "Vehicle")
        v_u_13.BottomLeft.MobileVehicleFrame.Visible = false
        if workspace.ClientObjects:FindFirstChild("ChopShopArrow") then
            for _, v94 in workspace.ClientObjects:GetChildren() do
                if v94.Name == "ChopShopArrow" then
                    v94:Destroy()
                end
            end
        end
        local v95 = v_u_9.DriverSeat:FindFirstChild("Flip")
        if v95 then
            v95.maxTorque = Vector3.new(0, 0, 0)
            v95.P = 0
            v95.D = 0
        end
        _G.CarFlipping = nil
        v_u_79 = false
        if script.Parent then
            script.Parent:Destroy()
            return
        end
    elseif p93.Name == "MaxSpeedOverride" then
        v_u_81 = false
    end
end)
local v_u_96 = v_u_10.Controls
local v97 = Instance.new("Folder", script.Parent)
v97.Name = "Controls"
for v_u_98, v99 in pairs(v_u_96) do
    local v_u_100 = Instance.new("StringValue", v97)
    v_u_100.Name = v_u_98
    v_u_100.Value = v99.Name
    v_u_100.Changed:connect(function()
        if v_u_98 == "MouseThrottle" or v_u_98 == "MouseBrake" then
            if v_u_100.Value == "MouseButton1" or v_u_100.Value == "MouseButton2" then
                v_u_96[v_u_98] = Enum.UserInputType[v_u_100.Value]
            else
                v_u_96[v_u_98] = Enum.KeyCode[v_u_100.Value]
            end
        else
            v_u_96[v_u_98] = Enum.KeyCode[v_u_100.Value]
            return
        end
    end)
end
local v_u_101 = v_u_10.Peripherals
for v_u_102, v103 in pairs(v_u_101) do
    local v_u_104 = Instance.new("IntValue", v97)
    v_u_104.Name = v_u_102
    v_u_104.Value = v103
    v_u_104.Changed:connect(function()
        local v105 = v_u_104
        local v106 = v_u_104.Value
        local v107 = math.max(0, v106)
        v105.Value = math.min(100, v107)
        v_u_101[v_u_102] = v_u_104.Value
    end)
end
function Flip()
    if (v_u_9.DriverSeat.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)).lookVector.y > 0.1 or v_u_79 then
        v_u_78 = tick()
    elseif tick() - v_u_78 >= 3 then
        v_u_79 = true
        _G.CarFlipping = true
        local v108 = v_u_9.DriverSeat.Flip
        v108.maxTorque = Vector3.new(10000, 0, 10000)
        v108.P = 3000
        v108.D = 500
        wait(1)
        v108.maxTorque = Vector3.new(0, 0, 0)
        v108.P = 0
        v108.D = 0
        _G.CarFlipping = nil
        v_u_79 = false
    end
end
function DealWithInput(p109, _)
    if _G.IgnoreInput then
        return
    end
    if v_u_9:GetAttribute("NeedsHotwire") then
        return
    end
    if v_u_9:GetAttribute("NeedsHack") then
        return
    end
    if v_u_8:GetFocusedTextBox() == nil and not v_u_80 then
        if (p109.KeyCode == v_u_96.ContlrShiftDown or v_u_68 and p109.KeyCode == v_u_96.MouseShiftDown or not v_u_68 and p109.KeyCode == v_u_96.ShiftDown) and ((v_u_31 and (v_u_67 == "Auto" and (v_u_49 <= 1 and v_u_10.AutoShiftVers == "New")) or (v_u_67 == "Semi" or v_u_67 == "Manual")) and p109.UserInputState == Enum.UserInputState.Begin) then
            if not v_u_51 then
                v_u_51 = true
            end
        elseif (p109.KeyCode == v_u_96.ContlrShiftUp or v_u_68 and p109.KeyCode == v_u_96.MouseShiftUp or not v_u_68 and p109.KeyCode == v_u_96.ShiftUp) and ((v_u_31 and (v_u_67 == "Auto" and (v_u_49 < 1 and v_u_10.AutoShiftVers == "New")) or (v_u_67 == "Semi" or v_u_67 == "Manual")) and p109.UserInputState == Enum.UserInputState.Begin) then
            if not v_u_50 then
                v_u_50 = true
            end
        elseif (p109.KeyCode == v_u_96.ContlrClutch or v_u_68 and p109.KeyCode == v_u_96.MouseClutch or not v_u_68 and p109.KeyCode == v_u_96.Clutch) and v_u_67 == "Manual" then
            if p109.UserInputState == Enum.UserInputState.Begin then
                v_u_41 = true
                v_u_42 = true
            elseif p109.UserInputState == Enum.UserInputState.End then
                v_u_41 = false
                v_u_42 = false
            end
        elseif p109.KeyCode == Enum.KeyCode.LeftShift then
            if v_u_9.Control_Values.Team.Value ~= "Civilian" then
                return
            end
            if p109.UserInputState == Enum.UserInputState.Begin then
                if not v_u_73 then
                    return
                end
                v_u_66 = true
                v_u_90()
            elseif p109.UserInputState == Enum.UserInputState.End then
                if not v_u_73 then
                    return
                end
                v_u_66 = false
                v_u_86()
            end
        elseif p109.KeyCode == v_u_96.ContlrPBrake or v_u_68 and p109.KeyCode == v_u_96.MousePBrake or not v_u_68 and p109.KeyCode == v_u_96.PBrake then
            if v_u_9:FindFirstChild("PITManeuver") then
                return
            end
            if v_u_9:GetAttribute("NeedsHotwire") then
                return
            end
            if v_u_9:GetAttribute("NeedsHack") then
                return
            end
            if v_u_9:WaitForChild("Control_Values").Drift.Value == true then
                return
            end
            if p109.UserInputState == Enum.UserInputState.Begin then
                if v_u_9.DriverSeat.Velocity.Magnitude > 5 and v_u_73 then
                    return
                end
                v_u_71 = not v_u_71
            elseif p109.UserInputState == Enum.UserInputState.End and v_u_9.DriverSeat.Velocity.Magnitude > 5 then
                v_u_71 = false
            end
        elseif (p109.KeyCode == v_u_96.ContlrToggleTMode or p109.KeyCode == v_u_96.ToggleTransMode) and p109.UserInputState == Enum.UserInputState.Begin then
            local v110 = 1
            for v111, v112 in pairs(v_u_10.TransModes) do
                if v112 == v_u_67 then
                    v110 = v111
                    break
                end
            end
            local v113 = v110 + 1
            local v114 = #v_u_10.TransModes < v113 and 1 or v113
            v_u_67 = v_u_10.TransModes[v114]
        elseif (v_u_68 or p109.KeyCode ~= v_u_96.Throttle and p109.KeyCode ~= v_u_96.Throttle2) and ((v_u_96.MouseThrottle ~= Enum.UserInputType.MouseButton1 and v_u_96.MouseThrottle ~= Enum.UserInputType.MouseButton2 or p109.UserInputType ~= v_u_96.MouseThrottle) and p109.KeyCode ~= v_u_96.MouseThrottle or not v_u_68) then
            if (v_u_68 or p109.KeyCode ~= v_u_96.Brake and p109.KeyCode ~= v_u_96.Brake2) and ((v_u_96.MouseBrake ~= Enum.UserInputType.MouseButton1 and v_u_96.MouseBrake ~= Enum.UserInputType.MouseButton2 or p109.UserInputType ~= v_u_96.MouseBrake) and p109.KeyCode ~= v_u_96.MouseBrake or not v_u_68) then
                if v_u_68 or p109.KeyCode ~= v_u_96.SteerLeft and p109.KeyCode ~= v_u_96.SteerLeft2 then
                    if v_u_68 or p109.KeyCode ~= v_u_96.SteerRight and p109.KeyCode ~= v_u_96.SteerRight2 then
                        if p109.KeyCode == v_u_96.ToggleMouseDrive then
                            if p109.UserInputState == Enum.UserInputState.End then
                                v_u_68 = not v_u_68
                                v_u_36 = v_u_10.IdleThrottle / 100
                                v_u_40 = 0
                                v_u_32 = 0
                            end
                        elseif v_u_10.TCSEnabled and (v_u_31 and p109.KeyCode == v_u_96.ToggleTCS) or p109.KeyCode == v_u_96.ContlrToggleTCS then
                            if p109.UserInputState == Enum.UserInputState.End then
                                v_u_73 = not v_u_73
                            end
                            if v_u_73 then
                                v_u_86()
                            else
                                v_u_90()
                            end
                        elseif (v_u_10.ABSEnabled and (v_u_31 and p109.KeyCode == v_u_96.ToggleABS) or p109.KeyCode == v_u_96.ContlrToggleABS) and p109.UserInputState == Enum.UserInputState.End then
                            v_u_76 = not v_u_76
                        end
                    elseif p109.UserInputState == Enum.UserInputState.Begin then
                        v_u_32 = 1
                        v_u_70 = true
                    else
                        if v_u_69 then
                            v_u_32 = -1
                        else
                            v_u_32 = 0
                        end
                        v_u_70 = false
                    end
                elseif p109.UserInputState == Enum.UserInputState.Begin then
                    v_u_32 = -1
                    v_u_69 = true
                else
                    if v_u_70 then
                        v_u_32 = 1
                    else
                        v_u_32 = 0
                    end
                    v_u_69 = false
                end
            elseif p109.UserInputState == Enum.UserInputState.Begin then
                v_u_40 = 1
                if _G.ClientSettings and (not _G.ClientSettings.AutoReverse and (v_u_49 == 1 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and v_u_67 == "Auto"))) then
                    v_u_49 = -1
                end
            else
                v_u_40 = 0
            end
        elseif p109.UserInputState == Enum.UserInputState.Begin and v_u_31 then
            v_u_36 = 1
            if _G.ClientSettings and (not _G.ClientSettings.AutoReverse and (v_u_49 == -1 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and v_u_67 == "Auto"))) then
                v_u_49 = 1
            end
        else
            v_u_36 = v_u_10.IdleThrottle / 100
        end
        if p109.KeyCode == Enum.KeyCode.F then
            Flip(true)
        end
        if p109.UserInputType.Name:find("Gamepad") then
            if p109.KeyCode == v_u_96.ContlrSteer then
                if p109.Position.X >= 0 then
                    local v115 = v_u_10.Peripherals.ControlRDZone / 100
                    local v116 = math.min(0.99, v115)
                    local v117 = p109.Position.X
                    if v116 < math.abs(v117) then
                        v_u_32 = (p109.Position.X - v116) / (1 - v116)
                    else
                        v_u_32 = 0
                    end
                else
                    local v118 = v_u_10.Peripherals.ControlLDZone / 100
                    local v119 = math.min(0.99, v118)
                    local v120 = p109.Position.X
                    if v119 < math.abs(v120) then
                        v_u_32 = (p109.Position.X + v119) / (1 - v119)
                    else
                        v_u_32 = 0
                    end
                end
            end
            if p109.KeyCode == v_u_96.ContlrThrottle then
                if not v_u_31 then
                    v_u_36 = v_u_10.IdleThrottle / 100
                    return
                end
                local v121 = v_u_10.IdleThrottle / 100
                local v122 = p109.Position.Z
                v_u_36 = math.max(v121, v122)
                if p109.UserInputState == Enum.UserInputState.Begin and (_G.ClientSettings and (not _G.ClientSettings.AutoReverse and (v_u_49 == -1 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and v_u_67 == "Auto")))) then
                    v_u_49 = 1
                    return
                end
            elseif p109.KeyCode == v_u_96.ContlrBrake then
                v_u_40 = p109.Position.Z
                if p109.UserInputState == Enum.UserInputState.Begin and (_G.ClientSettings and (not _G.ClientSettings.AutoReverse and (v_u_49 == 1 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and v_u_67 == "Auto")))) then
                    v_u_49 = -1
                    return
                end
            end
        end
    else
        v_u_36 = v_u_10.IdleThrottle / 100
        v_u_32 = 0
        v_u_40 = 0
    end
end
v_u_8.InputBegan:connect(DealWithInput)
v_u_8.InputChanged:connect(DealWithInput)
v_u_8.InputEnded:connect(DealWithInput)
v_u_1.ClientBinds.MobileButtonEvents.GasPedal.Event:Connect(function(p123)
    if v_u_9:GetAttribute("NeedsHotwire") then
        return
    elseif not v_u_9:GetAttribute("NeedsHack") then
        if p123 and v_u_31 then
            v_u_36 = 1
            v_u_3.SetThrottle:FireServer(v_u_9, 1)
            if _G.ClientSettings and (not _G.ClientSettings.AutoReverse and (v_u_49 == -1 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and v_u_67 == "Auto"))) then
                v_u_49 = 1
                return
            end
        else
            if v_u_40 == 1 then
                v_u_3.SetThrottle:FireServer(v_u_9, -1)
            else
                v_u_3.SetThrottle:FireServer(v_u_9, 0)
            end
            v_u_36 = v_u_10.IdleThrottle / 100
        end
    end
end)
v_u_1.ClientBinds.MobileButtonEvents.BrakePedal.Event:Connect(function(p124)
    if v_u_9:GetAttribute("NeedsHotwire") then
        return
    elseif not v_u_9:GetAttribute("NeedsHack") then
        if p124 then
            v_u_3.SetThrottle:FireServer(v_u_9, -1)
            v_u_40 = 1
            if _G.ClientSettings and (not _G.ClientSettings.AutoReverse and (v_u_49 == 1 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and v_u_67 == "Auto"))) then
                v_u_49 = -1
                return
            end
        else
            if v_u_36 == 1 then
                v_u_3.SetThrottle:FireServer(v_u_9, 1)
            else
                v_u_3.SetThrottle:FireServer(v_u_9, 0)
            end
            v_u_40 = 0
        end
    end
end)
v_u_1.ClientBinds.MobileButtonEvents.ParkVehicle.Event:Connect(function(p125)
    if v_u_9:FindFirstChild("PITManeuver") then
        return
    elseif v_u_9:WaitForChild("Control_Values").Drift.Value == true then
        return
    elseif p125 then
        if v_u_9.DriverSeat.Velocity.Magnitude <= 5 or not v_u_73 then
            v_u_71 = not v_u_71
        end
    else
        if v_u_9.DriverSeat.Velocity.Magnitude > 5 then
            v_u_71 = false
        end
        return
    end
end)
v_u_1.ClientBinds.MobileButtonEvents.SteerLeft.Event:Connect(function(p126)
    if v_u_9:FindFirstChild("PITManeuver") then
        return
    elseif v_u_9:GetAttribute("NeedsHotwire") then
        return
    elseif v_u_9:GetAttribute("NeedsHack") then
        return
    elseif p126 then
        v_u_32 = -1
        v_u_69 = true
    else
        if v_u_70 then
            v_u_32 = 1
        else
            v_u_32 = 0
        end
        v_u_69 = false
    end
end)
v_u_1.ClientBinds.MobileButtonEvents.SteerRight.Event:Connect(function(p127)
    if v_u_9:FindFirstChild("PITManeuver") then
        return
    elseif v_u_9:GetAttribute("NeedsHotwire") then
        return
    elseif v_u_9:GetAttribute("NeedsHack") then
        return
    elseif p127 then
        v_u_32 = 1
        v_u_70 = true
    else
        if v_u_69 then
            v_u_32 = -1
        else
            v_u_32 = 0
        end
        v_u_70 = false
    end
end)
local v_u_128 = {}
if v_u_10.Config == "FWD" or v_u_10.Config == "AWD" then
    for _, v129 in pairs(v_u_9.Wheels:GetChildren()) do
        if v129.Name == "FL" or (v129.Name == "FR" or v129.Name == "F") then
            table.insert(v_u_128, v129)
        end
    end
end
if v_u_10.Config == "RWD" or v_u_10.Config == "AWD" then
    for _, v130 in pairs(v_u_9.Wheels:GetChildren()) do
        if v130.Name == "RL" or (v130.Name == "RR" or v130.Name == "R") then
            table.insert(v_u_128, v130)
        end
    end
end
local v131 = 0
for _, v132 in pairs(v_u_128) do
    if v131 < v132.Size.x then
        v131 = v132.Size.x
    end
end
for _, v133 in pairs(v_u_9.Wheels:GetChildren()) do
    local v134 = v133["#BV"].MotorMaxTorque - v_u_24
    if math.abs(v134) < 1 then
        ::l79::
        local v135 = true
        v_u_71 = v135
    else
        local v136 = v133["#BV"].MotorMaxTorque - v_u_25
        if math.abs(v136) < 1 then
            goto l79
        end
    end
end
function Inputs(p137)
    local v138 = 60 / (1 / p137)
    if v_u_35 <= v_u_37 then
        local v139 = v_u_37
        local v140 = v_u_35 + v_u_10.ThrotAccel * v138
        v_u_35 = math.min(v139, v140)
    else
        local v141 = v_u_37
        local v142 = v_u_35 - v_u_10.ThrotDecel * v138
        v_u_35 = math.max(v141, v142)
    end
    if v_u_39 <= v_u_40 then
        local v143 = v_u_40
        local v144 = v_u_39 + v_u_10.BrakeAccel * v138
        v_u_39 = math.min(v143, v144)
    else
        local v145 = v_u_40
        local v146 = v_u_39 - v_u_10.BrakeDecel * v138
        v_u_39 = math.max(v145, v146)
    end
end
if v_u_10.SteeringType == "New" then
    v_u_27 = v_u_10.LockToLock * 180 / v_u_10.SteerRatio
    local v147 = v_u_27 - v_u_27 * (1 - v_u_10.Ackerman)
    local v148 = v_u_27 * 1.2
    v_u_28 = math.min(v147, v148)
end
function Steering(p149)
    if v_u_9:FindFirstChild("DriverSeat") then
        local v150 = 60 / (1 / p149)
        if v_u_68 then
            local v151 = v_u_7.ViewSizeX * v_u_10.Peripherals.MSteerWidth / 200
            local v152 = math.max(1, v151)
            local v153 = v_u_10.Peripherals.MSteerDZone / 100
            local v154 = (v_u_7.X - v_u_7.ViewSizeX / 2) / v152
            if math.abs(v154) <= v153 then
                v_u_32 = 0
            else
                local v155 = math.abs(v154) - v153
                local v156 = 1 - v153
                local v157 = math.min(v155, v156)
                v_u_32 = (math.max(v157, 0) / (1 - v153)) ^ v_u_10.MSteerExp * (v154 / math.abs(v154))
            end
        end
        if v_u_33 < v_u_32 then
            if v_u_33 < 0 then
                local v158 = v_u_32
                local v159 = v_u_33 + v_u_10.ReturnSpeed * v150
                v_u_33 = math.min(v158, v159)
            else
                local v160 = v_u_32
                local v161 = v_u_33 + v_u_10.SteerSpeed * v150
                v_u_33 = math.min(v160, v161)
            end
        elseif v_u_33 > 0 then
            local v162 = v_u_32
            local v163 = v_u_33 - v_u_10.ReturnSpeed * v150
            v_u_33 = math.max(v162, v163)
        else
            local v164 = v_u_32
            local v165 = v_u_33 - v_u_10.SteerSpeed * v150
            v_u_33 = math.max(v164, v165)
        end
        local v166 = v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.SteerDecay
        local v167 = 1 - v_u_10.MinSteer / 100
        local v168 = 1 - math.min(v166, v167)
        local v169 = v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerDecay
        local v170 = 1 - v_u_10.MinSteer / 100
        local v171 = 1 - math.min(v169, v170)
        local v172 = v_u_9.Name == "Forklift" and -1 or 1
        for _, v173 in pairs(v_u_9.Wheels:GetChildren()) do
            if v173.Name == "F" then
                local v174 = v173.Arm.Steer
                local v175 = v_u_9.Wheels.F.Base.CFrame
                local v176 = CFrame.Angles
                local v177 = v172 * v_u_33 * v_u_10.SteerInner * v168
                v174.CFrame = v175 * v176(0, -math.rad(v177), 0)
            elseif v173.Name == "FL" then
                if v_u_33 >= 0 then
                    local v178 = v173.Arm.Steer
                    local v179 = v_u_9.Wheels.FL.Base.CFrame
                    local v180 = CFrame.Angles
                    local v181 = v172 * v_u_33 * v_u_27 * v168
                    v178.CFrame = v179 * v180(0, -math.rad(v181), 0)
                else
                    local v182 = v173.Arm.Steer
                    local v183 = v_u_9.Wheels.FL.Base.CFrame
                    local v184 = CFrame.Angles
                    local v185 = v172 * v_u_33 * v_u_28 * v168
                    v182.CFrame = v183 * v184(0, -math.rad(v185), 0)
                end
            elseif v173.Name == "FR" then
                if v_u_33 >= 0 then
                    local v186 = v173.Arm.Steer
                    local v187 = v_u_9.Wheels.FR.Base.CFrame
                    local v188 = CFrame.Angles
                    local v189 = v172 * v_u_33 * v_u_28 * v168
                    v186.CFrame = v187 * v188(0, -math.rad(v189), 0)
                else
                    local v190 = v173.Arm.Steer
                    local v191 = v_u_9.Wheels.FR.Base.CFrame
                    local v192 = CFrame.Angles
                    local v193 = v172 * v_u_33 * v_u_27 * v168
                    v190.CFrame = v191 * v192(0, -math.rad(v193), 0)
                end
            elseif v173.Name == "R" then
                if v_u_10.FWSteer ~= "None" then
                    if v_u_10.FWSteer == "Static" then
                        local v194 = v173.Arm.Steer
                        local v195 = v_u_9.Wheels.R.Base.CFrame
                        local v196 = CFrame.Angles
                        local v197 = v_u_33 * v_u_30 * v171
                        local v198 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                        local v199 = v197 * math.max(0, v198)
                        v194.CFrame = v195 * v196(0, math.rad(v199), 0)
                    elseif v_u_10.FWSteer == "Speed" then
                        local v200 = v173.Arm.Steer
                        local v201 = v_u_9.Wheels.R.Base.CFrame
                        local v202 = CFrame.Angles
                        local v203 = v_u_33 * v_u_30 * v171
                        local v204 = v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                        local v205 = v203 * math.min(1, v204)
                        v200.CFrame = v201 * v202(0, -math.rad(v205), 0)
                    elseif v_u_10.FWSteer == "Both" then
                        local v206 = v173.Arm.Steer
                        local v207 = v_u_9.Wheels.R.Base.CFrame
                        local v208 = CFrame.Angles
                        local v209 = v_u_33 * v_u_30 * v171
                        local v210 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                        local v211 = v209 * math.max(-1, v210)
                        v206.CFrame = v207 * v208(0, math.rad(v211), 0)
                    end
                end
            elseif v173.Name == "RL" then
                if v_u_10.FWSteer ~= "None" then
                    if v_u_10.FWSteer == "Static" then
                        if v_u_33 >= 0 then
                            local v212 = v173.Arm.Steer
                            local v213 = v_u_9.Wheels.RL.Base.CFrame
                            local v214 = CFrame.Angles
                            local v215 = v_u_33 * v_u_29 * v171
                            local v216 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v217 = v215 * math.max(0, v216)
                            v212.CFrame = v213 * v214(0, math.rad(v217), 0)
                        else
                            local v218 = v173.Arm.Steer
                            local v219 = v_u_9.Wheels.RL.Base.CFrame
                            local v220 = CFrame.Angles
                            local v221 = v_u_33 * v_u_30 * v171
                            local v222 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v223 = v221 * math.max(0, v222)
                            v218.CFrame = v219 * v220(0, math.rad(v223), 0)
                        end
                    elseif v_u_10.FWSteer == "Speed" then
                        if v_u_33 >= 0 then
                            local v224 = v173.Arm.Steer
                            local v225 = v_u_9.Wheels.RL.Base.CFrame
                            local v226 = CFrame.Angles
                            local v227 = v_u_33 * v_u_29 * v171
                            local v228 = v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v229 = v227 * math.min(1, v228)
                            v224.CFrame = v225 * v226(0, -math.rad(v229), 0)
                        else
                            local v230 = v173.Arm.Steer
                            local v231 = v_u_9.Wheels.RL.Base.CFrame
                            local v232 = CFrame.Angles
                            local v233 = v_u_33 * v_u_30 * v171
                            local v234 = v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v235 = v233 * math.min(1, v234)
                            v230.CFrame = v231 * v232(0, -math.rad(v235), 0)
                        end
                    elseif v_u_10.FWSteer == "Both" then
                        if v_u_33 >= 0 then
                            local v236 = v173.Arm.Steer
                            local v237 = v_u_9.Wheels.RL.Base.CFrame
                            local v238 = CFrame.Angles
                            local v239 = v_u_33 * v_u_29 * v171
                            local v240 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v241 = v239 * math.max(-1, v240)
                            v236.CFrame = v237 * v238(0, math.rad(v241), 0)
                        else
                            local v242 = v173.Arm.Steer
                            local v243 = v_u_9.Wheels.RL.Base.CFrame
                            local v244 = CFrame.Angles
                            local v245 = v_u_33 * v_u_30 * v171
                            local v246 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v247 = v245 * math.max(-1, v246)
                            v242.CFrame = v243 * v244(0, math.rad(v247), 0)
                        end
                    end
                end
            elseif v173.Name == "RR" then
                if v_u_10.FWSteer ~= "None" then
                    if v_u_10.FWSteer == "Static" then
                        if v_u_33 >= 0 then
                            local v248 = v173.Arm.Steer
                            local v249 = v_u_9.Wheels.RR.Base.CFrame
                            local v250 = CFrame.Angles
                            local v251 = v_u_33 * v_u_30 * v171
                            local v252 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v253 = v251 * math.max(0, v252)
                            v248.CFrame = v249 * v250(0, math.rad(v253), 0)
                        else
                            local v254 = v173.Arm.Steer
                            local v255 = v_u_9.Wheels.RR.Base.CFrame
                            local v256 = CFrame.Angles
                            local v257 = v_u_33 * v_u_29 * v171
                            local v258 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v259 = v257 * math.max(0, v258)
                            v254.CFrame = v255 * v256(0, math.rad(v259), 0)
                        end
                    elseif v_u_10.FWSteer == "Speed" then
                        if v_u_33 >= 0 then
                            local v260 = v173.Arm.Steer
                            local v261 = v_u_9.Wheels.RR.Base.CFrame
                            local v262 = CFrame.Angles
                            local v263 = v_u_33 * v_u_30 * v171
                            local v264 = v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v265 = v263 * math.min(1, v264)
                            v260.CFrame = v261 * v262(0, -math.rad(v265), 0)
                        else
                            local v266 = v173.Arm.Steer
                            local v267 = v_u_9.Wheels.RR.Base.CFrame
                            local v268 = CFrame.Angles
                            local v269 = v_u_33 * v_u_29 * v171
                            local v270 = v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v271 = v269 * math.min(1, v270)
                            v266.CFrame = v267 * v268(0, -math.rad(v271), 0)
                        end
                    elseif v_u_10.FWSteer == "Both" then
                        if v_u_33 >= 0 then
                            local v272 = v173.Arm.Steer
                            local v273 = v_u_9.Wheels.RR.Base.CFrame
                            local v274 = CFrame.Angles
                            local v275 = v_u_33 * v_u_30 * v171
                            local v276 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v277 = v275 * math.max(-1, v276)
                            v272.CFrame = v273 * v274(0, math.rad(v277), 0)
                        else
                            local v278 = v173.Arm.Steer
                            local v279 = v_u_9.Wheels.RR.Base.CFrame
                            local v280 = CFrame.Angles
                            local v281 = v_u_33 * v_u_29 * v171
                            local v282 = 1 - v_u_9.DriverSeat.Velocity.Magnitude / v_u_10.RSteerSpeed
                            local v283 = v281 * math.max(-1, v282)
                            v278.CFrame = v279 * v280(0, math.rad(v283), 0)
                        end
                    end
                end
            end
        end
        local v284 = v_u_9.Wheels.FR
        local _, v285, _ = v284.Base.CFrame:ToObjectSpace(v284.Arm.CFrame):ToOrientation()
        local v286 = math.deg(v285)
        v_u_12.CurrentSteer.Value = v286
    end
end
local v_u_287 = v_u_10.FinalDrive * v_u_10.FDMult
local v_u_288 = v_u_287 * 30 / 3.141592653589793
local v_u_289 = workspace.Gravity * v_u_10.InclineComp / 32.2
local v_u_290 = v131 * 3.141592653589793 / 60
local v_u_291 = CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)
local v_u_292 = CFrame.Angles(0, 3.141592653589793, 0)
if not v_u_10.Engine and v_u_10.Electric then
    v_u_10.Redline = v_u_10.E_Redline
    v_u_10.PeakRPM = v_u_10.E_Trans2
    v_u_10.Turbochargers = 0
    v_u_10.Superchargers = 0
    v_u_10.Clutch = false
    v_u_10.IdleRPM = 0
    v_u_10.ClutchType = "Clutch"
    v_u_10.AutoShiftType = "DCT"
    v_u_10.ShiftUpTime = 0.1
    v_u_10.ShiftDnTime = 0.1
end
local v_u_293 = v_u_10.Turbochargers
local v_u_294 = v_u_10.T_Boost * v_u_10.Turbochargers
local v_u_295 = v_u_10.Superchargers
local v_u_296 = v_u_10.S_Boost * v_u_10.Superchargers
local v_u_297 = v_u_10.Horsepower / 100
local v_u_298 = v_u_10.Horsepower * (v_u_294 * (v_u_10.T_Efficiency / 10)) / 7.5 / 2 / 100
local v_u_299 = v_u_10.Horsepower * (v_u_296 * (v_u_10.S_Efficiency / 10)) / 7.5 / 2 / 100
local v_u_300 = v_u_10.PeakRPM / 1000
local v_u_301 = v_u_10.PeakSharpness
local v_u_302 = v_u_10.CurveMult
local v_u_303 = v_u_10.EqPoint / 1000
function CurveN(p304)
    local v305 = p304 / 1000
    local v306 = -(v305 - v_u_300) ^ 2
    local v307 = v_u_297 / v_u_300 ^ 2
    local v308 = v_u_302 ^ (v_u_300 / v_u_297)
    return (v306 * math.min(v307, v308) + v_u_297) * (v305 - v305 ^ v_u_301 / (v_u_301 * v_u_300 ^ (v_u_301 - 1)))
end
local v_u_309 = CurveN(v_u_10.PeakRPM)
function CurveT(p310)
    local v311 = p310 / 1000
    local v312 = -(v311 - v_u_300) ^ 2
    local v313 = v_u_298 / v_u_300 ^ 2
    local v314 = v_u_302 ^ (v_u_300 / v_u_298)
    return (v312 * math.min(v313, v314) + v_u_298) * (v311 - v311 ^ v_u_301 / (v_u_301 * v_u_300 ^ (v_u_301 - 1)))
end
local v_u_315 = CurveT(v_u_10.PeakRPM)
function CurveS(p316)
    local v317 = p316 / 1000
    local v318 = -(v317 - v_u_300) ^ 2
    local v319 = v_u_299 / v_u_300 ^ 2
    local v320 = v_u_302 ^ (v_u_300 / v_u_299)
    return (v318 * math.min(v319, v320) + v_u_299) * (v317 - v317 ^ v_u_301 / (v_u_301 * v_u_300 ^ (v_u_301 - 1)))
end
local v_u_321 = CurveS(v_u_10.PeakRPM)
local v_u_322 = v_u_10.E_Horsepower / 100
local v_u_323 = v_u_10.E_Torque / 100
local v_u_324 = v_u_10.E_Trans1 / 1000
local v_u_325 = v_u_10.E_Trans2 / 1000
local v_u_326 = v_u_10.E_Redline / 1000
function elecHP(p327)
    local v328 = p327 / 1000
    local v329 = 1e-9
    if v328 <= v_u_324 then
        return (v328 / v_u_324) ^ v_u_10.EH_FrontMult / (1 / v_u_322) * (v328 / v_u_324) + (v328 / v_u_324) ^ (1 / v_u_10.EH_FrontMult) / (1 / v_u_322) * (1 - v328 / v_u_324)
    end
    if v_u_324 < v328 and v328 < v_u_325 then
        return v_u_322
    end
    if v_u_325 <= v328 then
        return v_u_322 - ((v328 - v_u_325) / (v_u_326 - v_u_325)) ^ v_u_10.EH_EndMult / (1 / (v_u_322 * (v_u_10.EH_EndPercent / 100)))
    end
    error("\n\t [AC6C]: Drive initialization failed!" .. "\n\t    An unknown error occured when initializing electric horsepower." .. "\n\t    Please send a screenshot of this message to Avxnturador." .. "\n\t    R: " .. v328 .. ", T1: " .. v_u_324(", T2: ") .. v_u_325(", L: ") .. v_u_326("."))
    return v329
end
function elecTQ(p330)
    local v331 = p330 / 1000
    local v332 = 1e-9
    if v331 < v_u_324 then
        return v_u_323
    end
    if v_u_324 <= v331 then
        return v_u_323 - ((v331 - v_u_324) / (v_u_326 - v_u_324)) ^ v_u_10.ET_EndMult / (1 / (v_u_323 * (v_u_10.ET_EndPercent / 100)))
    end
    error("\n\t [AC6C]: Drive initialization failed!" .. "\n\t    An unknown error occured when initializing electric torque." .. "\n\t    Please send a screenshot of this message to Avxnturador." .. "\n\t    R: " .. v331 .. ", T1: " .. v_u_324(", T2: ") .. v_u_325(", L: ") .. v_u_326("."))
    return v332
end
function GetNCurve(p333, p334)
    local v335 = CurveN(p333) / (v_u_309 / v_u_297)
    local v336 = math.max(v335, 0) * 100
    return v336, v336 * (v_u_303 / p333) * v_u_10.Ratios[p334 + 2] * v_u_287 * v_u_21 * 1000
end
function GetECurve(p337, p338)
    local v339 = elecHP(p337)
    local v340 = math.max(v339, 0) * 100
    local v341 = elecTQ(p337)
    local v342 = math.max(v341, 0) * 100
    if p338 == 0 then
        return 0, 0
    end
    local v343 = v342 * v_u_10.Ratios[p338 + 2] * v_u_287 * v_u_21
    return v340, math.max(v343, 0)
end
function GetTCurve(p344, p345)
    local v346 = CurveT(p344) / (v_u_315 / v_u_298)
    local v347 = math.max(v346, 0) * 100
    return v347, v347 * (v_u_303 / p344) * v_u_10.Ratios[p345 + 2] * v_u_287 * v_u_21 * 1000
end
function GetSCurve(p348, p349)
    local v350 = CurveS(p348) / (v_u_321 / v_u_299)
    local v351 = math.max(v350, 0) * 100
    return v351, v351 * (v_u_303 / p348) * v_u_10.Ratios[p349 + 2] * v_u_287 * v_u_21 * 1000
end
local v_u_352 = {}
local v_u_353 = {}
local v_u_354 = {}
local v_u_355 = {}
for v356, _ in pairs(v_u_10.Ratios) do
    local v357 = (v_u_10.Redline + 100) / 100
    local v358 = {}
    local v359 = {}
    local v360 = {}
    local v361 = {}
    for v362 = 0, math.ceil(v357) do
        local v363 = {}
        local v364 = {}
        local v365 = {}
        local v366 = {}
        if v362 == 0 then
            v363.Horsepower = 0
            v363.Torque = 0
            v364.Horsepower = 0
            v364.Torque = 0
            v365.Horsepower = 0
            v365.Torque = 0
            v366.Horsepower = 0
            v366.Torque = 0
        else
            if v_u_10.Engine then
                local v367, v368 = GetNCurve(v362 * 100, v356 - 2)
                v363.Horsepower = v367
                v363.Torque = v368
                if v_u_293 == 0 then
                    v365.Horsepower = 0
                    v365.Torque = 0
                else
                    local v369, v370 = GetTCurve(v362 * 100, v356 - 2)
                    v365.Horsepower = v369
                    v365.Torque = v370
                end
                if v_u_295 == 0 then
                    v366.Horsepower = 0
                    v366.Torque = 0
                else
                    local v371, v372 = GetSCurve(v362 * 100, v356 - 2)
                    v366.Horsepower = v371
                    v366.Torque = v372
                end
            else
                v363.Horsepower = 0
                v363.Torque = 0
                v365.Horsepower = 0
                v365.Torque = 0
                v366.Horsepower = 0
                v366.Torque = 0
            end
            if v_u_10.Electric then
                local v373, v374 = GetECurve(v362 * 100, v356 - 2)
                v364.Horsepower = v373
                v364.Torque = v374
            else
                v364.Horsepower = 0
                v364.Torque = 0
            end
        end
        if v_u_10.Engine then
            local v375, v376 = GetNCurve((v362 + 1) * 100, v356 - 2)
            nhp = v375
            ntq = v376
            if v_u_293 == 0 then
                thp = 0
                ttq = 0
            else
                local v377, v378 = GetTCurve((v362 + 1) * 100, v356 - 2)
                thp = v377
                ttq = v378
            end
            if v_u_295 == 0 then
                shp = 0
                stq = 0
            else
                local v379, v380 = GetSCurve((v362 + 1) * 100, v356 - 2)
                shp = v379
                stq = v380
            end
        else
            nhp = 0
            ntq = 0
            thp = 0
            ttq = 0
            shp = 0
            stq = 0
        end
        if v_u_10.Electric then
            local v381, v382 = GetECurve((v362 + 1) * 100, v356 - 2)
            ehp = v381
            etq = v382
        else
            ehp = 0
            etq = 0
        end
        local v383 = nhp - v363.Horsepower
        local v384 = ntq - v363.Torque
        v363.HpSlope = v383
        v363.TqSlope = v384
        local v385 = ehp - v364.Horsepower
        local v386 = etq - v364.Torque
        v364.HpSlope = v385
        v364.TqSlope = v386
        local v387 = thp - v365.Horsepower
        local v388 = ttq - v365.Torque
        v365.HpSlope = v387
        v365.TqSlope = v388
        local v389 = shp - v366.Horsepower
        local v390 = stq - v366.Torque
        v366.HpSlope = v389
        v366.TqSlope = v390
        v360[v362] = v363
        v358[v362] = v364
        v361[v362] = v365
        v359[v362] = v366
    end
    table.insert(v_u_352, v360)
    table.insert(v_u_353, v358)
    table.insert(v_u_354, v361)
    table.insert(v_u_355, v359)
end
wait()
function Auto()
    local v391 = 0
    for _, v392 in pairs(v_u_128) do
        if v391 < v392.RotVelocity.Magnitude then
            v391 = v392.RotVelocity.Magnitude
        end
    end
    if v_u_31 then
        if v_u_10.AutoShiftVers == "Old" and v_u_49 == 0 then
            v_u_49 = 1
            v_u_41 = false
        end
        if v_u_49 >= 1 then
            if v_u_49 == 1 and (v_u_39 > 0 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and v_u_10.AutoShiftVers == "Old")) then
                if not _G.ClientSettings or _G.ClientSettings.AutoReverse then
                    v_u_49 = -1
                    v_u_41 = false
                    return
                end
            else
                if v_u_49 > 1 and (v_u_39 > 0 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and v_u_10.AutoShiftVers == "Old")) then
                    v_u_49 = 1
                    v_u_41 = false
                    return
                end
                if v_u_9.DriverSeat.Velocity.Magnitude > 5 then
                    if v_u_10.AutoShiftMode == "RPM" then
                        if v_u_46 > v_u_10.PeakRPM + v_u_10.AutoUpThresh then
                            if not (v_u_50 or v_u_52) then
                                v_u_50 = true
                                return
                            end
                        else
                            local v393 = v391 * v_u_10.Ratios[v_u_49 + 1] * v_u_288
                            local v394 = v_u_10.Redline + 100
                            local v395 = math.min(v393, v394)
                            local v396 = v_u_10.IdleRPM
                            if math.max(v395, v396) < v_u_10.PeakRPM - v_u_10.AutoDownThresh and (v_u_49 > 1 and not (v_u_51 or v_u_52)) then
                                v_u_51 = true
                                return
                            end
                        end
                    else
                        local v397 = v_u_9.DriverSeat.Velocity.Magnitude
                        local v398 = v_u_290 * (v_u_10.PeakRPM + v_u_10.AutoUpThresh) / v_u_10.Ratios[v_u_49 + 2] / v_u_287
                        if math.ceil(v398) < v397 then
                            if not (v_u_50 or v_u_52) then
                                v_u_50 = true
                                return
                            end
                        else
                            local v399 = v_u_9.DriverSeat.Velocity.Magnitude
                            local v400 = v_u_290 * (v_u_10.PeakRPM - v_u_10.AutoDownThresh) / v_u_10.Ratios[v_u_49 + 1] / v_u_287
                            if v399 < math.ceil(v400) and (v_u_49 > 1 and not (v_u_51 or v_u_52)) then
                                v_u_51 = true
                                return
                            end
                        end
                    end
                end
            end
        elseif v_u_35 - v_u_10.IdleThrottle / 100 > 0 and (v_u_9.DriverSeat.Velocity.Magnitude < 5 and (v_u_10.AutoShiftVers == "Old" and (not _G.ClientSettings or _G.ClientSettings.AutoReverse))) then
            v_u_49 = 1
            v_u_41 = false
        end
    end
end
function Gear()
    local v401 = 0
    for _, v402 in pairs(v_u_128) do
        if v401 < v402.RotVelocity.Magnitude then
            v401 = v402.RotVelocity.Magnitude
        end
    end
    if v_u_50 and not v_u_52 then
        if v_u_67 == "Manual" and not v_u_41 or (v_u_67 == "Manual" and (v_u_10.ClutchRel and v_u_35 - v_u_10.IdleThrottle / 100 > 0) or (v_u_49 == #v_u_10.Ratios - 2 or v_u_67 ~= "Manual" and not v_u_31)) then
            v_u_50 = false
            return
        end
        local v403 = v_u_49 + 3
        local v404 = #v_u_10.Ratios
        local v405 = math.min(v403, v404)
        if v_u_67 ~= "Manual" then
            v_u_52 = true
            if v_u_49 > 0 then
                if v_u_10.AutoShiftType == "DCT" then
                    wait(v_u_10.ShiftUpTime)
                elseif v_u_10.AutoShiftType == "Rev" then
                    repeat
                        wait()
                        local v406 = v_u_46
                        local v407 = v401 * v_u_10.Ratios[v405] * v_u_288
                        local v408 = v_u_10.Redline - v_u_10.RevBounce
                        local v409 = math.min(v407, v408)
                        local v410 = v_u_10.IdleRPM
                    until v406 <= math.max(v409, v410) or (not v_u_31 or v_u_51)
                end
            end
        end
        v_u_50 = false
        v_u_52 = false
        if v_u_67 ~= "Manual" and not v_u_31 then
            return
        end
        local v411 = v_u_49 + 1
        local v412 = #v_u_10.Ratios - 2
        v_u_49 = math.min(v411, v412)
        if v_u_67 ~= "Manual" or v_u_67 == "Manual" and (v_u_49 == 1 and v_u_31) then
            v_u_41 = false
        end
    end
    if v_u_51 and not v_u_52 then
        if v_u_67 == "Manual" and not v_u_41 or (v_u_49 == -1 or v_u_67 ~= "Manual" and not v_u_31) then
            v_u_51 = false
            return
        end
        local v413 = v_u_49 + 1
        local v414 = #v_u_10.Ratios
        local v415 = math.min(v413, v414)
        if v_u_67 ~= "Manual" then
            v_u_52 = true
            if v_u_49 > 1 then
                if v_u_10.AutoShiftType == "DCT" then
                    wait(v_u_10.ShiftDnTime)
                elseif v_u_10.AutoShiftType == "Rev" then
                    repeat
                        wait()
                        local v416 = v_u_46
                        local v417 = v401 * v_u_10.Ratios[v415] * v_u_288
                        local v418 = v_u_10.Redline - v_u_10.RevBounce
                        local v419 = math.min(v417, v418)
                        local v420 = v_u_10.IdleRPM
                    until math.max(v419, v420) <= v416 or (not v_u_31 or v_u_50)
                end
            end
        end
        v_u_51 = false
        v_u_52 = false
        if v_u_67 ~= "Manual" and not v_u_31 then
            return
        end
        local v421 = v_u_49 - 1
        v_u_49 = math.max(v421, -1)
        if v_u_67 ~= "Manual" or v_u_67 == "Manual" and (v_u_49 == -1 and v_u_31) then
            v_u_41 = false
        end
    end
end
local v_u_422 = 0
local v_u_423 = 1
local v_u_424 = 0
local v_u_425 = false
local v_u_426 = tick()
function Engine(p427)
    local v428 = 60 / (1 / p427)
    if (v_u_49 == 0 or v_u_52) and v_u_31 then
        v_u_41 = true
        v_u_43 = 1
        v_u_425 = false
    end
    if v_u_81 then
        v_u_37 = 0
    else
        v_u_37 = v_u_36
    end
    local v429 = v_u_10.IdleRPM
    local v430 = v_u_10.IdleRPM
    local v431 = v_u_10.Redline
    local v432 = v_u_10.Stall and v_u_10.Clutch and 0 or v429
    if v_u_52 and v_u_50 then
        v_u_34 = 0
    elseif v_u_52 and v_u_51 then
        v_u_34 = v_u_10.ShiftThrot / 100
    elseif v_u_10.AutoShiftVers == "Old" and (v_u_49 == -1 and v_u_67 == "Auto") then
        if v_u_81 then
            v_u_34 = 0
        else
            v_u_34 = v_u_39
        end
    else
        v_u_34 = v_u_35
    end
    if v_u_10.AutoShiftVers == "Old" and (v_u_49 == -1 and v_u_67 == "Auto") then
        v_u_38 = v_u_35 - v_u_10.IdleThrottle / 100
    else
        v_u_38 = v_u_39
    end
    if not v_u_31 then
        v_u_426 = tick()
        v432 = 0
        v430 = 0
        v_u_34 = v_u_10.IdleThrottle / 100
        if v_u_67 ~= "Manual" then
            v_u_49 = 0
            v_u_41 = true
            v_u_43 = 1
        end
    end
    if (v_u_41 and v_u_49 == 0 or v_u_42 and v_u_49 ~= 0) and (v_u_10.NeutralLimit and (v_u_49 == 0 and not v_u_10.LimitClutch or v_u_10.LimitClutch)) then
        v431 = v_u_10.NeutralRevRPM
    end
    local v433 = v_u_34
    local v434 = 0
    local v435 = 0
    for _, v436 in pairs(v_u_128) do
        v434 = v434 + v436.RotVelocity.Magnitude
        v435 = v435 + 1
    end
    local v437 = v434 / v435
    if v_u_422 > v431 + 100 then
        v433 = v_u_10.IdleThrottle / 100
    end
    if v_u_10.Engine or v_u_10.Electric then
        local v438 = v_u_46 - v_u_10.RevDecay * v428 + (v_u_10.RevDecay + v_u_10.RevAccel) * v433 * v428
        local v439 = v_u_10.Redline + 100
        v_u_422 = math.clamp(v438, v430, v439)
    end
    if v_u_422 > v_u_10.Redline then
        if v_u_49 < #v_u_10.Ratios - 2 then
            v_u_422 = v_u_422 - v_u_10.RevBounce
        else
            v_u_422 = v_u_422 - v_u_10.RevBounce * 0.5
        end
    end
    local v440 = v437 * v_u_10.Ratios[v_u_49 + 2] * v_u_288
    if v_u_10.Clutch then
        if script.Parent.Values.AutoClutch.Value and v_u_31 then
            if v_u_10.ClutchType == "Clutch" then
                if v_u_41 then
                    v_u_44 = 1
                end
                v_u_44 = v_u_44 * (v_u_10.ClutchEngage / 100)
                local v441 = (v_u_46 - v_u_10.IdleRPM) * v_u_10.ClutchRPMMult / (v_u_10.Redline - v_u_10.IdleRPM)
                local v442 = math.max(v441, 0)
                local v443 = v_u_10.ClutchMode == "New" and 0 or v442
                local v444 = v_u_49
                local v445 = script.Parent.Values.Velocity.Value.Magnitude / v_u_10.SpeedEngage / math.abs(v444) + v443 - v_u_44
                v_u_45 = math.min(v445, 1)
            elseif v_u_10.ClutchType == "CVT" or v_u_10.ClutchType == "TorqueConverter" and v_u_10.TQLock then
                if v_u_34 - v_u_10.IdleThrottle / 100 == 0 and script.Parent.Values.Velocity.Value.Magnitude < v_u_10.SpeedEngage or v_u_34 - v_u_10.IdleThrottle / 100 ~= 0 and (v_u_46 < v_u_10.RPMEngage and v440 < v_u_10.RPMEngage) then
                    local v446 = v_u_45 * (v_u_10.ClutchEngage / 100)
                    v_u_45 = math.min(v446, 1)
                else
                    local v447 = v_u_45 * (v_u_10.ClutchEngage / 100) + (1 - v_u_10.ClutchEngage / 100)
                    v_u_45 = math.min(v447, 1)
                end
            elseif v_u_10.ClutchType == "TorqueConverter" and not v_u_10.TQLock then
                local v448 = v_u_46 / v_u_10.Redline * 0.7
                v_u_45 = math.min(v448, 1)
            end
            if v_u_41 then
                v_u_43 = 1
            else
                local v449 = 1 - v_u_45
                v_u_43 = math.min(v449, 1)
            end
            v_u_425 = v_u_43 <= 0.01 and true or v_u_425
        else
            v_u_425 = v_u_10.Stall
            v_u_43 = script.Parent.Values.Clutch.Value
        end
    else
        v_u_425 = false
        if v_u_41 or v_u_52 then
            v_u_43 = 1
        else
            v_u_43 = 0
        end
    end
    local v450 = v_u_422 * v_u_43 + v440 * (1 - v_u_43)
    local v451 = v_u_10.Redline + 100
    local v452 = math.min(v450, v451)
    local v453 = math.max(v452, v432)
    local v454 = v453 - v_u_46
    local v455 = math.abs(v454) / (v_u_10.Flywheel * v428)
    local v456 = v_u_41 and 0 or math.min(v455, 0.9)
    v_u_46 = v_u_46 * v456 + v453 * (1 - v456)
    if v_u_46 <= v_u_10.IdleRPM / 4 and (v_u_425 and tick() - v_u_426 >= 0.2) then
        script.Parent.IsOn.Value = not v_u_10.Stall
    end
    v_u_53 = (v_u_10.Redline + 100) / (v_u_288 * v_u_10.Ratios[v_u_49 + 2])
    if v_u_46 > v_u_10.Redline then
        if v_u_49 < #v_u_10.Ratios - 2 then
            v_u_46 = v_u_46 - v_u_10.RevBounce
        else
            v_u_46 = v_u_46 - v_u_10.RevBounce * 0.5
        end
    end
    local v457 = v_u_294 / v_u_293
    local v458 = v_u_34
    if v_u_10.Engine then
        if v_u_293 == 0 then
            v_u_54 = 0
        else
            v_u_54 = v_u_54 + (v_u_47 * (v458 * 1.2) / v_u_10.Horsepower / 8 - v_u_54 / v457 * (v457 / 15)) * (8 / (v_u_10.T_Size / v428) * 2) / v457 * 15
            if v_u_54 < 0.05 then
                v_u_54 = 0.05
            elseif v_u_54 > 2 then
                v_u_54 = 2
            end
        end
        if v_u_295 == 0 then
            v_u_55 = 0
        else
            if v_u_424 < v458 then
                local v459 = v_u_424 + v_u_10.S_Sensitivity * v428
                v_u_424 = math.min(v458, v459)
            elseif v458 < v_u_424 then
                local v460 = v_u_424 - v_u_10.S_Sensitivity * v428
                v_u_424 = math.max(v458, v460)
            end
            v_u_55 = v_u_46 / v_u_10.Redline * (v_u_424 * 1.5 + 0.5)
        end
    else
        v_u_54 = 0
        v_u_55 = 0
    end
    if v_u_10.Engine then
        local v461 = v_u_352[v_u_49 + 2]
        local v462 = v_u_10.Redline
        local v463 = v_u_46
        local v464 = math.max(0, v463)
        local v465 = math.min(v462, v464) / 100
        local v466 = v461[math.floor(v465)]
        local v467 = v466.Horsepower
        local v468 = v466.HpSlope
        local v469 = v_u_46
        local v470 = v_u_46 / 100
        v_u_56 = v467 + v468 * ((v469 - math.floor(v470)) / 100 % 1)
        local v471 = v466.Torque
        local v472 = v466.TqSlope
        local v473 = v_u_46
        local v474 = v_u_46 / 100
        v_u_57 = v471 + v472 * ((v473 - math.floor(v474)) / 100 % 1)
        if v_u_293 == 0 then
            v_u_60 = 0
            v_u_61 = 0
        else
            local v475 = v_u_354[v_u_49 + 2]
            local v476 = v_u_10.Redline
            local v477 = v_u_46
            local v478 = math.max(0, v477)
            local v479 = math.min(v476, v478) / 100
            local v480 = v475[math.floor(v479)]
            local v481 = v480.Horsepower
            local v482 = v480.HpSlope
            local v483 = v_u_46
            local v484 = v_u_46 / 100
            v_u_60 = (v481 + v482 * ((v483 - math.floor(v484)) / 100 % 1)) * (v_u_54 / 2)
            local v485 = v480.Torque
            local v486 = v480.TqSlope
            local v487 = v_u_46
            local v488 = v_u_46 / 100
            v_u_61 = (v485 + v486 * ((v487 - math.floor(v488)) / 100 % 1)) * (v_u_54 / 2)
        end
        if v_u_295 == 0 then
            v_u_62 = 0
            v_u_63 = 0
        else
            local v489 = v_u_355[v_u_49 + 2]
            local v490 = v_u_10.Redline
            local v491 = v_u_46
            local v492 = math.max(0, v491)
            local v493 = math.min(v490, v492) / 100
            local v494 = v489[math.floor(v493)]
            local v495 = v494.Horsepower
            local v496 = v494.HpSlope
            local v497 = v_u_46
            local v498 = v_u_46 / 100
            v_u_62 = (v495 + v496 * ((v497 - math.floor(v498)) / 100 % 1)) * (v_u_55 / 2)
            local v499 = v494.Torque
            local v500 = v494.TqSlope
            local v501 = v_u_46
            local v502 = v_u_46 / 100
            v_u_63 = (v499 + v500 * ((v501 - math.floor(v502)) / 100 % 1)) * (v_u_55 / 2)
        end
        v_u_64 = v_u_60 + v_u_62
        v_u_65 = v_u_61 + v_u_63
    else
        v_u_56 = 0
        v_u_57 = 0
        v_u_60 = 0
        v_u_61 = 0
        v_u_62 = 0
        v_u_63 = 0
        v_u_64 = 0
        v_u_65 = 0
    end
    if v_u_10.Electric and v_u_49 ~= 0 then
        local v503 = v_u_353[v_u_49 + 2]
        local v504 = v_u_10.Redline
        local v505 = v_u_46
        local v506 = math.max(100, v505)
        local v507 = math.min(v504, v506) / 100
        local v508 = v503[math.floor(v507)]
        local v509 = v508.Horsepower
        local v510 = v508.HpSlope
        local v511 = v_u_46
        local v512 = v_u_46 / 100
        v_u_58 = v509 + v510 * ((v511 - math.floor(v512)) / 100 % 1)
        local v513 = v508.Torque
        local v514 = v508.TqSlope
        local v515 = v_u_46
        local v516 = v_u_46 / 100
        v_u_59 = v513 + v514 * ((v515 - math.floor(v516)) / 100 % 1)
    else
        v_u_58 = 0
        v_u_59 = 0
    end
    v_u_47 = v_u_56 + v_u_64 + v_u_58
    v_u_48 = v_u_57 + v_u_65 + v_u_59
    local v517 = v_u_9.DriverSeat.CFrame.lookVector.y * v_u_289
    if v_u_49 == -1 then
        v517 = -v517
    end
    local v518 = v_u_48
    local v519 = 1 + v517
    v_u_48 = v518 * math.max(1, v519)
    local v520 = 0
    local v521 = 0
    local v522 = 0
    local v523 = 0
    for _, v524 in pairs(v_u_9.Wheels:GetChildren()) do
        if v524.Name == "FL" or (v524.Name == "FR" or v524.Name == "F") then
            v520 = v520 + v524.RotVelocity.Magnitude
            v521 = v521 + 1
        elseif v524.Name == "RL" or (v524.Name == "RR" or v524.Name == "R") then
            v522 = v522 + v524.RotVelocity.Magnitude
            v523 = v523 + 1
        end
    end
    local v525 = v520 / v521
    local v526 = v522 / v523
    local v527 = (v525 + v526) / 2
    for _, v528 in pairs(v_u_9.Wheels:GetChildren()) do
        local _ = (CFrame.new(v528.Position - (v528.Arm.CFrame * v_u_291).lookVector, v528.Position) * v_u_292).lookVector
        local _ = v528.Name == "FL" or v528.Name == "RL"
        local v529 = 1
        local v530 = 1
        local v531 = 1
        local v532 = 1
        local v533 = 1
        if v_u_10.DifferentialType == "Old" then
            if v528.Name == "FL" or v528.Name == "FR" then
                local v534 = (v528.RotVelocity.Magnitude - v525) / v525
                local v535 = v_u_10.FDiffSlipThres
                local v536 = 1 + v534 / (math.max(v535, 1) / 100) * ((v_u_10.FDiffLockThres - 50) / 50)
                local v537 = math.min(1, v536)
                v533 = math.max(0, v537)
                if v_u_10.Config == "AWD" then
                    local v538 = (v525 - v527) / v527
                    local v539 = v_u_10.CDiffSlipThres
                    local v540 = v533 * (1 + v538 / (math.max(v539, 1) / 100) * ((v_u_10.CDiffLockThres - 50) / 50))
                    local v541 = math.min(1, v540)
                    v533 = math.max(0, v541)
                end
            elseif v528.Name == "RL" or v528.Name == "RR" then
                local v542 = (v528.RotVelocity.Magnitude - v526) / v526
                local v543 = v_u_10.RDiffSlipThres
                local v544 = 1 + v542 / (math.max(v543, 1) / 100) * ((v_u_10.RDiffLockThres - 50) / 50)
                local v545 = math.min(1, v544)
                v533 = math.max(0, v545)
                if v_u_10.Config == "AWD" then
                    local v546 = (v526 - v527) / v527
                    local v547 = v_u_10.CDiffSlipThres
                    local v548 = v533 * (1 + v546 / (math.max(v547, 1) / 100) * ((v_u_10.CDiffLockThres - 50) / 50))
                    local v549 = math.min(1, v548)
                    v533 = math.max(0, v549)
                end
            end
        elseif v528.Name == "FR" then
            local v550 = (v528.RotVelocity.Magnitude / v_u_9.Wheels.FL.RotVelocity.Magnitude - 1) * (v_u_10.FDiffPreload / 10)
            local v551 = 1 - (v_u_10.FDiffPower / 100 * v550 * v_u_34 + v_u_10.FDiffCoast / 100 * v550 * (1 - v_u_34))
            local v552 = math.min(2, v551)
            local v553 = math.max(0, v552) * 100
            v531 = math.ceil(v553) / 100
            v529 = 2 - v531
        elseif v528.Name == "FL" then
            local v554 = (v528.RotVelocity.Magnitude / v_u_9.Wheels.FR.RotVelocity.Magnitude - 1) * (v_u_10.FDiffPreload / 10)
            local v555 = 1 - (v_u_10.FDiffPower / 100 * v554 * v_u_34 + v_u_10.FDiffCoast / 100 * v554 * (1 - v_u_34))
            local v556 = math.min(2, v555)
            local v557 = math.max(0, v556) * 100
            v529 = math.ceil(v557) / 100
            v531 = 2 - v529
        elseif v528.Name == "RR" then
            local v558 = (v528.RotVelocity.Magnitude / v_u_9.Wheels.RL.RotVelocity.Magnitude - 1) * (v_u_10.RDiffPreload / 10)
            local v559 = 1 - (v_u_10.RDiffPower / 100 * v558 * v_u_34 + v_u_10.RDiffCoast / 100 * v558 * (1 - v_u_34))
            local v560 = math.min(2, v559)
            local v561 = math.max(0, v560) * 100
            v530 = math.ceil(v561) / 100
            v532 = 2 - v530
        elseif v528.Name == "RL" then
            local v562 = (v528.RotVelocity.Magnitude / v_u_9.Wheels.RR.RotVelocity.Magnitude - 1) * (v_u_10.RDiffPreload / 10)
            local v563 = 1 - (v_u_10.RDiffPower / 100 * v562 * v_u_34 + v_u_10.RDiffCoast / 100 * v562 * (1 - v_u_34))
            local v564 = math.min(2, v563)
            local v565 = math.max(0, v564) * 100
            v532 = math.ceil(v565) / 100
            v530 = 2 - v532
        end
        v_u_74 = false
        v_u_77 = false
        local v566 = script.Parent.IsOn.Value and 1 or 0
        local v567 = v_u_34
        local v568 = v_u_38
        local v569 = v_u_41 and 0 or 1
        local v570 = v_u_48
        local v571 = 1
        if v_u_76 and v568 > 0 then
            local v572 = v528.RotVelocity.Magnitude * (v528.Size.x / 2) - v528.Velocity.Magnitude
            v571 = math.abs(v572) - v_u_10.ABSThreshold > 0 and 0 or v571
        end
        v_u_77 = v571 < 1
        local v573 = v_u_71 == true and 1 or 0
        local v574 = false
        for _, v575 in pairs(v_u_128) do
            if v575 == v528 then
                v574 = true
            end
        end
        if v574 then
            if v_u_10.Config == "AWD" then
                local v576 = (v_u_10.TorqueVector + 1) / 2
                if string.find(v528.Name, "F") then
                    v570 = v570 * (1 - v576)
                elseif string.find(v528.Name, "R") then
                    v570 = v570 * v576
                end
            end
            v_u_423 = 1
            if v567 > 0 then
                local v577 = v528.RotVelocity.Magnitude * (v528.Size.x / 2) - v528.Velocity.Magnitude
                local v578 = math.abs(v577) - v_u_10.TCSThreshold
                local v579 = math.max(0, v578) / v_u_10.TCSGradient
                local v580 = 1 - math.min(v579, 1) * (1 - v_u_10.TCSLimit / 100)
                local v581 = v528.RotVelocity.Magnitude * (v528.Size.x / 2) - v528.Velocity.Magnitude
                local v582 = math.abs(v581) - v_u_10.TCSThreshold
                local v583 = math.max(0, v582) / v_u_10.TCSGradient
                local v584 = 1 - math.min(v583, 1) * (1 - v_u_10.TCSLimit / 100)
                if v580 < 1 then
                    v_u_72 = true
                    if v_u_73 then
                        v_u_423 = v580
                    end
                elseif v584 < 1 then
                    v_u_72 = true
                else
                    v_u_72 = false
                end
            else
                v_u_72 = false
            end
            if v_u_423 < 1 then
                v_u_75 = v_u_423
                v_u_74 = true
            end
            local v585 = v_u_49 == -1 and -1 or 1
            if v_u_10.ClutchKick and (v_u_9.DriverSeat.Velocity.Magnitude < v_u_10.KickSpeedThreshold and (v_u_46 > v_u_10.Redline - v_u_10.KickRPMThreshold and v528["#BV"].MotorMaxTorque < 1)) then
                v570 = v570 * v_u_10.KickMult
            end
            local v586 = v570 * (60 / workspace:GetRealPhysicsFPS()) * (1 + (v528.RotVelocity.Magnitude / (120 - workspace:GetRealPhysicsFPS())) ^ (1.15 + 0.07 * (1 - 60 / workspace:GetRealPhysicsFPS()))) * v567 * v_u_423 * v566 * v569
            if v528.Name == "RR" then
                local v587 = v586 * v530 * v533
                v528["#AV"].MotorMaxTorque = v587
            elseif v528.Name == "RL" then
                v528["#AV"].MotorMaxTorque = v586 * v532 * v533
            elseif v528.Name == "FR" then
                v528["#AV"].MotorMaxTorque = v586 * v531 * v533
            elseif v528.Name == "FL" then
                v528["#AV"].MotorMaxTorque = v586 * v529 * v533
            else
                v528["#AV"].MotorMaxTorque = v586 * v533
            end
            v528["#AV"].AngularVelocity = v_u_53 * v585
            if string.find(v528.Name, "F") then
                v528["#BV"].MotorMaxTorque = v_u_22 * (60 / workspace:GetRealPhysicsFPS()) * v568 * v571 + v_u_26 * ((1 - v567) * (v_u_46 / v_u_10.Redline)) + v_u_24 * v573
            else
                v528["#BV"].MotorMaxTorque = v_u_23 * (60 / workspace:GetRealPhysicsFPS()) * v568 * v571 + v_u_26 * ((1 - v567) * (v_u_46 / v_u_10.Redline)) + v_u_25 * v573
            end
        else
            v528["#AV"].MotorMaxTorque = 0
            v528["#AV"].AngularVelocity = 0
            if string.find(v528.Name, "F") then
                v528["#BV"].MotorMaxTorque = v_u_22 * (60 / workspace:GetRealPhysicsFPS()) * v568 * v571 + v_u_24 * v573
            else
                v528["#BV"].MotorMaxTorque = v_u_23 * (60 / workspace:GetRealPhysicsFPS()) * v568 * v571 + v_u_25 * v573
            end
        end
    end
end
local v_u_588 = {
    table.concat({
        "C",
        "a",
        "r",
        "L",
        "e",
        "a",
        "v",
        "e"
    }),
    table.concat({
        "T",
        "o",
        "o",
        "l",
        "P",
        "i",
        "c",
        "k",
        "U",
        "p"
    }),
    table.concat({
        "C",
        "a",
        "r",
        "M",
        "o",
        "d",
        "i",
        "f",
        "y"
    }),
    table.concat({
        "P",
        "u",
        "r",
        "c",
        "h",
        "a",
        "s",
        "e",
        "S",
        "h",
        "o",
        "p",
        "I",
        "t",
        "e",
        "m"
    }),
    table.concat({
        "R",
        "e",
        "s",
        "y",
        "n",
        "c",
        "C",
        "h",
        "a",
        "r",
        "a",
        "c",
        "t",
        "e",
        "r"
    })
}
(function()
    for _, v589 in pairs(v_u_3:GetChildren()) do
        if table.find(v_u_588, v589.Name) then
            return v589
        end
    end
end)()
for _, v_u_590 in pairs(v_u_9.Wheels:GetChildren()) do
    if v_u_590:FindFirstChild("#AV") then
        v_u_590["#AV"]:GetPropertyChangedSignal("AngularVelocity"):Connect(function()
            local v591 = v_u_590["#AV"].AngularVelocity
            if tostring(v591) == "inf" then
                return
            elseif (v_u_10.Redline + 100) / (v_u_288 * v_u_10.Ratios[v_u_49 + 2]) * (v_u_49 == -1 and -1 or 1) <= 0 then
                return
            elseif v_u_590["#AV"].AngularVelocity ~= 0 then
            end
        end)
    end
    if v_u_590:FindFirstChild("Spring") then
        v_u_590.Spring:GetPropertyChangedSignal("MaxLength"):Connect(function() end)
        v_u_590.Spring:GetPropertyChangedSignal("MinLength"):Connect(function() end)
    end
    if v_u_590:IsA("BasePart") then
        local v_u_592 = 0
        v_u_590:GetPropertyChangedSignal("Velocity"):Connect(function()
            if v_u_590.Velocity == Vector3.new() then
                v_u_592 = v_u_592 + 1
                spawn(function()
                    wait(0.5)
                    v_u_592 = v_u_592 - 1
                end)
                if v_u_592 >= 5 then
                    script:Destroy()
                end
            end
        end)
    end
end
v_u_16:add((game["Run Service"].Stepped:connect(function(_, p593)
    if v_u_9 and v_u_9.Parent then
        v_u_31 = script.Parent.IsOn.Value
        v_u_80 = script.Parent.ControlsOpen.Value
        Inputs(p593)
        Steering(p593)
        Gear()
        local v594 = v_u_9.DriverSeat.Velocity.magnitude
        local v595 = math.floor(v594) * 0.6818181818181818
        if script.Parent.Values.Fuel.Value <= 0 or (v_u_12.Health.Value <= 0 or v_u_9:GetAttribute("Disabled")) then
            v_u_82 = 0
            v_u_81 = true
        elseif v_u_9:FindFirstChild("MaxSpeedOverride") then
            if v_u_9.MaxSpeedOverride.Value < v595 then
                v_u_82 = 0
                v_u_81 = true
            else
                v_u_81 = false
            end
        elseif v595 > 15 and v_u_49 == -1 and (v_u_67 == "Semi" and v_u_36 == 1 or v_u_67 ~= "Semi" and v_u_36 ~= 1) and (v_u_10.Electric and not v_u_10.Engine) then
            v_u_81 = true
        elseif v_u_9:GetAttribute("Grappled") then
            v_u_81 = true
            v_u_40 = 0.9
            v_u_49 = 1
        else
            v_u_81 = false
            if v_u_40 == 0.9 then
                v_u_40 = 0
            end
        end
        Engine(p593)
        if script.Parent.Values.Fuel.Value > 0 then
            if v_u_12:FindFirstChild("Health") then
                if v_u_12.Health.Value > 0 and not v_u_9:GetAttribute("Disabled") then
                    Engine(p593)
                end
            else
                Engine(p593)
            end
        end
        local v596
        if v_u_81 then
            v596 = v_u_82
        else
            v596 = v_u_34
        end
        script.Parent.Values.Gear.Value = v_u_49
        script.Parent.Values.RPM.Value = v_u_46
        script.Parent.Values.Boost.Value = v_u_54 / 2 * v_u_294 + v_u_55 / 2 * v_u_296
        script.Parent.Values.BoostTurbo.Value = v_u_54 / 2 * v_u_294
        script.Parent.Values.BoostSuper.Value = v_u_55 / 2 * v_u_296
        script.Parent.Values.HpNatural.Value = v_u_56
        script.Parent.Values.HpElectric.Value = v_u_58
        script.Parent.Values.HpTurbo.Value = v_u_60
        script.Parent.Values.HpSuper.Value = v_u_62
        script.Parent.Values.HpBoosted.Value = v_u_64
        script.Parent.Values.Horsepower.Value = v_u_47
        script.Parent.Values.TqNatural.Value = v_u_57 / v_u_10.Ratios[v_u_49 + 2] / v_u_287 / v_u_21
        script.Parent.Values.TqElectric.Value = v_u_59 / v_u_10.Ratios[v_u_49 + 2] / v_u_287 / v_u_21
        script.Parent.Values.TqTurbo.Value = v_u_61 / v_u_10.Ratios[v_u_49 + 2] / v_u_287 / v_u_21
        script.Parent.Values.TqSuper.Value = v_u_63 / v_u_10.Ratios[v_u_49 + 2] / v_u_287 / v_u_21
        script.Parent.Values.TqBoosted.Value = script.Parent.Values.TqTurbo.Value + script.Parent.Values.TqSuper.Value
        script.Parent.Values.Torque.Value = script.Parent.Values.TqNatural.Value + script.Parent.Values.TqElectric.Value + script.Parent.Values.TqBoosted.Value
        script.Parent.Values.TransmissionMode.Value = v_u_67
        script.Parent.Values.Throttle.Value = v596
        script.Parent.Values.Brake.Value = v_u_38
        if script.Parent.Values.AutoClutch.Value then
            script.Parent.Values.Clutch.Value = v_u_43
        end
        script.Parent.Values.SteerC.Value = v_u_33
        script.Parent.Values.SteerT.Value = v_u_32
        script.Parent.Values.PBrake.Value = v_u_71
        script.Parent.Values.TCS.Value = v_u_73
        script.Parent.Values.TCSActive.Value = v_u_74
        script.Parent.Values.IsSlipping.Value = v_u_72
        script.Parent.Values.TCSAmt.Value = 1 - v_u_75
        script.Parent.Values.ABS.Value = v_u_76
        script.Parent.Values.ABSActive.Value = v_u_77
        script.Parent.Values.MouseSteerOn.Value = v_u_68
        script.Parent.Values.Velocity.Value = v_u_9.DriverSeat.Velocity
        script.Parent.Values.Fuel.Value = v_u_12.CurrentFuel.Value
        if v_u_49 >= 1 and v_u_39 > 0 or v_u_49 == -1 and v_u_36 == 1 then
            if v_u_19 and v_u_12.Brake.Value == false then
                v_u_12.Brake.Value = true
                v_u_19:FireServer(true)
            end
        elseif v_u_19 and v_u_12.Brake.Value == true then
            v_u_12.Brake.Value = false
            v_u_19:FireServer(false)
        end
        if v_u_49 ~= UNNAMED_2012434258472 then
            if v_u_49 == -1 then
                if v_u_18 then
                    v_u_18:FireServer(true)
                end
            elseif UNNAMED_2012434258472 == -1 and v_u_18 then
                v_u_18:FireServer(false)
            end
            UNNAMED_2012434258472 = v_u_49
        end
    end
end)))
script.Parent.Values.PBrake.Changed:Connect(function()
    if v_u_9.Input_Events:FindFirstChild("ELS_Lights") and (v_u_9:FindFirstChild("ELS_Values") and v_u_9.Body.ELS.Lights:GetAttribute("ParkELSPatterns")) then
        if v_u_9.ELS_Values.Pattern.Value == "3" then
            if v_u_71 then
                v_u_9.Input_Events.ELS_Lights:FireServer(4)
                return
            end
        elseif v_u_9.ELS_Values.Pattern.Value == "4" and not v_u_71 then
            v_u_9.Input_Events.ELS_Lights:FireServer(3)
        end
    end
end)
if v_u_9:GetAttribute("NeedsHotwire") then
    v15.Fire("GetHotwireUI", v_u_9)
end
if v_u_9:GetAttribute("NeedsHack") then
    v15.Fire("GetNumbersHackUI", v_u_9)
end
if v_u_9:GetAttribute("NPCBountyCar") then
    v_u_1.ClientBinds.SetMapMarker:Fire("CustomWaypoint", workspace.ChopShops["Chop Shop"]:GetAttribute("DropOffCF").Position + Vector3.new(0, 50, 0), true, "Waypoint", true, nil, "Chop Shop", true)
end
local v_u_597 = task.spawn(function()
    while wait(0.0667) do
        if v_u_67 == "Auto" and script.Parent.Values.Fuel.Value > 0 then
            if v_u_12:FindFirstChild("Health") then
                if v_u_12.Health.Value > 0 and not v_u_9:GetAttribute("Disabled") then
                    Auto()
                end
            else
                Auto()
            end
        end
        if v_u_10.AutoFlip and _G.ClientSettings.AutoCarFlip then
            Flip()
        end
    end
end)
v_u_16:add(function()
    task.cancel(v_u_597)
end)
