//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ oczyscmdc ]-----------------------------------------------//
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

YCMD:oczyscmdc(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pJob] == 2)
	 	{
	    	new playa;
			if( sscanf(params, "k<fix>", playa))
			{
				sendTipMessage(playerid, "U�yj /oczyscmdc [Nick/ID] (koszt -300$)");
				SendClientMessage(playerid, COLOR_GRAD3, "INFORMACJA: ta komenda czysci kartoteki policyjne gracza (koszt -300$)");
				return 1;
			}


			if(IsPlayerConnected(playa))
		    {
   				if(playa != INVALID_PLAYER_ID)
			    {
				    if(GetDistanceBetweenPlayers(playerid,playa) < 10)
					{
					    if(kaska[playerid] > 300)
						{
		        			GetPlayerName(playerid, sendername, sizeof(sendername));
		        			GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		        			format(string, sizeof(string), "* Oczy�ci�e� kartoteki gracza %s (-300$)",giveplayer);
						    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Prawnik %s oczy�ci� kartoteki Policji na tw�j temat",sendername);
					        SendClientMessage(playa, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string),"* %s wykonuje par� telefon�w i oczyszcza kartoteki %s.", sendername, giveplayer);
							ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                            ZabierzKase(playerid, 300);
                            format(string, sizeof(string), "~r~-$%d", 300);
							GameTextForPlayer(playerid, string, 5000, 1);
                    		PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
                    		ClearCrime(playa);
						}
						else
						{
						    sendErrorMessage(playerid, "Nie masz wystarczaj�cej ilo�ci pieni�dzy ($300).");
						}
                    }
					else
					{
					    sendErrorMessage(playerid, "Gracz jest za daleko.");
					}
				}
				else
				{
				    sendErrorMessage(playerid, "Nie ma takiego gracza.");
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� prawnikiem.");
		}
	}
	return 1;
}
