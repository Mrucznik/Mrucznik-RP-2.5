//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kajdanki ]-----------------------------------------------//
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

CMD:kajdanki(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(IsACop(playerid) || (IsABOR(playerid) && PlayerInfo[playerid][pRank] >= 2))
		{
			if(uzytekajdanki[playerid] != 1)
			{
				new giveplayerid;
				if(sscanf(params, "k<fix>", giveplayerid))
				{
					sendTipMessage(playerid, "U�yj /kajdanki [id gracza]");
					return 1;
				}
                if(IsACop(playerid))
                {
                    if(OnDuty[playerid] == 0)
					{
						sendErrorMessage(playerid,"Nie jeste� na s�u�bie!");
						return 1;
					}
                }
				if(IsPlayerConnected(giveplayerid))
				{
					if(giveplayerid != INVALID_PLAYER_ID)
					{
						if(GetDistanceBetweenPlayers(playerid,giveplayerid) < 5)
						{
							if(GetPlayerState(playerid) == 1 && GetPlayerState(giveplayerid) == 1)
							{
								if(zakuty[giveplayerid] == 0)
								{
									if(uzytekajdanki[giveplayerid] == 0)
									{
										if(GUIExit[playerid] == 0 && GUIExit[giveplayerid] == 0)
										{
											new string[128];
											if(IsACop(giveplayerid) && OnDuty[giveplayerid] == 1)
											{
												sendErrorMessage(playerid, "Nie mo�esz sku� policjanta na s�u�bie!");
												return 1;
											}
											if(PoziomPoszukiwania[giveplayerid] == 0)
											{
												sendTipMessage(playerid,"Chyba nie chcesz aresztowa� niewinnego cz�owieka?");
												return 1;
											}
											if(PlayerInfo[giveplayerid][pBW] >= 1)
											{
												//Wiadomo�ci
												format(string, sizeof(string), "* %s docisn�� do ziemi nieprzytomnego %s i sku� go.", GetNick(playerid, true), GetNick(giveplayerid, true));
												ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
												format(string, sizeof(string), "Dzi�ki szybkiej interwencji uda�o Ci si� sku� %s.", GetNick(giveplayerid, true));
												SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
												sendTipMessageEx(giveplayerid, COLOR_BLUE, "Jeste� nieprzytomny - policjant sku� ci� bez wi�kszego wysi�ku.");
												
												
												//czynno�ci
												PlayerInfo[giveplayerid][pBW] = 0;
												zakuty[giveplayerid] = 1;
												TogglePlayerControllable(giveplayerid, 0);
												uzytekajdanki[playerid] = 1;
												SkutyGracz[playerid] = giveplayerid;
												ClearAnimations(giveplayerid);
												SetPlayerSpecialAction(giveplayerid, SPECIAL_ACTION_CUFFED);
												SetPlayerAttachedObject(giveplayerid, 0, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977,-81.700035, 0.891999, 1.000000, 1.168000);
												SetTimerEx("UzyteKajdany",30000,0,"d",giveplayerid);
												return 1;
											}
											if(PlayerInfo[giveplayerid][pBW] == 0)
											{
												format(string, sizeof(string), "* %s wyci�ga kajdanki i pr�buje je za�o�y� %s.", GetNick(playerid, true),GetNick(giveplayerid, true));
												ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
												ShowPlayerDialogEx(giveplayerid, 98, DIALOG_STYLE_MSGBOX, "Aresztowanie", "Policjant chce za�o�y� ci kajdanki, je�li osacza ci� niedu�a liczba policjant�w mo�esz spr�bowa� si� wyrwa�\nJednak pami�taj je�li si� wyrwiesz i jeste� uzbrojony policjant ma prawo ci� zabi�. \nMo�esz tak�e dobrowolnie podda� si� policjantom.", "Poddaj si�", "Wyrwij si�");
												PDkuje[giveplayerid] = playerid;
												uzytekajdanki[giveplayerid] = 1;
												SetTimerEx("UzyteKajdany",30000,0,"d",giveplayerid);
											}
										}
									}
									else
									{
										sendErrorMessage(playerid, "Odczekaj 30 sekund zanim znowu za�o�ysz kajdanki temu graczowi!");
									}
								}
								else
								{
									sendErrorMessage(playerid, "Ten gracz ma ju� za�o�one kajdanki!");
								}
							}
							else
							{
								sendErrorMessage(playerid, "Nikt z was nie mo�e by� si� w wozie!");
							}
						}
						else
						{
							sendErrorMessage(playerid, "Jeste� za daleko od gracza !");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Nie ma takiego gracza !");
					}
				}
			}
			else
			{
				sendErrorMessage(playerid, "Ju� u�ywasz swoje kajdanki !");
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� policjantem lub USSS z rang� 2[+]");
		}
	}
	return 1;
}
*/
