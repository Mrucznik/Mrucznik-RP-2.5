//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ wezportfel ]----------------------------------------------//
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

CMD:wezportfel(playerid, params[])
{
	if(IsAMember(playerid))
	{
		if(PlayerInfo[playerid][pRank] < 3)
		{
			sendTipMessage(playerid, "Potrzebujesz rangi 3 lub wy�szej, �eby m�c zabiera� pieni�dze!");
			return 1;
		}
		new giveplayerid;
		if(sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /wezportfel [id/nick]");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid) && giveplayerid != INVALID_PLAYER_ID)
		{
			if(PlayerTied[giveplayerid] == 0)
			{
				sendTipMessage(playerid, "Ta osoba nie jest zwi�zana!");
				return 1;
			}
			if (ProxDetectorS(8.0, playerid, giveplayerid))
			{
				new car = GetPlayerVehicleID(playerid);
				new pieniadze;
				if(giveplayerid == playerid) { sendErrorMessage(playerid, "Nie mo�esz zwi�za� sam siebie!"); return 1; }
				if(IsPlayerInAnyVehicle(playerid) && (GetPlayerState(playerid) == 2 || GetPlayerState(playerid) == 3) && IsPlayerInVehicle(giveplayerid, car))
				{
					if(okradziony[giveplayerid] == 0)
					{
						if(kaska[giveplayerid] >= 1)
						{
							if(PlayerInfo[giveplayerid][pConnectTime] >= 2)
							{
								new string[128], giveplayer[MAX_PLAYER_NAME], sendername[MAX_PLAYER_NAME];
								GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								pieniadze = kaska[giveplayerid] / 4;
								if(pieniadze > 1000000)
								{
									pieniadze = 1000000;
								}
								
                                SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, sprintf("%s zabra� Ci portfel z $%d w �rodku", GetNick(playerid, true), pieniadze));
                                SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Zabra�e� portfel %s, w �rodku jest $%d", GetNick(giveplayerid, true), pieniadze));

								format(string, sizeof(string), "* %s zabiera portfel %s razem z %d$", sendername ,giveplayer, pieniadze);
								ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								PayLog(string);
								DajKase(playerid, pieniadze);
								DajKase(giveplayerid, -pieniadze);
								okradziony[giveplayerid] = 1;
								PoziomPoszukiwania[playerid] += 3;
								SetPlayerCriminal(playerid,INVALID_PLAYER_ID, "Porwanie + kradzie�");
							}
							else
							{
								sendErrorMessage(playerid, "Ten gracz za ma�o gra !");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Ten gracz nie ma nic przy sobie !");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Ta osoba nie ma portfela, ju� jej kto� zabra� !");
					}

				}
				else
				{
					sendErrorMessage(playerid, "Jeden z was nie jest w samochodzie !");
					return 1;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Ten gracz nie jest w pobli�u Ciebie !");
				return 1;
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
		sendErrorMessage(playerid, "Nie jeste� cz�onkiem / liderem rodziny !");
	}
	return 1;
}

