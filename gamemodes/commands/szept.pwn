//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ szept ]-------------------------------------------------//
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

CMD:cicho(playerid, params[]) return cmd_szept(playerid, params);
CMD:s(playerid, params[]) return cmd_szept(playerid, params);
CMD:szept(playerid, params[])
{
	
	if(IsPlayerConnected(playerid))
	{
		if(gPlayerLogged[playerid] == 0)
		{
			return 1;
		}
		if(PlayerInfo[playerid][pMuted] == 1)
		{
			sendTipMessage(playerid, "Jeste� uciszony! Nie mo�esz m�wi�"); 
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Dobry admin nie powinien robi� OOC w IC! U�yj /b [tre��]"); 
			return 1;
		}
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj /(l)ocal [tekst]");
			return 1;
		}
		
		PlayerTalkIC(playerid, params, "szepcze", 5.0,  true); 		
	}
	return 1;
}

