//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ megafon ]------------------------------------------------//
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

YCMD:megafon(playerid, params[], help)
{
	new string[256];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pMuted] == 1)
		{
			sendTipMessageEx(playerid, TEAM_CYAN_COLOR, "Nie mo�esz pisa� poniewa� jeste� wyciszony");
			return 1;
		}
		//new tmpcar = GetPlayerVehicleID(playerid);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj (/m)egafon [tekst]");
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Dobry admin nie powinien robi� OOC w IC! Pisz poprzez /b [tre��]");
			return 1;
		}
		//=========================[DLA S�DU]======================================
		if(IsPlayerInRangeOfPoint(playerid,5,1319.7424,-1359.5912,73.1409)
        || IsPlayerInRangeOfPoint(playerid,5,1319.8655,-1319.5767,73.1409)
        || IsPlayerInRangeOfPoint(playerid,10,1313.1859,-1295.6798,79.7320))//Oskar�ony
		{
			format(string, sizeof(string), "[Oskar�ony %s: %s]", sendername, params);
			ProxDetector(100.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid,5,1311.6882,-1359.3763,73.1409)
        || IsPlayerInRangeOfPoint(playerid,5,1311.6819,-1319.5743,73.1409)
        || IsPlayerInRangeOfPoint(playerid,10,1306.6122,-1295.5017,79.7320))//Oskar�yciel
		{
			format(string, sizeof(string), "[Oskar�yciel %s: %s]", sendername, params);
			ProxDetector(100.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid,5,1315.5699,-1355.1246,73.1409)
        || IsPlayerInRangeOfPoint(playerid,5,1315.6741,-1314.7883,73.1409)
        || IsPlayerInRangeOfPoint(playerid,10,1321.9991,-1283.2745,80.1720))//Swiadek
		{
			format(string, sizeof(string), "[�wiadek %s: %s]", sendername, params);
			ProxDetector(100.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			return 1;
		}
		//=======================[KONIEC]==================================================
		//=======================[DLA ORGANIZACJI:]========================================
		
		if(PlayerInfo[playerid][pMember] == 1||PlayerInfo[playerid][pLider] == 1)
		{
			format(string, sizeof(string), "[%s:o< %s]", sendername, params);
			ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
		else if(PlayerInfo[playerid][pMember] == 2||PlayerInfo[playerid][pLider] == 2)
		{
			format(string, sizeof(string), "[%s:o< %s]", sendername, params);
			ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
		else if(PlayerInfo[playerid][pMember] == 3||PlayerInfo[playerid][pLider] == 3)
		{
		    format(string, sizeof(string), "[%s:o< %s]", sendername, params);
		    ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
		else if(PlayerInfo[playerid][pMember] == 7||PlayerInfo[playerid][pLider] == 7)
		{
		    format(string, sizeof(string), "[%s:o< %s]", sendername, params);
		    ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
		else if(PlayerInfo[playerid][pJob] == 1 && PlayerInfo[playerid][pDetSkill] > 400)
		{
		    format(string, sizeof(string), "[%s:o< %s]", sendername, params);
		    ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
		else if(PlayerInfo[playerid][pMember] == 4 || PlayerInfo[playerid][pLider] == 4)
		{
		    format(string, sizeof(string), "[%s:o< %s]", sendername, params);
		    ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
		//PA�DZIOCH
		else if(PlayerInfo[playerid][pMember] == FRAC_SN || PlayerInfo[playerid][pLider] == FRAC_SN)
		{
			format(string, sizeof(string), "[%s:o< %s]", sendername, params);
			ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
		else if( (PlayerInfo[playerid][pMember] == FRAC_KT || PlayerInfo[playerid][pLider] == FRAC_KT) && PlayerInfo[playerid][pRank] >= 3)
		{
			format(string, sizeof(string), "[%s:o< %s]", sendername, params);
			ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
		//
		else if(PlayerInfo[playerid][pMember] == 17||PlayerInfo[playerid][pLider] == 17)
		{
			format(string, sizeof(string), "[%s:o< %s]", sendername, params);
			ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		}
        else if((PlayerInfo[playerid][pMember] == 11 || PlayerInfo[playerid][pLider] == 11) && PlayerInfo[playerid][pRank] >= 5)
        {
            if(IsPlayerInRangeOfPoint(playerid, 5.0, 1471.2521,-1825.2295,78.3412))
            {
                format(string, sizeof(string), "[Wyk�adowca %s: %s]", sendername, params);
                ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
            }
            else
            {
                return sendTipMessage(playerid, "Jako wyk�adowca mo�esz u�ywa� mikrofonu tylko na sali wyk�adowczej!");
            }
        }
        else if(GetPlayerOrg(playerid) == FAMILY_SAD && PlayerInfo[playerid][pRank] > 2)
        {
            if(IsPlayerInRangeOfPoint(playerid,5,1315.6835,-1348.1102,73.9968)
        	|| IsPlayerInRangeOfPoint(playerid,5,1315.5305,-1308.1102,73.9968)
        	|| IsPlayerInRangeOfPoint(playerid,10,1309.9856,-1278.9166,81.7088))
            {
                format(string, sizeof(string), "[S�dzia %s: %s]", sendername, params);
			    ProxDetector(100.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
            }
            else
            {
                return sendTipMessage(playerid, "Jako s�dzia mo�esz u�ywa� mikrofonu tylko na sali rozpraw!");
            }
        }
		else
		{
		    noAccessMessage(playerid);
			return 1;
		}
	    Log(chatLog, INFO, "%s megafon: %s", GetPlayerLogName(playerid), params);
		format(string, sizeof(string), "Megafon: %s!!", params);
		SetPlayerChatBubble(playerid,string,COLOR_YELLOW,30.0,8000);
	}
	return 1;
}
