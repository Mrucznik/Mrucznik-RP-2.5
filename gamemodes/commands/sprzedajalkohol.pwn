//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------[ sprzedajalkohol ]--------------------------------------------//
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

CMD:sprzedaja(playerid, params[]) return cmd_sprzedajalkohol(playerid, params);
CMD:sella(playerid, params[]) return cmd_sprzedajalkohol(playerid, params);
CMD:sprzedajalkohol(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsAPrzestepca(playerid) || PlayerInfo[playerid][pAdmin] >= 1000 || GetPlayerOrg(playerid) == 16)
        {
			
     		new x_nr[16];
			new giveplayerid;
			if( sscanf(params, "s[16] u", x_nr, giveplayerid))
			{
				sendTipMessage(playerid, "U�YJ: /sprzedaja [nazwa] [playerid]");
				sendTipMessage(playerid, "Dost�pne nazwy: Piwo, Wino, Sprunk, Cygaro");
				return 1;
			}
			
			if(IsPlayerConnected(giveplayerid) || giveplayerid != INVALID_PLAYER_ID)
			{
				if(GetDistanceBetweenPlayers(playerid,giveplayerid) < 5 && Spectate[giveplayerid] == INVALID_PLAYER_ID)
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					if(strcmp(x_nr,"piwo",true) == 0)
					{
						format(string, sizeof(string), "* Sprzeda�e� Piwo graczowi: %s, koszt sprzeda�y: 40$.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Gracz %s sprzeda� tobie 5 Piw 'Mruczny Gul'.",sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[giveplayerid][pPiwo] = 5;
						DajKase(playerid, -40);
						return 1;
					}
					else if(strcmp(x_nr,"wino",true) == 0)
					{
						format(string, sizeof(string), "* Sprzeda�e� Wino graczowi: %s, koszt sprzeda�y: 50$.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Gracz %s sprzeda� tobie 5 Win 'Komandos'.",sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[giveplayerid][pWino] = 5;
						DajKase(playerid, -50);
						return 1;
					}
					else if(strcmp(x_nr,"sprunk",true) == 0)
					{
						format(string, sizeof(string), "* Sprzeda�e� Sprunka graczowi: %s, koszt sprzeda�y: 30$.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Gracz %s sprzeda� tobie 5 Sprunk�w.",sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[giveplayerid][pSprunk] = 5;
						DajKase(playerid, -30);
						return 1;
					}
					else if(strcmp(x_nr,"cygaro",true) == 0)
					{
						format(string, sizeof(string), "* Sprzeda�e� Paczk� Cygar graczowi: %s, koszt sprzeda�y: 75$.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Gracz %s sprzeda� tobie paczk� 5 cygar kolumbijskich.",sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[giveplayerid][pCygaro] = 5;
						DajKase(playerid, -75);
						return 1;
					}
				}
				else
				{
					format(string, sizeof(string), "Jeste� zbyt daleko od gracza %s.",giveplayer);
					sendErrorMessage(playerid, string);
				}
			}
			else
			{
				sendErrorMessage(playerid, "Gracz jest nieaktywny!");
				return 1;
			}
        }
        else
        {
            sendErrorMessage(playerid, "Nie masz czego sprzeda� / nie jeste� z Mafii !");
            return 1;
        }
    }
    return 1;
}

//---------------------------------------[Reforma Prac]---------------------------------------------------------------------------------------------

//---------------------------------------[Bokser]---------------------------------------------------------------------------------------------


