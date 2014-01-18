PLUGIN.Title = "cmd"
PLUGIN.Description = "Rustaholic.de CMD List"

local alternate = true

function PLUGIN:Init()

	cmdcommandlist = util.GetDataFile( "owncmdlist" )
	local txt = cmdcommandlist:GetText()
	if (txt ~= "") then
		cmdcommandlist = txt
	else
		cmdcommandlist = {}
	end

	self:AddChatCommand("cmd", self.cmdList)
end

function PLUGIN:cmdList( netuser, cmd, args )
    	rust.Notice( netuser, cmdcommandlist )
end

function PLUGIN:SendHelpText( netuser )
	rust.SendChatToUser( netuser, "/cmd for a Commandlist." )
end
