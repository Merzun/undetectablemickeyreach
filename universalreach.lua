local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("StarterGui")
local player = game:GetService("Players").LocalPlayer
local balls = {}
local lastrefreshtime = os.time()
local reach = 20
function refreshballs(force)
    if force == false then
    if lastrefreshtime + 2 > os.time() then return end
    end
        lastrefreshtime = os.time()
    table.clear(balls)
for i,v in pairs(workspace:GetDescendants()) do
    
    -- IF THE SCRIPT IS NOT RECOGNISING A BALL, ADD THEIR LEAGUE ABBREVIATION ONTO THIS.
    
if v.Name == "TPS" or v.Name == "ESA" or v.Name == "MRS" or v.Name == "PRS" or v.Name == "MPS" or v.Name == "VFA" then
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
        if i.KeyCode == Enum.KeyCode.Comma or i.KeyCode == Enum.KeyCode.Period then
        if i.KeyCode == Enum.KeyCode.Comma then
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
    for i,v in pairs(player.Character["Right Leg"]:GetDescendants()) do
if v.Name == "TouchInterest" and v.Parent then
    for i,e in pairs(balls) do
if (e.Position - player.Character["Right Leg"].Position).magnitude < reach then
firetouchinterest(e,v.Parent,0)
firetouchinterest(e,v.Parent,1)
break
end
    end
end
end
        end
end
end)
