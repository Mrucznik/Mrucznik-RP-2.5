//-----------------------------------------------<< Source >>------------------------------------------------//
//                                               setzonecontrol                                              //
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
// Data utworzenia: 06.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_setzonecontrol_Impl(playerid, zoneid, org)
{
    if(!IsAHeadAdmin(playerid) && !IsAScripter(playerid)) {
        noAccessMessage(playerid);
    }
    
    if(zoneid < 0) return sendTipMessageEx(playerid, COLOR_GRAD2, "Numer od 0");

    ZoneControl[zoneid] = org;
    MruMySQL_SetZoneControl(org, zoneid);

    foreach(new i : Player)
    {
        GangZoneHideForPlayer(i, zoneid);
        GangZoneShowForPlayer(i, zoneid, OrgInfo[org][o_Color] | 0x44);
    }

    SendClientMessage(playerid, COLOR_GRAD2, "SET.");
    return 1;
}

//end