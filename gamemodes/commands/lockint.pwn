//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ lockint ]------------------------------------------------//
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

CMD:zamekint(playerid) return cmd_lockint(playerid);
CMD:lockint(playerid)
{
    if(IsPlayerConnected(playerid))
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			new model = GetVehicleModel(vehicleid);
			if(IsAInteriorVehicle(model))
			{
                if(!(IsCarOwner(playerid, vehicleid) || (Car_GetOwnerType(vehicleid) == CAR_OWNER_FRACTION && Car_GetOwner(vehicleid) == GetPlayerFraction(playerid)) ))
				{
					return sendTipMessageEx(playerid, COLOR_LIGHTGREEN, "Ten pojazd nie nale�y do Ciebie!");
				}
				
				if(VehicleUID[vehicleid][vIntLock] == 0)
				{
				    VehicleUID[vehicleid][vIntLock] = 1;
					sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Otworzy�e� interior");
				}
				else
				{
				    VehicleUID[vehicleid][vIntLock] = 0;
					sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Zamkn��e� interior");
				}
		    }
		    else
		    {
		        sendTipMessageEx(playerid, COLOR_GREY, "Ten w�z nie ma interioru");
		    }
	   	}
	   	else
	   	{
	   	    sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w wozie");
	   	}
	}
	return 1;
}

