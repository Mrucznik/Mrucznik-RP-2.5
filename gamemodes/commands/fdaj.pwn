//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ fdaj ]-------------------------------------------------//
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

CMD:fdaj(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >=10 || IsAScripter(playerid))
	{
	    new giveplayerid, level;
		if( sscanf(params, "k<fix>d", giveplayerid, level))
		{
			sendTipMessage(playerid, "U�yj /fdaj [id gracza] [id stylu]");
			return 1;
		}

		if(PlayerInfo[playerid][pLevel] >= 1)
		{
		    SetPlayerFightingStyle(playerid, level);
		}
	}
	return 1;
}

