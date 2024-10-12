//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   zjedz                                                   //
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
zjedz_OnDialogResponse(playerid, listitem)
{
    MruMySQL_EatCookedMeal(playerid, DynamicGui_GetValue(playerid, listitem));
    MruMySQL_CookedMealsDialog(playerid);
    return 1;
}

command_zjedz_Impl(playerid)
{
    new Float:hp;
    GetPlayerHealth(playerid, hp);
    if(hp >= 100.0)
    {
        sendErrorMessage(playerid, "Jeste� tak najedzony, �e nie zmie�cisz ju� wi�cej (masz pe�ne hp).");
        return 1;
    }
    
    if(IsPlayerInFight(playerid))
    {
        sendErrorMessage(playerid, "Nie mo�esz je�� podczas walki!");
        return 1;
    }

    if(IsAtFoodPlace(playerid))
    {
        if(kaska[playerid] < 100)
        {
            MruMessageFail(playerid, "Nie sta� Ci�, potrzebujesz 100$.");
            return 1;
        }
        ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 1, 1, 1, 1, 1);
        SetPlayerHealth(playerid, 100.0);
        ZabierzKase(playerid, 100);
        GameTextForPlayer(playerid, "~r~-100$", 5000, 1);
        return 1;
    }

    MruMySQL_CookedMealsDialog(playerid);
    return 1;
}

//end