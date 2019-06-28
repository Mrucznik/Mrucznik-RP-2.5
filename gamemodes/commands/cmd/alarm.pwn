//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ alarm ]-------------------------------------------------//
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

YCMD:alarm(playerid,cmdtext[], help)
{
    if(GetPlayerFraction(playerid) == FRAC_BOR && PlayerInfo[playerid][pRank] > 2 || GetPlayerOrg(playerid) == FAMILY_SAD && PlayerInfo[playerid][pRank] > 2)
	{
        if(IsPlayerInRangeOfPoint(playerid,5,1315.6504,-1271.2982,82.3418)
        || IsPlayerInRangeOfPoint(playerid,5,1315.0375,-1355.7534,62.0792)
		|| IsPlayerInRangeOfPoint(playerid,5,1323.6162,-1348.2600,73.1409)
		|| IsPlayerInRangeOfPoint(playerid,5,1301.1665,-1352.8203,59.5859)
		|| IsPlayerInRangeOfPoint(playerid,5,1323.4828,-1308.4191,73.1409)
		|| IsPlayerInRangeOfPoint(playerid,5,1316.7214,-1327.9717,82.5859)
		|| IsPlayerInRangeOfPoint(playerid,5,1299.6654,-1348.0380,52.4260)
        || IsPlayerInRangeOfPoint(playerid,5,1315.6658,-1318.4017,74.5859))
    	{
            if(!GATE_SAD_ALARM)
            {
				//INFORMACJA TYLKO DLA GSA
                SendFamilyMessage(FRAC_BOR, 0xFFFF0000, "[S�uchawka bluetooth] Uwaga! K3 w 0-6! W s�dzie w��czy� si� alarm! Sprawd� to!");
				new akcja[150];
				format(akcja,sizeof(akcja),"* %s wciska czerwony guzik i w��cza alarm.",GetNick(playerid));
                ProxDetector(30.0, playerid, akcja, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                format(akcja, 150, "> %s uruchomi� alarm w s�dzie!", GetNick(playerid));
                SendNewFamilyMessage(FAMILY_SAD, TEAM_AZTECAS_COLOR, akcja);
                SendFamilyMessage(FRAC_BOR, 0xFFFF0000, akcja);
				GATE_SAD_ALARM=true;
    		}
            else
            {
                SendFamilyMessage(FRAC_BOR, 0xFFFF0000, "[S�uchawka bluetooth] Alarm w s�dzie odwo�any.");
				new akcja[150];
				format(akcja,sizeof(akcja),"* %s wciska czerwony guzik i wy��cza alarm.",GetNick(playerid));
                ProxDetector(30.0, playerid, akcja, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				GATE_SAD_ALARM=false;
            }
    	}
    }
	else if(GetPlayerFraction(playerid) == FRAC_GOV && PlayerInfo[playerid][pRank] > 0 || GetPlayerFraction(playerid) == FRAC_BOR && PlayerInfo[playerid][pRank] > 2)
	{
		new string [128];
		if(GetPlayerAdminDutyStatus(playerid) == 0)
		{
			if(IsAtTheDMVWindows(playerid))
			{
				if(GetPlayerVirtualWorld(playerid) == 50)
				{
					if(DMV_ALARM == 0)
					{
						//POWIADOMIENIE DLA BOR I DMV
						format(string, sizeof(string), "[S�uchawka bluetooth] Uwaga! %s aktywowa� alarm w Urz�dzie - rzucaj wszystko i ruszaj tam!", GetNick(playerid, true));
						SendFamilyMessage(FRAC_BOR, 0xFFFF0000, string);
						format(string, sizeof(string), "[RADIO] Uwaga! Kryj si�! %s aktywowa� alarm w Urzedzie.", GetNick(playerid, true));
						SendFamilyMessage(FRAC_GOV, 0xFFFF0000, string);
						
						//AKCJA 
						format(string,sizeof(string),"* %s wciska czerwony guzik pod biurkiem i w��cza alarm.",GetNick(playerid, true));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						//MOVE OBJECTS:
						MoveDynamicObject(bramaAlarmu[0], 1458.55872, -1781.09436,  78.6217, 20, 0.00000, 0.00000, 0.00000);
						MoveDynamicObject(bramaAlarmu[1], 1453.65222, -1822.41931, 82.1589,  20,  0.00000, 0.00000, 0.00000);
						MoveDynamicObject(bramaAlarmu[2],1453.60974, -1822.42871, 82.1589, 20, 0.00000, 0.00000, 180.00000);
						MoveDynamicObject(bramaAlarmu[3], 1449.86377, -1807.49780, 79.68960, 5,   0.00000, 90.00000, 90.00000);
						//Inne
						DMV_ALARM = 1;
						foreach(new i : Player)
						{
							if(GetPlayerVirtualWorld(playerid) == 50)
							{
								sendTipMessage(i, "[G�O�NIKI URZ�DU MIASTA] ALARM W URZEDZIE MIASTA! UDAJ SI� DO BEZPIECZNEJ STREFY");
							}
						
						}
						return 1;
					}
					else if(DMV_ALARM == 1)
					{
						//POWIADOMIENIE DLA BOR I DMV
						format(string, sizeof(string), "[S�uchawka bluetooth] %s wy��czy� alarm w Urz�dzie Miasta!", GetNick(playerid, true));
						SendFamilyMessage(FRAC_BOR, 0xFFFF0000, string);
						format(string, sizeof(string), "[RADIO] %s wy��czy� alarm w Urz�dzie Miasta!", GetNick(playerid, true));
						SendFamilyMessage(FRAC_GOV, 0xFFFF0000, string);
						
						//AKCJA 
						format(string,sizeof(string),"* %s wciska czerwony guzik pod biurkiem i wy��cza alarm.",GetNick(playerid, true));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						//MOVE OBJECTS:
					
						MoveDynamicObject(bramaAlarmu[0], 1458.55872, -1781.09436, 84.14751, 20, 0.00000, 0.00000, 0.00000 );
						MoveDynamicObject(bramaAlarmu[1], 1453.65222, -1822.41931, 87.62315,  20,  0.00000, 0.00000, 0.00000);
						MoveDynamicObject(bramaAlarmu[2],1453.60974, -1822.42871, 87.69519, 20, 0.00000, 0.00000, 180.00000);
						MoveDynamicObject(bramaAlarmu[3], 1449.86377, -1807.49780, 79.68960, 20,   0.00000, 90.00000, 90.00000);
						
						DMV_ALARM = 0;
						return 1;
					
					}
				}
			}
	
		}
		else
		{
			sendErrorMessage(playerid, "Adminujesz? To Adminuj!"); 
			return 1;
		}
	}
    return 1;
}
