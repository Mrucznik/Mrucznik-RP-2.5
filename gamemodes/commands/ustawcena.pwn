//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ ustawcena ]-----------------------------------------------//
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

CMD:ustawcena(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		new moneys; 
		if( sscanf(params, "d", moneys))
		{
			sendErrorMessage(playerid, "U�yj /ustawcena [CENA]"); 
			return 1;
		}
		
		new sendername[MAX_PLAYER_NAME];
		new string[128];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(moneys >= 1000)
		{
			if(moneys <= 200000)
			{
				if(GetPlayerFraction(playerid) == 10)
				{
					format(string, sizeof(string), "Maszynista %s ustawi� cen� podr�y poci�giem na %d$.", sendername, moneys);
					OOCNews(TEAM_GROVE_COLOR,string);
					CenaBiletuPociag = moneys;				
				}
				else
				{
					sendErrorMessage(playerid, "Nie jeste� z KT!"); 
					return 1;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Maksymalna kwota jak� mo�esz ustali� to 200.000$");
				return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Cena od 1.000$ do 200.000$!"); 
			return 1;
		}
	
	}
	return 1;
}
