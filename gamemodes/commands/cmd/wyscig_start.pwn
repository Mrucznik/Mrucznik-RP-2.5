//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ wyscig_start ]---------------------------------------------//
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

YCMD:wyscig_start(playerid, params[], help)
{
    if(IsANoA(playerid))
    {
		if(PlayerInfo[playerid][pRank] >= 2)
		{
            if(owyscig[playerid] != 666)
            {
                if(Scigamy == 666)
                {
					if(tworzenietrasy[playerid] == 666)
					{
						sendErrorMessage(playerid, "Nie wybra�e� trasy wy�cigu!");
						return 1;
					}

	            	ScigaSie[playerid] = owyscig[playerid];
	            	owyscig[playerid] = 666;
	            	Scigamy = ScigaSie[playerid];
	            	SetTimerEx("Odlicz",5000,0,"d",Scigamy);
	            	foreach(new i : Player)
	            	{
	            	    if(ScigaSie[i] == Scigamy)
	            	    {
	            	        if(IsPlayerInRangeOfPoint(i, 10.0, wCheckpoint[Scigamy][0][0], wCheckpoint[Scigamy][0][1], wCheckpoint[Scigamy][0][2]))
	            	        {
	            	            TogglePlayerControllable(i, 0);
					            GameTextForPlayer(i, "Za chwile rozpocznie sie wyscig", 5000, 6);
					            IloscZawodnikow ++;//rupxnup69
								Ukonczyl = 1;
	            	        }
	            	        else
	            	        {
	            	            DisablePlayerRaceCheckpoint(i);
	            	            ScigaSie[i] = 666;
	            	        }
	            	    }
	            	}

					new string[128];
					format(string, sizeof(string), "Komunikat frakcyjny: wy�cig %s wystartowa�", Wyscig[tworzenietrasy[playerid]][wNazwa]);
					SendFamilyMessage(15, COLOR_YELLOW, string);
					SendFamilyMessage(1, COLOR_YELLOW, "UWAGA!");
					format(string, sizeof(string), "DO WSZYSTKICH JEDNOSTEK: kto� zorganizowa� nielegalny wy�cig %s", Wyscig[tworzenietrasy[playerid]][wNazwa]);
					SendFamilyMessage(1, COLOR_DBLUE, string);
					SendFamilyMessage(1, COLOR_YELLOW, "UWAGA!");
					SendClientMessage(playerid, COLOR_LIGHTGREEN, "Wyscig zaraz si� zacznie!!");
	            }
	            else
	            {
	                sendErrorMessage(playerid, "Ju� trwa jeden wy�cig! Poczekaj, a� si� sko�czy lub u�yj /wyscig-stop");
	            }
			}
			else
			{
			    sendErrorMessage(playerid, "Nie organizujesz wy�cigu, aby to zrobi�, u�yj panelu tras (/wyscigi)");
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie posiadasz uprawnie� (wymagana 2 ranga)");
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� z NoA");
	}
	//rup
	return 1;
}
