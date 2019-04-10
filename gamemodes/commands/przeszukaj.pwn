//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ przeszukaj ]----------------------------------------------//
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

CMD:frisk(playerid, params[]) return cmd_przeszukaj(playerid, params);
CMD:przeszukaj(playerid, params[])
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /przeszukaj [playerid/Cz��Nicku]");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid != INVALID_PLAYER_ID)
			{
			    if (ProxDetectorS(8.0, playerid, giveplayerid) && Spectate[giveplayerid] == INVALID_PLAYER_ID)
				{
				    if(!IsPlayerInAnyVehicle(playerid) && !IsPlayerInAnyVehicle(giveplayerid))
				    {
					    if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz przeszuka� samego siebie!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    new text1[20], text2[20], text3[20], text4[20], text5[20];
					    if(PlayerInfo[giveplayerid][pDrugs] > 0) { text1 = "| Narkotyki."; } else { text1 = "| Pusta kiesze�."; }
					    if(PlayerInfo[giveplayerid][pMats] > 0) { text2 = "| Materia�y."; } else { text2 = "| Pusta kiesze�."; }
					    if(Fishes[giveplayerid][pWeight1] > 0 || Fishes[giveplayerid][pWeight2] > 0 || Fishes[giveplayerid][pWeight3] > 0 || Fishes[giveplayerid][pWeight4] > 0 || Fishes[giveplayerid][pWeight5] > 0) { text3 = "| Fishes."; } else { text3 = "| Empty Pocket."; }
					    if(PlayerInfo[giveplayerid][pPhoneBook] > 0) { text4 = "| Ksi��ka tel."; } else { text4 = "| Pusta kiesze�."; }
					    if(PlayerInfo[giveplayerid][pCDPlayer] > 0) { text5 = "| MP3."; } else { text5 = "| Pusta kiesze�."; }
					    format(string, sizeof(string), "|__________ Wynik przeszukania %s __________|", giveplayer);
				        SendClientMessage(playerid, COLOR_WHITE, string);
				        format(string, sizeof(string), "%s.", text1);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text2);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text3);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text4);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text5);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "* %s przeszuka� %s w poszukiwaniu nielegalnych rzeczy.", sendername ,giveplayer);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz by� w poje�dzie !");
				    	return 1;
					}
				}
				else
				{
				    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
				    return 1;
				}
			}
		}
        else
        {
            sendErrorMessage(playerid, "Nie ma takiego gracza !");
            return 1;
        }
	}
    return 1;
}



