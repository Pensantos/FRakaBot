local version = "0.0"

local AUTOUPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/Pensantos/FRakaBot/master/Frakabot.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."FrakaBot.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

function _AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>SorakaBot by szczurekPROS:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTOUPDATE then
        local ServerData = GetWebResult(UPDATE_HOST, "/szczurekPROS/GitHub/master/scripts/Version/sorakabotfree.version")
        if ServerData then
                ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
                if ServerVersion then
                        if tonumber(version) < ServerVersion then
                                _AutoupdaterMsg("New version available"..ServerVersion)
                                _AutoupdaterMsg("Updating, please don't press F9")
                                DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () _AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
                        else
                                _AutoupdaterMsg("You have got the latest version ("..ServerVersion..")")
                        end
                end
        else
                _AutoupdaterMsg("Error downloading version info")
        end
end

--[[AUTO UPDATE END]]--

    welcome = "Welcome to SorakaBot version 2.4 by szczurekPROS"
    --[[
    SorakaBot V2.4 by szczurekPROS
    GPL v2 license
    --]]
     
     --Auto Potion--
    MPotUsed = false
    HPotUsed = false
    manaLimit = 0.55
    hpLimit = 0.4
    lastTimeMPot = 0
    lastTimeHPot = 0
     
    --press this key for spell settings(F1 default)
    desiredGuiKey = 0x50
    --soraka will heal target up to this percent
    desiredHeal = 0.75
    --soraka will repelnish target mana up to this percent
    desiredReplenish = 0.74
    --soraka will ult teammates up to this percent
    desiredUlt = 0.80
    --soraka will use summoners
    desiredSummoners = true
    --enable autobuy items from list
    desiredItems = true
    --Item List
	--[[ Config ]]
	shopList = {2004, 2004, 1006, 1004, 3096, 1001, 1028, 3158, 3067, 3069, 1028, 3105, 3190, 1028, 3010, 3027, 3065}

	nextbuyIndex = 1
	wardBought = 0
	firstBought = false
	lastBuy = 0
	
	buyDelay = 100 --default 100
    --enable level spells from array bellow
    desiredLevel = true
    --level sequence
    spells = {_W,_E,_W,_Q,_E,_R,_W,_Q,_W,_E,_R,_E,_Q,_E,_W,_R,_Q,_Q}
    --wards
    wards = {{x=10000,z=2860},{x=4000,z=11600},{x=4800,z=8925},{x=9125,z=5315},{x=11450,z=6990},{x=6735,z=2925},{x=2615,z=7500},{x=7300,z=11490}}
    --team dependent wards
    if myHero.team == TEAM_BLUE then
            wards[#wards + 1] = {x=13260,z=2910}
            wards[#wards + 1] = {x=2550,z=13450}
    else
            wards[#wards + 1] = {x=11675,z=1100}
            wards[#wards + 1] = {x=935,z=12245}
    end
     
    ------------------------------------------------
    --------------------code-----------------------
    ------------------------------------------------
    if myHero.charName ~= "Soraka" then return end
    --fix bugsplat for now
    IsWallOfGrass = function() return 0 end
     
    require "AIData"
    require "AIRoutine"
    require "AITimer"
    require "AIFind"
    require "AIGui"
    require "AIStat"
    require "AICondition"
    require "AISpell"
     
    ------------------------------------------------
    ----------------------init----------------------
    ------------------------------------------------
     
    function OnLoad()
		--eu
		nabase=true
		timed=false
		tempo=GetInGameTimer()
		timer=0
		tempoafk=0
		 
		 x=1
		 if AIData.allies[x].charName=="Soraka" then
		   x=x+1
		  end
		 i=1
		 fo=false
		 while i<6 do
		   r=AIData.allies[i].charName
		   if r=="Lucian" or r=="Caitlyn" or r=="Corki" or r=="Tristana" or r=="Ashe" or r=="Graves" or r=="Varus" or r=="Jinx" or r=="Draven" or r=="Twitch" or r=="Vayne" or r=="Ezreal" or r=="MissFortune" or r=="sivir" then
			   
			   print("ADC encontrado, seguindo: <<"..r..">>")
			   followTarget = AIData.allies[i]
				 i=6
				 fo=true
                                                            action = decide()
                                                            actionTimer = action()
                                                            brainTimer = AITimer.add(0.125,function()
                                                                            local candidate = decide()
                                                                            if action ~= candidate then
                                                                                    AITimer.remove(actionTimer)
                                                                                    action = candidate
                                                                                    actionTimer = action()
                                                                            end
         
																																		end)
			 else 
			    
				 end
				 i=i+1
			end
		   if fo==false then
			   
		     followTarget = AIData.allies[x]
                                                            action = decide()
                                                            actionTimer = action()
                                                            brainTimer = AITimer.add(0.125,function()
                                                                            local candidate = decide()
                                                                            if action
