--not my plugin, updated to support oxide 1.8
--see more info at: http://forum.rustoxide.com/resources/private-messaging.4/


PLUGIN.Title = "Private Messaging"
PLUGIN.Description = "Allows players to talk to each other privately"

function PLUGIN:Init()
	self:AddChatCommand("pm", self.cmdWhisper)
end

function PLUGIN:cmdWhisper( netuser, cmd, args )
	if (#args < 2) then
		rust.Notice(netuser, "Syntax: /pm \"name\" message ")
		return
	end
	
	local b, targetuser = rust.FindNetUsersByName(args[1])
	if (not b) then
		if (targetuser == 0) then
			rust.Notice(netuser, "No players found with that name!")
		else
			rust.Notice(netuser, "Multiple players found with that name!")
		end
		return
	end
	
	table.remove(args, 1)
	local message = util.QuoteSafe( table.concat(args, " ") )
	rust.RunClientCommand(targetuser, "chat.add \"(PM) from " .. rust.QuoteSafe( netuser.displayName ) .. " \" \"" .. message .. "\"" )
	rust.RunClientCommand(netuser, "chat.add \"(PM) to " .. rust.QuoteSafe( targetuser.displayName ) .. " \" \"" .. message .. "\"" )
end

function PLUGIN:SendHelpText( netuser )
	rust.SendChatToUser( netuser, "Use /pm to send a private message." )
end
