//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ respawnplayer ]---------------------------------------------//
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

CMD:respp(playerid, params[]) return cmd_respawnplayer(playerid, params);
CMD:respawnplayer(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pNewAP] < 1) return 1;
    new v;
    if(sscanf(params, "k<fix>", v)) return sendTipMessage(playerid, "U�yj /respawnplayer [ID/Nick]");
    if(!IsPlayerConnected(v)) return sendErrorMessage(playerid, "Niepoprawne ID gracza.");
    new pstate = GetPlayerState(v);
    if((pstate == 0 || pstate == 7 || pstate == 9) && PlayerInfo[playerid][pAdmin] < 5000) return sendErrorMessage(playerid, "Nie mo�esz go teraz zrespawnowa�!");
    new str[128];
    format(str, 128, "$System$ � Zosta�e� zrespawnowany przez admina %s", GetNick(playerid));
    SendClientMessage(v, COLOR_LIGHTGREEN, str);
    format(str, 128, "$System$ � Zrespawnowa�e� gracza o nicku %s", GetNick(v));
    SendClientMessage(playerid, COLOR_LIGHTGREEN, str);

    SpawnPlayer(v);
    return 1;
}

