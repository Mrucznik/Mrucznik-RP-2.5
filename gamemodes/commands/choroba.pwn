//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ choroba ]------------------------------------------------//
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

CMD:setstd(playerid, params[]) return cmd_choroba(playerid, params);
CMD:zaraz(playerid, params[]) return cmd_choroba(playerid, params);
CMD:choroba(playerid, params[])
{
	new string[64];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new para1, level;
		if( sscanf(params, "k<fix>d", para1, level))
		{
			sendTipMessage(playerid, "U�yj /setstd [playerid/Cz��Nicku] [id choroby] (4 - grypa, 5 - sepsa)");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 100)
		{
		    if(IsPlayerConnected(para1))
		    {
		    	if(para1 != INVALID_PLAYER_ID)
	        	{
					GetPlayerName(para1, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					STDPlayer[para1] = level;
					printf("AdmCmd: %s zmieni� chorob� %s na %d.", sendername, giveplayer, level);
					format(string, sizeof(string), "   Zarazi�e� si� chorob�");
					SendClientMessage(para1, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "   Zmieni�e� chorob� graczowi %s na prac� %d.", giveplayer,level);
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

