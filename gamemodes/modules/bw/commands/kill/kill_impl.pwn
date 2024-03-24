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

    new message[128];
    new moneyLost = 1 + kaska[playerid] / 50;
    if(moneyLost < 1) 
    {
        sendTipMessage(playerid, "Jeste� tak biedny, �e nie Ci� nawet na �mier�.");
        return 1;
    }
    format(message, sizeof(message), "Czy na pewno chcesz u�mierci� (memory kill) swoj� posta�?\nStracisz %d$ ze swojego portfela.", moneyLost);
    ShowPlayerDialogEx(playerid, DIALOG_ID_KILL, DIALOG_STYLE_MSGBOX, "U�miercenie postaci", message, "Akceptuj", "Anuluj");
    return 1;
}

//end