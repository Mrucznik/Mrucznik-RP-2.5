//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zatankuj ]-----------------------------------------------//
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


static zatankujPojazdGracza(playerid)
{
	new engine, niewazne;
	GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, niewazne, niewazne, niewazne, niewazne, niewazne, niewazne); 
	if(engine == 1 || OdpalanieSpam[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Nie mo�esz tankowa�, gdy silnik jest odpalony!");
	GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~~n~Tankowanie pojazdu, prosze czekac",2000,3);
	SetTimer("Fillup",RefuelWait,0);
	Refueling[playerid] = 1;
}


YCMD:zatankuj(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		// zwyk�e stacje benzynowe
		if(IsAtGasStation(playerid))
		{
		    if(IsPlayerInAnyVehicle(playerid))
		    {
				zatankujPojazdGracza(playerid);
			}
		}
		// stacje benzynowe frakcyjne
		else if(IsAFractionGasStationValidUser(playerid) && IsPlayerInTheirFractionVehicle(playerid))
		{
			zatankujPojazdGracza(playerid);
		}
		else
		{
			sendTipMessageEx(playerid,COLOR_GREY,"Nie jeste� na stacji benzynowej!");
		}
	}
	return 1;
}
