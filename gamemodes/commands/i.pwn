//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ i ]---------------------------------------------------//
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

CMD:i(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(PlayersChannel[playerid] == 999)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� na kanale IRC !");
            return 1;
        }
        if(PlayerInfo[playerid][pMuted] == 1)
		{
			sendTipMessageEx(playerid, TEAM_CYAN_COLOR, "Nie mo�esz m�wi�, jeste� uciszony");
			return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj /i [irc chat]");
			return 1;
		}
		format(string, sizeof(string), "** IRC %s: %s. **", sendername, params);
		SendIRCMessage(PlayersChannel[playerid], COLOR_YELLOW2, string);
    }
    return 1;
}


