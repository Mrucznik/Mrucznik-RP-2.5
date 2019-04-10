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

CMD:alarm(playerid,cmdtext[]) //TODO
{
    if(GetPlayerFraction(playerid) == FRAC_BOR && PlayerInfo[playerid][pRank] > 2 || GetPlayerOrg(playerid) == FAMILY_SAD && PlayerInfo[playerid][pRank] > 2)
	{
        if(IsPlayerInRangeOfPoint(playerid,5,1321.1561, -1322.0787, 40.2077)
        || IsPlayerInRangeOfPoint(playerid,20,1309.6487, -1299.8835, 36.5567)
        || IsPlayerInRangeOfPoint(playerid,10,1310.2283, -1343.9265, 38.5291))
    	{
            if(!GATE_SAD_ALARM)
            {
        	    GATE_ALARM_OBJ[0] = CreateDynamicObject(18646, 1320.75305, -1328.18896, 41.55560,   0.00000, 0.00000, 0.00000, 500);
        		GATE_ALARM_OBJ[1] = CreateDynamicObject(18646, 1293.60901, -1329.04358, 41.55560,   0.00000, 0.00000, 0.00000, 500);
        		GATE_ALARM_OBJ[2] = CreateDynamicObject(18646, 1318.46729, -1320.96216, 41.55560,   0.00000, 0.00000, 0.00000, 500);
        		GATE_ALARM_OBJ[3] = CreateDynamicObject(18646, 1298.91919, -1305.46460, 41.22390,   0.00000, 0.00000, 0.00000, 501);
        		GATE_ALARM_OBJ[4] = CreateDynamicObject(18646, 1298.68286, -1294.45544, 41.22390,   0.00000, 0.00000, 0.00000, 501);
        		GATE_ALARM_OBJ[5] = CreateDynamicObject(18646, 1298.24878, -1291.82971, 41.22390,   0.00000, 0.00000, 0.00000, 501);
          		//INFORMACJA TYLKO DLA GSA
                SendFamilyMessage(FRAC_BOR, 0xFFFF0000, "[S�uchawka bluetooth] Uwaga! K3 w 0-6! W s�dzie w��czy� si� alarm! Sprawd� to!");
			    MoveDynamicObject(GATE_SAD[18], 1310.2843, -1324.6620, 42.21040, 1,  0.00000, 180.00000, 90.00000);
				GATE_SAD_ALARM = true;
				new akcja[150];
				format(akcja,sizeof(akcja),"* %s wciska czerwony guzik pod biurkiem i w��cza alarm.",GetNick(playerid));
                ProxDetector(30.0, playerid, akcja, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                format(akcja, 150, "> %s uruchomi� alarm w s�dzie!", GetNick(playerid));
                SendNewFamilyMessage(FAMILY_SAD, TEAM_AZTECAS_COLOR, akcja);
                SendFamilyMessage(FRAC_BOR, 0xFFFF0000, akcja);
    		}
            else
            {
                for(new i=0;i<7;i++) DestroyDynamicObject(GATE_ALARM_OBJ[i]);
                GATE_SAD_ALARM = false;
                SendFamilyMessage(FRAC_BOR, 0xFFFF0000, "[S�uchawka bluetooth] Alarm w s�dzie odwo�any.");
			    MoveDynamicObject(GATE_SAD[18], 1310.2843, -1324.6620, 45.7, 1,  0.00000, 180.00000, 90.00000);
				new akcja[150];
				format(akcja,sizeof(akcja),"* %s wciska czerwony guzik pod biurkiem i wy��cza alarm.",GetNick(playerid));
                ProxDetector(30.0, playerid, akcja, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
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
						foreach(Player, i)
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





