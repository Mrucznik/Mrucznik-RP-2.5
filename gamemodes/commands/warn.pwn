//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ warn ]-------------------------------------------------//
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

CMD:warn(playerid, params[])
{
	new string[256];
    if(IsPlayerConnected(playerid))
    {
    	new giveplayerid, result[64];
		if( sscanf(params, "k<fix>s[64]", giveplayerid, result))
		{
			sendTipMessage(playerid, "U�yj /warn [playerid/Cz��Nicku] [reason]");
			return 1;
		}
		if(giveplayerid == 65535)
		{
			if(sscanf(params, "ds[64]", giveplayerid, result)) 
			{
				sendTipMessageEx(playerid, COLOR_GRAD2, "Ten gracz ma zbugowane ID. Wpisz jego ID zamiast nicku aby go zbanowa�.");
				return 1;
			}
		}

		if (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1)
		{
            if(AntySpam[playerid] == 1)
		    {
		        sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 5 sekund");
		        return 1;
		    }
		    if(IsPlayerConnected(giveplayerid) || true)//bug z id
		    {
		        if(giveplayerid != INVALID_PLAYER_ID)
		        {
		            if(PlayerInfo[giveplayerid][pAdmin] >= 1)
		            {
		                sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zwarnowa� Admina !");
		                return 1;
		            }
                    if(gPlayerLogged[giveplayerid] == 0)
                    {
                        sendTipMessageEx(playerid, COLOR_WHITE, " Gracz nie jest zalogowany, u�yj kicka.");
						return 1;
                    }
					GiveWarnForPlayer(giveplayerid, playerid, result);
					if(kary_TXD_Status == 1)
					{
						if(PlayerInfo[giveplayerid][pWarns] >= 3)
						{
							format(string, sizeof(string), "%s (3 Warny)", result);
							BanPlayerTXD(giveplayerid, playerid, string); 
							return 1;
						}
						WarnPlayerTXD(giveplayerid, playerid, result);
						
					}
					else if(kary_TXD_Status == 0)
					{
						if(PlayerInfo[giveplayerid][pWarns] >= 3)
						{
							format(string, sizeof(string), "AdmCmd: %s zosta� zbanowany przez admina %s, pow�d: %s (3 warny)", GetNick(giveplayerid), GetNick(playerid), result); 
						}
						else 
						{
							format(string, sizeof(string), "AdmCmd: %s zosta� zwarnowany przez admina %s, pow�d: %s", GetNick(giveplayerid), GetNick(playerid), result);
						}
						SendPunishMessage(string, playerid); 
					}
				  
					return 1;
				}
			}//not connected
            else
            {
                format(string, sizeof(string), "Gracz o ID %d nie jest po�aczony.", giveplayerid);
			    sendErrorMessage(playerid, string);
            }
		}
        else {
            return noAccessMessage(playerid);
        }
		/*else
		{
			format(string, sizeof(string), "   Gracz o ID %d nie istnieje.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}*/
	}
	return 1;
} 


