//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ kasa ]-------------------------------------------------//
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

YCMD:kasa(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		new playa, money;
		if( sscanf(params, "k<fix>d", playa, money))
		{
			sendTipMessage(playerid, "U�yj /kasa [playerid/Cz��Nicku] [money]");
			return 1;
		}

		if (IsAHeadAdmin(playerid))
		{
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {
					ResetujKase(playa);
					PlayerInfo[playa][pBankMoney] = 0;
					DajKase(playa, money);
					Log(adminLog, INFO, "Admin %s da� %s kwot� %d$ (/money)", GetPlayerLogName(playerid), GetPlayerLogName(playa), money);
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
