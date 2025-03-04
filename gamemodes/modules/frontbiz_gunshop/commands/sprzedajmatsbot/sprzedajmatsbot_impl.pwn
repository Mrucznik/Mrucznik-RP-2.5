//-----------------------------------------------<< Source >>------------------------------------------------//
//                                              sprzedajmatsbot                                              //
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
// Autor: wiger
// Data utworzenia: 18.02.2024


//

//------------------<[ Implementacja: ]>-------------------
command_sprzedajmatsbot_Impl(playerid, mats)
{
    if(mats < 5000 || mats > 50000) 
    {
        sendErrorMessage(playerid, "Zakres od 5 000 do 50 000!");
        return 1;
    }

    if(PlayerInfo[playerid][pMats] < mats) 
    {
        sendErrorMessage(playerid, "Nie masz tyle materia��w!");
        return 1;
    }

    new bizId = IsAtFrontBusinessInteriorType(playerid, FRONT_BIZ_TYPE_GUNSHOP);
    if(bizId == -1)
    {
        MruMessageFail(playerid, "By sprzeda� materia�y botowi, musisz znajdowa� si� w gunshopie.");
        return 1;
    }

    new gsid = bizId - GUNSHOP_FIRST_ID;
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, GS_MatsBot[gsid][0], GS_MatsBot[gsid][1], GS_MatsBot[gsid][2]))
    {
        MruMessageFail(playerid, "Znajdujesz si� za daleko od bota sprzedawcy broni.");
        return 1;
    }

    if(GS_MatsCena[gsid] == 0) 
    {
        sendErrorMessage(playerid, "Sprzeda� u bota jest wy��czona!");
        return 1;
    }

    new org = FrontBusiness[bizId][Owner];
    new cena = GS_MatsCena[gsid] * mats;
    if(Sejf_Rodziny[org] < cena) 
    {
        sendErrorMessage(playerid, "W sejfie nie ma tyle pieni�dzy!");
        return 1;
    }

    PlayerInfo[playerid][pMats] -= mats;
    DajKase(playerid, cena);
    SejfR_AddMats(org, mats);
    SejfR_Add(org, -cena);

    MruMessageGoodInfo(playerid, sprintf("Sprzeda�e� botowi %i mats�w za $%i", mats, cena));
    SendOrgMessage(org, TEAM_AZTECAS_COLOR, sprintf("Diler broni %s sprzeda� botowi %i mats za $%i, nowy stan sejfu: %d$ i %d materia��w", 
        GetNick(playerid), mats, cena, Sejf_Rodziny[org], Rodzina_Mats[org]));
    Log(payLog, INFO, "Gracz %s sprzeda� botowi %d mats za $%d", GetPlayerLogName(playerid),  mats, cena);
    return 1;
}

//end