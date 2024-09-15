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
command_og_Impl(playerid, params[256])
{
    new string[256], admstring[256];
    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nie jeste� zalogowany!");
		else if(PlayerInfo[playerid][pConnectTime] == 0 && PlayerInfo[playerid][pLevel] == 1) return sendErrorMessage(playerid, "Aby pisa� og�oszenia musisz przegra� 1h na serwerze!");
		else if(GetPlayerAdminDutyStatus(playerid) == 1) return sendErrorMessage(playerid, "Nie mo�esz pisa� og�osze� podczas s�u�by administratora!");
		else if(PlayerInfo[playerid][pJailed] != 0) return sendErrorMessage(playerid, "Nie posiadasz telefonu w wi�zieniu!");
        else if(PlayerInfo[playerid][pPnumber] == 0) return SendClientMessage(playerid, COLOR_GREY, "Nie masz telefonu. Kup go w 24/7 !");
        else if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, "U�YJ: (/og)loszenie [tekst og�oszenia]");
		else if(sprawdzReklame(params, playerid) == 1) return 1;
		else if(sprawdzWulgaryzmy(params, playerid) == 1) return 1;
		else if(PlayerInfo[playerid][pBP] >= 1)
		{
			format(string, sizeof(string), "Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
			return SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
		}
		else if(PhoneOnline[playerid] == 1)
		{
			sendTipMessage(playerid, "Tw�j telefon jest wy��czony! W��cz go za pomoc� /togtel");
			return 1;
		}
		else if ((!adds) && (!IsPlayerPremiumOld(playerid)) && PlayerInfo[playerid][pAdmin] < 10)
		{
			format(string, sizeof(string), "Spr�buj p�niej, %d sekund mi�dzy og�oszeniami !",  (addtimer/1000));
			return SendClientMessage(playerid, COLOR_GRAD2, string);
		}
		else
		{
			new payout = strlen(params) * 25;
			if(kaska[playerid] < payout)
			{
				format(string, sizeof(string), "* U�y�e� %d znak�w i masz zap�aci� $%d, nie posiadasz a� tyle.", strlen(params), payout);
				return SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			}
			ZabierzKase(playerid, payout);
			format(string, sizeof(string), "Og�oszenie: %s, Kontakt: %d", params, PlayerInfo[playerid][pPnumber]);
			format(admstring, sizeof(admstring), "Og�oszenie: %s, Kontakt: %d [%s]", params, PlayerInfo[playerid][pPnumber], GetNick(playerid));
			foreach(new i : Player)
			{
				if(IsPlayerConnected(i))
				{
					if(!gNews[i] && PlayerPersonalization[i][PERS_AD] == 0)
					{
						if(GetPlayerAdminDutyStatus(i) == 1)
						{
							SendClientMessage(i, TEAM_GROVE_COLOR, admstring);
						}
						else
						{
							SendClientMessage(i, TEAM_GROVE_COLOR, string);
						}
					}
				}
			}
			Log(chatLog, INFO, "%s og�oszenie: %s", GetPlayerLogName(playerid), params);
			format(string, sizeof(string), "~r~Zaplaciles $%d~n~~w~Za: %d Znakow", payout, strlen(params));
			GameTextForPlayer(playerid, string, 5000, 5);
			if (PlayerInfo[playerid][pAdmin] < 1 && (!IsPlayerPremiumOld(playerid)))
			{
				SetTimer("AddsOn", addtimer, 0);adds = 0;
			}
		}   
    }
    return 1;
}

//end
