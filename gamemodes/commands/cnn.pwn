//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ cnn ]--------------------------------------------------//
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

CMD:cnn(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj /cnn [cnn formattextu ~n~=Nowalinia ~r~=Czerwony ~g~=Zielony ~b~=Niebieski ~w~=Bia�y ~y~=��ty]");
			return 1;
		}
		new string[128];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		//
		format(string, sizeof(string), "~b~%s: ~w~%s",sendername,params);
        if(!issafefortextdraw(string)) return sendErrorMessage(playerid, "Niekompletny tekst (tyldy etc)");
		foreach(Player, i)
		{
			if(IsPlayerConnected(i))
			{
				GameTextForPlayer(i, string, 5000, 6);
			}
		}
        CMDLog(string);
		return 1;
	}
	else
	{
		noAccessMessage(playerid);
		return 1;
	}
}

