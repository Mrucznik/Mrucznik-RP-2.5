//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ startujlekcje ]---------------------------------------------//
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

CMD:startlesson(playerid, params[]) return cmd_startujlekcje(playerid, params);
CMD:zacznijlekcje(playerid, params[]) return cmd_startujlekcje(playerid, params);
CMD:startlekcja(playerid, params[]) return cmd_startujlekcje(playerid, params);
CMD:startegzamin(playerid, params[]) return cmd_startujlekcje(playerid, params);
CMD:startujlekcje(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsAnInstructor(playerid))
        {
            new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
			    sendTipMessage(playerid, "U�yj /startlekcja [playerid/Cz��Nicku]");
			    return 1;
			}

			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(kaska[playerid] >= 3000)
			        {
				        if(PlayerInfo[giveplayerid][pCarLic] == 2)
				        {
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* Zacz��e� egzamin z %s.",giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Urz�dnik %s zacz�� z tob� egzamin.",sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        TakingLesson[giveplayerid] = 1;
					        DajKase(playerid, -12500);
                            Sejf_Add(FRAC_GOV, 12500);
				        }
				        else
						{
						    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie zaliczy� jeszcze testu teoretycznego!");
						    return 1;
						}
					}
					else
					{
						sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie ma tyle kasy!");
	    				return 1;
					}
			    }
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Nie ma takiego gracza !");
			    return 1;
			}
        }
        else
        {
            sendErrorMessage(playerid, "Nie jeste� urz�dnikiem !");
            return 1;
        }
    }
    return 1;
}

