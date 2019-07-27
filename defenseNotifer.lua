--[[Created by tomspell
    You need to have HTTP Requests turned on in your game settings for this to work. To do this, open your game, press home, then press game settings. Once in there, navigate to Options, and turn HTTP Requests on.
    I hope this will help you and your clan out! If you have any questions, you can reach me on the GCC Discord Server, or at ts#1329

    Make sure to check the GCC discord for more opensource tech. also please dont remove any of the comments.
]]

local notified = false
local bot = "" -- This is your Discord Webhook. You can read about those here: https://support.discordapp.com/hc/en-us/articles/228383668-Intro-to-Webhooks
local httpService = game:GetService("HttpService")

local neededRaiders =  --[[
Put the needed raiders for the bot to ping here. 
If the amount of raiders is greater than the needed, it'll send the message. 
Typically, you want this 1 or 2 raiders lower than your official ammount.
]]
local groupID =   -- It's your group id, pretty simple.

function postAnnouncement()
	local Message = {
        ['username'] = "put your username here", -- This will be the username of the bot. Typically, it'll be something like it'll be something like "Arvore Scout" or "WIJBot"
        ['content'] = "put your message here", -- This is where the message goes. If you want to ping everyone, just do @everyone. 
    --[[ If you want to create an embed, it'll take a bit of work on your part. However, i'll provide the basic resources for you.
		["embeds"] = {{
			["color"] = 2247400, -- This has to be a Hexidecimal. This best place to get these is https://convertingcolors.com/
			["fields"] = {{
				["name"] = "title", -- So Fields work like this. Rich embeds don't work via webhooks (to my knowledge), so each of your fields will have to have a name and a value 
				["value"] = "message", -- The Value will be your main message, and the name will be the title
			},
			{
				["name"] = "title", -- You can have as many fields as you want, but make sure to remember the squiggly brackets
				["value"] = "message" -- This is sending to discord, which usages javascript, which is why you need the squiggly brackets.
			}},
		["footer"] = { -- You can also add a footer to embeds, which can contain additional information.
			["text"] = "Created by tomspell" -- There isn't any title for these, just text
		}
		}}
    ]]
	}
	httpService:PostAsync(bot, httpService:JSONEncode(Message)) -- Actually posting the message. Don't mess with this unless you know what you're doing.
end

-- Everything below this line is checking if the condition is met where the amount of raiders is greater than the needed amount.
game.Players.PlayerAdded:connect(function(Player)
	if not Player:IsInGroup(groupID) then
		local amountRaiders=0;
		for _,v in pairs(game.Players:GetPlayers()) do
			if not v:IsInGroup(groupID) then
				amountRaiders=amountRaiders+1
			end
		end
	if amountRaiders>=neededRaiders and Player then
  	  	wait(5)
   			if not notified then
				notified = true
       				postAnnouncement()
			end
		end
    end
end)
