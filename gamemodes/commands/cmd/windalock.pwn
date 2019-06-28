//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ windalock ]-----------------------------------------------//
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

YCMD:windalock(playerid, params[], help)
{
	new string[128];
	new nick[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new level;
		if( sscanf(params, "d", level))
		{
			sendTipMessage(playerid, "U�yj: /windalock [nr poziomu]");
			return 1;
		}

		if(IsPlayerInRangeOfPoint(playerid,5,288.0914,-1609.7465,17.9994)//parking SAN News
        || IsPlayerInRangeOfPoint(playerid,3,292.0818,-1610.0715,124.7512)//recepcja Winda
        || IsPlayerInRangeOfPoint(playerid,3,296.9033,-1598.3610,117.0619)/* Studia */
        || IsPlayerInRangeOfPoint(playerid,3,295.1328,-1609.4705,115.6818)/*Akademia */
        || IsPlayerInRangeOfPoint(playerid,3,297.7128,-1612.1783,114.4219)/*Dach*/
        || IsPlayerInRangeOfPoint(playerid,3,290.7577,-1604.3273,134.6113)/*Biura SAN NEWS*/ 
		&& (PlayerInfo[playerid][pMember] == FRAC_SN || PlayerInfo[playerid][pLider] == FRAC_SN))
		{
			if(level > 7 || level < 0)
			{
				sendErrorMessage(playerid, "Poziom od 0 do 7");
				return 1;
			}
			if(levelLock[FRAC_SN][level] == 1)
			{
				levelLock[FRAC_SN][level] = 0; 
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i odblokowuje poziom [%d].", GetNick(playerid), level);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else if(levelLock[FRAC_SN][level] == 0)
			{
				levelLock[FRAC_SN][level] = 1; 
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i blokuje poziom [%d].", GetNick(playerid), level);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
		}
		else if((IsPlayerInRangeOfPoint(playerid,3,1311.5483,-1361.2096,62.8567) //-1 archiwum
        || IsPlayerInRangeOfPoint(playerid,3,1305.9991,-1326.1344,52.5659) // 0 recepcja 
        || IsPlayerInRangeOfPoint(playerid,3,1309.9982,-1364.2216,59.6271) // 1 korytarze
        || IsPlayerInRangeOfPoint(playerid,3,1310.1989,-1328.8876,82.5859) // 2 biura
        || IsPlayerInRangeOfPoint(playerid,3,1310.2946,-1321.2517,74.6955) // 3 socjal
        || IsPlayerInRangeOfPoint(playerid,3,1310.3961,-1319.0530,35.6587))// 4 dach
		&& GetPlayerOrg(playerid) == FAMILY_SAD)
		{
		    if(level > 4 || level < -1)
			{
				sendErrorMessage(playerid, "Poziom od -1 do 4");
				return 1;
			}
			if(SadWinda[level+1] == 1)
			{
				SadWinda[level+1] = 0; 
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i odblokowuje poziom [%d].", GetNick(playerid), level+1);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else if(SadWinda[level+1] == 1)
			{
				SadWinda[level+1] = 1; 
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i odblokowuje poziom [%d].", GetNick(playerid), level+1);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}		
		
		}
		else if((IsPlayerInRangeOfPoint(playerid,2.0, 1144.4740, -1333.2556, 13.8348) ||
        IsPlayerInRangeOfPoint(playerid,2.0, 1167.2428,-1311.8409,31.6567) ||
        IsPlayerInRangeOfPoint(playerid,2.0,1104.2808,-1291.9760,21.6958)||
        IsPlayerInRangeOfPoint(playerid,2.0,1135.2930,-1358.6663,25.5729)||
        IsPlayerInRangeOfPoint(playerid,2.0,1170.3951,-1296.2148,31.7773)||
        IsPlayerInRangeOfPoint(playerid,2.0,1155.3907,-1363.1615,26.9370)||
        IsPlayerInRangeOfPoint(playerid,2.0,1127.3309,-1344.8870,20.3422)||
        IsPlayerInRangeOfPoint(playerid,2.0,1174.5618,-1376.4209,24.2193)||
        IsPlayerInRangeOfPoint(playerid,2.0, 1161.8228, -1337.0521, 31.6112)) && (PlayerInfo[playerid][pMember] == 4 || PlayerInfo[playerid][pLider] == 4))
        {
            if(level == 0 && LSMCWindap0 == 0)//level 00
		    {
		    	LSMCWindap0 = 1;
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Zamkn��e� poziom nr [0]!");
				GetPlayerName(playerid, nick, sizeof(nick));
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i blokuje poziom [0].", nick);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else if(level == 0 && LSMCWindap0 == 1)//level 00
		    {
		    	LSMCWindap0 = 0;
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Otworzy�e� poziom nr [0]!");
				GetPlayerName(playerid, nick, sizeof(nick));
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i otwiera poziom [0].", nick);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else if(level == 2 && LSMCWindap2 == 0)//level 02
		    {
		    	LSMCWindap2 = 1;
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Zamkn��e� poziom nr [2]!");
				GetPlayerName(playerid, nick, sizeof(nick));
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i blokuje poziom [2].", nick);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else if(level == 2 && LSMCWindap2 == 1)//level 02
		    {
		    	LSMCWindap2 = 0;
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Otworzy�e� poziom nr [2]!");
				GetPlayerName(playerid, nick, sizeof(nick));
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i otwiera poziom [2].", nick);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else if(level == 8 && LSMCWindap8 == 0)//level 08
		    {
		    	LSMCWindap8 = 1;
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Zamkn��e� poziom nr [8]!");
				GetPlayerName(playerid, nick, sizeof(nick));
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i blokuje poziom [8].", nick);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else if(level == 8 && LSMCWindap8 == 1)//level 08
		    {
		    	LSMCWindap8 = 0;
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Otworzy�e� poziom nr [8]!");
				GetPlayerName(playerid, nick, sizeof(nick));
				format(string, sizeof(string),"* %s wstukuje kod na panelu windy i otwiera poziom [8].", nick);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			else
		    {
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "B��d! Mo�esz zarz�dza� tylko poziomami [0], [2], [8]!");
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie znajdujesz si� obok windy, kt�r� mo�esz zarz�dza�!");
		}
	}
	return 1;
}
