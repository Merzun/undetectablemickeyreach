local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("StarterGui")
local player = game:GetService("Players").LocalPlayer
local balls = {}
local lastrefreshtime = os.time()
local currentleg = true
local touchint = nil
local Ltouchint
local reach = 15
function refreshballs(force)
    if force == false then
    if lastrefreshtime + 1.5 > os.time() then return end
    end
        lastrefreshtime = os.time()
    table.clear(balls)
for i,v in pairs(workspace:GetDescendants()) do
        local firstletter = string.sub(v.Name, 1, 1)
    -- IF THE SCRIPT IS NOT RECOGNISING A BALL, ADD THEIR LEAGUE ABBREVIATION ONTO THIS.
if v.Name == "TPS" or v.Name == "ESA" or v.Name == "MRS" or v.Name == "PRS" or v.Name == "MPS" or v.Name == "VFA" or firstletter == "{" then
    task.wait()
table.insert(balls,v)
end
end
end

refreshballs(true)

UserInputService.InputBegan:Connect(function(i, gameProcessedEvent)
    if i.KeyCode == Enum.KeyCode.W or i.KeyCode == Enum.KeyCode.A or i.KeyCode == Enum.KeyCode.S or i.KeyCode == Enum.KeyCode.D or i.KeyCode == Enum.KeyCode.Space then
    return end
    if gameProcessedEvent == false then
        if i.KeyCode == Enum.KeyCode.LeftControl then
        if currentleg == true then
        currentleg = false
        else
            currentleg = true
        end
        end
        if i.KeyCode == Enum.KeyCode.PageUp or i.KeyCode == Enum.KeyCode.PageDown then
        if i.KeyCode == Enum.KeyCode.PageDown then
        reach = reach - 1
        CoreGui:SetCore("SendNotification", {
	Title = "ReachScript";
	Text = "Reach has been set to: "..reach;
	Duration = 0.5;
        })
        else
                    reach = reach + 1
        CoreGui:SetCore("SendNotification", {
	Title = "ReachScript";
	Text = "Reach has been set to: "..reach;
	Duration = 0.5;
        })
        end
        else
        refreshballs(false)
        if currentleg == true then
    for i,v in pairs(player.Character["Right Leg"]:GetDescendants()) do
if v.Name == "TouchInterest" and v.Parent then
    task.wait()
touchint = v
end
end
else
    for i,v in pairs(player.Character["Left Leg"]:GetDescendants()) do
if v.Name == "TouchInterest" and v.Parent then
    task.wait()
Ltouchint = v
end
end
    end
    for i,e in pairs(balls) do
if (e.Position - player.Character["Right Leg"].Position).magnitude <= reach then
        task.wait(math.random(0.2,0.5))
    if currentleg == true then
firetouchinterest(e,touchint.Parent,0)
firetouchinterest(e,touchint.Parent,1)
else
firetouchinterest(e,Ltouchint.Parent,0)
firetouchinterest(e,Ltouchint.Parent,1)
end
break
end
end
        end
end
end)
