-- Dark themed Admin Panel Script

-- Create GUI elements
local mainPage = vgui.Create("DFrame")
mainPage:SetSize(800, 600)
mainPage:Center()
mainPage:SetTitle("Admin Panel")
mainPage:SetDraggable(false)
mainPage:MakePopup()

-- Navigation bar on the left
local navBar = vgui.Create("DPanelList", mainPage)
navBar:Dock(LEFT)
navBar:SetSize(150, 600)
navBar:SetSpacing(5)
navBar:EnableVerticalScrollbar(true)

-- Console log on the right
local consoleLog = vgui.Create("DPanelList", mainPage)
consoleLog:Dock(RIGHT)
consoleLog:SetSize(150, 600)
consoleLog:SetSpacing(5)
consoleLog:EnableVerticalScrollbar(true)

-- Search bar at the top
local searchBar = vgui.Create("DTextEntry", mainPage)
searchBar:Dock(TOP)
searchBar:SetSize(800, 30)

-- Player list in the middle
local playerList = vgui.Create("DListView", mainPage)
playerList:Dock(FILL)
playerList:SetSize(800, 570)
playerList:SetMultiSelect(false)
playerList:AddColumn("Name")
playerList:AddColumn("Steam ID")
playerList:AddColumn("Rank")
playerList:AddColumn("Admin Notes")

-- Add players to the player list
for k, v in pairs(player.GetAll()) do
	playerList:AddLine(v:Nick(), v:SteamID(), v:GetUserGroup(), "")
end

-- Search function
searchBar.OnEnter = function(self)
	local searchText = self:GetValue()
	playerList:Clear()
	for k, v in pairs(player.GetAll()) do
		if v:Nick():lower():find(searchText:lower()) then
			playerList:AddLine(v:Nick(), v:SteamID(), v:GetUserGroup(), "")
		end
	end
end

-- Add custom pages
local customPages = {}

-- Ban list page
local banButton = vgui.Create("DButton", navBar)
banButton:SetText("Ban List")
banButton:SetSize(145, 25)
banButton:Dock(TOP)
function banButton:DoClick()
	if not customPages.banList then
		local page = vgui.Create("DFrame")
		page:SetSize(800, 600)
		page:Center()
		page:SetTitle("Ban List")
		page:SetDraggable(false)
		page:MakePopup()
		customPages.banList = page
	else
		customPages.banList:SetVisible(true)
	end
end

-- Mute list page
local muteButton = vgui.Create("DButton", navBar)
muteButton:SetText("Mute List")
muteButton:SetSize(145, 25)
muteButton:Dock(TOP)
function muteButton:DoClick()
	if not customPages.muteList then
		local page = vgui.Create("DFrame")
		page:SetSize(800, 600)
		page:Center()
		page:SetTitle("Mute List")
		page:SetDraggable(false)
		page:MakePopup()
		customPages.muteList = page
	else
		customPages.muteList:SetVisible(true)
	end
end

-- Custom page system
local customPageButton = vgui.Create("DButton", navBar)
customPageButton:SetText("Custom Page")
customPageButton:SetSize(145, 25)
customPageButton:Dock(TOP)
function customPageButton:DoClick()
	local pageName = vgui.Create("DTextEntry", mainPage)
	pageName:SetSize(200, 30)
	pageName:SetPos(400, 300)
	pageName:MakePopup()
	pageName:RequestFocus()
	pageName.OnEnter = function(self)
		if not customPages[self:GetValue()] then
			local page = vgui.Create("DFrame")
			page:SetSize(800, 600)
			page:Center()
			page:SetTitle(self:GetValue())
			page:SetDraggable(false)
			page:MakePopup()
			customPages[self:GetValue()] = page
		else
			customPages[self:GetValue()]:SetVisible(true)
		end
		self:Remove()
	end
end

-- Console log
hook.Add("ServerLog", "ConsoleLog", function(logText)
	consoleLog:AddItem(vgui.Create("DLabel", mainPage))
	local label = consoleLog:GetItems()[consoleLog:GetItems():Count()]
	label:SetText(logText)
	label:SetTextColor(Color(255, 255, 255))
	label:SizeToContents()
end)







-- Panel Command Script

-- Create concommand and hook
concommand.Add("!panel", function(ply)
	if ply:IsSuperAdmin() then
		-- Dark themed Admin Panel
		local mainPage = vgui.Create("DFrame")
		mainPage:SetSize(800, 600)
		mainPage:Center()
		mainPage:SetTitle("Admin Panel")
		mainPage:SetDraggable(false)
		mainPage:MakePopup()

		-- Navigation bar on the left
		local navBar = vgui.Create("DPanelList", mainPage)
		navBar:Dock(LEFT)
		navBar:SetSize(150, 600)
		navBar:SetSpacing(5)
		navBar:EnableVerticalScrollbar(true)

		-- Console log on the right
		local consoleLog = vgui.Create("DPanelList", mainPage)
		consoleLog:Dock(RIGHT)
		consoleLog:SetSize(150, 600)
		consoleLog:SetSpacing(5)
		consoleLog:EnableVerticalScrollbar(true)

		-- Search bar at the top
		local searchBar = vgui.Create("DTextEntry", mainPage)
		searchBar:Dock(TOP)
		searchBar:SetSize(800, 30)

		-- Player list in the middle
		local playerList = vgui.Create("DListView", mainPage)
		playerList:Dock(FILL)
		playerList:SetSize(800, 570)
		playerList:SetMultiSelect(false)
		playerList:AddColumn("Name")
		playerList:AddColumn("Steam ID")
		playerList:AddColumn("Rank")
		playerList:AddColumn("Admin Notes")

		-- Add players to the player list
		for k, v in pairs(player.GetAll()) do
			playerList:AddLine(v:Nick(), v:SteamID(), v:GetUserGroup(), "")
		end

		-- Search function
		searchBar.OnEnter = function(self)
			local searchText = self:GetValue()
			playerList:Clear()
			for k, v in pairs(player.GetAll()) do
				if v:Nick():lower():find(searchText:lower()) then
					playerList:AddLine(v:Nick(), v:SteamID(), v:GetUserGroup(), "")
				end
			end
		end

		-- Add custom pages
		local customPages = {}

		-- Ban list page
		local banButton = vgui.Create("DButton", navBar)
		banButton:SetText("Ban List")
		banButton:SetSize(145, 25)
		banButton:Dock(TOP)
		function banButton:DoClick()
			if not customPages.banList then
				local page = vgui.Create("DFrame")
				page:SetSize(800, 600)
				page:Center()
				page:SetTitle("Ban List")
				page:SetDraggable(false)
				page:MakePopup()
				customPages.banList = page
			else
				customPages.banList:SetVisible(true)
			end
		end

		-- Mute list page
		local muteButton = vgui.Create("DButton", navBar)
		muteButton:SetText("Mute List")
		muteButton:SetSize(145, 25)
		muteButton:Dock(TOP)
		function muteButton:DoClick()
			if not customPages.muteList then
				local page = vgui.Create("DFrame")
				page:SetSize(800, 600)
				page:Center()
				page:SetTitle("Mute List")
				page:SetDraggable(false)
				page:MakePopup()
				customPages.muteList = page
			else
				customPages.muteList:SetVisible(true)
			end
		end

		-- Custom page system
		local customPageButton = vgui.Create("DButton", navBar)
		customPageButton:SetText("Custom Page")
		customPageButton:SetSize(145, 25)
		customPageButton:Dock(TOP)
		function customPageButton:DoClick()
			local pageName = vgui.Create("DTextEntry", mainPage)
			pageName:SetSize(200, 30)
			pageName:SetPos(400, 300)
			pageName:MakePopup()
			pageName:RequestFocus()
			pageName.OnEnter = function(self)
				if not customPages[self:GetValue()] then
					local page = vgui.Create("DFrame")
					page:SetSize(800, 600)
					page:Center()
					page:SetTitle(self:GetValue())
					page:SetDraggable(false)
					page:MakePopup()
					customPages[self:GetValue()] = page
				else
					customPages[self:GetValue()]:SetVisible(true)
				end
				self:Remove()
			end
		end

		-- Console log
		hook.Add("ServerLog", "ConsoleLog", function(logText)
			consoleLog:AddItem(vgui.Create("DLabel", mainPage))
			local label = consoleLog:GetItems()[consoleLog:GetItems():Count()]
			label:SetText(logText)
			label:SetTextColor(Color(255, 255, 255))
			label:SizeToContents()
		end)
	else
		ply:ChatPrint("You do not have permission to use this command!")
	end
end)