//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  przemyt                                                  //
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
// Data utworzenia: 31.03.2024


//

//------------------<[ Implementacja: ]>-------------------
command_przemyt_Impl(playerid)
{
    if(GetPlayerJob(playerid) != JOB_SMUGGLER)
    {
        MruMessageFail(playerid, "Nie jeste� przemytnikiem.");
        return 1;
    }

    if(!IsAPrzestepca(playerid))
    {
        MruMessageFail(playerid, "Nie jeste� w organizacji przest�pczej, tylko organizacje przest�pcze mog� organizowa� przemyt.");
        return 1;
    }

    if(IsPlayerSmuggling(playerid))
    {
        new actionID = GetPlayerSmugglingActionID(playerid);
        if(actionID == -1)
        {
            MruMessageError(playerid, "Nie uda�o si� pobra� ID akcji przemytniczej. Zg�o� b��d adminom.");
            return 1;
        }

        switch(SmugglingAction[actionID][SmugglingStage])
        {
            case SMUGGLING_STAGE_PICKUP:
            {
                return przemyt_StagePickup(playerid, actionID);
            }
            case SMUGGLING_STAGE_FLY:
            {
                MruMessageInfo(playerid, "Musisz teraz dolecie� do punktu kontrolnego nad Prawn Island, Vice City");
                return 1;
            }
            case SMUGGLING_STAGE_DROP:
            {
                // TODO: info 
                return przemyt_StageDrop(playerid, actionID);
            }
            case SMUGGLING_STAGE_GATHER:
            {
                // TODO: info
                return przemyt_StageGather(playerid, actionID);
            }
            default:
            {
                MruMessageError(playerid, "B��d - zg�o� go Mrucznikowi.");
            }
        }
        return 1;
    }

    ChatMe(playerid, "wyci�ga telefon i dzwoni um�wi� akcj� przemytnicz�");

    new hour,minute,second;
    gettime(hour, minute, second);
    if(hour < 18 || hour > 23)
    {
        SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): nie ma dost�pnych przemyt�w w tym momencie. Zadzwo� mi�dzy 18 a 23.");
        SendClientMessage(playerid, COLOR_GRAD2, "Marcepan_Marks roz��czy� si�.");
        return 1;
    }

    if(SmugglingActionsCount >= SMUGGLING_ACTIONS_PER_DAY)
    {
        SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): przemycili�my ju� zbyt du�o dzisiejszego dnia. Musimy przystopowa�, by nikt si� nie po�apa�.");
        SendClientMessage(playerid, COLOR_GRAD2, "Marcepan_Marks roz��czy� si�.");
        return 1;
    }

    if(!(IsPlayerAtViceCityMainland(playerid) && GetPlayerInterior(playerid) == 0 && GetPlayerVirtualWorld(playerid) == 0))
    {
        SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): Tw�j telefon mo�e znajdowa� si� na pods�uchu!");
        SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): Zadzwo� ustali� szczeg�y gdy b�dziesz na wyspie Mainland w Vice City!");
        SendClientMessage(playerid, COLOR_GRAD2, "Marcepan_Marks roz��czy� si�.");
        return 1;
    }

    new players;
    foreach(new i : Player)
    {
        if(IsAPolicja(i) || GetPlayerJob(i) == JOB_SMUGGLER || GetPlayerJob(i) == JOB_LOWCA)
        {
            players++;
        }
    }
    if(players < 3)
    {
        SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): niestety, ma�y ruch w interesie, nie ma z kim organizowa� akcji przemytniczych.");
        SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): zadzwo�, gdy w mie�cie b�dzie wi�cej ruchu. ((minimum 3 graczy z prac� �owcy/przemytnika/policjanta na serwerze))");
        SendClientMessage(playerid, COLOR_GRAD2, "Marcepan_Marks roz��czy� si�.");
        return 1;
    }

    SetPVarInt(playerid, "smuggling", 1);
    MruMessageInfo(playerid, "Rozpocz��e� umawianie akcji przemytniczej, aby z niej zrezygnowa�, wpisz: /z");
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);

    SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): dobrze, �e dzwonisz. W�a�nie zmierzamy z kontraband� do Vice City.");
    SendClientMessage(playerid, COLOR_YELLOW, sprintf("Telefon (Marcepan_Marks): Sprzedajemy j� za %d$. Zainteresowany zorganizowaniem akcji przemytniczej?", SMUGGLING_COST));
    MruMessageInfo(playerid, "Wpisz 'tak' aby kontynuowa�.");
    return 1;
}


przemyt_StagePickup(playerid, actionID)
{
    if(GetPlayerSmugglingRole(playerid) != SMUGGLING_ROLE_INITIATOR)
    {
        MruMessageFail(playerid, "Tylko inicjator akcji przemytniczej mo�e odebra� kontraband� z punktu odbioru.");
        return 1;
    }

    if(!IsPlayerInRangeOfPoint(playerid, 15.0, SmugglingAction[actionID][PickupPointX], SmugglingAction[actionID][PickupPointY], SmugglingAction[actionID][PickupPointZ]))
    {
        MruMessageFail(playerid, "Nie jeste� przy punkcie odbioru kontrabandy.");
        return 1;
    }

    new vehicleID = GetPlayerVehicleID(playerid);
    if(!IsPlayerInAnyVehicle(playerid) || !IsAWodolot(vehicleID))
    {
        MruMessageFail(playerid, "Musisz znajdowa� si� w wodolocie by odebra� kontraband�.");
        return 1;
    }

    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        MruMessageFail(playerid, "Musisz by� pasa�erem wodolotu. Tw�j kierowca powinien nim kierowa�.");
        return 1;
    }

    new driverid = GetVehicleDriverID(vehicleID);
    if(GetPlayerSmugglingRole(driverid) != SMUGGLING_ROLE_DRIVER || PlayerInfo[driverid][pUID] != SmugglingAction[actionID][SmugglingDriverUID])
    {
        MruMessageFail(playerid, "Gracz kt�ry jest kierowc� wodolotu nie zosta� wybrany jako kierowca w tej akcji przemytniczej.");
        return 1;
    }

    DisablePlayerCheckpoint(playerid);
    DisablePlayerCheckpoint(driverid);

    StartSmugglingDrop(playerid, driverid, actionID);
    return 1;
}


przemyt_StageDrop(playerid, actionID)
{
    #pragma unused playerid, actionID // TODO
    return 1;
}

przemyt_StageGather(playerid, actionID)
{
    #pragma unused playerid, actionID // TODO
    return 1;
}

//end