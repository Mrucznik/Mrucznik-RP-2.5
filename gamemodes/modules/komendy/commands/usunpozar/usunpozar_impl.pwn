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
command_usunpozar_Impl(playerid)
{
    if (PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
	{
	    DeleteAllFire();
	    sendTipMessage(playerid, "Usun��e� aktywne po�ary!");
	    sendTipMessage(playerid, "Aby wywo�a� losowy po�ar wpisz /losowypozar !");
	    
	    new string[128];
        format(string, 128, "CMD_Info: /usunpozar u�yte przez %s [%d]", GetNickEx(playerid), playerid);
        SendCommandLogMessage(string);
		Log(adminLog, INFO, "Admin %s u�y� /usunpozar", GetPlayerLogName(playerid));
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}

//end
