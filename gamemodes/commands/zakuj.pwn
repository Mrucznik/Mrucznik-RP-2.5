//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ zakuj ]-------------------------------------------------//
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

CMD:cuff(playerid, params[]) return cmd_zakuj(playerid, params);
CMD:skuj(playerid, params[]) return cmd_zakuj(playerid, params);
CMD:zakuj(playerid, params[])
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(gTeam[playerid] == 2 || IsACop(playerid) || IsABOR(playerid))
		{
		    new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "U�yj /skuj [playerid/Cz��Nicku]");
				return 1;
			}

		    if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(gTeam[giveplayerid] == 2 || IsACop(giveplayerid))
			        {
			            sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz sku� policjanta !");
				        return 1;
			        }
				    if(PlayerCuffed[giveplayerid] > 0)
				    {
				        sendTipMessageEx(playerid, COLOR_GREY, "Gracz jest ju� skuty !");
				        return 1;
				    }
					if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    new car = GetPlayerVehicleID(playerid);
					    if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz sku� samego siebie!"); return 1; }
					    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == 2 && IsPlayerInVehicle(giveplayerid, car))
					    {
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
					        format(string, sizeof(string), "* Zosta�e� skuty przez %s, nie mo�esz si� rusza�.", sendername);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Sku�e� %s, nie mo�e si� teraz rusza�.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s Zakuwa r�ce %s, aby nigdzie nie uciek�.", sendername ,giveplayer);
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							GameTextForPlayer(giveplayerid, "~r~Skuty", 2500, 3);
							TogglePlayerControllable(giveplayerid, 0);
							PlayerCuffed[giveplayerid] = 2;
							PlayerCuffedTime[giveplayerid] = 180;
					    }
					    else
					    {
					        sendTipMessageEx(playerid, COLOR_GREY, "Gracz nie jest w twoim poje�dzie lub nie jeste� kierowc� !");
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
		else
		{
			SendClientMessage(playerid, COLOR_GREY, "Nie jeste� z Policji / FBI / SASD !");
		}
	}
	return 1;
}

