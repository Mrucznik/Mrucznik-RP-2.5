//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ setslot ]------------------------------------------------//
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

CMD:setslot(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new para1, level;
		if( sscanf(params, "k<fix>d", para1, level))
		{
			sendTipMessage(playerid, "U�yj /setslot [playerid/Cz��Nicku] [liczba slot�w]");
			return 1;
		}
		if (PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
		{
		    if(IsPlayerConnected(para1))
		    {
		    	if(para1 != INVALID_PLAYER_ID)
	        	{
                    if(!(0 <= level <= 12)) return 1;
					GetPlayerName(para1, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					PlayerInfo[para1][pCarSlots] = level;
					printf("AdmCmd: %s sloty %s na %d.", sendername, giveplayer, level);
					format(string, sizeof(string), "   Liczba slotow zostala zmieniona %d przez %s", level, sendername);
					SendClientMessage(para1, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "   Zmieni�e� sloty graczowi %s na %d.", giveplayer,level);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
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
