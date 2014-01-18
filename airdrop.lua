PLUGIN.Title = "Airdrop"
PLUGIN.Description = "Performs timed airdrops"

function PLUGIN:Init()
		--change 3600 to any number of seconds
		timer.Repeat(3600, self.drop)
end

function PLUGIN:drop()
		rust.RunServerCommand( "airdrop.drop" )
end
