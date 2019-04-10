//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ news ]-------------------------------------------------//
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

CMD:news(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLider] == 9)
		{
		    new newcar = GetPlayerVehicleID(playerid);
	        if(PlayerInfo[playerid][pMuted] == 1)
			{
				sendTipMessageEx(playerid, TEAM_CYAN_COLOR, "Nie mo�esz m�wi� poniewa� zosta�e� wyciszony");
				return 1;
			}

            new bool:inpos=false;
            for(new i=0;i<MAX_VEHICLES;i++)
            {
                if(Car_GetOwner(i) == FRAC_SN && Car_GetOwnerType(i) == CAR_OWNER_FRACTION)
                {
                    if(newcar == i)
                    {
                        inpos=true;
                        break;
                    }
                }
            }

			if(inpos ||
                IsPlayerInRangeOfPoint(playerid, 20.0, 676.9533,-1339.5132,30.3588) ||
                IsPlayerInRangeOfPoint(playerid, 20.0, 660.1057,-1339.6501,29.3712) ||
                IsPlayerInRangeOfPoint(playerid, 20.0, 655.8636,-1377.5455,28.4672) ||
                IsPlayerInRangeOfPoint(playerid, 20.0, 652.1369,-1367.9576,28.5072) ||
                IsPlayerInRangeOfPoint(playerid, 20.0, 651.2371,-1367.7997,28.5072) ||
                IsPlayerInRangeOfPoint(playerid, 20.0, 667.8975,-1380.4872,28.4672))
			{
				GetPlayerName(playerid, sendername, sizeof(sendername));
				if(isnull(params))
				{
					sendTipMessage(playerid, "U�yj /news [newstext]");
					return 1;
				}
				if (strfind(params , "ip:" , true)>=0 ||strfind(params , "www." , true)>=0 || strfind(params , ".pl" , true)>=0 || strfind(params , ",pl" , true)>=0  || strfind(params , " ip" , true)>=0 || strfind(params , ":7" , true)>=0 || strfind(params , "795" , true)>=0 || strfind(params , ":3" , true)>=0 || strfind(params , ":4" , true)>=0 || strfind(params , ":5" , true)>=0 || strfind(params , ":6" , true)>=0 || strfind(params , ":8" , true)>=0)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "NIE CHCEMY REKLAM!");
					format(string, sizeof(string), "AdmWarning: [%d] %s REKLAMA: %s.",playerid,sendername,params);
					ABroadCast(COLOR_LIGHTRED,string,1);
					CzitLog(string);
				}
				else
				{
				    if(AntySpam[playerid] == 1)
				    {
				        sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 3 sekund");
				        return 1;
				    }
					format(string, sizeof(string), "NR %s: %s", sendername, params);
					OOCNews(COLOR_NEWS,string);
					SendDiscordMessage(DISCORD_SAN_NEWS, string);
                    //OOCNews(0xFF8C55FF, string);
					PlayerInfo[playerid][pNewsSkill] ++;
					if(PlayerInfo[playerid][pNewsSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci Reportera wynosz� teraz 2, Nied�ugo b�dziesz m�g� lata� helikopterem i prowadzi� wywiady."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci Reportera wynosz� teraz 3, Nied�ugo b�dziesz m�g� lata� helikopterem i prowadzi� wywiady."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci Reportera wynosz� teraz 4, mo�esz teraz lata� helikopterem."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci Reportera wynosz� teraz 5, mo�esz teraz prowadzi� wywiady na �ywo z kim chcesz."); }
                    SetTimerEx("AntySpamTimer",3000,0,"d",playerid);
	    			AntySpam[playerid] = 1;
				}
			}
			else if(PlayerToPoint(10.5, playerid, 1820.0637,-1315.9836,109.9520))
			{
            	GetPlayerName(playerid, sendername, sizeof(sendername));
				if(isnull(params))
				{
					sendTipMessage(playerid, "U�yj /news [newstext]");
					return 1;
				}
				if (strfind(params , "ip:" , true)>=0 ||strfind(params , "www." , true)>=0 || strfind(params , ".pl" , true)>=0 || strfind(params , ",pl" , true)>=0  || strfind(params , " ip" , true)>=0 || strfind(params , ":7" , true)>=0 || strfind(params , "795" , true)>=0 || strfind(params , ":3" , true)>=0 || strfind(params , ":4" , true)>=0 || strfind(params , ":5" , true)>=0 || strfind(params , ":6" , true)>=0 || strfind(params , ":8" , true)>=0)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "NIE CHCEMY REKLAM!");
					format(string, sizeof(string), "AdmWarning: [%d] %s REKLAMA: %s.",playerid,sendername,params);
					ABroadCast(COLOR_LIGHTRED,string,1);
					CzitLog(string);
				}
				else
				{
				    if(AntySpam[playerid] == 1)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Odczekaj 3 sekund");
				        return 1;
				    }
					format(string, sizeof(string), "NR %s: %s", sendername, params);
					//OOCNews(COLOR_NEWS,string);
                    OOCNews(0xBB5D00FF, string);
					SendDiscordMessage(DISCORD_SAN_NEWS, string);
					PlayerInfo[playerid][pNewsSkill] ++;
					if(PlayerInfo[playerid][pNewsSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci Reportera wynosz� teraz 2, Nied�ugo b�dziesz m�g� lata� helikopterem i prowadzi� wywiady."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci Reportera wynosz� teraz 3, Nied�ugo b�dziesz m�g� lata� helikopterem i prowadzi� wywiady."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci Reportera wynosz� teraz 4, mo�esz teraz lata� helikopterem."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci Reportera wynosz� teraz 5, mo�esz teraz prowadzi� wywiady na �ywo z kim chcesz."); }
                    SetTimerEx("AntySpamTimer",3000,0,"d",playerid);
	    			AntySpam[playerid] = 1;
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w wozie SAN News !");
			    return 1;
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� Reporterem !");
		}
	}//not connected
	return 1;
}


