//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ teczka ]------------------------------------------------//
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

CMD:teczka(playerid, params[])
{
	new string[64];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 1)
        {
			new giveplayerid, moneys;
			if( sscanf(params, "k<fix>s[32]", giveplayerid, string))
			{
				sendTipMessage(playerid, "U�yj /teczka [playerid/Cz��Nicku] [ilo��]");
				return 1;
			}
			moneys = FunkcjaK(string);

			if(PlayerInfo[playerid][pConnectTime] == 0)
			{
				sendTipMessage(playerid, "Zanim b�dziesz m�g� p�aci�, musisz gra� wi�cej ni� 1 godzin� online!");
			    return 1;
			}

			if(PlayerInfo[playerid][pLevel] < 3)
			{
				sendTipMessage(playerid, "Musisz mie� 3 level aby p�aci� teczk�");
				return 1;
			}
			if(moneys < 1 || moneys > 1000001)
			{
			    sendTipMessage(playerid, "Kwota musi wynosi� mniej ni� 1 000 000$ .");
			    return 1;
			}
			if(AntySpam[playerid] == 1)
			{
			    sendTipMessage(playerid, "Odczekaj 15 sekund lub skorzystaj z przelewu");
				return 1;
			}
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(PlayerInfo[giveplayerid][pLocal] == 106)
					{
						sendErrorMessage(playerid, "Komenda nie dzia�a w tym miejscuu");
						return 1;
					}
					if (ProxDetectorS(5.0, playerid, giveplayerid) && Spectate[giveplayerid] == INVALID_PLAYER_ID)
					{
						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						new playermoney = kaska[playerid];
						if (moneys > 0 && playermoney >= moneys)
						{
							DajKase(playerid, (0 - moneys));
							DajKase(giveplayerid, moneys);
							format(string, sizeof(string), "   Da�e� %s(gracz: %d), $%d.", giveplayer,giveplayerid, moneys);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_GRAD1, string);
							format(string, sizeof(string), "   Otrzyma�e� $%d od %s(gracz: %d).", moneys, sendername, playerid);
							SendClientMessage(giveplayerid, COLOR_GRAD1, string);
							format(string, sizeof(string), "%s dal teczke z $%d graczowi %s", sendername, moneys, giveplayer);
							PayLog(string);
							if(moneys >= 10000000)
							{
								ABroadCast(COLOR_YELLOW,string,1);
							}
							PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "* %s wyci�ga teczk� i podaje %s.", sendername ,giveplayer);
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							AntySpam[playerid] = 1;
							SetTimerEx("AntySpamTimer",15000,0,"d",playerid);
						}
						else
						{
							sendErrorMessage(playerid, "Nieprawid�owa ilo�� pieni�dzy.");
						}
					}
					else
					{
						sendErrorMessage(playerid, "Jeste� za daleko od gracza.");
					}
				}//invalid id
			}
			else
			{
				format(string, sizeof(string), "%d nie jest na serwerze.", giveplayerid);
				sendErrorMessage(playerid, string);
			}
		}
	}
	return 1;
}

