//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ degraduj ]-----------------------------------------------//
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

CMD:degraduj(playerid, params[])
{
	new para1;
	if(sscanf(params, "k<fix>", para1))
	{
		sendTipMessage(playerid, "U�yj /degraduj [playerid/Cz��Nicku]");
		return 1;
	}
	if (PlayerInfo[playerid][pLider] >= 1)
	{
		if(IsPlayerConnected(para1))
		{
			if(para1 != INVALID_PLAYER_ID)
			{
				if(PlayerInfo[playerid][pLider] == PlayerInfo[para1][pMember] || PlayerInfo[playerid][pLider] == PlayerInfo[para1][pLider])
				{
					if(PlayerInfo[para1][pRank] == 0)
					{
                        if(PlayerInfo[para1][pLider] != 0) return sendErrorMessage(playerid, "Nie mo�esz wyrzuci� lidera.");

                        SendClientMessage(para1, COLOR_RED, sprintf("%s zdegradowa� Ci�. Masz ju� rang� 0 - zostajesz zwolniony z frakcji", GetNick(playerid, true)));

                        new str[32];
                        valstr(str, para1);
                        cmd_zwolnij(playerid, str);
					}
					else
					{
						PlayerInfo[para1][pRank] -= 1;
						new level = PlayerInfo[para1][pRank];

                        SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Zdegradowa�e� %s na rang� %s", GetNick(para1, true), FracRang[GetPlayerFraction(para1)][level]));
                        if(playerid != para1)
                            SendClientMessage(para1, COLOR_LIGHTBLUE, sprintf("Zosta�e� zdegradowany na rang� %s przez %s", FracRang[GetPlayerFraction(para1)][level],  GetNick(playerid, true)));

                        MruMySQL_SetAccInt("Rank", GetNick(para1), PlayerInfo[para1][pRank]);
					}
				}
				else
				{
					sendErrorMessage(playerid, "Ten gracz nie jest w twojej frakcji!");
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



