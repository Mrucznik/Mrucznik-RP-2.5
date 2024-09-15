//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                sprzedajneon                                               //
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
// Data utworzenia: 02.06.2020


//

//------------------<[ Implementacja: ]>-------------------
sprzedajneon_akceptuj(playerid)
{
    new giveplayerid = GetPVarInt(playerid, "neon-mechid");
    new uid = GetPVarInt(playerid, "neon-uid");
    new cost = GetPVarInt(playerid, "neon-cost");
    new commission = GetPVarInt(playerid, "neon-commission");
    new vuid = GetPVarInt(playerid, "neon-vuid");

    if(uid == 0)
    {
        sendErrorMessage(playerid, "Nikt nie oferowa� Ci neonu.");
        return 1;
    }

    if(giveplayerid == INVALID_PLAYER_ID || !IsPlayerConnected(giveplayerid))
    {
        SendClientMessage(playerid, COLOR_GREY, "   Gracz, kt�ry oferowa� Ci neon, wyszed� z gry.");
        return 1;
    }

    if(uid != PlayerInfo[giveplayerid][pUID]) 
    {
        SendClientMessage(playerid, COLOR_GREY, "   Gracz, kt�ry oferowa� Ci neon, wyszed� z gry.");
        SetPVarInt(playerid, "neon-uid", 0);
        return 1;
    }

    if(!IsAtWarsztat(playerid)) 
    {
        sendErrorMessage(playerid, "Nie jeste� w warsztacie, w kt�rym mo�na montowa� tuning.");
        return 1;
    }

    if(!IsPlayerNear(playerid, giveplayerid))
    {
        sendErrorMessage(playerid, sprintf("Jeste� zbyt daleko od gracza %s", GetNick(giveplayerid)));
        return 1;
    }

    new pojazd = GetPlayerVehicleID(playerid);
    if(pojazd == INVALID_VEHICLE_ID)
    {
        sendErrorMessage(playerid, "Nie znajdujesz si� w poje�dzie.");
        return 1;
    }

    if(!IsCarOwner(playerid, pojazd))
    {
        sendErrorMessage(playerid, "Ten pojazd nie nale�y do Ciebie.");
        return 1;
    }

    if(vuid != VehicleUID[pojazd][vUID])
    {
        sendErrorMessage(playerid, "Nie jeste� w poje�dzie dla kt�rego oferowano Ci montowanie neonu.");
        return 1;
    }

    if(IsABoat(pojazd) || IsAPlane(pojazd) || IsABike(pojazd))
    {
        sendErrorMessage(playerid, "W helikoptrze/samolocie/�odzi/motorze nie mo�na zamontowa� neon�w.");
        return  1;
    }
    new model = GetVehicleModel(pojazd);

    if(kaska[playerid] < cost)
    {
        sendErrorMessage(playerid, "Nie sta� Ci� na neon!");
        return 1;
    }

    //body
    SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("* Akceptowa�e� kupno neon�w, koszt %d$.", cost));
    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, sprintf("* Gracz %s akceptowa� kupno neon�w, koszt %d$.", GetNick(playerid), cost));

    ZabierzKase(playerid, cost);
    DajKase(giveplayerid, commission);
    Log(payLog, INFO, "%s kupi� od %s neony za $%d (prowizja $%d) w poje�dzie %s", 
        GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), cost, commission, GetVehicleLogName(pojazd)
    );

    IloscAut[playerid] = VehicleUID[pojazd][vUID];
    ChatMe(giveplayerid, sprintf("montuje neony w %s.", GetNick(playerid), VehicleNames[model-400]));
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolorowe neony mo�e w��cza� tylko osoba z kontem premium! Bez konta premium, wszystkie neony b�d� koloru bia�ego.");
    ShowPlayerDialogEx(playerid, 1401, DIALOG_STYLE_LIST, "Wybierz kolor neonu", "{FFFFFF}Bia�y\n{DAA520}��ty\n{9ACD32}Zielony\n{0000FF}Niebieski\n{FF0000}Czerwony\n{C2A2DA}R�owy", "Wybierz", "");

    SetPVarInt(playerid, "neon-uid", 0);
    return 1;
}

command_sprzedajneon_Impl(playerid, giveplayerid, commission)
{
    if(!IsBusinessTypeOwnedByPlayerOrg(playerid, FRONT_BIZ_TYPE_SPRAY))
    {
        sendErrorMessage(playerid, "Aby sprzedawa� neony musisz by� w organizacji, kt�ra ma przej�ty biznes Pay N Spray.");
        return 1;
    }

    if(!IsAtWarsztat(playerid)) 
    {
        sendErrorMessage(playerid, "Nie jeste� w warsztacie, w kt�rym mo�na montowa� tuning.");
        return 1;
    }

    if(!IsPlayerNear(playerid, giveplayerid))
    {
        sendErrorMessage(playerid, sprintf("Jeste� zbyt daleko od gracza %s", GetNick(giveplayerid)));
        return 1;
    }
    
    new pojazd = GetPlayerVehicleID(giveplayerid);
    if(pojazd == INVALID_VEHICLE_ID)
    {
        sendErrorMessage(playerid, "Nie znajdujesz si� w poje�dzie.");
        return 1;
    }

    if(!IsCarOwner(giveplayerid, pojazd))
    {
        sendErrorMessage(playerid, "Ten pojazd nie nale�y do tego gracza.");
        return 1;
    }

    if(IsABoat(pojazd) || IsAPlane(pojazd) || IsABike(pojazd))
    {
        sendErrorMessage(playerid, "W helikoptrze/samolocie/�odzi/motorze nie mo�na zamontowa� neon�w.");
        return  1;
    }

    if(commission < 0) 
    {
        sendErrorMessage(playerid, "Prowizja musi by� wi�ksza ni� 0.");
        return 1;
    }

    new cost;
    if(CarData[VehicleUID[pojazd][vUID]][c_Neon] == 0)
    {
        cost = 3000000 + commission; // nie ma neonu
    }
    else
    {
        cost = 1000000 + commission; // ma neon
    }

    SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("* Oferujesz %s monta� neonu za $%d$ (prowizja %d$).", 
        GetNick(giveplayerid), cost, commission
    ));
    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, sprintf("* %s oferuje monta� neonu za %d$.", GetNick(playerid), cost));
    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "* Wpisz /akceptuj neon aby si� zgodzi�.");


    SetPVarInt(giveplayerid, "neon-mechid", playerid);
    SetPVarInt(giveplayerid, "neon-uid", PlayerInfo[playerid][pUID]);
    SetPVarInt(giveplayerid, "neon-cost", cost);
    SetPVarInt(giveplayerid, "neon-commission", commission);
    SetPVarInt(giveplayerid, "neon-vuid", VehicleUID[pojazd][vUID]);
    return 1;
}

//end