//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ awans ]-------------------------------------------------//
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

CMD:awans(playerid, params[])
{
	new para1;
	if(sscanf(params, "k<fix>", para1))
	{
		sendTipMessage(playerid, "U�yj /awans [playerid/Cz��Nicku]");
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
                    new rang = PlayerInfo[para1][pRank];
                    if(rang == 9) return 1;
                    if(strlen(FracRang[GetPlayerFraction(playerid)][rang+1]) < 1) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ta ranga nie jest stworzona!");

					PlayerInfo[para1][pRank] += 1;
					new level = PlayerInfo[para1][pRank];

                    SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Awansowa�e� %s na rang� %s", GetNick(para1, true), FracRang[GetPlayerFraction(para1)][level]));
                    if(playerid != para1)
                        SendClientMessage(para1, COLOR_LIGHTBLUE, sprintf("Gratulacje! Otrzyma�e� awans na rang� %s od %s", FracRang[GetPlayerFraction(para1)][level],  GetNick(playerid, true)));

                    MruMySQL_SetAccInt("Rank", GetNick(para1), PlayerInfo[para1][pRank]);
				}
				else
				{
					sendErrorMessage(playerid, "Ten gracz nie jest w twojej frakcji!");
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie ma takiego gracza!");
		}
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}

