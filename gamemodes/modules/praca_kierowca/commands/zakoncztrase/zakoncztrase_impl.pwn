//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                zakoncztrase                                               //
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
// Autor: mrucznik
// Data utworzenia: 06.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_zakoncztrase_Impl(playerid)
{
	if(GetPlayerFraction(playerid) != FRAC_KT && GetPlayerJob(playerid) != JOB_DRIVER)
	{
		MruMessageFail(playerid, "Nie jeste� kierowc� lub pracownikiem Korporacji Transportowej!");
		return 1;
	}
	
	new vehicleid = GetPlayerVehicleID(playerid);
	if(!IsAPublicTransport(vehicleid))
	{
		MruMessageFail(playerid, "Nie jeste� w autobusie!");
		return 1;
	}

	new route = DrivingBusRoute[playerid];
	if(route != -1)
	{
		MruMessageFail(playerid, "Nie wykonujesz aktualnie �adnej trasy autobusowej.");
		return 1;
	}

	EndBusRoute(playerid, vehicleid, route, true);
	MruMessageGoodInfo(playerid, "Zako�czy�e� tras� i wygasi�e� tablice.");
    return 1;
}

//end