//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ dpa ]--------------------------------------------------//
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

CMD:dpa(playerid, params[])
{
	new para1;
	if(sscanf(params, "k<fix>", para1))
	{
		sendTipMessage(playerid, "U�yj /dpa [playerid/Cz��Nicku]");
		return 1;
	}
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(IsPlayerConnected(para1))
		{
			if(para1 != INVALID_PLAYER_ID)
			{
				if(PlayerInfo[para1][pNewAP] >= 1 && PlayerInfo[para1][pNewAP] <= 3)
				{
					new string[128], sendername[MAX_PLAYER_NAME], giveplayer[MAX_PLAYER_NAME];
					PlayerInfo[para1][pNewAP] -= 1;
					new level = PlayerInfo[para1][pNewAP];
					GetPlayerName(para1, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "   Zosta�e� zdegradowany przez admina %s, masz teraz %d rang� p�admina", sendername, level);
					SendClientMessage(para1, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "   Zdegradowa�e� gracza %s, ma teraz %d rang� p�admina.", giveplayer, level);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				}
				else
				{
					sendErrorMessage(playerid, "Ten gracz nie jest p�adminem!");
				}
			}
		}
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}
