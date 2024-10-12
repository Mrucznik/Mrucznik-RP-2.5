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
command_zmienskin_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if (IsAHA(playerid) || IsAPolicja(playerid) && (PlayerInfo[playerid][pMember] != 3 || PlayerInfo[playerid][pLider] != 3))
        {
            if((PlayerInfo[playerid][pRank] >= 1 && IsAHA(playerid)) || (PlayerInfo[playerid][pRank] >= 2 && IsAPolicja(playerid)))
            {
                if(GetPVarInt(playerid, "IsAGetInTheCar") == 1)
                {
                    sendErrorMessage(playerid, "Jeste� podczas wsiadania - odczekaj chwile. Nie mo�esz znajdowa� si� w poje�dzie.");
                    return 1;
                }
                ShowPlayerDialogEx(playerid, DIALOG_HA_ZMIENSKIN(0), DIALOG_STYLE_LIST, "Zmiana ubrania", DialogListaFrakcji(), "Start", "Anuluj");
            } 
            else if(IsAHA(playerid))
            {
                sendTipMessage(playerid, "Dozwolone tylko dla rangi 1 lub wi�kszych");
            }
            else
            {
                sendTipMessage(playerid, "Dozwolone tylko dla rangi 2 lub wi�kszych");
            }
        } 
        else
        {
            sendTipMessage(playerid, "Tylko dla Hitman Agency i FBI/LSPD.");
        }
    }
    return 1;
}

//end
