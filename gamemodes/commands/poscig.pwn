//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ poscig ]------------------------------------------------//
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

CMD:poscig(playerid, params[])
{
	if(IsACop(playerid))
	{
		if(OnDuty[playerid] == 1)
		{
			new giveplayerid;
			if(sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "U�yj /poscig [id/nick]");
				return 1;
			}
			if(IsPlayerConnected(giveplayerid) && giveplayerid != INVALID_PLAYER_ID)
			{
				if(PoziomPoszukiwania[giveplayerid] >= 1)
				{
					if(ProxDetectorS(20.0, playerid, giveplayerid))
					{
						if(poscig[giveplayerid] == 1)
						{
							sendErrorMessage(playerid, "Ten gracz ma ju� po�cig!");
							return 1;
						}
						SendClientMessage(playerid,COLOR_LIGHTBLUE,"Rozpocza�e� po�cig! Trwa on 7 minut.");
						SendClientMessage(giveplayerid,COLOR_PANICRED,"|_________________Tryb Po�cigu_________________|");
						SendClientMessage(giveplayerid,COLOR_WHITE,"S�u�by porz�dkowe ruszy�y za tob� w po�cig! W takim wypadku najlepiej si� podda�!");
						SendClientMessage(giveplayerid,COLOR_WHITE,"W trybie po�cigu nie mozesz wyj�� z gry, zgin�� oraz by� AFK.");
						SendClientMessage(giveplayerid,COLOR_WHITE,"Z�amanie tych zasad skutkuje kar� nadawan� automatycznie.");
						SendClientMessage(giveplayerid,COLOR_PANICRED,"|______________________________________________|");
						poscig[giveplayerid] = 1;
						SetTimerEx("PoscigTimer",7*60000,0,"d",giveplayerid);
					}
					else
					{
						sendErrorMessage(playerid, "Ten gracz nie jest w pobli�u Ciebie !");
					}
				}
				else
				{
					sendErrorMessage(playerid, "Ten gracz nie ma WL !");
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie ma takiego gracza !");
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� na s�u�bie !");
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� z PD !");
	}
	return 1;
}

