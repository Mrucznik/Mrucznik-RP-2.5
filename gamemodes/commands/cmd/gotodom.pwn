//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ gotodom ]------------------------------------------------//
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

YCMD:gotodom(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		if(IsAScripter(playerid) || IsPlayerAdmin(playerid))
		{
		    new domid;
			if( sscanf(params, "d", domid))
			{
				sendTipMessage(playerid, "U�yj /gotodom [domid]");
				return 1;
			}

			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, Dom[domid][hWej_X], Dom[domid][hWej_Y], Dom[domid][hWej_Z]);
			}
			else
			{
				SetPlayerPos(playerid, Dom[domid][hWej_X], Dom[domid][hWej_Y], Dom[domid][hWej_Z]);
			}
			_MruAdmin(playerid, "Zosta�e� teleportowany");
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
