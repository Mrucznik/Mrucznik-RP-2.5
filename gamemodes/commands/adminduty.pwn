//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ adminduty ]-----------------------------------------------//
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

CMD:adminduty(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1)
	{
	
		new adminMaWolnyNick = 0;
		
		SetPVarString(playerid, "pAdminDutyNickOn", params);
		new adminNameDuo[MAX_PLAYER_NAME];
		GetPVarString(playerid, "pAdminDutyNickOn", adminNameDuo, sizeof(adminNameDuo)); 
		
		
		if(GetPlayerAdminDutyStatus(playerid) == 0)
		{
			if(isnull(params))
			{
				sendTipMessage(playerid, "U�yj /adminduty [NICK 4UM]");
				return 1;
			}
			if(OnDuty[playerid] == 1 || JobDuty[playerid] == 1 || SanDuty[playerid] == 1)//Zabezpieczenie przed duty - odkryte w do�� ciekawy spos�b, dlatego traktujemy jako easter egg
			{
				sendTipMessage(playerid, "Najpierw zejd� z duty! Powodujesz bugi, kt�re musz� naprawia�!");
				return 1;
			}
			else
			{
				if(strlen(params) < MAX_PLAYER_NAME)//Maksymalnie 32 znaki nicku
				{
					if(strlen(params) >= MIN_ADMIN_NAME)//Minimalnie 3 znaki
					{
						//Symbole i znaki specjalne
						if(SprawdzZnaki(params) ==  0)
						{
							foreach(Player, i)
							{
								//if(strfind(GetNick(i), AdminName, true) != -1)
								if(strfind(GetNick(i), adminNameDuo) == -1)
								{
									adminMaWolnyNick = 0;	
								}
								else
								{
									adminMaWolnyNick = 1;
								}
							}
							if(adminMaWolnyNick == 0)
							{
								AdminDutyPlayer(playerid, 1);
							}
							else
							{
								sendErrorMessage(playerid, "Ten nick jest ju� zaj�ty!");
								return 1;
							}
							
						}	
						else
						{
							sendErrorMessage(playerid, "U�y�e� nieprawid�owych znak�w!"); 
							MSGBOX_Show(playerid, "Zle znaki!", MSGBOX_ICON_TYPE_ERROR);
							return 1;
						}
					}	
					else
					{
						sendErrorMessage(playerid, "Minimalna d�ugo�� nicku to 3 znaki!"); 
						return 1;
					}
						
				}
				else
				{
					sendErrorMessage(playerid, "Maksymalna d�ugo�� nicku to 32 znaki!"); 
					return 1;
				}
			}
				
			return 1;	
		}
		else if(GetPlayerAdminDutyStatus(playerid) == 1)//Wykonuje zej�cie z duty
		{	
			AdminDutyPlayer(playerid, 0); 
			return 1;
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� administratorem, wi�c nie mo�esz tego u�y�!"); 
		MSGBOX_Show(playerid, "Nie masz uprawnien!", MSGBOX_ICON_TYPE_ERROR);
		return 1; 
	}

	return 1; 
}

