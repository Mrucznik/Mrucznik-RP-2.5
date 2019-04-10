//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zmiennick ]-----------------------------------------------//
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

CMD:zmiennick(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

	if (PlayerInfo[playerid][pLevel] >= 3)
	{
        //Nowy system
        if(PlayerInfo[playerid][pZmienilNick] < 1) return sendTipMessage(playerid, "Nie posidasz pakietu zmiany nicku.");

        if(PlayerInfo[playerid][pDom] == 0)
	    {
	        if(PlayerInfo[playerid][pPbiskey] == 255)
	        {
				GetPlayerName(playerid, sendername, sizeof(sendername));
				if(isnull(params))
				{
					sendTipMessage(playerid, "U�yj /zmiennick [nowy nick]");
                    sendTipMessage(playerid, "UWAGA!! Przy zmianie nicku kasuje ci si� frakcja/rodzina.", COLOR_PANICRED);
					return 1;
				}
				else
				{
                    if(ChangePlayerName(playerid, params))
                    {
                        format(string, sizeof(string), "%s[%d] zmieni� sobie nick - Nowy nick: %s",sendername,PlayerInfo[playerid][pUID],params);
                    	SendClientMessageToAll(COLOR_LIGHTRED, string);
                    	NickLog(string);

						ShowPlayerDialogEx(playerid, 70, DIALOG_STYLE_MSGBOX, "Zmiana nicku", "W�a�nie zmieni�e� nick. Nast�puj�ce elementy zosta�y wyzerowane:\n\nPraca\nFrakcja\nWanted Level\nRodzina\nLider\nRanga\nSkin\nZaufany Gracz\n\n\nPami�taj, �e ka�da zmiana nicku jest na wag� z�ota wi�c nie trwo� ich pochopnie!\nJe�eli dosz�o do b��dnej zmiany zg�o� ten fakt pr�dko na forum w panelu strat!\nPami�taj: nowa posta� = nowe �ycie.", "Dalej", "");
                    }
                }
			}
			else
			{
			    sendTipMessage(playerid, "Masz biznes, nie mo�esz zmieni� nicku");
			}
		}
		else
		{
		    sendTipMessage(playerid, "Masz lub wynajmujesz dom, nie mo�esz zmieni� nicku");
		    sendTipMessage(playerid, "U�yj /sprzedajdom lub /unrent");
		}
	}
	else
 	{
 		sendTipMessage(playerid, "Musisz mie� 3 level aby zmieni� sobie nick.");
  	}
	return 1;
}

