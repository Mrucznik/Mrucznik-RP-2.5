//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ tankveh ]------------------------------------------------//
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

CMD:fuelcar(playerid) return cmd_tankveh(playerid);
CMD:tankujauto(playerid) return cmd_tankveh(playerid);
CMD:tankveh(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�� Nie jeste� w poje�dzie!");
        if(IsPlayerInAnyVehicle(playerid)) {
            new string[128];
            if (PlayerInfo[playerid][pAdmin] >= 5)
            {
				new vehicleid = GetPlayerVehicleID(playerid);
				new vuid = VehicleUID[vehicleid][vUID];
                Gas[vehicleid] = 100;
                format(string, sizeof(string), " �� Pojazd o ID (%d) zosta� dotankowany", vehicleid);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string); 
				
				format(string, sizeof(string), "AdmCmd: %s zatankowa� auto %s (%d)[%d].", GetNick(playerid), VehicleNames[GetVehicleModel(vehicleid)-400], vehicleid, vuid);
				SendPunishMessage(string, playerid);
				KickLog(string);
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
    }
    return 1;
}

