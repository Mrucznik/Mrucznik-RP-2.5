//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ datek ]-------------------------------------------------//
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

CMD:charity(playerid, params[]) return cmd_datek(playerid, params);
CMD:datek(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new moneys;
		if( sscanf(params, "s[16]", string))
		{
			sendTipMessage(playerid, "U�yj /charity [kwota]");
			return 1;
		}
		moneys = FunkcjaK(string);

		if(PlayerInfo[playerid][pLocal] == 106)
		{
			sendErrorMessage(playerid, "Komenda nie dzia�a w tym miejscu");
			return 1;
		}
		if(moneys < 1)
		{
			sendTipMessage(playerid, "Datek 0$ nie jest datkiem.");
			return 1;
		}
		if(kaska[playerid] < moneys)
		{
		    sendTipMessage(playerid, "Nie masz a� tyle pieni�dzy.");
			return 1;
		}
		if(moneys < 100000)
		{
		    sendTipMessage(playerid, "�artujesz sobie? Nie chcemy takich groszy!");
			return 1;
		}
		ZabierzKase(playerid, moneys);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s bardzo dzi�kujemy za przekazan� sum� $%d.",sendername, moneys);
		printf("%s", string);
		SendAdminMessage(COLOR_YELLOW, string);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		SendClientMessage(playerid, COLOR_GRAD1, string);
		PayLog(string);
	}
	return 1;
}

