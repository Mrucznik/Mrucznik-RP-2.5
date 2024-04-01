//-----------------------------------------------<< Source >>------------------------------------------------//
//                                               praca_mechanik                                              //
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
// Data utworzenia: 31.03.2024
//Opis:
/*
	Praca Mechanika.
*/

//

//-----------------<[ Funkcje: ]>-------------------
TuneCommands_CheckRequirements(playerid, giveplayerid, cost)
{
	if(!IsAMechazordWarsztatowy(playerid) && PlayerInfo[playerid][pJob] != 7)
    {
        MruMessageFail(playerid, "Nie jeste� mechanikiem lub pracownikiem warsztatu.");
        return 0;
    }

    if(!IsAtWarsztat(playerid)) 
    {
        MruMessageFail(playerid, "Nie jeste� w warsztacie, w kt�rym mo�na prowadzi� tuning.");
        return 0;
    }

    if(GetDistanceBetweenPlayers(playerid, giveplayerid) > 8)
    {
        MruMessageFail(playerid, "Gracz jest za daleko.");
        return 0;
    }

    if(!IsPlayerInAnyVehicle(giveplayerid))
    {
        MruMessageFail(playerid, "Gracz nie jest w poje�dzie.");
        return 0;
    }

    new vehicleID = GetPlayerVehicleID(giveplayerid);
    if(!IsCarOwner(giveplayerid, vehicleID))
    {
        MruMessageFail(playerid, "Ten pojazd nie nale�y do tego gracza.");
        return 0;
    }

    if(kaska[playerid] < cost)
    {
        MruMessageFailF(playerid, "Nie masz wystarczaj�cej ilo�ci pieni�dzy (%d$)", cost);
        return 0;
    }
	return 1;
}

//end