//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ sblok ]-------------------------------------------------//
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

CMD:sblock(playerid, params[]) return cmd_sblok(playerid, params);
CMD:sblok(playerid, params[])
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        new giveplayerid, result[64];
        if( sscanf(params, "k<fix>s[64]", giveplayerid, result))
        {
            sendTipMessage(playerid, "U�yj /sblock [id/nick] [powod]");
            return 1;
        }

		if (PlayerInfo[playerid][pAdmin] >= 5000 || PlayerInfo[playerid][pNewAP] == 4)
		{
		    if(AntySpam[playerid] == 1)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Odczekaj 5 sekund");
		        return 1;
		    }
        	if(IsPlayerConnected(giveplayerid))
        	{
            	if(giveplayerid != INVALID_PLAYER_ID)
            	{
            	    if(PlayerInfo[giveplayerid][pAdmin] >= 1)
		            {
		                sendErrorMessage(playerid, "Nie mozesz zablokowa� Admina !");
		                return 1;
		            }
	                GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
	                GetPlayerName(playerid, sendername, sizeof(sendername));
		            format(string, sizeof(string), "AdmCmd: Konto gracza %s zostalo sblock przez %s, Powod: %s", giveplayer, sendername, (result));
		            //PlayerInfo[giveplayerid][pCK] = 2;
		            BanLog(string);
		            PlayerInfo[playerid][pBlock] = 1;
					SendClientMessage(giveplayerid, COLOR_NEWS, "Twoje konto zosta�o zablokowane za z�y nick. Je�li block jest nies�uszny wejd� na www.Mrucznik-RP.pl i napi� pro�b� o UN BLOCK");
					KickEx(giveplayerid);
					SetTimerEx("AntySpamTimer",5000,0,"d",playerid);
	    			AntySpam[playerid] = 1;
					if(GetPlayerAdminDutyStatus(playerid) == 1)
					{
						iloscBan[playerid] = iloscBan[playerid]+1;
					}
		            return 1;
	            }
   			}
  		}
  		else
	 	{
			format(string, sizeof(string), " %d nie jest aktywnym graczem.", giveplayerid);
      		sendErrorMessage(playerid, string);
		}
	}
	return 1;
}
