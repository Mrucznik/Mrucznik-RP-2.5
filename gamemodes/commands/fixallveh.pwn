//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ fixallveh ]-----------------------------------------------//
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

CMD:fixallveh(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pAdmin] < 1000)
        {
            noAccessMessage(playerid);
            return 1;
        }
        foreach(Player, i)
        {
            if(IsPlayerInAnyVehicle(playerid))
            {
                SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
                RepairVehicle(GetPlayerVehicleID(playerid));
                CarData[VehicleUID[GetPlayerVehicleID(playerid)][vUID]][c_HP] = 1000.0;
            }
        }
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			iloscInne[playerid] = iloscInne[playerid]+1;
		}
        new string[128];
        format(string, sizeof(string), "Admin %s naprawi� wszystkim graczom pojazdy", GetNick(playerid, true));
        SendClientMessageToAll(COLOR_LIGHTBLUE, string);
		KickLog(string);
    }
    return 1;
}
