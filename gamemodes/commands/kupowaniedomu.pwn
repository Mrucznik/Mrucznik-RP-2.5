//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ kupowaniedomu ]---------------------------------------------//
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

CMD:kupdom(playerid) return cmd_kupowaniedomu(playerid);
CMD:buyhouse(playerid) return cmd_kupowaniedomu(playerid);
CMD:kupowaniedomu(playerid)
{
	new string[128];

    if(gPlayerLogged[playerid] == 1)
    {
		if(GetPlayerAdminDutyStatus(playerid) == 0)
		{
			if(PlayerInfo[playerid][pDom] == 0)
			{
				if(PlayerInfo[playerid][pWynajem] == 0)
				{
					for(new i; i<=dini_Int("Domy/NRD.ini", "NrDomow"); i++)
					{
						if(IsPlayerInRangeOfPoint(playerid, 5.0, Dom[i][hWej_X], Dom[i][hWej_Y], Dom[i][hWej_Z]))
						{
							if(Dom[i][hKupiony] == 0)
							{
								if(GUIExit[playerid] == 0)
								{
									/*new doplata = Dom[i][hOplata];
									new interior = IntInfo[Dom[i][hDomNr]][Cena];
									new mnoznik;
									new pZone[MAX_ZONE_NAME];
									GetPlayer2DZone(playerid, pZone, MAX_ZONE_NAME);
									//
									mnoznik = Mnoznik(pZone);
									new cenadomu = ((interior*mnoznik)/10)+doplata;//cena domu*/
									if(PlayerInfo[playerid][pLevel] < 3)
									{
										sendTipMessage(playerid, "Aby kupi� dom musisz mie� powy�ej 3 lvl");
										return 1;
									}
									new cenadomu = Dom[i][hCena];
									if(cenadomu < kaska[playerid] || cenadomu < PlayerInfo[playerid][pAccount])
									{
										IDDomu[playerid] = i;
										format(string, sizeof(string), "Czy na pewno chcesz kupi� ten dom za %d$?\nAby kupi� wci�nij 'Tak', aby anulowa� naci�nij 'Nie'", cenadomu);
										ShowPlayerDialogEx(playerid, 85, DIALOG_STYLE_MSGBOX, "Kupowanie domu - pytanie", string, "Tak", "Nie");
									}
									else
									{
										format(string, sizeof(string), "Nie sta� ci� na zakup tego domu, potrzebujesz %d", cenadomu);
										sendErrorMessage(playerid, string);
									}
								}
							}
							else
							{
								sendErrorMessage(playerid, "Ten dom ju� jest kupiony");
							}
						}
					}
				}
				else
				{
					sendTipMessage(playerid, "Aby kupi� dom nie mo�esz wynajmowa� domu. Wpisz /unrent.");
				}
			}
			else
			{
				sendTipMessage(playerid, "Posiadasz ju� 1 dom, nie mo�esz kupi� drugiego.");
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie mo�esz kupi� domu podczas s�u�by administratora!"); 
		}
  	}
	return 1;
}



