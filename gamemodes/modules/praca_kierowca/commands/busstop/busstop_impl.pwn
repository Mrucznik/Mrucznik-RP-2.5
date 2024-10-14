//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  busstop                                                  //
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
// Data utworzenia: 13.10.2024


//

//------------------<[ Implementacja: ]>-------------------
command_busstop_Impl(playerid, route, busstop, action[32], param[128])
{
    if(PlayerInfo[playerid][pAdmin] != 5000)
    {
        noAccessMessage(playerid);
        return 1;
    }

    if(route < 0 || route >= MAX_BUS_ROUTES)
    {
        MruMessageFail(playerid, "ID trasy od 0 do "#MAX_BUS_ROUTES);
        return 1;
    }

    if(busstop < 0 || busstop >= MAX_BUS_STOPS)
    {
        MruMessageFail(playerid, "ID przystanku autobusowego od 0 do "#MAX_BUS_STOPS);
        return 1;
    }

    if(strcmp(action, "describe", true) == 0)
    {
        if(BusStops[route][busstop][bs_Active])
        {
            MruMessageGoodInfo(playerid, sprintf("Przystanek %s, Dzielnica: %s, Checkpoint: %.4f, %.4f, %.4f, Obiekt: %.4f, %.4f, %.4f", 
                BusStops[route][busstop][bs_Name], BusStops[route][busstop][bs_District],
                BusStops[route][busstop][bs_StopX], BusStops[route][busstop][bs_StopY], BusStops[route][busstop][bs_StopZ],
                BusStops[route][busstop][bs_ObjectX], BusStops[route][busstop][bs_ObjectY], BusStops[route][busstop][bs_ObjectZ]));

            SetPlayerCheckpoint(playerid, BusStops[route][busstop][bs_StopX], BusStops[route][busstop][bs_StopY], BusStops[route][busstop][bs_StopZ], 4.0);
        }
        else
        {
            MruMessageBadInfo(playerid, "Brak przystanku pod tym id. Edytuje jego nazw� i pozycj� aby go stworzy�.");
        }
        return 1;
    }
    else if(strcmp(action, "goto", true) == 0)
    {
        if(BusStops[route][busstop][bs_Active])
        {
            SetPlayerPos(playerid, BusStops[route][busstop][bs_StopX], BusStops[route][busstop][bs_StopY], BusStops[route][busstop][bs_StopZ]);
            MruMessageGoodInfo(playerid, sprintf("Teleportowa�e� si� do przystanku nr %d trasy %s", busstop, BusRoute[route][br_Name]));
        }
        else
        {
            MruMessageBadInfo(playerid, "Brak przystanku pod tym id. Edytuje jego nazw� i pozycj� aby go stworzy�.");
        }
        return 1;
    }
    else if(strcmp(action, "place", true) == 0)
    {
        new type = strval(param);
        if(isnull(param))
        {
            sendTipMessage(playerid, "U�yj: /busstop place [typ "#BUS_STOP_TYPE_BIG" - du�y przystanek, "#BUS_STOP_TYPE_SMALL" - ma�y przystanek, "#BUS_STOP_TYPE_SMALL_BENCH" - ma�y przystanek z �aweczk�, inne = model]");
            return 1;
        }
        BusStops[route][busstop][bs_Type] = type;
        SetPVarInt(playerid, "placing-bus-stop", 1);
        SetPVarInt(playerid, "placing-bus-stop-route", route);
        SetPVarInt(playerid, "placing-bus-stop-id", busstop);
        SetPVarInt(playerid, "placing-bus-stop-type", type);
        MruMessageGoodInfo(playerid, "Teraz strzel w miejsce, gdzie chcesz by postawi� przystanek.");
        return 1;
    }
    else if(strcmp(action, "name", true) == 0)
    {
        format(BusStops[route][busstop][bs_Name], MAX_BUS_STOP_NAME, "%s", param);
        MruMessageGoodInfo(playerid, sprintf("Zmieni�e� nazw� przystanku na %s", param));
        BusStops[route][busstop][bs_Active] = 1;
        RecreateBusStops(route);
        Streamer_Update(playerid);
    }
    else if(strcmp(action, "district", true) == 0)
    {
        format(BusStops[route][busstop][bs_District], MAX_BUS_STOP_DISTRICT, "%s", param);
        MruMessageGoodInfo(playerid, sprintf("Zmieni�e� dzielnic� przystanku na %s", param));
        BusStops[route][busstop][bs_Active] = 1;
        RecreateBusStops(route);
        Streamer_Update(playerid);
    }
    else if(strcmp(action, "checkpoint", true) == 0)
    {
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        BusStops[route][busstop][bs_StopX] = x;
        BusStops[route][busstop][bs_StopY] = y;
        BusStops[route][busstop][bs_StopZ] = z;
    
        SetPlayerCheckpoint(playerid, x, y, z, 4.0);
        MruMessageGoodInfo(playerid, "Checkpoint zapisany w miejscu, w kt�rym stoisz.");
    }
    else if(strcmp(action, "delete", true) == 0)
    {
        new tmp[MAX_BUS_STOPS][eBusStop];
        for(new i; i<MAX_BUS_STOPS; i++)
        {
            for(new j; j < eBusStop; j++)
            {
                tmp[i][j] = BusStops[route][i][j];
            }
        }
        new substract = 0;
        for(new i; i < MAX_BUS_STOPS; i++)
        {
            if(i == busstop)
            {
                substract = 1;
                continue;
            }
            for(new j; j < eBusStop; j++)
            {
                BusStops[route][i - substract][j] = tmp[i][j];
            }
        }
        RecreateBusStops(route);
        Streamer_Update(playerid);
        MruMessageGoodInfo(playerid, sprintf("Usun��e� przystanek nr %d", busstop));
    }
    else if(strcmp(action, "insert", true) == 0)
    {
        new tmp[MAX_BUS_STOPS][eBusStop];
        for(new i; i<MAX_BUS_STOPS; i++)
        {
            for(new j; j < eBusStop; j++)
            {
                tmp[i][j] = BusStops[route][i][j];
            }
        }
        new substract = 0;
        for(new i; i < MAX_BUS_STOPS; i++)
        {
            if(i == busstop)
            {
                BusStops[route][i][bs_Active] = 1;
                format(BusStops[route][i][bs_Name], MAX_BUS_STOP_NAME, "TODO");
                format(BusStops[route][i][bs_District], MAX_BUS_STOP_NAME, "TODO");
                substract = 1;
                continue;
            }
            for(new j; j < eBusStop; j++)
            {
                BusStops[route][i][j] = tmp[i - substract][j];
            }
        }
        RecreateBusStops(route);
        Streamer_Update(playerid);
        MruMessageGoodInfo(playerid, sprintf("Doda�e� nowy slot na przystanek mi�dzy przystankiem %d a %d", busstop, busstop + 1));
    }
    else
    {
        MruMessageFail(playerid, "Niepoprawna akcja.");
        RunCommand(playerid, "/busstop",  "");
        return 1;
    }

    SaveBusRoute(route);
    return 1;
}

//end