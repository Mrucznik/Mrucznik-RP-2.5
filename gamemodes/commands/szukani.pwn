//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ szukani ]------------------------------------------------//
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

CMD:wanted(playerid) return cmd_szukani(playerid);
CMD:poszukiwani(playerid) return cmd_szukani(playerid);
CMD:szukani(playerid)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
   	{
		if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLider] == 1)
		{
			new x;
			SendClientMessage(playerid, COLOR_GREEN, "Lista Poszukiwanych:");
		    foreach(Player, i)
			{
				if(IsPlayerConnected(i))
				{
				    if(PoziomPoszukiwania[i] >= 2 && PoziomPoszukiwania[i] <= 5 || PoziomPoszukiwania[i] == 10)
				    {
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
						format(string, sizeof(string), "%s%s: %d", string,giveplayer,PoziomPoszukiwania[i]);
						x++;
						if(x > 3) {
						    SendClientMessage(playerid, COLOR_YELLOW, string);
						    x = 0;
							format(string, sizeof(string), "");
						} else {
							format(string, sizeof(string), "%s, ", string);
						}
					}
				}
			}
			if(x <= 3 && x > 0) {
				string[strlen(string)-2] = '.';
			    SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		}
		else if(PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLider] == 2)
		{
			new x;
			SendClientMessage(playerid, COLOR_GREEN, "Lista Poszukiwanych:");
		    foreach(Player, i)
			{
				if(IsPlayerConnected(i))
				{
				    if(PoziomPoszukiwania[i] >= 6)
				    {
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
						format(string, sizeof(string), "%s%s: %d", string,giveplayer,PoziomPoszukiwania[i]);
						x++;
						if(x > 3) {
						    SendClientMessage(playerid, COLOR_YELLOW, string);
						    x = 0;
							format(string, sizeof(string), "");
						} else {
							format(string, sizeof(string), "%s, ", string);
						}
					}
				}
			}
			if(x <= 3 && x > 0)
			{
				string[strlen(string)-2] = '.';
			    SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		}
		else if(PlayerInfo[playerid][pJob] == 1)
		{
		    if(PlayerToPoint(5.0,playerid,325.0463,306.9240,999.1484))
		    {
			    if(PlayerInfo[playerid][pDetSkill] < 50)
			    {
			        new x;
					SendClientMessage(playerid, COLOR_GREEN, "Poszukiwani �ywi lub Martwi:");
				    foreach(Player, i)
					{
					    if(IsPlayerConnected(i))
						{
							if(PoziomPoszukiwania[i] == 2 || PoziomPoszukiwania[i] == 10)
					    	{
					    	    GetPlayerName(i, giveplayer, sizeof(giveplayer));
								format(string, sizeof(string), "%s%s, Nagroda: %d000$", string,giveplayer,PoziomPoszukiwania[i]);
								x++;
								if(x > 3)
								{
								    SendClientMessage(playerid, COLOR_YELLOW, string);
								    x = 0;
									format(string, sizeof(string), "");
								}
								else
								{
									format(string, sizeof(string), "%s, ", string);
								}
							}
						}
					}
					if(x <= 3 && x > 0)
					{
						string[strlen(string)-2] = '.';
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					}
					SendClientMessage(playerid, COLOR_GREEN, "Aby wzi�� zlecenie na kogo� wpisz /zlecenie");
					SendClientMessage(playerid, COLOR_GRAD1, "Wy�szy skill �owcy Nagr�d, wi�ksze nagrody");
				}
				else if(PlayerInfo[playerid][pDetSkill] >= 50 && PlayerInfo[playerid][pDetSkill] < 100)
			    {
			        new x;
					SendClientMessage(playerid, COLOR_GREEN, "Poszukiwani �ywi lub Martwi:");
				    foreach(Player, i)
					{
					    if(IsPlayerConnected(i))
						{
							if(PoziomPoszukiwania[i] >= 2 && PoziomPoszukiwania[i] <= 3 || PoziomPoszukiwania[i] == 10)
					    	{
					    	    GetPlayerName(i, giveplayer, sizeof(giveplayer));
								format(string, sizeof(string), "%s%s, Nagroda: %d000$", string,giveplayer,PoziomPoszukiwania[i]);
								x++;
								if(x > 3)
								{
								    SendClientMessage(playerid, COLOR_YELLOW, string);
								    x = 0;
									format(string, sizeof(string), "");
								}
								else
								{
									format(string, sizeof(string), "%s, ", string);
								}
							}
						}
   					}
					if(x <= 3 && x > 0)
					{
						string[strlen(string)-2] = '.';
					    SendClientMessage(playerid, COLOR_YELLOW, string);
   					}
   					SendClientMessage(playerid, COLOR_GREEN, "Aby wzi�� zlecenie na kogo� wpisz /zlecenie");
   					SendClientMessage(playerid, COLOR_GRAD1, "Wy�szy skill �owcy Nagr�d, wi�ksze nagrody");
				}
				else if(PlayerInfo[playerid][pDetSkill] >= 100 && PlayerInfo[playerid][pDetSkill] < 200)
			    {
			        new x;
					SendClientMessage(playerid, COLOR_GREEN, "Poszukiwani �ywi lub Martwi:");
				    foreach(Player, i)
					{
					    if(IsPlayerConnected(i))
						{
							if(PoziomPoszukiwania[i] >= 2 && PoziomPoszukiwania[i] <= 4 || PoziomPoszukiwania[i] == 10)
					    	{
					    	    GetPlayerName(i, giveplayer, sizeof(giveplayer));
								format(string, sizeof(string), "%s%s, Nagroda: %d000$", string,giveplayer,PoziomPoszukiwania[i]);
								x++;
								if(x > 3)
								{
								    SendClientMessage(playerid, COLOR_YELLOW, string);
								    x = 0;
									format(string, sizeof(string), "");
								}
								else
								{
									format(string, sizeof(string), "%s, ", string);
								}
							}
						}
					}
					if(x <= 3 && x > 0)
					{
						string[strlen(string)-2] = '.';
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					}
					SendClientMessage(playerid, COLOR_GREEN, "Aby wzi�� zlecenie na kogo� wpisz /zlecenie");
					SendClientMessage(playerid, COLOR_GRAD1, "Wy�szy skill �owcy Nagr�d, wi�ksze nagrody");
				}
				else if(PlayerInfo[playerid][pDetSkill] >= 200 && PlayerInfo[playerid][pDetSkill] < 400)
			    {
			        new x;
					SendClientMessage(playerid, COLOR_GREEN, "Poszukiwani �ywi lub Martwi:");
				    foreach(Player, i)
					{
					    if(IsPlayerConnected(i))
						{
							if(PoziomPoszukiwania[i] >= 2 && PoziomPoszukiwania[i] <= 5 || PoziomPoszukiwania[i] == 10)
					    	{
					    	    GetPlayerName(i, giveplayer, sizeof(giveplayer));
								format(string, sizeof(string), "%s%s, Nagroda: %d000$", string,giveplayer,PoziomPoszukiwania[i]);
								x++;
								if(x > 3)
								{
								    SendClientMessage(playerid, COLOR_YELLOW, string);
								    x = 0;
									format(string, sizeof(string), "");
								}
								else
								{
									format(string, sizeof(string), "%s, ", string);
     							}
							}
						}
					}
					if(x <= 3 && x > 0)
					{
						string[strlen(string)-2] = '.';
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					}
					SendClientMessage(playerid, COLOR_GREEN, "Aby wzi�� zlecenie na kogo� wpisz /zlecenie");
					SendClientMessage(playerid, COLOR_GRAD1, "Wy�szy skill �owcy Nagr�d, wi�ksze nagrody");
				}
				else if(PlayerInfo[playerid][pDetSkill] >= 400)
			    {
			        new x;
					SendClientMessage(playerid, COLOR_GREEN, "Poszukiwani �ywi lub Martwi:");
				    foreach(Player, i)
					{
					    if(IsPlayerConnected(i))
						{
							if(PoziomPoszukiwania[i] >= 2 && PoziomPoszukiwania[i] <= 7 || PoziomPoszukiwania[i] == 10)
					    	{
					    	    GetPlayerName(i, giveplayer, sizeof(giveplayer));
								format(string, sizeof(string), "%s%s, Nagroda: %d000$", string,giveplayer,PoziomPoszukiwania[i]);
								x++;
								if(x > 3)
								{
								    SendClientMessage(playerid, COLOR_YELLOW, string);
								    x = 0;
									format(string, sizeof(string), "");
								}
								else
								{
									format(string, sizeof(string), "%s, ", string);
								}
							}
						}
					}
					if(x <= 3 && x > 0)
					{
						string[strlen(string)-2] = '.';
					    SendClientMessage(playerid, COLOR_YELLOW, string);
					}
					SendClientMessage(playerid, COLOR_GREEN, "Aby wzi�� zlecenie na kogo� wpisz /zlecenie");
					SendClientMessage(playerid, COLOR_GRAD1, "Wy�szy skill �owcy Nagr�d, wi�ksze nagrody");
				}
			}
			else
			{
 				SendClientMessage(playerid, COLOR_YELLOW, "Nie jeste� w biurze �owcy Nagr�d");
			}
		}
		else if(PlayerInfo[playerid][pJob] == 2)
		{
			new x;
			SendClientMessage(playerid, COLOR_GREEN, "Lista potencjalnych klient�w:");
		    foreach(Player, i)
			{
				if(IsPlayerConnected(i))
				{
				    if(PoziomPoszukiwania[i] >= 2)
				    {
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
						format(string, sizeof(string), "%s%s: %d", string,giveplayer,PoziomPoszukiwania[i]);
						x++;
						if(x > 3) {
						    SendClientMessage(playerid, COLOR_YELLOW, string);
						    x = 0;
							format(string, sizeof(string), "");
						} else {
							format(string, sizeof(string), "%s, ", string);
						}
					}
				}
			}
			if(x <= 3 && x > 0) {
				string[strlen(string)-2] = '.';
			    SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		}
		else
		{
		   	new x;
			SendClientMessage(playerid, COLOR_GREEN, "Najbardziej poszukiwani przest�pcy:");
		    foreach(Player, i)
			{
				if(IsPlayerConnected(i))
				{
				    if(PoziomPoszukiwania[i] >= 10)
				    {
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
						format(string, sizeof(string), "%s%s: %d", string,giveplayer,PoziomPoszukiwania[i]);
						x++;
						if(x > 3) {
						    SendClientMessage(playerid, COLOR_YELLOW, string);
						    x = 0;
							format(string, sizeof(string), "");
						} else {
							format(string, sizeof(string), "%s, ", string);
						}
					}
				}
			}
			if(x <= 3 && x > 0) {
				string[strlen(string)-2] = '.';
			    SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		}
	}//not connected
	return 1;
}

