//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ ticketend ]-----------------------------------------------//
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

CMD:ticketend(playerid)
{
    if(PlayerInfo[playerid][pZG] == 0 && PlayerInfo[playerid][pNewAP] == 0 && PlayerInfo[playerid][pAdmin] == 0) return 1;
    if(GetPVarInt(playerid, "validticket") != 1) return 1;
    SetPVarInt(playerid, "validticket", 0);
    if(Unspec[playerid][Coords][0] != 0)
    {
        PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
    	PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
        SetPlayerInterior(playerid, Unspec[playerid][sPint]);
        SetPlayerVirtualWorld(playerid, Unspec[playerid][sPvw]);
    	SetPlayerPosEx(playerid, Unspec[playerid][Coords][0], Unspec[playerid][Coords][1], Unspec[playerid][Coords][2]);
        Wchodzenie(playerid);
    }
    else
        SpawnPlayer(playerid);
    return 1;
}
