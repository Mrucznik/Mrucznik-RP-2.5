//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------[ poszukuj ]---------------------------------------------------//
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

YCMD:poszukiwania(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
	/*	if(PlayerInfo[playerid][pJob] != 1)
		{
			sendErrorMessage(playerid, "Nie jeste� �owc� nagr�d!"); 
			return 1;
		}
		if(hunterStatus[playerid] == 0)
		{
			sendTipMessage(playerid, "W��czy�e� wy�wietlanie na mapie os�b z WL 10"); 
			sendTipMessage(playerid, "Dane aktualizuj� si� do systemu co 2 minuty!"); 
			hunterStatus[playerid]++; 
			timerForHunter[playerid] = SetTimerEx("PlayerShowForHunter", 5000, false, "d", playerid);
		}
		else if(hunterStatus[playerid] > 0)
		{
			sendTipMessage(playerid, "Wy��czy�e� wy�wietlanie na mapie os�b z WL"); 
			hunterStatus[playerid]=0;
			KillTimer(timerForHunter[playerid]);
			foreach(new i : Player)
			{
				if(hunterSeeMe[i] == playerid)
				{
					DestroyDynamicCP(chpIDHunter[i]); 
				}
			}
		}
		*/
		sendErrorMessage(playerid, "Trwaj� prace nad t� komend�!"); 
	}
	return 1;
}



