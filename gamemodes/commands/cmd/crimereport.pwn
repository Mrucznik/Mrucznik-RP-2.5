//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ crimereport ]----------------------------------------------//
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

YCMD:crimereport(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][Admin] >= 1000)
		{
            new giveplayerid, level;
			if( sscanf(params, "k<fix>d", giveplayerid, level))
			{
				sendTipMessage(playerid, "U�yj /crimereport [id gracza] [id przestepstwa]");
				return 1;
			}
			PlayCrimeReportForPlayer(playerid, giveplayerid, level);
		}
    }
	return 1;
}
