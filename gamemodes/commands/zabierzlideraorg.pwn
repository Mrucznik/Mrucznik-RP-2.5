//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------[ zabierzlideraorg ]-------------------------------------------//
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

CMD:zabierzlideraorg(playerid, params[])
{
    if(!Uprawnienia(playerid, ACCESS_MAKEFAMILY)) return 1;
    new id=-1;
	if( sscanf(params, "k<fix>", id)) return sendTipMessage(playerid, "U�yj /zabierzlideraorg [ID/Nick]");
	if(id != -1)
    {
        if(!IsPlayerConnected(id)) return sendErrorMessage(playerid, "Brak takiego gracza!");
        if(!gPlayerOrgLeader[id]) return sendTipMessageEx(playerid, COLOR_GRAD2, "Ten gracz nie ma lidera rodziny!");
        orgGivePlayerRank(id, INVALID_PLAYER_ID, PlayerInfo[id][pRank]);
        gPlayerOrgLeader[id] = false;
    }
    new str[128];
    if(id != -1)
    {
        format(str, 128, "Admin %s odebra� Tobie kontrol� nad rodzin� %s", GetNick(playerid), OrgInfo[gPlayerOrg[id]][o_Name]);
        SendClientMessage(id, COLOR_LIGHTBLUE, str);
        format(str, 128, "Odebra�e� kontrol� nad rodzin� %s graczowi %s", OrgInfo[gPlayerOrg[id]][o_Name], GetNick(id));
        SendClientMessage(playerid, COLOR_LIGHTBLUE, str);
		
		//logi
		format(str, sizeof(str), "%s odebral kontrole nad rodzina %d graczowi %s", GetNick(playerid), gPlayerOrg[id], GetNick(id));
		ActionLog(str);
    }
    return 1;
}

