//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                     a                                                     //
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
// Data utworzenia: 15.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_zatankuj_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if(IsAtGasStation(playerid))
		{ // zwyk�e stacje benzynowe
		    if(IsPlayerInAnyVehicle(playerid))
		    {
                zatankujPojazdGracza(playerid);
			}
		}
		else if(IsAFractionGasStationValidUser(playerid) && IsPlayerInTheirFractionVehicle(playerid))
		{ // stacje benzynowe frakcyjne
			zatankujPojazdGracza(playerid);
		}
		else
		{
			sendTipMessageEx(playerid,COLOR_GREY,"Nie jeste� na stacji benzynowej!");
		}
	}
	return 1;
}


static zatankujPojazdGracza(playerid)
{
	new engine, niewazne;
	GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, niewazne, niewazne, niewazne, niewazne, niewazne, niewazne); 
	if(engine == 1 || OdpalanieSpam[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Nie mo�esz tankowa�, gdy silnik jest odpalony!");
	GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~~n~Tankowanie pojazdu, prosze czekac",2000,3);
	SetTimer("Fillup",RefuelWait,0);
	Refueling[playerid] = 1;
	return 1;
}

//end
