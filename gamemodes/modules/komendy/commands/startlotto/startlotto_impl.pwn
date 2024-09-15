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
command_startlotto_Impl(playerid, params[256])
{
    new string[128];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pAdmin] >= 2000)
        {
            format(string, sizeof(string), "Nowo�ci lotto: Losowanie rozpocz�te.");
            OOCOff(COLOR_WHITE, string);
            new rand = true_random(80);
            if(rand < 77) { rand += 3; }
            Lotto(rand);

            format(string, sizeof(string), "CMD_Info: /startlotto u�yte przez %s [%d]", GetNickEx(playerid), playerid);
            SendCommandLogMessage(string);
	        Log(adminLog, INFO, "Admin %s u�y� /startlotto", GetPlayerLogName(playerid));
        }
        else
        {
            noAccessMessage(playerid);
            return 1;
        }
    }
	return 1;
}

//end
