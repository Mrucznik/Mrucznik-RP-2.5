//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ cbradio ]------------------------------------------------//
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

CMD:cb(playerid, params[]) return cmd_cbradio(playerid, params);
CMD:cb_radio(playerid, params[]) return cmd_cbradio(playerid, params);
CMD:cbradio(playerid, params[])
{
	if(PlayerInfo[playerid][pCB] == 0)
	{
		sendErrorMessage(playerid, "Nie masz CB-Radia");
		return 1;
	}
	if(GetPlayerVehicleID(playerid))
	{
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj /cb [text]");
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Dobry admin nie powinien robi� OOC w IC! Pisz poprzez /b [tre��]");
			return 1;
		}
		new string[128];
		if(PlayerInfo[playerid][pBP] >= 1)
		{
			format(string, sizeof(string), "Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
			sendTipMessage(playerid, string);
			return 1;
		}
		foreach(Player, i)
		{
			if(GetPlayerVehicleID(i) || adminpodgladcb[i] == 1)
			{
				if(PlayerInfo[i][pCB] == 1)
				{
					if(cbradijo[i] == 0)
					{
						format(string, sizeof(string), "%s m�wi przez CB-Radio: %s", GetNick(playerid, true), params);
						SendClientMessage(i,0xff00ff, string);
					}
				}
			}
		}
	}
	else
	{
        sendErrorMessage(playerid, "Nie jeste� w aucie");
	}
	return 1;
}
