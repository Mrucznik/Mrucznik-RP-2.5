//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  podszyj                                                  //
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
// Data utworzenia: 07.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_podszyj_Impl(playerid)
{
    if(GetPlayerFraction(playerid) != FRAC_FBI)
    {
        noAccessMessage(playerid);
        return 1;
    }

    if(OnDuty[playerid] != 1)
    {
        MruMessageFail(playerid, "Musisz by� na s�u�bie (/duty) by u�y� tej komendy.");
        return 1;
    }

    if(!IsAtDutyPlace(playerid))
    {
        MruMessageFail(playerid, "Nie jeste� w miejscu, gdzie mo�esz si� podszy� (to samo miejsce gdzie bierzesz /duty).");
        return 1;
    }

    if(SecretAgent[playerid] > 0)
    {
        SecretAgent[playerid] = 0;
        SetPlayerSkinEx(playerid, PlayerInfo[playerid][pUniform]);
        SetPlayerToTeamColor(playerid);
        MruMessageGoodInfo(playerid, "Przesta�e� si� podszywa�.");
    }
    else
    {
        new skin;
        if(PlayerInfo[playerid][pSex] == 1)
        {
            new skins[] = {78, 79, 239, 134, 135, 136, 137, 230};
            skin = skins[random(sizeof(skins))];
        }
        else
        {
            new skins[] = {77, 129, 130, 232, 231};
            skin = skins[random(sizeof(skins))];
        }

        SecretAgent[playerid] = 6;
        SetPlayerSkinEx(playerid, skin);
        SetPlayerColor(playerid,TEAM_HIT_COLOR);
        MruMessageGoodInfo(playerid, "Podszy�e� si� pod �ula. Mo�esz teraz inflitrowa� diler�w narkotyk�w i broni.");
    }
    return 1;
}

//end