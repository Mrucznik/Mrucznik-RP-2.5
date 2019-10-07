//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   napraw                                                  //
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
// Autor: Simeone
// Data utworzenia: 07.10.2019


//

//------------------<[ Implementacja: ]>-------------------
command_napraw_Impl(playerid, giveplayerid, valueCost)
{
    new string[124];
    if(GetPlayerJobID(playerid) != JOB_MECHAZORD)
    {
        sendErrorMessage(playerid, "Nie jeste� mechanikiem!");
        sendTipMessage(playerid, "Mo�esz do��czy� do pracy mechanika wpisuj�c /dolacz w odpowiednim punkcie!"); 
        return 1;
    }
    if(valueCost > 6000)
    {
        sendErrorMessage(playerid, "Kwota nie mo�e przekracza� 6 tysi�cy!"); 
        return 1;
    }
    if(valueCost < 0)
    {
        sendErrorMessage(playerid, "Nie mo�esz oferowa� naprawy za minusowe kwoty!"); 
        return 1;
    }
    if(!IsPlayerInAnyVehicle(giveplayerid))
    {
        sendErrorMessage(playerid, "Gracz, kt�remu oferujesz napraw� nie znajduje si� w �adnym poje�dzie!"); 
        return 1;
    }
    if(!ProxDetectorS(8.0, playerid, giveplayerid) || Spectate[giveplayerid] != INVALID_PLAYER_ID)
    {
        sendErrorMessage(playerid, "Ten gracz nie jest przy Tobie!"); 
        return 1;
    }
    if(SpamujeMechanik[playerid] == 0)
    {
        if(playerid == giveplayerid)
        {
            sendErrorMessage(playerid, "Nie mo�esz naprawi� pojazdu samemu sobie!"); 
            return 1;
        }
        format(string, sizeof(string), "Mechanik %s oferuje napraw� twojego pojazdu za %d$ - aby si� zgodzi� wpisz /akceptuj naprawe", GetNick(playerid), valueCost);
        sendTipMessageEx(giveplayerid, COLOR_P@, string); 
        format(string, sizeof(string), "Zaoferowa�e� napraw� dla %s za %d$ - odczekaj chwil�, a� gracz akceptuje twoj� ofert�!", GetNick(giveplayerid), valueCost); 
        sendTipMessageEx(playerid, COLOR_P@, string); 
        RepairOffer[giveplayerid] = playerid;
        RepairPrice[giveplayerid] = valueCost;
        SpamujeMechanik[playerid] = 1;
        SetTimerEx("AntySpamMechanik",30000,0,"d",playerid);
    }
    else
    {
        sendErrorMessage(playerid, "Odczekaj 30 sekund!"); 
    }
    return 1;
}

//end