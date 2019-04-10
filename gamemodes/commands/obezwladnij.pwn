//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ obezwladnij ]----------------------------------------------//
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

CMD:ob(playerid, params[]) return cmd_obezwladnij(playerid, params);
CMD:obezwladnij(playerid, params[])
{
	if(IsACop(playerid) && OnDuty[playerid] == 1 || IsABOR(playerid) || PlayerInfo[playerid][pJob] == 1 && PlayerInfo[playerid][pDetSkill] >= 4 || GetPlayerOrg(playerid) == 12)
	{
		new giveplayerid;
		if(sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /ob [ID gracza]");
			return 1;
		}
		if(giveplayerid == playerid)
		{
		    sendErrorMessage(playerid, "Nie mo�esz obezw�adni� samego siebie!");
		    return 1;
		}
		if(!IsPlayerConnected(giveplayerid))
		{
		    sendErrorMessage(playerid, "Nie ma takiego gracza!");
			return 1;
		}
		if(GetPlayerWeapon(giveplayerid) != 0 && GetPlayerWeapon(giveplayerid) != 1)
		{
		    sendErrorMessage(playerid, "Nie mo�esz obezw�adni� uzbrojonego gracza!");
			return 1;
		}
		if(Spectate[giveplayerid] != INVALID_PLAYER_ID)
		{
			sendErrorMessage(playerid, "Ten gracz jest za daleko.");
			return 1;
		}
		if(GetPVarInt(giveplayerid, "obezwladniony") > gettime())
		{
			sendTipMessage(playerid, "Jeste� zbyt zm�czony aby ponownie obezw�adni� tego gracza, odczekaj chwil�.");
			return 1;
		}
		if(PlayerInfo[playerid][pJob] == 1 && lowcaz[playerid] != giveplayerid)
		{
			sendTipMessage(playerid, "Nie masz zlecenia na tego gracza!");
			return 1;
		}
		new Float:x, Float:y, Float:z;
		GetPlayerPos(giveplayerid, x, y, z);

		if(ProxDetectorS(3.0, playerid, giveplayerid))
		{
			new string[64], sendername[MAX_PLAYER_NAME], giveplayer[MAX_PLAYER_NAME];
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			ApplyAnimation(giveplayerid, "WUZI", "CS_Dead_Guy", 4.0, 0, 1, 1, 1, -1);
			format(string, sizeof(string), "* %s obezw�adnia %s", sendername, giveplayer);
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

            SetPVarInt(giveplayerid, "obezwladniony", gettime()+30);
			SetTimerEx("WstalPoOB", 15000, false, "i", giveplayerid);
            SetPlayerArmedWeapon(giveplayerid, 0);

		}
		else
		{
			sendErrorMessage(playerid, "Jeste� zbyt daleko");
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� cz�onkiem policji na s�u�bie");
	}
	return 1;
}

