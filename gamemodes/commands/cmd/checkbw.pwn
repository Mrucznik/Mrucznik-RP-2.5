//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------- -------[ checkbw ]------------------------------------------------//
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

YCMD:checkbw(playerid, params[], help)
{
    if(PlayerInfo[playerid][Admin] >= 1 || PlayerInfo[playerid][HalfAdmin] >= 1 || IsAScripter(playerid))
	{
		new id, string[144], typeint, type[144];
		if(sscanf(params, "k<fix>", id)) return sendTipMessage(playerid, "U�yj /checkbw [ID]");
		if(!IsPlayerConnected(id)) return sendErrorMessage(playerid, "Nie ma takiego gracza.");
		if(PlayerInfo[id][pBW] <= 0 && PlayerInfo[id][pInjury] <= 0)
		{
			return sendTipMessageEx(playerid, COLOR_GRAD2, "Ten gracz nie ma BW.");
		} 
		else
		{
			if(PlayerInfo[id][pBW] > 0)
			{
				typeint = PlayerInfo[id][pBW];
				format(type, sizeof(type), "(nieprzytomny)");
			}
			else
			{
				typeint = PlayerInfo[id][pInjury];
				format(type, sizeof(type), "(ranny)");
			}
			format(string, sizeof(string), "Graczowi %s zosta�o do ko�ca BW: %d sekund %s", GetNick(id), typeint, type); 
			SendClientMessage(playerid, COLOR_GRAD2, string);
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie masz uprawnie�.");
	}
    return 1;
}
