//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ dajrange ]-----------------------------------------------//
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

CMD:giverank(playerid, params[]) return cmd_dajrange(playerid, params);
CMD:dajrange(playerid, params[])
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new para1, level;
		if( sscanf(params, "k<fix>d", para1, level))
		{
			sendTipMessage(playerid, "U�yj /dajrange [playerid/Cz��Nicku] [Numer(0-9)]");
			return 1;
		}

		if(level > 9 || level < 0)
		{sendTipMessageEx(playerid, COLOR_GREY, "Numer rangi od 0 do 9!"); return 1; }
		if (PlayerInfo[playerid][pLider] >= 1 || PlayerInfo[playerid][pAdmin] >= 1000)
		{
		    if(IsPlayerConnected(para1))
		    {
		        if(para1 != INVALID_PLAYER_ID)
		        {
		            if(PlayerInfo[playerid][pLider] == PlayerInfo[para1][pMember] || PlayerInfo[playerid][pLider] == PlayerInfo[para1][pLider])
		            {
                        if(strlen(FracRang[GetPlayerFraction(playerid)][level]) < 1) return sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Ta ranga nie jest stworzona!");

						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						PlayerInfo[para1][pRank] = level;
						format(string, sizeof(string), "Lider %s zmieni� twoj� rang�", sendername);
						SendClientMessage(para1, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "Da�e� %s Rang� %d.", giveplayer,level);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        MruMySQL_SetAccInt("Rank", giveplayer, PlayerInfo[para1][pRank]);
					}
					else
					{
					    sendErrorMessage(playerid, "Ten gracz nie jest z twojej frakcji!");
					}
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}







