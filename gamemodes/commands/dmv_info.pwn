//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ dmv_info ]-----------------------------------------------//
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

CMD:dmv(playerid, params[]) return cmd_dmv_info(playerid, params);
CMD:dmv_info(playerid, params[])
{
	new string[256];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(!IsAUrzednik(playerid))
		{
 			sendErrorMessage(playerid, "Nie jeste� urz�dnikiem!");
		    return 1;
		}
		if(PlayerInfo[playerid][pRank] < 2)
		{
		    sendErrorMessage(playerid, "Musisz mie� 2 range aby tego u�ywa�!");
		    return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj (/dmv)-info [tekst]");
			return 1;
		}
		if(PlayerInfo[playerid][pBP] >= 1)
		{
		    format(string, sizeof(string), "Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
			sendTipMessage(playerid, string, TEAM_CYAN_COLOR);
			return 1;
		}
		SendClientMessageToAll(COLOR_WHITE, "|___________ Wiadomo�� Rz�dowa ___________|");
		format(string, sizeof(string), "Urz�dnik %s: %s", sendername, params);
		SendClientMessageToAll(COLOR_YELLOW, string);
	}
	return 1;
}
