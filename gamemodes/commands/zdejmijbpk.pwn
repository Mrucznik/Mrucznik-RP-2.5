//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zdejmijbpk ]----------------------------------------------//
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

CMD:zdejmijbpk(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1)
	{
		new giveplayerid; 
		if(sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /zdejmijbpk [ID GRACZA]"); 
			return 1;
		}
		if(!IsPlayerConnected(giveplayerid))
		{
			sendErrorMessage(playerid, "Nie ma takiego gracza"); 
			return 1;
		}
		new string[128];
		format(string, sizeof(string), "null");
		SetPVarString(giveplayerid, "trescOgloszenia", string);			
		PlayerInfo[giveplayerid][pBlokadaPisaniaFrakcjaCzas] = 0;
		KillTimer(komunikatTime[giveplayerid]);
		format(string, sizeof(string), "Administrator %s zdj�� Ci blokad� pisania na komunikatach frakcyjnych", GetNick(playerid));
		sendTipMessageEx(playerid, COLOR_P@, string);
		format(string, sizeof(string), "Administrator %s zdj�� blokad� dla %s. Mo�e on teraz swobodnie pisa� komunikat frakcyjny", GetNick(playerid), GetNick(giveplayerid));
		SendAdminMessage(COLOR_RED, string);
		
	}
	else
	{
		sendErrorMessage(playerid, "Brak uprawnie�"); 
	}
	return 1;
}
