//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ losowypozar ]----------------------------------------------//
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

YCMD:losowypozar(playerid, params[], help)
{
	if (PlayerInfo[playerid][pAdmin] >= 15 || PlayerInfo[playerid][pAdmin] == 7 || IsAScripter(playerid))
	{
	    DeleteAllFire();
	    AktywujPozar();
	    sendTipMessage(playerid, "Aktywowa�e� losowy po�ar dla LSFD!");
	    sendTipMessage(playerid, "Aby usun�� po�ar wpisz /usunpozar !");
	    
	    new string[128];
        format(string, 128, "CMD_Info: /losowypozar u�yte przez %s [%d]", GetNick(playerid), playerid);
        SendCommandLogMessage(string);
		Log(adminLog, INFO, "Admin %s u�y� /losowypozar", GetPlayerLogName(playerid));
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}
