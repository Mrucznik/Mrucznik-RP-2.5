//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ tod ]--------------------------------------------------//
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

CMD:tod(playerid, params[])
{
	new string[128];

    if(IsPlayerConnected(playerid))
    {
		new hour;
		if( sscanf(params, "d", hour))
		{
			sendTipMessage(playerid, "U�yj /tod [czas] (0-23)");
			return 1;
		}


		if (PlayerInfo[playerid][pAdmin] >= 5 || IsAScripter(playerid))
		{
            SetWorldTime(hour);
            ServerTime = hour;
			
			format(string, sizeof(string), "Czas zmieniony na %d Godzine.", hour);
			BroadCast(COLOR_GRAD1, string);

            format(string, sizeof(string), "CMD_Info: /tod u�yte przez %s [%d]", GetNick(playerid), playerid);
            SendCommandLogMessage(string);
            CMDLog(string);
			if(GetPlayerAdminDutyStatus(playerid) == 1)
			{
				iloscInne[playerid] = iloscInne[playerid]+1;
			}
			foreach(Player, i)//Je�eli gracze s� w intkach 
			{
				if(GetPlayerVirtualWorld(i) != 0 || GetPlayerInterior(i) != 0)
				{
					SetInteriorTimeAndWeather(i);
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}

