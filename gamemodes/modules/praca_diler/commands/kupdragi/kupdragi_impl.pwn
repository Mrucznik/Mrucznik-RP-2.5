//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  kupdragi                                                 //
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
// Data utworzenia: 06.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_kupdragi_Impl(playerid, weight)
{
    if(GetPVarInt(playerid, PVAR_DEALER_PRICE) != 0)
    {
        MruMessageFail(playerid, "Nie mo�esz kupi� narkotyk�w, gdy sam nimi dilujesz.");
        return 1;
    }

    new dealerid = GetClosestDrugDealer(playerid);
    if(dealerid == INVALID_PLAYER_ID)
    {
        MruMessageFail(playerid, "Jeste� zbyt daleko od dilera.");
        return 1;
    }

    if(weight < 0)
    {
        MruMessageFail(playerid, "Waga nie mo�e by� ujemna.");
        return 1;
    }

    new perGramPrice = GetPVarInt(dealerid, PVAR_DEALER_PRICE);
    new price = perGramPrice * weight;
    if(kaska[playerid] < price)
    {
        MruMessageFailF(playerid, "Nie sta� ci�! U tego dilera %d gram narkotyku kosztuje %d$.", weight, price);
        return 1;
    }

    // functionality
    ZabierzKase(playerid, price);
    DajKase(dealerid, price - DRUG_SELL_PRICE);

    IncreasePlayerJobSkill(dealerid, JOB_DRUG_DEALER, 1);

    PlayerInfo[playerid][pDrugs] += weight;

    // messages
    Log(payLog, INFO, "%s kupi� od dilera %s narkotyki w ilo�ci %d gram za %d$", 
        GetPlayerLogName(playerid), GetPlayerLogName(dealerid), weight, price);

    MruMessageGoodInfoF(dealerid, "%s kupi� od ciebie %d gram narkotyku za %d$.", GetNick(playerid), weight, price);
    MruMessageGoodInfoF(playerid, "Kupi�e� od dilera %s %d gram narkotyku za %d$.", GetNick(dealerid), weight, price);
    ChatMe(playerid, sprintf("odbiera zupe�nie niepodejrzanego loda od lodziarza %s", GetNick(dealerid)));

    // zdemaskowanie
    if(PlayerInfo[playerid][pTajniak] > 0 && spamwl[dealerid] == 0)
    {
        PoziomPoszukiwania[dealerid] += 4;
        PlayCrimeReportForPlayer(playerid, dealerid, 14);
        SetPlayerCriminal(dealerid, playerid, "sprzeda� narkotyk�w");
        SetPlayerWantedLevel(playerid, PoziomPoszukiwania[dealerid]);

        PursuitMode(playerid, dealerid);

        new reward = 75_000;
        DajKase(playerid, reward);

        MruMessageBadInfoF(dealerid, "Tajny agent %s nakry� Ci� na sprzeda�y narkotyk�w! Masz teraz %d Poziom Poszukiwania.", GetNick(playerid), PoziomPoszukiwania[dealerid]);
        MruMessageGoodInfoF(playerid, "Nakry�e� %s na sprzeda�y narkotyk�w! Dostajesz %d$ za wykonywanie swojej pracy.", GetNick(dealerid), reward);

        SetTimerEx("spamujewl",300_000,0,"d",dealerid); //5min anty-wl
    }
    return 1;
}

//end