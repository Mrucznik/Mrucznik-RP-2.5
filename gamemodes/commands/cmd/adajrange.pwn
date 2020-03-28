//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ adajrange ]-----------------------------------------------//
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
Komenda pozwalaj�ca nada� rang� dla innego ID - stworzona dla admin�w z wysokim LVL lub adm. technicznych. 	
*/

YCMD:adajrange(playerid, params[], help)
{
    if(IsAHeadAdmin(playerid) || IsAScripter(playerid) || Uprawnienia(playerid, ACCESS_MAKELEADER) || Uprawnienia(playerid, ACCESS_PANEL) || Uprawnienia(playerid, ACCESS_MAKEFAMILY)) //uprawnienia dla panelu KO - TYMCZASOWO do czasu refactoringu
    {
        new giveplayerid, rankValue, string[256]; 
        if(sscanf(params, "k<fix>d", giveplayerid, rankValue))
        {
            sendTipMessage(playerid, "U�yj /adajrange [ID/CZʌ�_NICKU] [RANGA]"); 
            return 1;
        }
        if(IsPlayerConnected(playerid))
        {
            if(IsPlayerConnected(giveplayerid))
            {
                if(GetPlayerFraction(giveplayerid) != 0 || GetPlayerOrg(giveplayerid) != 0)
                {

                    if(strlen(FracRang[GetPlayerFraction(giveplayerid)][rankValue]) < 1)
                    {
                        sendErrorMessage(playerid, "Ta ranga nie jest stworzona!"); 
                        return 1;
                    } 
                    format(string, sizeof(string), "AdmCmd: %s [%d] da� %s [%d] rang� %d z poprzedniej rangi %d [w %d]", 
                    GetNickEx(playerid), 
                    playerid,
                    GetNick(giveplayerid),
                    giveplayerid,
                    rankValue, 
                    PlayerInfo[giveplayerid][pRank], 
                    GetPlayerFraction(giveplayerid)); 
                    SendMessageToAdmin(string, COLOR_RED);
                    format(string, sizeof(string), "Admin %s zmieni� tw�j stopie� z %d na %d", GetNickEx(playerid), PlayerInfo[giveplayerid][pRank], rankValue); 
                    sendTipMessage(giveplayerid, string); 
                    PlayerInfo[giveplayerid][pRank] = rankValue;
                    Log(adminLog, INFO, "%s da� %s rang� %d", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), rankValue);
                    return 1;
                }
                else
                {
                    return sendErrorMessage(playerid, "Ten gracz nie ma �adnej frakcji i organizacji!"); 
                }
            }
            else
            {
                return sendErrorMessage(playerid, "Nie ma takiego gracza"); 
            }
        }
    }
    else
    {
        return noAccessMessage(playerid); 
    }
    
    return 1;
}
