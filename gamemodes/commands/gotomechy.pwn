//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ gotomechy ]-----------------------------------------------//
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

CMD:gotomechy(playerid)
{
    if(PlayerInfo[playerid][pAdmin] > 0 || IsAScripter(playerid)) {
		
		if (GetPlayerState(playerid) == 2)
		{
			SetVehiclePos(GetPlayerVehicleID(playerid), 2778.0833, -1612.0159, 10.9219);

		}
		else
		{
			SetPlayerPosEx(playerid, 2778.0833,-1612.0159,10.9219);
		}
        SetPlayerVirtualWorld(playerid, 0);
        sendTipMessageEx(playerid, COLOR_GRAD1, "Zosta�e� teleportowany na baz� mechanik�w, �opata w d�o�! ");
        SetPlayerInterior(playerid,0);
        PlayerInfo[playerid][pInt] = 0;
    }
    return 1;
}

