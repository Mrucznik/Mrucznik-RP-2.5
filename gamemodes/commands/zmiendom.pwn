//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zmiendom ]-----------------------------------------------//
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

CMD:setdom(playerid, params[]) return cmd_zmiendom(playerid, params);
CMD:sethouse(playerid, params[]) return cmd_zmiendom(playerid, params);
CMD:zmiendom(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new para1, level;
		if( sscanf(params, "k<fix>d", para1, level))
		{
			sendTipMessage(playerid, "U�yj /setdom [playerid/Cz��Nicku] [id domu]");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 5000 || IsASkuban(playerid))
		{
		    if(IsPlayerConnected(para1))
		    {
		    	if(para1 != INVALID_PLAYER_ID)
	        	{
					GetPlayerName(para1, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					PlayerInfo[para1][pDom] = level;
					format(string, sizeof(string), "AdmCmd: %s zmieni� dom %s na %d.", sendername, giveplayer, level);
					StatsLog(string);
					format(string, sizeof(string), "   Tw�j dom zosta� zmieniony na dom nr %d przez %s", level, sendername);
					SendClientMessage(para1, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "   Zmieni�e� dom graczowi %s na dom nr %d.", giveplayer,level);
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



