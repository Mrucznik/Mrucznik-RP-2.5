//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ setvw ]-------------------------------------------------//
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

CMD:setvw(playerid, params[])
{
	new string[128];

    if(IsPlayerConnected(playerid))
    {
		new gracz, intid;
		if( sscanf(params, "k<fix>d", gracz, intid))
		{
			sendTipMessage(playerid, "U�yj /setvw [nick/id] [virtualworld]");
			return 1;
		}

		if(!IsPlayerConnected(gracz))
		{
			sendErrorMessage(playerid, "Nie ma takiego gracza.");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
		{
			SetPlayerVirtualWorld(gracz, intid);
			format(string, sizeof(string), "Ustawi�e� %s virtualworld nr %d.", GetNick(gracz), intid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			format(string, sizeof(string), "Admin %s ustawi� ci virtualworld nr %d.", GetNick(playerid), intid);
			SendClientMessage(gracz, COLOR_LIGHTBLUE, string);
			if(GetPlayerAdminDutyStatus(playerid) == 1)
			{
				iloscInne[playerid] = iloscInne[playerid]+1;
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}

