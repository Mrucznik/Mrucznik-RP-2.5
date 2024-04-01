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
// Autor: mrucznik
// Data utworzenia: 01.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_napraw_Impl(playerid, giveplayerid, price)
{
	if(!IsAMechazordWarsztatowy(playerid) && PlayerInfo[playerid][pJob] != 7)
    {
        MruMessageFail(playerid, "Nie jeste� mechanikiem lub pracownikiem warsztatu.");
        return 1;
    }

    if(GetDistanceBetweenPlayers(playerid, giveplayerid) > 8)
    {
        MruMessageFail(playerid, "Gracz jest za daleko.");
        return 1;
    }

    if(!IsPlayerInAnyVehicle(giveplayerid))
    {
        MruMessageFail(playerid, "Gracz nie jest w samochodzie.");
        return 1;
    }

    if(SpamujeMechanik[playerid] != 0)
    {
        MruMessageFail(playerid, "Poczekaj 10 sekund przed ponownym u�yciem komendy.");
        return 1;
    }

    if(playerid == giveplayerid) 
    { 
        MruMessageFail(playerid, "Nie mo�esz naprawi� wozu samemu sobie!"); 
        return 1; 
    }

    RepairOffer[giveplayerid] = playerid;
    RepairPrice[giveplayerid] = price;

    MruMessageInfoF(playerid, "Oferujesz %s napraw� wozu za $%d .", GetNick(giveplayerid), price);
    MruMessageGoodInfoF(giveplayerid, "* Mechanik %s proponuje napraw� twojego wozu za $%d, (wpisz /akceptuj naprawe) aby akceptowa�.", GetNick(playerid), price);
    
    SpamujeMechanik[playerid] = 1;
    SetTimerEx("AntySpamMechanik",10000,0,"d", playerid);
    return 1;
}

//end