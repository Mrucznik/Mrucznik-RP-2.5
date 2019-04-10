//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ dutycd ]------------------------------------------------//
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

CMD:dutysbi(playerid) return cmd_dutycd(playerid);
CMD:dutycd(playerid)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(IsACop(playerid) && PoziomPoszukiwania[playerid] > 0)
		{
			sendTipMessage(playerid, "Osoby poszukiwane przez policj� nie mog� rozpocz�� s�u�by !");
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie mo�esz tego u�y�  podczas @Duty! Zejd� ze s�u�by u�ywaj�c /adminduty");
			return 1;
		}
        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendTipMessage(playerid, "Aby wzi�� s�u�be musisz by� pieszo!");

        if(OnDuty[playerid]==1 && OnDutyCD[playerid] == 0) return sendTipMessage(playerid, "U�yj /duty !");

		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLider] == 1)
		{
			if (PlayerToPoint(3, playerid,255.3,77.4,1003.6)
			|| PlayerToPoint(5, playerid, 266.7904,118.9303,1004.6172)
			|| PlayerToPoint(3, playerid, 1579.6711,-1635.4512,13.5609)
			|| PlayerToPoint(3, playerid, -2614.1667,2264.6279,8.2109)
			|| PlayerToPoint(3, playerid, 2425.6,117.69,26.5)//nowe domy
			|| PlayerToPoint(3, playerid, -1649.6832,885.4910,-45.4141)//nowe komi by dywan
			|| PlayerToPoint(3, playerid, -1645.3046,895.2336,-45.4141)
            || PlayerToPoint(3, playerid, 1572.1919,-1631.5922,13.3991))//KILSON NOWY SPAWN

			{
				if(OnDuty[playerid]==0 && OnDutyCD[playerid] == 0)
		        {
			    	format(string, sizeof(string), "* Oficer %s bierze odznak� i bro� ze swojej szafki.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					DajBronieFrakcyjne(playerid);
					SetPlayerArmour(playerid, 90);
	    		    SetPlayerHealth(playerid, 100);
	    		    //SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	    		    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
					OnDuty[playerid] = 1;
					OnDutyCD[playerid] = 1;
                    //SetPlayerToTeamColor(playerid);
				}
				else if(OnDuty[playerid]==1 && OnDutyCD[playerid] == 1)
				{
					format(string, sizeof(string), "* Oficer %s odk�ada odznak� i bro� do swojej szafki.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					SetPlayerArmour(playerid, 0.0);
	    		    SetPlayerHealth(playerid, 100);
					
	    		    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                    OnDuty[playerid] = 0;
                    OnDutyCD[playerid] = 0;
                    PrzywrocBron(playerid);
                    SetPlayerToTeamColor(playerid);
				}
			}
			else
			{
				sendTipMessage(playerid, "Nie jeste� w szatni !");
				return 1;
			}
		}
		else if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLider] == 3)
        {
            if ( IsPlayerInRangeOfPoint(playerid, 5.0, 254.1888,77.0841,1003.6406) || IsPlayerInRangeOfPoint(playerid, 5.0, 609.0364,-555.1090,19.4573) ) //PlayerToPoint(3, playerid,255.3,77.4,1003.6) || PlayerToPoint(3,playerid,266.7904,118.9303,1004.6172) || PlayerToPoint(10.0,playerid, 2515.0200, -2459.5896, 13.8187)
            {
                if(OnDuty[playerid]==0 && OnDutyCD[playerid] == 0)
                {
                    format(string, sizeof(string), "* Funkcjonariusz %s bierze odznak� i bro� ze swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    DajBronieFrakcyjne(playerid);
                    SetPlayerArmour(playerid, 90);
                    SetPlayerHealth(playerid, 100);
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                    OnDuty[playerid] = 1;
                    OnDutyCD[playerid] = 1;
                }
                else if(OnDuty[playerid]==1 && OnDutyCD[playerid] == 1)
                {
                    format(string, sizeof(string), "* Funkcjonariusz %s odk�ada odznak� i bro� do swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    SetPlayerArmour(playerid, 0.0);
                    SetPlayerHealth(playerid, 100);
                    OnDuty[playerid] = 0;
                    OnDutyCD[playerid] = 0;
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                    PrzywrocBron(playerid);
                }
            }
            else
            {
                sendTipMessage(playerid, "Nie jeste� w szatni !");
                return 1;
            }
        }
		else
		{
		    noAccessMessage(playerid);
		}
        if(GetPlayerSkin(playerid) == 0)
        {
            SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
            sendTipMessage(playerid, "Nie masz skina frakcyjnego!");
        }
	}
	return 1;
}
