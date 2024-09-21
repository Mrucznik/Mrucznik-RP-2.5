//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   zrzut                                                   //
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
// Data utworzenia: 04.05.2024


//

//------------------<[ Implementacja: ]>-------------------
command_zrzut_Impl(playerid)
{
    new vehicleID = GetPlayerVehicleID(playerid);
    if(!IsAWodolot(vehicleID))
    {
        MruMessageFail(playerid, "Musisz znajdowa� si� w wodolocie by zrzuci� kontraband�.");
        return 1;
    }

    new actionID = GetPlayerSmugglingActionID(playerid);
    if(actionID == -1)
    {
        MruMessageFail(playerid, "Nie organizujesz akcji przemytniczej.");
        return 1;
    }

    new role = GetPlayerSmugglingRole(playerid);
    if(role != SMUGGLING_ROLE_INITIATOR)
    {
        MruMessageFail(playerid, "Nie jeste� inicjatorem akcji przemytniczej - nie mo�esz zrzuca� paczek z kontraband�");
        return 1;
    }

    if(SmugglingAction[actionID][s_enableContrabandDrop] < 1)
    {
        MruMessageFail(playerid, "Musisz przelecie� przez "#CHECKPOINT_PER_DROP" checkpointy by m�c zrzuci� 1 paczk� kontrabandy.");
        return 1;
    }

    new driverid = GetVehicleDriverID(vehicleID);
    if(GetPlayerSmugglingRole(driverid) != SMUGGLING_ROLE_DRIVER || PlayerInfo[driverid][pUID] != SmugglingAction[actionID][s_driverUID])
    {
        MruMessageFail(playerid, "Gracz kt�ry jest kierowc� wodolotu nie zosta� wybrany jako kierowca w tej akcji przemytniczej.");
        return 1;
    }


    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    if(z <= 20.0)
    {
        MruMessageFail(playerid, "Jeste� za nisko, powiec kierowcy by wzlecia� wy�ej.");
        return 1;
    }

    if(z >= 60.0)
    {
        MruMessageFail(playerid, "Jeste� za wysoko, powiedz kierowcy by zni�y� lot");
        return 1;
    }

    ChatMe(playerid, "wyrzuca z wodolotu paczk� z kontraband�");
    SmugglingAction[actionID][s_enableContrabandDrop] = 0;
    SmugglingAction[actionID][s_packagesToDrop]--;

    GetPosBehindVehicle(vehicleID, x, y, z, 1.0);
    CreateContrabandDrop(actionID, x, y, z, SmugglingAction[actionID][s_packagesToDrop]);
    PlayerPlaySound(playerid, 1039, 0, 0, 0);

    if(SmugglingAction[actionID][s_packagesToDrop] == 0)
    {
        // last package dropped, start gather stage
        SmugglingAction[actionID][s_stage] = SMUGGLING_STAGE_GATHER;
        MruMessageGoodInfo(playerid, "To by�a ostatnia paczka kontrabandy, teraz udaj si� do punktu zboru i czekaj a� Twoi wsp�lnicy zbior� wszystkie paczki.");
        SendSmugglingCrewMessage(playerid, TEAM_AZTECAS_COLOR, sprintf("%s zrzuci� ostatni� paczk� z kontraband�.", GetNick(playerid)));
    }
    else 
    {
        MruMessageGoodInfo(playerid, "Zrzuci�e� paczk� kontrabandy!");
        SendSmugglingCrewMessage(actionID, TEAM_AZTECAS_COLOR, sprintf("%s zrzuci� paczk� z kontraband�.", GetNick(playerid)));
        ShowSmugglingCheckpoint(playerid, actionID);
        foreach(new i : Player)
        {
            if(PlayerInfo[playerid][pUID] == SmugglingAction[actionID][s_driverUID])
            {
                ShowSmugglingCheckpoint(i, actionID);
            }
        }
    }
    return 1;
}

//end