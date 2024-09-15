//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                     a                                                     //
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
// Data utworzenia: 15.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_app_Impl(playerid)
{
    if(GetPVarInt(playerid, "pozwolenie-oferuje") == 999) return sendErrorMessage(playerid, "Nikt nie oferowa� Ci pozwolenia prawniczego!");
    new ofertaod = GetPVarInt(playerid, "pozwolenie-oferuje");
    if(!IsPlayerConnected(ofertaod)) return sendErrorMessage(playerid, "Osoba, kt�ra oferowa�a Ci pozwolenie wysz�a z serwera!");
    if(GetPVarInt(ofertaod, "pozwolenie-oferujeDla") != playerid) return sendErrorMessage(playerid, "Osoba, kt�ra oferowa�a Ci pozwolenie wysz�a z serwera!");
    if(kaska[playerid] < CENA_POZWOLENIE) return sendErrorMessage(playerid, "Nie sta� Cie na pozwolenie prawnicze");
    new string[128];
    format(string, sizeof(string), "%s akceptowa� Twoj� ofert� pozwolenia prawiczego, otrzymujesz $"#CENA_POZWOLENIE_ZYSK, GetNick(playerid));
    sendTipMessage(ofertaod, string, COLOR_LIGHTBLUE);
    format(string, sizeof(string), "Otrzymujesz pozwolenie prawnicze od %s", GetNick(ofertaod));
    sendTipMessage(playerid, string, COLOR_LIGHTBLUE);
    format(string, sizeof(string), "* %s da� zgod� na uwolnienie wi�nia prawnikowi %s", GetNick(ofertaod), GetNick(playerid));
    SendRadioMessage(1, COLOR_PANICRED, string);
    SendRadioMessage(2, COLOR_PANICRED, string);
    SendRadioMessage(3, COLOR_PANICRED, string);
    ZabierzKase(playerid, CENA_POZWOLENIE);
    DajKase(ofertaod, CENA_POZWOLENIE_ZYSK);
    Log(payLog, INFO, "%s kupi� pozwolenie prawnicze od %s za "#CENA_POZWOLENIE" zysk: "#CENA_POZWOLENIE_ZYSK, GetPlayerLogName(playerid), GetPlayerLogName(ofertaod));
    SetPVarInt(playerid, "pozwolenie-oferuje", 999);
    Sejf_Add(PlayerInfo[ofertaod][pMember], CENA_POZWOLENIE_SEJF);
    ApprovedLawyer[playerid] = 1;
    Log(payLog, INFO, "%s da� zgod� prawnicz� %s", GetPlayerLogName(ofertaod), GetPlayerLogName(playerid));
    return 1;
}

//end
