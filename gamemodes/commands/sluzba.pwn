//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ sluzba ]------------------------------------------------//
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

CMD:duty(playerid) return cmd_sluzba(playerid);
CMD:sluzba(playerid)
{
    new string[128];
    new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(GetPVarInt(playerid, "IsAGetInTheCar") == 1)
		{
			sendErrorMessage(playerid, "Podczas wsiadania nie mo�esz tego u�y�"); 
			return 1;
		}
        if(IsACop(playerid) && PoziomPoszukiwania[playerid] > 0)
        {
            sendTipMessage(playerid, "Osoby poszukiwane przez policj� nie mog� rozpocz�� s�u�by !");
            return 1;
        }
        if(IsACop(playerid) && OnDutyCD[playerid] == 1)
        {
            sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "U�yj /dutycd lub /dutysbi !");
            return 1;
        }
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie mo�esz tego u�y�  podczas @Duty! Zejd� ze s�u�by u�ywaj�c /adminduty");
			return 1;
		}
		
        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return sendTipMessage(playerid, "Aby wzi�� s�u�be musisz by� pieszo!");
        GetPlayerName(playerid, sendername, sizeof(sendername));
        if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLider] == 1)
        {
            if (PlayerToPoint(3, playerid,255.3,77.4,1003.6)
            || PlayerToPoint(5, playerid, 266.7904,118.9303,1004.6172)
            || PlayerToPoint(3, playerid, 1579.6711,-1635.4512,13.5609) //STARE DUTY
            || PlayerToPoint(3, playerid, -2614.1667,2264.6279,8.2109)
            || PlayerToPoint(3, playerid, 2425.6,117.69,26.5)//nowe domy
            || PlayerToPoint(3, playerid, -1649.6832,885.4910,-45.4141)//nowe komi by dywan
            || PlayerToPoint(3, playerid, -1645.3046,895.2336,-45.4141)
			|| PlayerToPoint(3, playerid, 2522.8916,-2441.6270,13.6435))//nowe komi by dywan

            {
                if(OnDuty[playerid]==0)
                {
                    format(string, sizeof(string), "* Oficer %s bierze odznak� i bro� ze swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    DajBronieFrakcyjne(playerid);
                    SetPlayerHealth(playerid, 100);
                    SetPlayerArmour(playerid, 90.0);
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
                    OnDuty[playerid] = 1;
                    SetPlayerToTeamColor(playerid);
                }
                else if(OnDuty[playerid]==1)
                {
                    format(string, sizeof(string), "* Oficer %s odk�ada odznak� i bro� do swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    SetPlayerHealth(playerid, 100);
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                    OnDuty[playerid] = 0;
                    SetPlayerArmour(playerid, 0.0);
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
        else if(PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLider] == 2)
        {
            if (PlayerToPoint(3.5, playerid,592.5598,-1477.5116,82.4736) //nowe FBI by Ubunteq
            || PlayerToPoint(5, playerid, 185.3000488281,-1571.0999755859,-54.5)//nowe domy
            || PlayerToPoint(5, playerid, 1189.5999755859,-1574.6999511719,-54.5 ))//nowe domy /duty w domu
            {
				if(GetPlayerVirtualWorld(playerid) == 2)
				{
					if(OnDuty[playerid]==0)
					{
						format(string, sizeof(string), "* Agent FBI %s bierze odznak� i bro� ze swojej szafki.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						DajBronieFrakcyjne(playerid);
						SetPlayerArmour(playerid, 90);
						SetPlayerHealth(playerid, 100);
						OnDuty[playerid] = 1;
						SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
						SetPlayerToTeamColor(playerid);
					}
					else if(OnDuty[playerid]==1)
					{
						format(string, sizeof(string), "* Agent FBI %s odk�ada odznak� i bro� do swojej szafki.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPlayerArmour(playerid, 0.0);
						SetPlayerHealth(playerid, 100);
						OnDuty[playerid] = 0;
						PrzywrocBron(playerid);
						SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
						SetPlayerToTeamColor(playerid);
					}
				}
				else
				{
					sendErrorMessage(playerid, "Nie jeste� w szatni!"); 
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
                if(OnDuty[playerid]==0)
                {
                    format(string, sizeof(string), "* Funkcjonariusz %s bierze mundur i bro� ze swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    DajBronieFrakcyjne(playerid);
                    SetPlayerArmour(playerid, 90);
                    SetPlayerHealth(playerid, 100);
                    OnDuty[playerid] = 1;
                    SetPlayerToTeamColor(playerid);
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
                }
                else if(OnDuty[playerid]==1)
                {
                    format(string, sizeof(string), "* Funkcjonariusz %s odk�ada mundur i bro� do swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    SetPlayerArmour(playerid, 0.0);
                    SetPlayerHealth(playerid, 100);
                    OnDuty[playerid] = 0;
                    SetPlayerToTeamColor(playerid);
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
		else if(GetPlayerOrg(playerid) == 12)
		{
			if ( IsPlayerInRangeOfPoint(playerid, 5.0, 2522.8916,-2441.6270,13.6435) )
            {
				if(OnDuty[playerid]==0)
                {
                    format(string, sizeof(string), "* �o�nierz %s bierze odznak� i bro� ze swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    SetPlayerArmour(playerid, 90);
                    SetPlayerHealth(playerid, 100);
					
					if(PlayerInfo[playerid][pSex] == 1)
						SetPlayerSkin(playerid, 287);
					else
						SetPlayerSkin(playerid, 191);
                    OnDuty[playerid] = 1;
                }
                else if(OnDuty[playerid]==1)
                {
                    format(string, sizeof(string), "* �o�nierz %s odk�ada odznak� i bro� do swojej szafki.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    SetPlayerArmour(playerid, 0.0);
                    SetPlayerHealth(playerid, 100);
                    OnDuty[playerid] = 0;
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                    PrzywrocBron(playerid);
                }
			}
		}
        else if(PlayerInfo[playerid][pMember] == 4||PlayerInfo[playerid][pLider] == 4)
        {
            if (PlayerToPoint(4, playerid,1147.3623,-1314.4891,13.6743))
            {
                if(JobDuty[playerid] == 1)
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Nie jeste� ju� na s�u�bie medyka, nie b�dziesz widzia� zg�osze�.");
                    JobDuty[playerid] = 0;
                    Medics -= 1;
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                    SetPlayerToTeamColor(playerid);
                }
                else
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeste� na s�u�bie medyka, kiedy kto� b�dzie potrzebowa� pomocy zostanie wy�wietlony komunikat.");
                    JobDuty[playerid] = 1;
                    Medics += 1;
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
                    SetPlayerToTeamColor(playerid);
                }
            }
            else
            {
                sendTipMessage(playerid, "Nie jeste� w szatni !");
                return 1;
            }
        }
        else if(GetPlayerFraction(playerid) == FRAC_LSFD)
        {
            if (IsPlayerInRangeOfPoint(playerid, 4.0, 1758.4077,-1123.4249,227.8059))
            {
                if(JobDuty[playerid] == 1)
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Nie jeste� ju� na s�u�bie stra�aka.");
                    JobDuty[playerid] = 0;
                    PrzywrocBron(playerid);
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                    SetPlayerToTeamColor(playerid);
                }
                else
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeste� na s�u�bie stra�aka.");
                    JobDuty[playerid] = 1;
                    DajBronieFrakcyjne(playerid);
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
                    SetPlayerToTeamColor(playerid);
                }
            }
            else
            {
                sendTipMessage(playerid, "Nie jeste� w szatni !");
                return 1;
            }
        }
        else if(PlayerInfo[playerid][pMember] == 11||PlayerInfo[playerid][pLider] == 11)
        {
            if(JobDuty[playerid] == 1)
            {
                SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Nie jeste� ju� na s�u�bie urz�dasa.");
                JobDuty[playerid] = 0;
                SetPlayerToTeamColor(playerid);
                SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				
            }
            else
            {
                SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeste� ju� na s�u�bie urz�dasa. Id� do Urz�du urz�dasie.");
                JobDuty[playerid] = 1;
                SetPlayerToTeamColor(playerid);
                SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
            }
        }
        else if(PlayerInfo[playerid][pMember] == 7||PlayerInfo[playerid][pLider] == 7)
        {
            if (PlayerToPoint(5, playerid,1527.2361,-1453.2623,67.8331))
            {
                if(OnDuty[playerid]==0)
                {
                    format(string, sizeof(string), "* Agent USSS %s wyci�ga bro� i garnitur z szafy.", sendername);//a
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    OnDuty[playerid]= 1;
                    DajBronieFrakcyjne(playerid);
                    SetPlayerArmour(playerid, 90);
                    SetPlayerHealth(playerid, 100);
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
                    SetPlayerToTeamColor(playerid);
                }
                else if(OnDuty[playerid]==1)
                {
                    format(string, sizeof(string), "* Agent USSS %s chowa bro� i garnitur do szafy.", sendername);
                    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                    SetPlayerArmour(playerid, 0);
                    SetPlayerHealth(playerid, 100);
                    OnDuty[playerid] = 0;
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                    SetPlayerToTeamColor(playerid);
                    PrzywrocBron(playerid);
                }
            }
        }
        else if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
        {
			if(JobDuty[playerid] == 1)
            {
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "*Nie jeste� ju� na s�u�bie taks�wkarza");
				JobDuty[playerid] = 0;
				SetPlayerToTeamColor(playerid);
				SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
            }
            else
            {
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wchodzisz na s�u�b�, udaj si� do pojazdu!");
                JobDuty[playerid] = 1;
                SetPlayerToTeamColor(playerid);
                SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
            }
        }
        else if(PlayerInfo[playerid][pJob] == 7)
        {
            if(AntySpam[playerid] == 0)
            {
                if(JobDuty[playerid] == 1)
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Nie jeste� ju� na s�u�bie mechanika, nie b�d� ci si� wy�wietla� zg�oszenia.");
                    JobDuty[playerid] = 0;
                    Mechanics -= 1;
                }
                else
                {
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeste� na s�u�bie mechanika, kiedy kto� b�dzie ci� potrzebowa� zostanie wy�wietlony komunikat.");
                    JobDuty[playerid] = 1;
                    Mechanics += 1;
                }
                AntySpam[playerid] = 1;
                SetTimerEx("AntySpamTimer",10000,0,"d",playerid);
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "Odczekaj 10 sekund");
            }
        }
        else if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLider] == 9)
        {
            if(SanDuty[playerid] == 1)
            {
                SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Nie jeste� ju� na s�u�bie reportera, komunikaty oraz kasa za SMS nie b�d� wysy�ane.");
                SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                SanDuty[playerid] = 0;
                SetPlayerToTeamColor(playerid);
            }
            else
            {
                SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeste� na s�u�bie reportera.");
                SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
                SanDuty[playerid] = 1;
                SetPlayerToTeamColor(playerid);
            }
        }
        else
        {
            sendTipMessage(playerid, "Nie jeste� policjantem !");
        }
        if(GetPlayerSkin(playerid) == 0)
        {
            SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
            sendTipMessage(playerid, "Nie masz skina frakcyjnego!");
        }
    }
    return 1;
}

