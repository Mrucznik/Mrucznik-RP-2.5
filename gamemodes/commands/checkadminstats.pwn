//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------[ checkadminstats ]--------------------------------------------//
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

CMD:checkadminstats(playerid, params[])
{
	new SenderAdminName[MAX_PLAYER_NAME];
	new FirstSenderAdminName[MAX_PLAYER_NAME];
	new string[325];
	new giveplayerid;
	if(sscanf(params, "k<fix>", giveplayerid))
	{
		sendTipMessage(playerid, "U�yj /checkadminstats [ID]");
		return 1;
	}
	if(PlayerInfo[playerid][pAdmin] >= 1000) 
	{
		if(giveplayerid != INVALID_PLAYER_ID)
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= 1 || PlayerInfo[giveplayerid][pNewAP] >= 1)
			{
				if(GetPlayerAdminDutyStatus(giveplayerid) == 1)
				{
					
					GetPVarString(giveplayerid, "pAdminDutyNickOn", SenderAdminName, sizeof(SenderAdminName)); 
					GetPVarString(giveplayerid, "pAdminDutyNickOff", FirstSenderAdminName, sizeof(FirstSenderAdminName)); 
					
					format(string, sizeof(string), "{C0C0C0}Statystyki\n{800080}Nick administratora:{C0C0C0}%s\n{800080}Nick IC: {C0C0C0}%s\n{800080}Nadane Bany: {C0C0C0}%d\n{800080}Nadane Warny: {C0C0C0}%d\n{800080}Nadane Kicki: {C0C0C0}%d\n{800080}Inne akcje: {C0C0C0}%d\n\n{C2A2DA}Na s�u�bie ju�: {C0C0C0}%d godzin i %d minut", SenderAdminName, FirstSenderAdminName,iloscBan[giveplayerid],iloscWarn[giveplayerid],iloscKick[giveplayerid],iloscInne[giveplayerid],AdminDutyGodziny[giveplayerid], AdminDutyMinuty[giveplayerid]);
					ShowPlayerDialogEx(playerid, 1091, DIALOG_STYLE_MSGBOX, "System @DUTY", string, "Okej", "");
					return 1;
				}
				else
				{
					format(string, sizeof(string), "Gracz %s nie jest podczas s�u�by!", GetNick(giveplayerid));
					sendErrorMessage(playerid, string); 
					return 1;
				}
			}
			else
			{
				format(string, sizeof(string), "Gracz %s nie jest administratorem!", GetNick(giveplayerid));
				sendErrorMessage(playerid, string); 
				return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie ma takiego gracza!"); 
			return 1;
		}
	}
	else
	{
		noAccessMessage(playerid);
	}

	return 1;
}









//-----------------<[ Timery: ]>-------------------

forward AdminDutyCzas(playerid);
public AdminDutyCzas(playerid)
{
	AdminDutyMinuty[playerid]++;
	if(AdminDutyMinuty[playerid] == 60)
	{
		AdminDutyGodziny[playerid]++;
		AdminDutyMinuty[playerid] = 0;
	
	}
	return 1;
}
//end