//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ scenadisallow ]---------------------------------------------//
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

CMD:scenadisallow(playerid, p[])
{
    if(PlayerInfo[playerid][pAdmin] < 200 ) return 1;
    new id;
    if(sscanf(p, "k<fix>", id)) return sendTipMessage(playerid, "U�yj /scenadisallow [Nick/ID]");
    if(GetPVarInt(id, "scena-allow") != 1) return sendTipMessageEx(playerid, COLOR_GRAD2, "Ten gracz nie ma takiego pozwolenia.");
    new str[128];
    format(str, 128, "� Admin %s (ID: %d) zabra� Ci pozwolenie na zarz�dzanie scen�.", GetNick(playerid), playerid);
    SendClientMessage(id, COLOR_LIGHTRED,  str);
    format(str, 128, "� Zabra�e� %s (ID: %d) mo�liwo�� kontrolowania sceny.", GetNick(id), id);
    SendClientMessage(playerid, COLOR_LIGHTRED,  str);
    SetPVarInt(id, "scena-allow", 0);
    return 1;
}
