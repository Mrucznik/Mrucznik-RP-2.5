//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ usss_info ]-----------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

CMD:usss(playerid, params[]) return cmd_usss_info(playerid, params);
CMD:usss_info(playerid, params[])
{
    new string[256];
    new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(!IsABOR(playerid))
        {
            sendErrorMessage(playerid, "Nie jeste� agentem USSS!");
            return 1;
        }
        if(PlayerInfo[playerid][pRank] < 3)
        {
            sendErrorMessage(playerid, "Musisz mie� 3 range aby tego u�ywa�!");
            return 1;
        }
        GetPlayerName(playerid, sendername, sizeof(sendername));
        if(isnull(params))
        {
            sendTipMessage(playerid, "U�yj (/usss)-info [tekst]");
            return 1;
        }
        if(PlayerInfo[playerid][pBP] >= 1)
        {
            format(string, sizeof(string), "Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
            sendTipMessage(playerid, string, TEAM_CYAN_COLOR);
            return 1;
        }
        SendClientMessageToAll(COLOR_WHITE, "|___________ United States Secret Service ___________|");
        format(string, sizeof(string), "Agent %s: %s", sendername, params);
        SendClientMessageToAll(COLOR_PURPLE, string);
    }
    return 1;
}


