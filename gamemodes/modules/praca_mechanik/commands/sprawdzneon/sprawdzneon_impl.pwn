//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                sprawdzneon                                                //
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
// Data utworzenia: 01.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_sprawdzneon_Impl(playerid, giveplayerid)
{
	if(PlayerInfo[playerid][pJob] != 7)
    {
        MruMessageFail(playerid, "Nie jeste� mechanikiem.");
        return 1;
    }

    if(GetDistanceBetweenPlayers(playerid, giveplayerid) > 8)
    {
        MruMessageFail(playerid, "Gracz jest za daleko.");
        return 1;
    }

    if(SpamujeMechanik[playerid] != 0)
    {
        MruMessageFail(playerid, "Poczekaj 10 sekund przed ponownym u�yciem komendy.");
        return 1;
    }

    if(GetPlayerJobSkill(playerid, JOB_MECHANIC) < 3)
    {
        MruMessageFail(playerid, "Musisz mie� 3 skill mechanika aby sprawdza� neony.");
        return 1;
    }

    if(!IsPlayerInAnyVehicle(giveplayerid))
    {
        MruMessageFail(playerid, "Gracz nie jest w poje�dzie.");
        return 0;
    }

    ZabierzKase(playerid, 10000);
    ChatMe(playerid, "zagl�da pod podwozie w poszukiwaniu neon�w");

    new string[MAX_MESSAGE_LENGHT];
    new kolorneonu[16] = "";
    new veh_id = GetPlayerVehicleID(giveplayerid);
    new cNeon = CarData[VehicleUID[veh_id][vUID]][c_Neon];
    if(cNeon != 0)
    {
        if(cNeon == 18652)
        {
            kolorneonu = "bia�e";
        }
        else if(cNeon == 18650)
        {
                kolorneonu = "��te";
        }
        else if(cNeon == 18649)
        {
            kolorneonu = "zielone";
        }
        else if(cNeon == 18648)
        {
            kolorneonu = "niebieskie";
        }
        else if(cNeon == 18647)
        {
            kolorneonu = "czerwone";
        }
        else if(cNeon == 18651)
        {
            kolorneonu = "r�owe";
        }
        format(string, sizeof(string), "Mechanik %s: Pojazd %s posiada %s neony", GetNick(playerid), VehicleNames[GetVehicleModel(veh_id)-400], kolorneonu);
    }   
    else
    {
        format(string, sizeof(string), "Mechanik %s: Pojazd %s nie posiada neon�w", GetNick(playerid), VehicleNames[GetVehicleModel(veh_id)-400]);
    }
    ProxDetector(10.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);

    MruMessageGoodInfoF(playerid, "Pomog�e� %s w sprawdzeniu neon�w!", GetNick(giveplayerid));
    MruMessageGoodInfoF(giveplayerid, "%s pom�g� Ci w sprawdzeniu neon�w!", GetNick(playerid));
   
    IncreasePlayerJobSkill(playerid, JOB_MECHANIC, 1);
    
    SetTimerEx("AntySpamTimer",10000,0,"d",playerid);
    AntySpam[playerid] = 1;
    return 1;
}

//end