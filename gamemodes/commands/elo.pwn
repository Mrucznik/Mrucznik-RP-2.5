//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ elo ]--------------------------------------------------//
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

CMD:elo(playerid, params[])
{
    if(IsPlayerConnected(playerid))
    {
		new playa;
		if( sscanf(params, "k<fix>", playa))
		{
			sendTipMessage(playerid, "U�yj /elo [ID gracza]");
			return 1;
		}



		if (ProxDetectorS(5.0, playerid, playa) && Spectate[playa] == INVALID_PLAYER_ID)
		{
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {
		            if(Spectate[playa] != INVALID_PLAYER_ID)
					{
						sendErrorMessage(playerid, "Ten gracz jest za daleko.");
						return 1;
					}
                    new string[128], nick[MAX_PLAYER_NAME], witany[MAX_PLAYER_NAME];
                    GetPlayerName(playa, witany, sizeof(witany));
                    GetPlayerName(playerid, nick, sizeof(nick));
                    format(string, sizeof(string), "Witasz si� z %s", witany);
                    SendClientMessage(playerid, COLOR_WHITE, string);
                    format(string, sizeof(string), "Witasz si� z %s", nick);
                    SendClientMessage(playa, COLOR_WHITE, string);
					//SendClientMessage(playa, COLOR_WHITE, "Witasz si�");
					ApplyAnimation(playerid,"GANGS","hndshkcb",4.1,0,1,1,1,1);//8
					ApplyAnimation(playa,"GANGS","hndshkcb",4.1,0,1,1,1,1);//8
				}
			}
		}
		else
		{
			sendErrorMessage(playerid, "Jeste� za daleko !");
		}
	}
	return 1;
}

