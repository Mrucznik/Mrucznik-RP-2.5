//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ slap ]-------------------------------------------------//
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

YCMD:slap(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new playa;
		new option[10];
		if(sscanf(params, "k<fix>s[1]", playa, option))
		{
			if(sscanf(params, "k<fix>", playa))
			{
				sendTipMessage(playerid, "U�yj /slap [playerid/Cz��Nicku] [opcjonalnie: l-lewo, r-prawo]");
			}
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >=1 || PlayerInfo[playerid][pNewAP] >= 1 && PlayerInfo[playerid][pNewAP] <= 3 || PlayerInfo[playerid][pZG] >= 2 || IsAScripter(playerid))
		{
		    if(IsPlayerConnected(playa))
		    {
		        if(playa != INVALID_PLAYER_ID)
		        {			
					new Float:shealth;
					new Float:slx, Float:sly, Float:slz;
			        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerHealth(playa, shealth);
					SetPlayerHealth(playa, shealth-5);
					GetPlayerPos(playa, slx, sly, slz);
					if(strcmp(option,"l", true) != -1)
					{
						slx -= 5;
					}
					else if(strcmp(option,"r", true) != -1)
					{
						slx += 5;
					}
					else
					{
						sendTipMessage(playerid, "U�yj /slap [playerid/Cz��Nicku] [opcjonalnie: l-lewo, r-prawo]");
						return 1;
					}

					SetPlayerPosEx(playa, slx, sly, slz+5);
					PlayerPlaySound(playa, 1130, slx, sly, slz+5);
        			Log(punishmentLog, INFO, "Admin %s da� slapa %s", GetPlayerLogName(playerid), GetPlayerLogName(playa));
					format(string, sizeof(string), "AdmCmd: %s da� klapsa w dupsko %s",sendername, giveplayer);
					ABroadCast(COLOR_LIGHTRED,string,1);
					format(string, sizeof(string), "Dosta�e� klapsa w dupsko od administratora %s, widocznie zrobi�e� co� z�ego :)", sendername);
					SendClientMessage(playa, COLOR_PANICRED, string);
					if(GetPlayerAdminDutyStatus(playerid) == 1)
					{
						iloscInne[playerid] = iloscInne[playerid]+1;
					}
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
