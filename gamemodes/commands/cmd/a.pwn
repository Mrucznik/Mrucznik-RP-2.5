//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ a ]---------------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:a(playerid, params[], help)
{
	new string[256];
    if(IsPlayerConnected(playerid))
    {
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj (/a)dmin [admin chat]");
			return 1;
		}
		if(PlayerInfo[playerid][Admin] >= 5000) 
		{
			format(string, sizeof(string), "H@ [%d] %s - %s", PlayerInfo[playerid][Admin], GetNickEx(playerid), params);
		}
		else if(IsAScripter(playerid))
		{
			format(string, sizeof(string), "Skrypter %s - %s", GetNickEx(playerid), params);
		}
		else if(PlayerInfo[playerid][Admin] >= 1) 
		{
			format(string, sizeof(string), "Admin [%d] %s - %s", PlayerInfo[playerid][Admin], GetNickEx(playerid), params);
		}
		else if(PlayerInfo[playerid][HalfAdmin] >= 1 && PlayerInfo[playerid][HalfAdmin] <= 4)
		{
			format(string, sizeof(string), "P�-Admin [%d] %s - %s", PlayerInfo[playerid][HalfAdmin], GetNickEx(playerid), params);
		}
		else 
		{
			noAccessMessage(playerid);
			return 1;
		}
		SendAdminMessage(0xFFC0CB, string);
		SendDiscordMessage(DISCORD_ADMIN_CHAT, string);
		Log(chatLog, INFO, "%s admin chat: %s", GetPlayerLogName(playerid), params);

	}
	return 1;
}



