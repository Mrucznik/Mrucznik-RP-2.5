//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zabierz ]------------------------------------------------//
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

CMD:take(playerid, params[]) return cmd_zabierz(playerid, params);
CMD:zabierz(playerid, params[])
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(gTeam[playerid] == 2 || IsACop(playerid))
        {
            if(PlayerInfo[playerid][pRank] < 1)
            {
                SendClientMessage(playerid, COLOR_GREY, "Potrzebujesz 1 rangi aby zabiera� przedmioty!");
                return 1;
            }
            new x_nr[16];
			new giveplayerid;
            if(gettime() < GetPVarInt(playerid, "lic-timer")) return sendTipMessage(playerid, "Licencje oraz rzeczy mo�esz zabiera� co 30 sekund!");
			if( sscanf(params, "s[16] d", x_nr, giveplayerid))
			{
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Zabieranie rzeczy __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "U�YJ: /zabierz [nazwa] [playerid/Cz��Nicku]");
		  		SendClientMessage(playerid, COLOR_GREY, "Dost�pne nazwy: Prawojazdy, LicencjaLot, LicencjaLodz, LicencjaBron, Bron, Dragi, Mats");
				SendClientMessage(playerid, COLOR_WHITE, "|_______________________________________________________|");
				return 1;
			}
		    if(strcmp(x_nr,"prawojazdy",true) == 0)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* Zabra�e� %s prawo jazdy.", giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� Ci prawo jazdy.", sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� %s prawo jazdy.", sendername, giveplayer);
					        printf(string);
					        PlayerInfo[giveplayerid][pCarLic] = 0;
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
			else if(strcmp(x_nr,"licencjalot",true) == 0)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* Zabra�e� %s Licencje na latanie.", giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� Ci licencj� na latanie.", sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� %s licencj� na latanie.", sendername, giveplayer);
					        printf(string);
					        PlayerInfo[giveplayerid][pFlyLic] = 0;
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
			else if(strcmp(x_nr,"licencjabron",true) == 0)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* Zabra�e� %s Licencj� na Bro�.", giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� Ci licencj� na bro�.", sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� %s licencj� na bro�.", sendername, giveplayer);
					        printf(string);
					        PlayerInfo[giveplayerid][pGunLic] = 0;
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
			else if(strcmp(x_nr,"licencjalodz",true) == 0)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* Zabra�e� %s Licencje na p�ywanie �odziami.", giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� Ci twoj� licencj� na p�ywanie �odziami.", sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� %s licencj� na lodz.", sendername, giveplayer);
					        printf(string);
					        PlayerInfo[giveplayerid][pBoatLic] = 0;
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
			else if(strcmp(x_nr,"bron",true) == 0)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* Zabra�e� %s Bronie.", giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� twoj� bro�.", sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� %s bro�.", sendername, giveplayer);
					        printf(string);
					        ResetPlayerWeapons(giveplayerid);
					        UsunBron(giveplayerid);
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
			else if(strcmp(x_nr,"dragi",true) == 0)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						    format(string, sizeof(string), "* Zabra�e� %s dragi.", giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� twoje narkotyki.", sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� %s dragi %d.", sendername, giveplayer, PlayerInfo[giveplayerid][pDrugs]);
					        printf(string);
					        PlayerInfo[giveplayerid][pDrugs] = 0;
						}
				        else
						{
						    sendTipMessageEx(playerid, COLOR_GREY, "   Ten gracz nie jest przy tobie !");
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
			else if(strcmp(x_nr,"mats",true) == 0)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    GetPlayerName(playerid, sendername, sizeof(sendername));
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						    format(string, sizeof(string), "* Zabra�e� %s Materia�y.", giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� twoje Materia�y.", sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Oficer %s zabra� %s matsy %d.", sendername, giveplayer, PlayerInfo[giveplayerid][pMats]);
					        printf(string);
					        PlayerInfo[giveplayerid][pMats] = 0;
						}
				        else
						{
						    sendTipMessageEx(playerid, COLOR_GREY, "   Ten gracz nie jest przy tobie !");
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
			else
			{
				sendTipMessageEx(playerid, COLOR_GREY, "Z�a nazwa");
				return 1;
			}
        }
        else
        {
            sendErrorMessage(playerid, "Nie jeste� policjantem !");
            return 1;
        }
    }
    SetPVarInt(playerid, "lic-timer", gettime() + 30);
    return 1;
}


