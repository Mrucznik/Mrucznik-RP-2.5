//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ KickEx_all ]----------------------------------------------//
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

CMD:KickEx_all(playerid)
{
	if(PlayerInfo[playerid][pAdmin] == 5000)
	{
		new string[64], sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid,sendername,sizeof(sendername));
		format(string, sizeof(string), "Admin %s (id:%d) zkickowal wszystkich graczy",sendername, playerid);
		SendClientMessageToAll(COLOR_RED, string);
		printf(string);

		foreach(Player, i)
		{
			SendClientMessage(playerid, COLOR_WHITE,"*$AdmCmd$*: zkickowales wszystkich graczy!");
			KickEx(i);
		}
	}
    return 1;
}

