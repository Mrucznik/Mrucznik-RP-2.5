//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ ip ]--------------------------------------------------//
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

CMD:ip(playerid, params[])
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];

	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /ip [playerid]");
			sendTipMessage(playerid, "FUNKCJA: Pokazuje IP wybranego gracza.");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
			if(IsAFakeKonto(giveplayerid))
			{
				format(string, sizeof(string), "-| %s IP: 62.87.184.91 |-", GetNick(giveplayerid));
				SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
				return 1;
			}
			new ip[32];
			GetPlayerIp(giveplayerid,ip,32);
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "-| %s IP: %s |-", giveplayer,ip);
			SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
            format(string, sizeof(string), "CMD_Info: %s uzyl /ip na %s", GetNick(playerid), GetNick(giveplayerid));
            CMDLog(string);
		}
		else
		{
			format(string, sizeof(string), "Nie znaleziono gracza o nicku/id %s", params);
			sendErrorMessage(playerid, string);
		}
	}
	else
	{
		noAccessMessage(playerid);
  	}
	return 1;
}

