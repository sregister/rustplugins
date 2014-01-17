
PLUGIN.Title = "Hello World"
PLUGIN.Description = "Says hello to all that is worthy"

function PLUGIN:Init()
	self:AddChatCommand( "say_hello", self.say_hello )
end

function PLUGIN:say_hello( netuser, cmd, args )
	if (not args[1]) then
		rust.Notice( netuser, "Say hello to who? Syntax: /say_hello name" )
		return
	end
	local b, targetuser = rust.FindNetUsersByName( args[1] )
	if (not b) then
		if (targetuser == 0) then
			rust.Notice( netuser, "No players found with that name!" )
		else
			rust.Notice( netuser, "Multiple players found with that name!" )
		end
		return
	end
	local userID = rust.GetUserID( netuser )
	local targetID = rust.GetUserID( targetuser )
	rust.BroadcastChat ( "", "Hello" .. rust.QuoteSafe (targetuser.displayName) )
	return
end
