//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ poddajsie ]-----------------------------------------------//
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

CMD:poddajsie(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pJob] == 1)
	 	{
	 	    new playa;
			if( sscanf(params, "k<fix>", playa))
			{
				sendTipMessage(playerid, "U�yj /poddajsie [Nick/ID]");
				SendClientMessage(playerid, COLOR_GRAD3, "INFORMACJA: ta komenda proponuje poddanie si� przest�pcy");
				return 1;
			}


			if(IsPlayerConnected(playa))
		    {
   				if(playa != INVALID_PLAYER_ID)
			    {
				    if(GetDistanceBetweenPlayers(playerid,playa) < 10)
					{
					    if(PoziomPoszukiwania[playa] >= 2)
					    {
					        if(playa != playerid)
					        {
					            if(lowcaz[playerid] == playa)
					            {
									//ShowPlayerDialogEx(playerid, 113, DIALOG_STYLE_MSGBOX, "St�j w imieniu prawa!", "Lorem ipsum", "Poddaj si�", "Uciekaj");
							        GetPlayerName(playerid, sendername, sizeof(sendername));
				        			GetPlayerName(playa, giveplayer, sizeof(giveplayer));
							        format(string, sizeof(string), "* �owca Nagr�d %s proponuje ci poddanie si� i trafienie do wi�zienia z ma�� kar�, aby si� zgodzi� wpisz /poddajesie",sendername);
							        SendClientMessage(playa, COLOR_LIGHTBLUE, string);
							        format(string, sizeof(string), "* Zaproponowa�e� %s poddanie si�, je�li zostanie ono akceptowane zarobisz %d$",giveplayer, PoziomPoszukiwania[playa]*2500);
							        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							        poddaje[playa] = 1;
									lowcap[playa] = playerid;
								}
								else
								{
								    sendErrorMessage(playerid, "Nie masz zlecenia na tego gracza");
								}
							}
							else
							{
								sendErrorMessage(playerid, "Nie mo�esz si� podda� samemu sobie");
                			}
					    }
					    else
					    {
					    	sendErrorMessage(playerid, "Ten gracz nie ma WL");
                		}
					}
					else
				    {
				    	sendErrorMessage(playerid, "Ten gracz jest za daleko");
               		}
				}
				else
				{
                    sendErrorMessage(playerid, "Taki gracz nie istnieje");
                }
			}
		}
		else
	   	{
	   		sendErrorMessage(playerid, "Nie jeste� �owc� nagr�d");
		}
	}
	return 1;
}


