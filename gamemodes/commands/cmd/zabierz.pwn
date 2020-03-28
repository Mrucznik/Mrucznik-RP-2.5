//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zabierz ]------------------------------------------------//
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

YCMD:zabierz(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(gTeam[playerid] == 2 || IsAPolicja(playerid))
        {
            if(PlayerInfo[playerid][pRank] < 1)
            {
                SendClientMessage(playerid, COLOR_GREY, "Potrzebujesz 1 rangi aby zabiera� przedmioty!");
                return 1;
            }
            new x_nr[16];
			new giveplayerid;
            if(gettime() < GetPVarInt(playerid, "lic-timer")) return sendTipMessage(playerid, "Licencje oraz rzeczy mo�esz zabiera� co 30 sekund!");
			if( sscanf(params, "s[16] d", x_nr, giveplayerid))
			{
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Zabieranie rzeczy __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "U�YJ: /zabierz [nazwa] [playerid/Cz��Nicku]");
		  		SendClientMessage(playerid, COLOR_GREY, "Dost�pne nazwy: Prawojazdy, LicencjaLot, LicencjaLodz, LicencjaBron, Bron, Dragi, Mats");
				SendClientMessage(playerid, COLOR_WHITE, "|_______________________________________________________|");
				return 1;
			}

			if(!IsPlayerConnected(giveplayerid))
			{
				sendErrorMessage(playerid, "Nie ma takiego gracza !");
				return 1;
			}

			if (!ProxDetectorS(8.0, playerid, giveplayerid))
			{
				sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
				return 1;
			}

			GetPlayerName(playerid, sendername, sizeof(sendername));
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));

		    if(strcmp(x_nr,"prawojazdy",true) == 0)
			{
				format(string, sizeof(string), "* Zabra�e� %s prawo jazdy.", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� Ci prawo jazdy.", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� %s prawo jazdy.", sendername, giveplayer);
				PlayerInfo[giveplayerid][pCarLic] = 0;
			}
			else if(strcmp(x_nr,"licencjalot",true) == 0)
			{
				format(string, sizeof(string), "* Zabra�e� %s Licencje na latanie.", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� Ci licencj� na latanie.", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� %s licencj� na latanie.", sendername, giveplayer);
				PlayerInfo[giveplayerid][pFlyLic] = 0;

			}
			else if(strcmp(x_nr,"licencjabron",true) == 0)
			{
				format(string, sizeof(string), "* Zabra�e� %s Licencj� na Bro�.", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� Ci licencj� na bro�.", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� %s licencj� na bro�.", sendername, giveplayer);
				SetTimerEx("AntySB", 5000, 0, "d", giveplayerid);
				AntySpawnBroni[giveplayerid] = 5;
				PlayerInfo[giveplayerid][pGunLic] = 0;
			}
			else if(strcmp(x_nr,"licencjalodz",true) == 0)
			{
				format(string, sizeof(string), "* Zabra�e� %s Licencje na p�ywanie �odziami.", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� Ci twoj� licencj� na p�ywanie �odziami.", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� %s licencj� na lodz.", sendername, giveplayer);
				PlayerInfo[giveplayerid][pBoatLic] = 0;

			}
			else if(strcmp(x_nr,"bron",true) == 0)
			{
				format(string, sizeof(string), "* Zabra�e� %s Bronie.", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� twoj� bro�.", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� %s bro�.", sendername, giveplayer);
				SetTimerEx("AntySB", 5000, 0, "d", giveplayerid);
				AntySpawnBroni[giveplayerid] = 5;
				ResetPlayerWeapons(giveplayerid);
				UsunBron(giveplayerid);
			}
			else if(strcmp(x_nr,"dragi",true) == 0)
			{
				format(string, sizeof(string), "* Zabra�e� %s dragi.", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� twoje narkotyki.", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� %s dragi %d.", sendername, giveplayer, PlayerInfo[giveplayerid][pDrugs]);
				PlayerInfo[giveplayerid][pDrugs] = 0;
			}
			else if(strcmp(x_nr,"mats",true) == 0)
			{
				format(string, sizeof(string), "* Zabra�e� %s Materia�y.", giveplayer);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� twoje Materia�y.", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Oficer %s zabra� %s matsy %d.", sendername, giveplayer, PlayerInfo[giveplayerid][pMats]);
				PlayerInfo[giveplayerid][pMats] = 0;
			}
			else
			{
				sendTipMessageEx(playerid, COLOR_GREY, "Z�a nazwa");
				return 1;
			}

			Log(serverLog, INFO, "%s zabra� %s %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), x_nr);
        }
        else
        {
            sendErrorMessage(playerid, "Nie jeste� policjantem !");
            return 1;
        }
    }
    SetPVarInt(playerid, "lic-timer", gettime() + 30);
    return 1;
}
