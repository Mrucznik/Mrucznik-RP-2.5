//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ ban ]--------------------------------------------------//
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

CMD:ban(playerid, params[])
{
	new string[256];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid)) 
    {
    	new giveplayerid, result[64];
		if( sscanf(params, "k<fix>s[64]", giveplayerid, result))
		{
			sendTipMessage(playerid, "U�yj /ban [playerid/Cz��Nicku] [pow�d]");
			return 1;
		}
		
	    if(AntySpam[playerid] == 1)
	    {
	        sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 5 sekund");
	        return 1;
	    }
	    if(IsPlayerConnected(giveplayerid))//bug z id
	    {
	        if(giveplayerid != INVALID_PLAYER_ID)
	        {
	            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				new str[128];
	            if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pZG] >= 4 || IsAScripter(playerid))
	            {
					if(IsPlayerAdmin(giveplayerid) || Uprawnienia(giveplayerid, ACCESS_OWNER))
					{
						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zabanowa� Head Admina !");
						return 1;
					}
					if( (PlayerInfo[giveplayerid][pAdmin] >= 1 || PlayerInfo[giveplayerid][pNewAP] >= 1 || PlayerInfo[giveplayerid][pZG] >= 4) && PlayerInfo[playerid][pZG] >= 4)
					{
						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zabanowa� Admina, P@ i ZG!");
						return 1;
					}
					if(PlayerInfo[giveplayerid][pLevel] > 1 && PlayerInfo[playerid][pZG] >= 4 && PlayerInfo[playerid][pZG] < 6)
					{
						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zabanowa� gracza z levelem wiekszym niz 1!");
						return 1;
					}
					if(PlayerInfo[giveplayerid][pDonateRank] > 1 && PlayerInfo[playerid][pZG] >= 6)
					{
						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zabanowa� gracza z KP!");
						return 1;
					}
                    if(gPlayerLogged[giveplayerid] == 0)
                    {
                        sendTipMessageEx(playerid, COLOR_WHITE, " Gracz nie jest zalogowany, u�yj kicka.");
						return 1;
                    }
					SendClientMessage(giveplayerid, COLOR_NEWS, "Je�li uwa�asz ze ban jest nies�uszny wejd� na www.Mrucznik-RP.pl i z�� prosb� o UN-BAN");
					format(string, sizeof(string), "AdmCmd: Admin %s zbanowal %s, pow�d: %s",  sendername, giveplayer, result);
					BanLog(string);
					if(kary_TXD_Status == 0)
					{
						format(string, sizeof(string), "AdmCmd: Admin %s zbanowa� %s, pow�d: %s",  sendername, giveplayer, result);
						SendPunishMessage(string, giveplayerid);
					}
					if(kary_TXD_Status == 1)
					{
						BanPlayerTXD(giveplayerid, playerid, result);
					}
					//adminowe logi
			        format(str, sizeof(str), "Admini/%s.ini", sendername);
			        dini_IntSet(str, "Ilosc_Banow", dini_Int(str, "Ilosc_Banow")+1 );
					format(str,sizeof(str),"~y~Ban Info:~n~~r~Osoba zbanowana: ~w~%s~n~~r~Powod: ~w~%s~n~~r~Nalozyl: ~w~%s", giveplayer ,result, sendername);
					MruMySQL_Banuj(giveplayerid, result, playerid);
					KickEx(giveplayerid);
					if(PlayerInfo[giveplayerid][pAdmin] >= 1)
					{
					    MruMySQL_Banuj(playerid, result, giveplayerid);
						format(str, sizeof(str), "%s zostal zbanowany za zbanowanie admina /ban",sendername);
						BanLog(str);
					    KickEx(playerid);
						//adminduty
						if(GetPlayerAdminDutyStatus(playerid) == 1)
						{
							iloscBan[playerid] = iloscBan[playerid]+1;
							
						}
					}
					else
					{
					    SetTimerEx("AntySpamTimer",5000,0,"d",playerid);
					    AntySpam[playerid] = 1;
					}
					return 1;
			  	}
				else
				{
				    if(PlayerInfo[playerid][pNewAP] >= 1 && PlayerInfo[playerid][pNewAP] <= 3)
				    {
                        if(IsPlayerAdmin(giveplayerid) || Uprawnienia(giveplayerid, ACCESS_OWNER))
    					{
    						sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zabanowa� Head Admina !");
    						return 1;
    					}
						if(PlayerInfo[giveplayerid][pAdmin] >= 1)
						{
							sendTipMessageEx(playerid, COLOR_WHITE, "Nie mozesz zabanowa� Admina !");
							return 1;
						}
                        if(gPlayerLogged[giveplayerid] == 0)
                        {
                            sendTipMessageEx(playerid, COLOR_WHITE, " Gracz nie jest zalogowany, u�yj kicka.");
							return 1;
                        }
						SendClientMessage(giveplayerid, COLOR_NEWS, "Je�li uwa�asz ze ban jest nies�uszny wejd� na www.Mrucznik-RP.pl i z�� prosb� o UN-BAN");
						format(string, sizeof(string), "AdmCmd: P�Admin %s zbanowa� %s, pow�d: %s",  sendername, giveplayer, (result));
						BanLog(string);
                        SendPunishMessage(string, giveplayerid);
						format(str,sizeof(str),"~y~Ban Info:~n~~r~Osoba zbanowana: ~w~%s~n~~r~Powod: ~w~%s~n~~r~Nalozyl: ~w~%s", giveplayer ,(result), sendername);
						MruMySQL_Banuj(giveplayerid, result, playerid);
						KickEx(giveplayerid);
						return 1;
					}
					else
					{
					    noAccessMessage(playerid);
					}
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

