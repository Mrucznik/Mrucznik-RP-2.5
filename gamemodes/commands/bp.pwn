//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ bp ]--------------------------------------------------//
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

CMD:bp(playerid, params[])//blokada pisania
{
	new giveplayerid, czas, text[32], string[256];
	if(sscanf(params, "k<fix>ds[32]", giveplayerid, czas, text))
	{
		sendTipMessage(playerid, "U�yj /bp [ID gracza] [czas (w gozinach)] [nazwa chatu]");
		return 1;
	}
	if (PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
	{
		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid != INVALID_PLAYER_ID)
			{
				if(czas <= 8 && czas >= 0)
				{
					GiveBPForPlayer(giveplayerid, playerid, czas, text);
					if(kary_TXD_Status == 1)
					{
						BPPlayerTXD(giveplayerid, playerid, czas, text);
					}
					else if(kary_TXD_Status == 0)
					{
						format(string, sizeof(string), "AdmCmd: %s dosta� Blokad� Pisania od %s na %d minut. Pow�d: %s", GetNick(giveplayerid), GetNick(adminid), czas, text);
						SendPunishMessage(string, playerid);
					}
					return 1;
				}
				else
				{
					sendTipMessage(playerid, "Czas od 0 do 8");
				}
			}
		}
	}
	else
	{
		new string[64];
		format(string, sizeof(string), "%d jest nieaktywny.", giveplayerid);
		sendErrorMessage(playerid, string);
	}
	return 1;
}

