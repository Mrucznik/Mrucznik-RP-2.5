//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ armia ]-------------------------------------------------//
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

CMD:armia(playerid, params[])
{
	new string[256];
	new sendername[MAX_PLAYER_NAME];
	new content[256];

    if(IsPlayerConnected(playerid))
    {
		if(GetPlayerOrg(playerid) != 12)
		{
 			sendErrorMessage(playerid, "Nie jeste� z wojska!");
		    return 1;
		}
		if(PlayerInfo[playerid][pRank] < 9)
		{
		    sendErrorMessage(playerid, "Musisz mie� 9 rang� aby tego u�ywa� !");
		    return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj /armia [tekst]");
			return 1;
		}
		if(PlayerInfo[playerid][pBP] >= 1)
		{
		    format(string, sizeof(string), "Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
			sendTipMessage(playerid, string, TEAM_CYAN_COLOR);
			return 1;
		}
		GetPVarString(playerid, "trescOgloszenia", content, sizeof(content));
		if(PlayerInfo[playerid][pBlokadaPisaniaFrakcjaCzas] >= 1)
		{
			PlayerInfo[playerid][pBlokadaPisaniaFrakcjaCzas] = 15-komunikatMinuty[playerid];
			format(string, sizeof(string), "Wys�a�e� og�oszenie o tej samej tre�ci, odczekaj jeszcze %d minut", PlayerInfo[playerid][pBlokadaPisaniaFrakcjaCzas]);
			sendTipMessageEx(playerid, COLOR_LIGHTBLUE, string); 
			format(string, sizeof(string), "{A0522D}Ostatnie og�oszenie: {FFFFFF}%s", content);
			sendTipMessage(playerid, string);
			return 1;
		}
		if(strfind(params, content, false) == -1)
		{
			SetPVarString(playerid, "trescOgloszenia", params);
			SendClientMessageToAll(COLOR_WHITE, "|___________ Wiadomo�� Armii ___________|");
			format(string, sizeof(string), "Genera� %s: %s", sendername, params);
			SendClientMessageToAll(COLOR_GREEN, string);
			komunikatTimeZerowanie[playerid] = SetTimerEx("KomunikatCzasZerowaie", 60000, true, "i", playerid);
			sendTipMessage(playerid, "Odczekaj 5 minut przed wys�aniem ponownego komunikatu o {AC3737}tej samej tre�ci"); 
			return 1;
		}
		SendClientMessage(playerid, -1, " "); 
		sendTipMessageEx(playerid, COLOR_WHITE, "Wys�a�e� og�oszenie o tej samej tre�ci w czasie mniejszym jak {AC3737}5 minut!");
		sendTipMessageEx(playerid, COLOR_WHITE, "{C0C0C0}Zostajesz ukarany kar� Anty-Spam na {AC3737}15 minut");
		komunikatTime[playerid] = SetTimerEx("KomunikatCzas", 60000, true, "i", playerid);		
		PlayerInfo[playerid][pBlokadaPisaniaFrakcjaCzas] = 15;
		format(string, sizeof(string), "[ANTY_SPAM] %s otrzyma� blokad� na 15 minut za wys�anie 2x tego samego komunikatu!", GetNick(playerid, true));
		SendAdminMessage(COLOR_BLUE, string);
	}
	return 1;
}
