//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                sprzedajrybe                                               //
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
// Data utworzenia: 03.03.2020


//

//------------------<[ Implementacja: ]>-------------------
command_sprzedajrybe_Impl(playerid, fishid)
{
	new isAtOwnRestaurant = 0;
	new bizId = IsPlayerAtFrontBusinnesZone(playerid);
	new org = GetPlayerOrg(playerid);
	if(bizId != -1 && IsActiveOrg(org) && 
		FrontBusiness[bizId][Owner] == org && 
		FrontBusiness[bizId][Type] == FRONT_BIZ_TYPE_RESTAURANT &&
		GetPlayerFrontBusinessProximity(playerid, bizId) < 10.0)
	{
		isAtOwnRestaurant = bizId;
	}
	
    if(!PlayerToPoint(100, playerid, -30.875, -88.9609, 1004.53) && !isAtOwnRestaurant)//centerpoint 24-7
    {
		SendClientMessage(playerid, COLOR_WHITE, "Ryb� mo�esz sprzeda� tylko w 24/7 lub restauracji posiadanej przez Twoj� organizacj�!");
		return 1;
    }

    switch(fishid)
    {
        case 1..5:
        {
            SprzedajeRybe(playerid, fishid, isAtOwnRestaurant);
        }
        default:
        {
            return sendTipMessageEx(playerid, COLOR_GREY, "Numer ryby od 1 do 5 !"); 
        }
    }
    return 1;
}

SprzedajeRybe(playerid, fishid, isAtOwnRestaurant)
{
	if(!fishid) return 0;
	new FishWeight, FishName[20];
	if(fishid == 1)
	{
		FishWeight = Fishes[playerid][pWeight1];
		format(FishName, sizeof(FishName), Fishes[playerid][pFish1]);
	}
	else if(fishid == 2)
	{
		FishWeight = Fishes[playerid][pWeight2];
		format(FishName, sizeof(FishName), Fishes[playerid][pFish2]);
	}
	else if(fishid == 3)
	{
		FishWeight = Fishes[playerid][pWeight3];
		format(FishName, sizeof(FishName), Fishes[playerid][pFish3]);
	}
	else if(fishid == 4)
	{
		FishWeight = Fishes[playerid][pWeight4];
		format(FishName, sizeof(FishName), Fishes[playerid][pFish4]);
	}
	else if(fishid == 5)
	{
		FishWeight = Fishes[playerid][pWeight5];
		format(FishName, sizeof(FishName), Fishes[playerid][pFish5]);
	}

	if(FishWeight < 1) {
		return SendClientMessage(playerid, COLOR_GREY, sprintf("** Nie z�owi�e� �adnej ryby pod numerem [%d] !", fishid)); 
	}
	new moneyPerKg = 14;
	if(isAtOwnRestaurant)
	{
		moneyPerKg = 21;
		AccountBusinessProfit(isAtOwnRestaurant, moneyPerKg*7);
	}
	SendClientMessage(playerid, COLOR_GREY, sprintf("** Sprzeda�e� ryb� numer [%d]!", fishid));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Sprzeda�e� ryb�: %s, wa��c� %d kg. Otrzymujesz %d$.", FishName, FishWeight, FishWeight * moneyPerKg));
	DajKase(playerid, FishWeight * moneyPerKg);
	ClearFishID(playerid, fishid);
	Fishes[playerid][pLastFish] = 0;
	Fishes[playerid][pFishID] = 0;
	
	if(IsPlayerSick(playerid, FANATYK_WEDKARSTWA))
	{
		if(random(100) <= 5)
		{
			CurePlayer(playerid, FANATYK_WEDKARSTWA);
		}
	}
	return 1;
}

//end