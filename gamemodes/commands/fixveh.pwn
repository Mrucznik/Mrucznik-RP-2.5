//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ fixveh ]------------------------------------------------//
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

CMD:fixveh(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pAdmin] < 10 &&  PlayerInfo[playerid][pAdmin] != 7)
		{
		    noAccessMessage(playerid);
		    return 1;
		}
		if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			new vuid = VehicleUID[vehicleid][vUID];
		    SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
		    RepairVehicle(GetPlayerVehicleID(playerid));
            CarData[vuid][c_HP] = 1000.0;
			
			new string[128];
			format(string, sizeof(string), "AdmCmd: %s naprawi� auto %s (%d)[%d].", GetNick(playerid), VehicleNames[GetVehicleModel(vehicleid)-400], vehicleid, vuid);
			SendPunishMessage(string, playerid);
			KickLog(string);
		}
	}
	return 1;
}

