//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ komunikat ]-----------------------------------------------//
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

YCMD:komunikat(playerid, params[], help)
{
    new string[256], sendername[MAX_PLAYER_NAME], org;
    GetPlayerName(playerid, sendername, sizeof(sendername));
    if(!IsPlayerConnected(playerid)) return 1;
    org = GetPlayerOrg(playerid);
    if(!org) return sendErrorMessage(playerid, "Nie jeste� w �adnej rodzinie!");
    if(PlayerInfo[playerid][pRank] < 5) 
    {
        return sendErrorMessage(playerid, "Musisz mie� 5 range aby tego u�ywa� !");
    }
    else
    {
        if(org == 21 && PlayerInfo[playerid][pRank] < 4) return sendErrorMessage(playerid, "Musisz mie� 4 range aby tego u�ywa� !"); //dla Ammunation Willowfield slot 21
    }
    if(isnull(params)) return sendErrorMessage(playerid, "U�yj: /komunikat [tekst]");
    if(CMDKomunikat == 1) return sendErrorMessage(playerid, "Komunikat by� u�yty przed chwil�!");
    if(IsAPrzestepca(playerid)) return sendErrorMessage(playerid, "Nie mo�esz by� w gangu/mafii!");
    if(PlayerInfo[playerid][pBP])
    {
        format(string, sizeof(string), "   Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
        SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
        return 1;
    }
    format(string, sizeof(string), "|___________ %s ___________|", OrgInfo[gPlayerOrg[playerid]][o_Name]);
    SendClientMessageToAll(COLOR_WHITE, string);
    format(string, sizeof(string), "%s: %s", sendername, params);
    SendClientMessageToAll(COLOR_BLUE, string);
    CMDKomunikat = 1;
    SetTimer("KomunikatTimer", 60000, false);
    return 1;
}
