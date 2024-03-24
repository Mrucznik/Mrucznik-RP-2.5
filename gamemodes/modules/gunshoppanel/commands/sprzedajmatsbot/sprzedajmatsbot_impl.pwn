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
    if(!IsASklepZBronia(playerid))
        return noAccessMessage(playerid);
    if(mats < 5000 || mats > 50000) {
        sendErrorMessage(playerid, "Zakres od 5 000 do 50 000!");
        return 1;
    }
    if(PlayerInfo[playerid][pMats] < mats) {
        sendErrorMessage(playerid, "Nie masz tyle materia��w!");
        return 1;
    }
    new orgid = GetPlayerOrg(playerid);
    new gsid = orgid-21;
    if(!PlayerToPoint(2.0, playerid, GS_MatsBot[gsid][0], GS_MatsBot[gsid][1], GS_MatsBot[gsid][2]) || GetPlayerVirtualWorld(playerid) != GS_MatsBotVw[gsid]) {
        sendErrorMessage(playerid, "Nie stoisz przy bocie!");
        return 1;
    }
    if(GS_MatsCena[gsid] == 0) {
        sendErrorMessage(playerid, "Sprzeda� u bota jest wy��czona!");
        return 1;
    }
    new cena = GS_MatsCena[gsid] * mats;
    if(Sejf_Rodziny[orgid] < cena) {
        sendErrorMessage(playerid, "W sejfie nie ma tyle pieni�dzy!");
        return 1;
    }
    PlayerInfo[playerid][pMats] -= mats;
    DajKase(playerid, cena);
    SejfR_AddMats(orgid, mats);
    SejfR_Add(orgid, -cena);
    new string[128];
    format(string, 128, "* Sprzeda�e� botowi %i mats�w za $%i", mats, cena);
    SendClientMessage(playerid, COLOR_BLUE, string);
    format(string, 128, "Kurier %s sprzeda� botowi %i mats za $%i", GetNickEx(playerid), mats, cena);
    switch(orgid) {
        case 21:
            SendDiscordMessage(DISCORD_LOG_GSWF, string);
        case 22:
            SendDiscordMessage(DISCORD_LOG_GSCM, string);
        case 23:
            SendDiscordMessage(DISCORD_LOG_GSLS, string);
    }
    return 1;
}

//end