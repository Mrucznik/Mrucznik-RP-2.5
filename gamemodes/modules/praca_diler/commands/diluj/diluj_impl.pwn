//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   diluj                                                   //
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
// Data utworzenia: 31.03.2024


//

//------------------<[ Implementacja: ]>-------------------
command_diluj_Impl(playerid, price)
{
    if(!IsPlayerInDrugCar(playerid))
    {
        MruMessageFail(playerid, "Aby dilowa� narkotykami, musisz znajdowa� w lodziarni.");
        return 1;
    }

    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
    {
        MruMessageFail(playerid, "Aby dilowa� narkotykami, musisz znajdowa� w lodziarni jako kierowca.");
        return 1;
    }

    if(price < DRUG_SELL_PRICE || price > DRUG_SELL_MAX_PRICE) 
    {
        MruMessageFail(playerid, "Stawka za gram narkotyku musi by� od "DRUG_SELL_PRICE"$ do "DRUG_SELL_MAX_PRICE"$.");
        return 1;
    }

    new vehicleid = GetPlayerVehicleID(playerid);
    EnableDrugDealing(playerid, vehicleid, price);

	MruMessageGoodInfoF(playerid, "Aktywowa�e� sprzeda� narkotyk�w za %d$ per gram. Za ka�dy sprzedany gram ponosisz koszt "DRUG_SELL_PRICE"$", price);
    return 1;
}

//end