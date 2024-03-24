//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                    kill                                                   //
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
// Data utworzenia: 23.03.2024


//

//------------------<[ Implementacja: ]>-------------------
command_kill_Impl(playerid)
{
    if(PlayerInfo[playerid][pInjury] == 0) {
        sendTipMessage(playerid, "Twoja posta� nie jest ranna, nie mo�esz u�y� tej komendy.");
        return 1;
    }

    new message[256];
    new moneyLost = 1 + kaska[playerid] / 50;
    if(moneyLost < 1) 
    {
        sendTipMessage(playerid, "Jeste� tak biedny, �e nie Ci� nawet na �mier�.");
        return 1;
    }
    format(message, sizeof(message), "Czy na pewno chcesz u�mierci� (memory kill) swoj� posta�?\nStracisz "INCOLOR_PANICRED"%d$"INCOLOR_DIALOG" ze swojego portfela.", moneyLost);
    ShowPlayerDialogEx(playerid, DIALOG_ID_KILL, DIALOG_STYLE_MSGBOX, "U�miercenie postaci", message, "Akceptuj", "Anuluj");
    return 1;
}

command_kill_accept(playerid)
{
    new moneyLost = 1 + kaska[playerid] / 50;
    ZabierzKase(playerid, moneyLost);
    Log(payLog, INFO, "%s upu�ci� %d$ na skutek �mierci", GetPlayerLogName(playerid), moneyLost);

    new string[128];
    format(string, sizeof(string), "umiera na wskutek odniesionych obra�e� i upuszcza %d$ ((MemoryKill))", moneyLost);
    ChatMe(playerid, string);

    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    new int =  GetPlayerInterior(playerid);
    new vw = GetPlayerVirtualWorld(playerid);
    SetTimerEx("DropDeathMoneyTimer", 5000, false, "ddfffdd", playerid, moneyLost, x, y, z - 0.4, int, vw);

    SetPVarInt(playerid, "kill-bw", 1);
    SetPlayerHealth(playerid, 0.0);
}

forward DropDeathMoneyTimer(playerid, moneyLost, Float:x, Float:y, Float:z, int, vw);
public DropDeathMoneyTimer(playerid, moneyLost, Float:x, Float:y, Float:z, int, vw)
{
    new wl = moneyLost / 200000;
    CreateMoneyPickup(x, y, z, int, vw, moneyLost, wl, PlayerInfo[playerid][pUID]);
    DeletePVar(playerid, "kill-bw");
    ZespawnujGraczaSzpitalBW(playerid);
}

//end