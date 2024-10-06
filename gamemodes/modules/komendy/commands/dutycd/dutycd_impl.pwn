//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                     a                                                     //
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
// Autor: mrucznik
// Data utworzenia: 15.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_dutycd_Impl(playerid)
{
    new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(IsAPolicja(playerid) && PoziomPoszukiwania[playerid] > 0)
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
			if(IsAtDutyPlace(playerid))
			{
				if(OnDuty[playerid]==0 && OnDutyCD[playerid] == 0)
		        {
			    	format(string, sizeof(string), "* Oficer %s bierze odznak� i bro� ze swojej szafki.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					DajBronieFrakcyjne(playerid);
					SetPlayerArmour(playerid, 90);
	    		    SetPlayerHealth(playerid, 100);
	    		    SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);
					OnDuty[playerid] = 1;
					OnDutyCD[playerid] = 1;
					AddLSPDMemberToThiefMapIcons(playerid);
                    //SetPlayerToTeamColor(playerid);
				}
				else if(OnDuty[playerid]==1 && OnDutyCD[playerid] == 1)
				{
					format(string, sizeof(string), "* Oficer %s odk�ada odznak� i bro� do swojej szafki.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					SetPlayerArmour(playerid, 0.0);
	    		    SetPlayerHealth(playerid, 100);
					
	    		    SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);
                    OnDuty[playerid] = 0;
					SecretAgent[playerid] = 0;
                    OnDutyCD[playerid] = 0;
                    PrzywrocBron(playerid);
                    SetPlayerToTeamColor(playerid);
					RmvLSPDMemberFromThiefMapIcons(playerid);
				}
			}
			else
			{
				sendTipMessage(playerid, "Nie jeste� w szatni !");
				return 1;
			}
		}
		else if((PlayerInfo[playerid][pMember] == FRAC_BOR && PlayerInfo[playerid][pRank] >= 2) || PlayerInfo[playerid][pLider] == FRAC_BOR)
		{
			if(IsPlayerInRangeOfPoint(playerid, 5.0, 1521.8843,-1479.6427,22.9377))
			{
				if(OnDuty[playerid] == 0 && OnDutyCD[playerid] == 0)
				{
					format(string, sizeof(string), "* Agent %s bierze identyfikator i bro� ze swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    DajBronieFrakcyjne(playerid);
                    SetPlayerArmour(playerid, 70);
                    SetPlayerHealth(playerid, 100);
                    SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);
                    OnDuty[playerid] = 1;
                    OnDutyCD[playerid] = 1;
				}
				else
				{
					format(string, sizeof(string), "* Agent %s odk�ada identyfikator i bro� do swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    SetPlayerArmour(playerid, 0.0);
                    OnDuty[playerid] = 0;
					SecretAgent[playerid] = 0;
                    OnDutyCD[playerid] = 0;
                    SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);
                    PrzywrocBron(playerid);
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie jeste� w odpowiednim miejscu!"); 
				return 1;
			}
		}
		else if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLider] == 3)
        {
            if (IsAtDutyPlace(playerid))
            {
                if(OnDuty[playerid]==0 && OnDutyCD[playerid] == 0)
                {
                    format(string, sizeof(string), "* Funkcjonariusz %s bierze odznak� i bro� ze swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    DajBronieFrakcyjne(playerid);
                    SetPlayerArmour(playerid, 90);
                    SetPlayerHealth(playerid, 100);
                    SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);
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
					SecretAgent[playerid] = 0;
                    OnDutyCD[playerid] = 0;
                    SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);
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
	}
	return 1;
}

//end
