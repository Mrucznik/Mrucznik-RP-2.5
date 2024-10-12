//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  zderzaki                                                 //
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
command_zderzaki_Impl(playerid, giveplayerid)
{
    new cost = 10_000;
    if(IsBusinessTypeOwnedByPlayerOrg(playerid, FRONT_BIZ_TYPE_SPRAY))
    {
        cost /= 2;
    }

    // permission, paarmeters validation
    if(!TuneCommands_CheckRequirements(playerid, giveplayerid, cost))
    {
        return 1;
    }

    if(GetPlayerJobSkill(playerid, JOB_MECHANIC) < 4)
    {
        MruMessageFail(playerid, "Musisz mie� 4 skill mechanika aby montowa� zderzaki.");
        return 1;
    }

    if(GUIExit[playerid] != 0)
    {
        return 1;
    }

    MruMessageGoodInfoF(playerid, "Proponujesz graczowi %s zamontowanie zderzak�w.", GetNick(giveplayerid));
    MruMessageGoodInfoF(giveplayerid, "Mechanik %s proponuje Tobie zamontowanie zderzak�w.", GetNick(playerid));

    mechanikid[playerid] = giveplayerid;
    new model = GetVehicleModel(GetPlayerVehicleID(giveplayerid));
    if(model >= 558 && model <= 562 || model == 565)//alien i x-flow
    {
        ShowPlayerDialogEx(playerid, 501, DIALOG_STYLE_LIST, "Wybierz zderzaki", "X-Flow\nAlien", "Montuj", "Wyjd�");
    }
    else if(model == 575 || model == 534 || model == 536 || model == 567 || model == 576)//lowrider
    {
        ShowPlayerDialogEx(playerid, 502, DIALOG_STYLE_LIST, "Wybierz zderzaki", "Chromowe\nMasywne", "Montuj", "Wyjd�");
    }
    else if(model == 535)//slamvan
    {
        ShowPlayerDialogEx(playerid, 503, DIALOG_STYLE_LIST, "Wybierz zderzaki", "Masywne", "Montuj", "Wyjd�");
    }
    else
    {
        MruMessageFail(playerid, "W tym wozie nie mo�na zamontowac zderzak�w");
    }

    return 1;
}

//end