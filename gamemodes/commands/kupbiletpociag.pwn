//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ kupbiletpociag ]--------------------------------------------//
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

CMD:kbpo(playerid) return cmd_kupbiletpociag(playerid);
CMD:kpociag(playerid) return cmd_kupbiletpociag(playerid);
CMD:kupbiletpociag(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(IsAtTicketMachine(playerid))
		{
			if(PlayerInfo[playerid][pBiletpociag] == 1)
			{
				//zmienne:
				new string[128];
				//Komunikaty:
				sendErrorMessage(playerid, "Posiadasz ju� bilet do poci�gu!");
				format(string, sizeof(string), "* %s mruczy (jak Mrucznik) na bilet, kt�ry ju� posiada.", GetNick(playerid, true));//ciekawostka - mrucznik
				ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
				return 1;
			}
			else if(PlayerInfo[playerid][pBiletpociag] == 0)
			{
				//zmienne
				new fracgracza = GetPlayerFraction(playerid);
				new string[256];
				new giveplayer[MAX_PLAYER_NAME];
				GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
				//czynno�ci:
				format(string, sizeof(string), "{FFFF00}Korporacja Transportowa\n{FFFFFF}Cena: {00FF00}%d$\n{FFFFFF}Imi�_Nazwisko: {00FF00}%s\n{FFFFFF}Twoja organizacja: {AA3333}%s\n{FFFFFF}Zni�ka dla twojej organizacji: {00FF00}0$\n{FFFFFF}Ulga: {00FF00}0$", CenaBiletuPociag, giveplayer, FractionNames[fracgracza]);//Skrypt na zni�ki i ulgi w trakcie pisania, celowo ie ma tutaj warto�ci
				ShowPlayerDialogEx(playerid, 1090, DIALOG_STYLE_MSGBOX, "Maszyna do bilet�w", string, "Zakup", "Odejd�");
				//komunikaty:
				format(string, sizeof(string), "* %s wstukuje w maszyn� UID dowodu osobistego, wybiera tras� i ulg�.", GetNick(playerid, true));
				ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� przy maszynie do kupna bilet�w!"); 
			return 1;
		}
	}
	return 1;
}
