//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ czyjtonumer ]----------------------------------------------//
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

CMD:czyjtonumer(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1)
	{
		new number, offline, string[128];
		if( sscanf(params, "dD(0)", number, offline))
		{
			sendTipMessage(playerid, "U�yj /czyjtonumer [numer] (0 - gracze online, 1 - wszystkie konta)");
			sendTipMessage(playerid, "FUNKCJA: Pokazuje do kogo nale�y numer telefonu.");
			return 1;
		}
		
		if(number <= 0)
		{
			sendErrorMessage(playerid, "Numer telefonu musi by� wi�kszy ni� 0!");
			return 1;
		}
		
		if(number == 555)
		{
			format(string, sizeof(string), "Osoby z numerem %d:", number);
			SendClientMessage(playerid, COLOR_WHITE, string);
			SendClientMessage(playerid, COLOR_WHITE, "Marcepan_Marks");
			return 1;
		}
		
		if(offline)
		{
			format(string, sizeof(string), "Osoby z numerem %d:", number);
			SendClientMessage(playerid, COLOR_WHITE, string);
			
			format(string, sizeof(string), "SELECT `Nick` FROM mru_konta WHERE `PhoneNr`='%d'", number);
			mysql_query(string);
			mysql_store_result();
			if(mysql_num_rows())
			{
				while(mysql_fetch_row_format(string, "|"))
				{
					new nick[MAX_PLAYER_NAME];
					sscanf(string, "p<|>s[24]", nick);
					SendClientMessage(playerid, COLOR_WHITE, nick);
				}
			}
			mysql_free_result();
		}
		else
		{
			foreach(Player, i)
			{
				if(PlayerInfo[i][pPnumber] == number)
				{
					SendClientMessage(playerid, COLOR_WHITE, GetNick(i));
				}
			}
		}
	}
	else
	{
		noAccessMessage(playerid);
  	}
	return 1;
}

