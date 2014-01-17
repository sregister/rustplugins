
PLUGIN.Title = "Airdrop"
PLUGIN.Description = "Performs timed airdrops"

function PLUGIN:Init()
		timer.Repeat(30, self.drop)
end

function PLUGIN:drop()
		rust.RunServerCommand( "airdrop.drop" )
end
