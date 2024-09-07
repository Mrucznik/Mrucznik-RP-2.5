//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   kuporg                                                  //
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
// Data utworzenia: 07.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_kuporg_Impl(playerid, name[32], color, orgType)
{
    if(kaska[playerid] < CREATE_ORG_COST)
    {
        MruMessageFail(playerid, "Stworzenie organizacji kosztuje "#CREATE_ORG_COST"$, a Ty tyle nie masz.");
        return 1;
    }

    if(GetContraband(playerid) < CREATE_ORG_CONTRABAND_COST)
    {
        MruMessageFail(playerid, "Stworzenie organizacji kosztuje "#CREATE_ORG_CONTRABAND_COST" kontrabandy, a Ty tyle nie masz.");
        return 1;
    }

    if(orgType != ORG_TYPE_GANG && orgType != ORG_TYPE_MAFIA)
    {
        MruMessageFail(playerid, "Dost�pne typy organizacji: 1 - Gang, 2 - Mafia.");
        return 1;
    }

    new org = GetFreeOrgSlot();
    if(org <= 0)
    {
        MruMessageFail(playerid, "Aktualnie nie ma wolnego slotu na organizacje.");
        return 1;
    }

    if(GetPlayerFraction(playerid) != 0 || GetPlayerOrg(playerid) != 0 || GetPlayerJob(playerid) != 0)
    {
        MruMessageFail(playerid, "By zosta� liderem organizacji nie mo�esz by� we frakcji/organizacji/pracy.");
        return 1;
    }

    CreateOrganisation(org, name, color, orgType);
    InvitePlayerToOrg(playerid, org, MAIN_LEADER_RANK);

    ZabierzKase(playerid, CREATE_ORG_COST);
    TakeContraband(playerid, CREATE_ORG_CONTRABAND_COST);

    MruMessageGoodInfoF(playerid, "Gratulacje! Stworzy�e� now� organizacj� o nazwie \"%s\" i typie %s", name, OrgTypes[orgType]);
    MruMessageGoodInfo(playerid, "Aby zobaczy� dost�pne komendy wpisz /liderpomoc. Udanego liderownia!");
    return 1;
}

//end