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
command_kamizelka_Impl(playerid)
{
    new string[128];
    new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        GetPlayerName(playerid, sendername, sizeof(sendername));
        if(IsAPolicja(playerid) || PlayerInfo[playerid][pMember] == 7 || PlayerInfo[playerid][pLider] == 7)
        {
            if (IsAtDutyPlace(playerid))
            {
                if(OnDuty[playerid] == 1)
                {
                    if(kaska[playerid] < 10000) return sendErrorMessage(playerid, "Nie sta� ci� na kamizelke");
                    ZabierzKase(playerid, 10000);
                    sendTipMessageEx(playerid, COLOR_P@, "Zap�aci�e� $10000 za kamizelk� - wpisz /dopasuj aby dopasowa�."); 
                    format(string, sizeof(string), "* %s wyci�ga z szafki i ubiera kamizelk�.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    RunCommand(playerid, "/dopasuj",  "kamizelke");
                    SetPlayerArmour(playerid, 90);
                }
                else
                {
                    sendTipMessage(playerid, "Nie jeste� na s�u�bie!");
                }
            }
            else
            {
                sendTipMessage(playerid, "Nie jeste� w szatni!");
                return 1;
            }
        }
        else
        {
            sendErrorMessage(playerid, "Nie jeste� z PD!");
            return 1;
        }
    }
    return 1;
}

//end
