//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ liderpomoc ]----------------------------------------------//
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

YCMD:liderpomoc(playerid, params[], help)
{
	if (PlayerInfo[playerid][pLider] >= 1)
	{
		ShowPlayerDialogEx(playerid, DIALOG_LIDER01, DIALOG_STYLE_MSGBOX, "Komendy Lidera", "/przyjmij - Przyjmujesz danego gracza do swojej - frakcji\n/zwolnij - Wyrzucasz danego gracza ze swojej - frakcji\n/dajrange - Wystawiasz danemu graczowi range (1-6)\n/awans - Dajesz cz�onkowi frakcji awans\n/degraduj - Degradujesz cz�onka z danej rangi na ni�sz�.\n/pracownicy - Pokazuje liste pracownik�w online\n/lidercar - zarz�dzanie pojazdami organizacji.\n/liderranga - Zmiana nazw rang.", "Zamknij", "");
		if(PlayerInfo[playerid][pLider] == 11)
		{
			ShowPlayerDialogEx(playerid, DIALOG_LIDER02, DIALOG_STYLE_MSGBOX, "Komendy Lidera", "/podatek(/dajpodatek) - dajesz pieniadze policjantom", "Zamknij", "");
		}
	}
	else if(IsPlayerOrgLeader(playerid))
	{
		ShowOrgLeaderCommands(playerid);
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}
