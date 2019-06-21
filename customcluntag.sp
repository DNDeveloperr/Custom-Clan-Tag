#pragma semicolon 1
#pragma newdecls required
#include <sourcemod>
#include <sdktools>
#include <cstrike>
//#include <sdkhooks>

#define PLUGIN_VERSION "0.00"

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "Custom Clan Tag",
	author = "Munoon",
	description = "Plugin switch player clan tag Ddepending on his role",
	version = "1.0",
	url = ""
};

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if(g_Game != Engine_CSGO && g_Game != Engine_CSS)
	{
		SetFailState("This plugin is for CSGO/CSS only.");	
	}
	HookEvent("player_team", change_clantag);
}

public Action change_clantag(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	CS_SetClientClanTag(client, "CLAN TAG");
}  