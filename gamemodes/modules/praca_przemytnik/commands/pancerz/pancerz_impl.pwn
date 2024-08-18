//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  pancerz                                                  //
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
// Data utworzenia: 18.08.2024


//

//------------------<[ Implementacja: ]>-------------------
command_pancerz_Impl(playerid)
{
    if(!IsOwnerOfSmugglingItem(playerid, SMUGGLING_ITEM_ARMOR))
    {
        MruMessageFail(playerid, "Najpierw musisz kupi� kamizelk� kuloodporn� u przemytnika.");
        return 1;
    }

    if(IsPlayerInFight(playerid))
    {
        MruMessageFail(playerid, "Nie mo�esz za�o�y� kamizelki kuloodpornej podczas walki (60 sekund po otrzymaniu obra�e�)!");
        return 1;
    }

    TakeSmugglingItem(playerid, SMUGGLING_ITEM_ARMOR);

    SetPlayerArmour(playerid, 100);
    ChatMe(playerid, "zak�ada kamizelk� kuloodporn�");
    ApplyAnimation(playerid, "SILENCED", "Silence_reload", 4.0999, 0, 0, 0, 1, 0, 1);
    return 1;
}

//end