//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ scenaallow ]----------------------------------------------//
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

CMD:scenaallow(playerid, p[])
{
    if(PlayerInfo[playerid][pAdmin] < 200 || IsAKO(playerid)) return 1;
    new id;
    if(sscanf(p, "k<fix>", id)) return sendTipMessage(playerid, "U�yj /scenaallow [Nick/ID]");
    if(GetPVarInt(id, "scena-req") != 2 && PlayerInfo[playerid][pAdmin] < 1) return sendTipMessageEx(playerid, COLOR_GRAD2, "Ten gracz nie prosi� o to.");
    new str[128];
    format(str, 128, "� Admin %s (ID: %d) nada� Ci pozwolenie na zarz�dzanie scen�.", GetNick(playerid), playerid);
    SendClientMessage(id, COLOR_LIGHTBLUE,  str);
    format(str, 128, "� Dale� %s (ID: %d) mo�liwo�� kontrolowania sceny. Aby zabra� (/scenadisallow)", GetNick(id), id);
    SendClientMessage(playerid, COLOR_LIGHTBLUE,  str);
    SetPVarInt(id, "scena-allow", 1);
    return 1;
}

