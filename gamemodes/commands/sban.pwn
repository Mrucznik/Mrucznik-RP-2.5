//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ sban ]-------------------------------------------------//
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

CMD:sban(playerid, params[])
{
	new string[256];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
    	new giveplayerid, result[128];
		if( sscanf(params, "k<fix>s[128]", giveplayerid, result))
		{
			sendTipMessage(playerid, "U�yj /sban [playerid/Cz��Nicku] [reason]");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 5000 || PlayerInfo[playerid][pNewAP] == 4 || PlayerInfo[playerid][pAdmin] == 7)
		{
		    if(AntySpam[playerid] == 1)
		    {
		        sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 5 sekund");
		        return 1;
		    }
		    if(IsPlayerConnected(giveplayerid))
		    {
		        if(giveplayerid != INVALID_PLAYER_ID)
		        {
					if(PlayerInfo[giveplayerid][pAdmin] >= 1)
					{
						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zabanowa� Admina!");
						return 1;
					}
					
					format(string, sizeof(string), "AdmCmd: Ukryty (/sban) Admin %s zbanowal %s, pow�d: %s",  sendername, giveplayer, result);
					BanLog(string);
				    MruMySQL_Banuj(giveplayerid, result, playerid);
					KickEx(giveplayerid);
					SetTimerEx("AntySpamTimer",5000,0,"d",playerid);
					AntySpam[playerid] = 1;
					return 1;
				}
			}//not connected
		}
		else
		{
			format(string, sizeof(string), "   Gracz o ID %d nie istnieje.", giveplayerid);
			sendErrorMessage(playerid, string);
		}
	}
	return 1;
}

