//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kradnij ]------------------------------------------------//
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

YCMD:kradnij(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
   	{
   	    if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
   	    {
            if(Car_IsValid(GetPlayerVehicleID(playerid)))
            {
                return sendTipMessageEx(playerid, COLOR_GRAD2, "Tego pojazdu nie da si� ukra��, poniewa� jest z wypo�yczalni!");
            }
			
			if(NieSpamujKradnij[playerid] == 0)
			{
				if(KradniecieWozu[playerid] > 1 && GetPlayerVehicleID(playerid) == KradniecieWozu[playerid])
				{
					sendErrorMessage(playerid, "Ju� ukrad�e� ten w�z.");
					return 1;
				}
				
				new skillz;
				if(PlayerInfo[playerid][pJackSkill] < 50)
				{
					skillz = 1;
				}
				else if(PlayerInfo[playerid][pJackSkill] >= 50 && PlayerInfo[playerid][pJackSkill] <= 99)
				{
					skillz = 2;
				}
				else if(PlayerInfo[playerid][pJackSkill] >= 100 && PlayerInfo[playerid][pJackSkill] <= 199)
				{
					skillz = 3;
				}
				else if(PlayerInfo[playerid][pJackSkill] >= 200 && PlayerInfo[playerid][pJackSkill] <= 399)
				{
					skillz = 4;
				}
				else if(PlayerInfo[playerid][pJackSkill] >= 400)
				{
					skillz = 5;
				}
				new kradnij = random(100);
				new mnoznik = skillz*19;
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string),"* %s wyci�ga m�otek i rozwala os�onk� po czym wyjmuje 2 kabelki.", sendername);
				ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				NieSpamujKradnij[playerid] = 1;
				new timer;
				if(kradnij <= mnoznik)
				{
					timer = SetTimerEx("udalo1",6000,0,"d",playerid);
					KradniecieWozu[playerid] = 1;
				}
				else
				{
					timer = SetTimerEx("nieudalo1",6000,0,"d",playerid);
					KradniecieWozu[playerid] = 1;
				}
				SetPVarInt(playerid, "timerKradnij", timer);
			}
			else
			{
				sendTipMessageEx(playerid, COLOR_GREY, "Ju� pr�bujesz ukra�� w�z !");
			}
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w poje�dzie !");
		}
	}//not connected
	return 1;
}
