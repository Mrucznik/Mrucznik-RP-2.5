//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ dajkase ]------------------------------------------------//
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

CMD:givemoney(playerid, params[]) return cmd_dajkase(playerid, params);
CMD:dajkase(playerid, params[])
{
    if(IsPlayerConnected(playerid))
    {
		new playa, money;
		if( sscanf(params, "k<fix>d", playa, money))
		{
			sendTipMessage(playerid, "U�yj /dajkase [playerid/Cz��Nicku] [kasa]");
			return 1;
		}

		if (IsAHeadAdmin(playerid))
		{
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {
					DajKase(playa, money);
					new string[128];
					format(string, sizeof(string), "%s dal %s: %d$ /givemoney", GetNick(playerid), GetNick(playa), money);
					StatsLog(string);
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
