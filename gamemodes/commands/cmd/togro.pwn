//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ togro ]-----------------------------------------------//
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
// Autor: Sanda�
// Data utworzenia: 25.12.2019

// Opis:
/*

*/


// Notatki skryptera:
/*
	
*/


YCMD:togro(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		if (gRO[playerid] == 0)
		{
			gO[playerid] = 1;
            MSGBOX_Show(playerid, "Czat RO ~r~OFF", MSGBOX_ICON_TYPE_OK);
		}
		else if (gRO[playerid] == 1)
		{
			gRO[playerid]  = 0;
            MSGBOX_Show(playerid, "Czat RO ~g~ON", MSGBOX_ICON_TYPE_OK);
		}
	}
	return 1;
}
