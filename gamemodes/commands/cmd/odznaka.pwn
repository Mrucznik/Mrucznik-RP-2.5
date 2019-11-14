//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ odznaka ]------------------------------------------------//
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

YCMD:odznaka(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		new giveplayerid;
		if(sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /odznaka [id gracza]");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid != INVALID_PLAYER_ID)
			{
				if (ProxDetectorS(5.0, playerid, giveplayerid) && Spectate[giveplayerid] == INVALID_PLAYER_ID)
				{
					new string[64], sendername[MAX_PLAYER_NAME], giveplayer[MAX_PLAYER_NAME];
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					if(GetPlayerFraction(playerid) == FRAC_LSPD)
					{
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "|______________ Odznaka LSPD _____________|");
						format(string, sizeof(string), "Numer odznaki: %d%d%d%d%d", PlayerInfo[playerid][pMember], PlayerInfo[playerid][pSex], PlayerInfo[playerid][pRank], PlayerInfo[playerid][pPnumber], PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imi� i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						if(PlayerInfo[playerid][pRank] < 2)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Wydzia�: Ruchu Drogowego");
						}
						else if(PlayerInfo[playerid][pRank] == 2 || PlayerInfo[playerid][pRank] == 3)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Wydzia�: Prewencyjny");
						}
						else if(PlayerInfo[playerid][pRank] >= 4)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Wydzia�: Kryminalny");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Brak wydzia�u");
						}
                        format(string, sizeof(string), "Ranga: %s", FracRang[FRAC_LSPD][PlayerInfo[playerid][pRank]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(OnDuty[playerid] == 0)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Nie");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Tak");
						}
						SendClientMessage(giveplayerid,COLOR_GRAD2,"Posiadacz tej odznaki ma uprawnienia do przeprowadzania");
						SendClientMessage(giveplayerid,COLOR_GRAD2,"kontroli os�b wzbudzaj�cych podejrzenia �amania prawa. Prezydent");
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "|_____ San Andreas Police Department _____|");
					}
					if(GetPlayerFraction(playerid) == FRAC_FBI)
					{
						SendClientMessage(giveplayerid, COLOR_FBI, "|______________ Odznaka FBI ______________|");
						format(string, sizeof(string), "Numer odznaki: %d%d%d%d%d", PlayerInfo[playerid][pMember], PlayerInfo[playerid][pSex], PlayerInfo[playerid][pRank], PlayerInfo[playerid][pPnumber], PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imi� i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						if(PlayerInfo[playerid][pRank] < 3)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Wydzia�: �ledczy");
						}
						else if(PlayerInfo[playerid][pRank] >= 9)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Wydzia�: Kierowniczy");
						}
						else if(PlayerInfo[playerid][pRank] >= 7)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Wydzia�: Wywiadowczy");
						}
						else if(PlayerInfo[playerid][pRank] >= 3)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Wydzia�: Walki z Przest�pczo�ci� Zorganizowan�");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Brak wydzia�u");
						}
                        format(string, sizeof(string), "Ranga: %s", FracRang[FRAC_FBI][PlayerInfo[playerid][pRank]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(OnDuty[playerid] == 0)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Nie");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Tak");
						}
						SendClientMessage(giveplayerid,COLOR_GRAD2,"Ta odznaka uprawnia do przej�cia dowodzenia nad");
						SendClientMessage(giveplayerid,COLOR_GRAD2,"wszytkimi jednostami s�u�b. porz. podczas akcji. Prezydent.");
						SendClientMessage(giveplayerid, COLOR_FBI, "|____ Federal Bureau of Investigation ____|");
					}
					if(GetPlayerFraction(playerid) == FRAC_NG)
					{
						SendClientMessage(giveplayerid, COLOR_GREEN, "|______________ Odznaka SASD ______________|");
						format(string, sizeof(string), "Numer odznaki: %d%d%d%d%d", PlayerInfo[playerid][pMember], PlayerInfo[playerid][pSex], PlayerInfo[playerid][pRank], PlayerInfo[playerid][pPnumber], PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imi� i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Ranga: %s", FracRang[FRAC_NG][PlayerInfo[playerid][pRank]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(OnDuty[playerid] == 0)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Nie");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_GREEN,"Mo�liwo�� interwencji: Tak");
						}
						SendClientMessage(giveplayerid,COLOR_GRAD2,"Posiadacz tej odznaki ma uprawnienia do wylegitymowania");
						SendClientMessage(giveplayerid,COLOR_GRAD2,"ka�dego obywatela na terenie stanu San Andreas.");
						SendClientMessage(giveplayerid, COLOR_BLUE, "|____ San Andreas State Police ____|");
					}
					if(GetPlayerFraction(playerid) == FRAC_ERS)
					{
						SendClientMessage(giveplayerid, COLOR_ALLDEPT, "|______________ Idetyfikator ERS ______________|");
						format(string, sizeof(string), "Numer identyfikatora: %d%d%d%d%d", PlayerInfo[playerid][pMember], PlayerInfo[playerid][pSex], PlayerInfo[playerid][pRank], PlayerInfo[playerid][pPnumber], PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imi� i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Ranga: %s", FracRang[FRAC_ERS][PlayerInfo[playerid][pRank]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(OnDuty[playerid] == 0)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Nie");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Tak");
						}
						SendClientMessage(giveplayerid,COLOR_GRAD2,"Identyfikator uprawnia do uczestniczenia w akcjach");
						SendClientMessage(giveplayerid,COLOR_GRAD2,"s�u�b. porz. oraz dow�dztwo w zakresie ochrony zdrowia");
						SendClientMessage(giveplayerid, COLOR_ALLDEPT, "|____ San Andreas Metropolitan Emergency Service ____|");
					}
					if (GetPlayerFraction(playerid) == FRAC_BOR)
					{
						SendClientMessage(giveplayerid, COLOR_PURPLE, "|______________ Odznaka USSS _____________|");
						format(string, sizeof(string), "Numer odznaki: %d%d%d%d%d", PlayerInfo[playerid][pMember], PlayerInfo[playerid][pSex], PlayerInfo[playerid][pRank], PlayerInfo[playerid][pPnumber], PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imi� i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Ranga: %s", FracRang[FRAC_BOR][PlayerInfo[playerid][pRank]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(OnDuty[playerid] == 0)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Nie");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Mo�liwo�� interwencji: Tak");
						}
						SendClientMessage(giveplayerid, COLOR_PURPLE, "|_____ United States Secret Service _____|");
					}
					if (GetPlayerOrg(playerid) == FAMILY_SAD)
					{
						SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, "|______________ Legitymacja SCoSA _____________|");
						format(string, sizeof(string), "Imi� i nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Ranga: %s", FamRang[FAMILY_SAD][PlayerInfo[playerid][pRank]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(PlayerInfo[playerid][pRank] > 3)
						{
							SendClientMessage(giveplayerid,COLOR_GREEN,"TA OSOBA POSIADA IMMUNITET!");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_RED,"TA OSOBA NIE POSIADA IMMUNITETU!");
						}
						SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, "|______________ Legitymacja SCoSA _____________|");
					}
					if (GetPlayerFraction(playerid) == FRAC_GOV)
					{
						SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, "|___________ Legitymacja Urz�du Miasta __________|");
						format(string, sizeof(string), "Imi� i nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Stopie�: %s", FamRang[FAMILY_SAD][PlayerInfo[playerid][pRank]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(PlayerInfo[playerid][pRank] > 7)
						{
							SendClientMessage(giveplayerid,COLOR_GREEN,"TA OSOBA POSIADA IMMUNITET!");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_RED,"TA OSOBA NIE POSIADA IMMUNITETU!");
						}
						SendClientMessage(giveplayerid, COLOR_LIGHTGREEN, "|_____________ Podpis: Burmistrz & Posiadacz __________|");
					}
					if (GetPlayerFraction(playerid) == FRAC_SN)
					{
						SendClientMessage(giveplayerid, COLOR_NEWS, "|______________ Identyfikator SAN _____________|");
						format(string, sizeof(string), "Numer identyfikatora: %d%d%d%d%d", PlayerInfo[playerid][pMember], PlayerInfo[playerid][pSex], PlayerInfo[playerid][pRank], PlayerInfo[playerid][pPnumber], PlayerInfo[playerid][pCrimes]);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "Imi� i Nazwisko: %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_WHITE, string);
                        format(string, sizeof(string), "Ranga: %s", FracRang[FRAC_SN][PlayerInfo[playerid][pRank]]);
						SendClientMessage(giveplayerid,COLOR_WHITE,string);
						if(OnDuty[playerid] == 0)
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Uprawnienia: Ograniczone");
						}
						else
						{
							SendClientMessage(giveplayerid,COLOR_WHITE,"Uprawnienia: Pe�ne");
						}
						SendClientMessage(giveplayerid,COLOR_GRAD2,"Identyfikator uprawnia do obserwacji wszytkich dzia�a�");
						SendClientMessage(giveplayerid,COLOR_GRAD2,"jedn. adm. pub. oraz otrzymywania informacji o tych dzia�aniach.");
						SendClientMessage(giveplayerid, COLOR_NEWS, "|_____ San Andreas Network _____|");
					}
					//
					format(string, sizeof(string), "* %s pokazuje dokumenty %s.", sendername ,giveplayer);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
				else
				{
					sendErrorMessage(playerid, "Gracz nie jest przed tob� !");
					return 1;
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Gracz jest OFFLINE!");
			return 1;
		}
	}
	return 1;
}
