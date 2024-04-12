//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   trasa                                                   //
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
// Autor: mrucznik
// Data utworzenia: 06.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_trasa_Impl(playerid)
{
	new Veh = GetPlayerVehicleID(playerid);
	if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10 || GetPlayerJob(playerid) == JOB_DRIVER)
	{
		if(IsPlayerConnected(playerid))
		{
			if(IsAPublicTransport(Veh))
			{
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 - niebieska(230$/p , 9min, 21p, +2)\nLinia 72 - pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
			}
			else
			{
				sendTipMessage(playerid, "Nie jeste� w autobusie!");
			}
			return 1;
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� z Korporacji Transportowej!");
	}
    return 1;
}

command_trasa_dialog(playerid, dialogid, response, listitem, inputtext[])
{
	#pragma unused inputtext

	if(dialogid == 8155)//SYstem autobus�w - tablice
	{
		if(response == 1)
		{
			switch(listitem)
			{
				case 0:
				{
					if(PlayerInfo[playerid][pNatrasiejest] == 0)
					{
						if( (GetPlayerJob(playerid) == JOB_DRIVER && PlayerInfo[playerid][pCarSkill] >= 50) || PlayerInfo[playerid][pMember] == 10 ||PlayerInfo[playerid][pLider] == 10)
						{
							PlayerInfo[playerid][pLinia55]=1;
							SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczon� tras�. Pod��aj za sygna�em GPS.");
							SetPlayerCheckpoint(playerid, 2215.8428,-1436.8223,23.4033, 4); // Ustawiamy pocz�tkowy CP
							CP[playerid] = 551; //Przypisek CP do dalszych
							PlayerInfo[playerid][pNatrasiejest] = 1; //Kierowca jest w trasie
							Przystanek(playerid, COLOR_BLUE, "Linia nr. 55\n{808080}Dojazd do trasy.\nWszytkie przystanki NA ��DANIE (N/�)");
							SetTimerEx("AntyBusCzit", 60000*6, 0, "d", playerid);
							BusCzit[playerid] = 1;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 2skill aby rozpocz�� t� tras�");
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, " Jeste� ju� w trasie !");
					}
				}
				case 1:
				{
					if(PlayerInfo[playerid][pNatrasiejest] == 0)
					{
							PlayerInfo[playerid][pLinia72]= 1;
							SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczon� tras�. Pod��aj za sygna�em GPS.");
							SetPlayerCheckpoint(playerid, 2818.4243,-1576.9399,10.9287, 4);
							CP[playerid] = 721;
							PlayerInfo[playerid][pNatrasiejest] = 1;
							Przystanek(playerid, COLOR_NEWS, "Linia nr. 72 (dojazd)\n{808080}Kierunek: BAZA MECHANIK�W (p�tla) \nWszytkie przystanki NA ��DANIE (N/�)");
							SetTimerEx("AntyBusCzit", 60000*5, 0, "d", playerid);
							BusCzit[playerid] = 1;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, " Jeste� ju� w trasie !");
					}
				}
				case 2:
				{
					if(PlayerInfo[playerid][pNatrasiejest] == 0)
					{
						if( (GetPlayerJob(playerid) == JOB_DRIVER && PlayerInfo[playerid][pCarSkill] >= 200) || PlayerInfo[playerid][pMember] == 10 ||PlayerInfo[playerid][pLider] == 10)
						{
							PlayerInfo[playerid][pLinia96]= 1;
							SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczon� tras�. Pod��aj za sygna�em GPS");
							SetPlayerCheckpoint(playerid, 2687.6597,-2406.9775,13.6017, 4);
							CP[playerid] = 961;
							PlayerInfo[playerid][pNatrasiejest] = 1;
							Przystanek(playerid, COLOR_GREEN, "Linia nr. 96\n{808080}Dojazd do trasy.\nWszytkie przystanki NA ��DANIE (N/�)");
							SetTimerEx("AntyBusCzit", 60000*6, 0, "d", playerid);
							BusCzit[playerid] = 1;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 4skill aby rozpocz�� t� tras�");
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, " Jeste� ju� w trasie !");
					}
				}
				case 3:
				{
					if(PlayerInfo[playerid][pNatrasiejest] == 0)
					{
						if( (GetPlayerJob(playerid) == JOB_DRIVER && PlayerInfo[playerid][pCarSkill] >= 400) || PlayerInfo[playerid][pMember] == 10 ||PlayerInfo[playerid][pLider] == 10)
						{
							PlayerInfo[playerid][pLinia82]= 1;
							SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczon� tras�. Pod��aj za sygna�em GPS");
							SetPlayerCheckpoint(playerid, 1173.1520,-1825.2843,13.1789, 4);
							CP[playerid] = 821;
							PlayerInfo[playerid][pNatrasiejest] = 1;
							Przystanek(playerid,COLOR_YELLOW, "Linia nr. 82\n{808080}Dojazd do trasy.\nWszytkie przystanki NA ��DANIE (N/�)");
							SetTimerEx("AntyBusCzit", 60000*8, 0, "d", playerid);
							BusCzit[playerid] = 1;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 5skill aby rozpocz�� t� tras�");
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, " Jeste� ju� w trasie !");
					}
				}
				case 4:
				{
					if(PlayerInfo[playerid][pNatrasiejest] == 0)
					{
						if( (GetPlayerJob(playerid) == JOB_DRIVER && PlayerInfo[playerid][pCarSkill] >= 100) || PlayerInfo[playerid][pMember] == 10 ||PlayerInfo[playerid][pLider] == 10)
						{
							PlayerInfo[playerid][pLinia85]= 1;
							SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz wyznaczon� tras�. Pod��aj za sygna�em GPS");
							SetPlayerCheckpoint(playerid, 2119.7363,-1896.8149,13.1345, 4);
							CP[playerid] = 501;
							PlayerInfo[playerid][pNatrasiejest] = 1;
							Przystanek(playerid, COLOR_GREEN, "Linia nr. 85\n{808080}Dojazd do trasy.\nWszytkie przystanki NA ��DANIE (N/�)");
							SetTimerEx("AntyBusCzit", 60000*6, 0, "d", playerid);
							BusCzit[playerid] = 1;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 3skill aby rozpocz�� t� tras�");
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, " Jeste� ju� w trasie !");
					}
				}
				case 5:
				{
					if(PlayerInfo[playerid][pNatrasiejest] == 0)
					{
						if( (GetPlayerJob(playerid) == JOB_DRIVER && PlayerInfo[playerid][pCarSkill] >= 400) || PlayerInfo[playerid][pMember] == 10 && PlayerInfo[playerid][pRank] >= 4 ||PlayerInfo[playerid][pLider] == 10)
						{
							Przystanek(playerid, COLOR_BLUE, "Wycieczka\nKoszt: 7500$\n Wi�cej informacji u kierowcy.");
							/*BusDrivers += 1; TransportDuty[playerid] = 2; TransportValue[playerid]= 15000;
							GetPlayerName(playerid,sendername,sizeof(sendername));
							format(string, sizeof(string), "Przewodnik %s zaprasza wszytkich na wycieczk� autobusow�, koszt: $15000", sendername, TransportValue[playerid]);
							OOCNews(TEAM_GROVE_COLOR,string);*/
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, " Potrzebujesz 5skill lub 4 rangi aby organizowa� wycieczki.");
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, " Jeste� ju� w trasie !");
					}
				}
				case 6:
				{
					if(GetPlayerJob(playerid) == JOB_DRIVER)
						{
							SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
							CP[playerid]=1201;
							PlayerInfo[playerid][pLinia55] = 0;
							PlayerInfo[playerid][pLinia72] = 0;
							PlayerInfo[playerid][pLinia82] = 0;
							PlayerInfo[playerid][pLinia96] = 0;
							PlayerInfo[playerid][pNatrasiejest] = 0;
							SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz zjazd do zajezdni, wskazuje j� sygna� GPS. ");
							Przystanek(playerid, COLOR_BLUE, "Linia ZAJ \n Kierunek: Zajezdnia Commerce\n {808080}Zatrzymuje si� na przystankach");
							SendClientMessage(playerid, COLOR_ALLDEPT, " KT przypomina: {C0C0C0}Odstawiony do zajezdni autobus to szcz�liwy autobus :) ");
						}
						else if (PlayerInfo[playerid][pMember] == 10 ||PlayerInfo[playerid][pLider] == 10)
						{
							SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
							CP[playerid]=1200;
							PlayerInfo[playerid][pLinia55] = 0;
							PlayerInfo[playerid][pLinia72] = 0;
							PlayerInfo[playerid][pLinia82] = 0;
							PlayerInfo[playerid][pLinia96] = 0;
							PlayerInfo[playerid][pNatrasiejest] = 0;
							SendClientMessage(playerid, COLOR_YELLOW, " Rozpoczynasz zjazd do zajezdni, wskazuje j� sygna� GPS. ");
							Przystanek(playerid, COLOR_BLUE, "Linia ZAJ \n Kierunek: Zajezdnia Ocean Docks\n {808080}Zatrzymuje si� na przystankach");
							SendClientMessage(playerid, COLOR_ALLDEPT, " LSBD przypomina: {C0C0C0}Odstawiony do zajezdni autobus to szcz�liwy autobus :) ");
						}
				}
				case 7:
				{
					SendClientMessage(playerid, COLOR_YELLOW, "|_____________Obja�nienia_____________|");
					SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}50$/p {FFFFF0}- okre�la premi� za ka�dy przystanek");
					SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}5min{FFFFF0} - orientacyjny czas przejazdy ca�ej trasy (dwa okr��enia)");
					SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}13p{FFFFF0} - liczba przystank�w na trasie");
					SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}/businfo{FFFFF0} - wy�wietla informacje o systemie autobus�w (w budowie)");
					SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}/zakoncztrase{FFFFF0} - przerywa wykonywan� tras� i zmienia tablic� na domy�ln�");
					SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}/zd{FFFFF0} - zamyka drzwi w autobusie i umo�liwa dalsz� jazd�");
					SendClientMessage(playerid, COLOR_GREEN, "Wyp�at� za przejechane przystanki otrzymuje si� DOPIERO po przejechaniu ca�ej trasy!");
					SendClientMessage(playerid, COLOR_GREEN, "{FF00FF}Podpowied�:{FFFFF0} najszybsze zarobki gwarantuje linia 72");
					SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD<<_____________|");
				}
			}
		}
		return 1;
	}
	return 0;
}

//end