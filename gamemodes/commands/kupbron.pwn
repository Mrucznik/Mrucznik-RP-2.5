//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kupbron ]------------------------------------------------//
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

CMD:kupbron(playerid, params[])
{
	sendErrorMessage(playerid, "Sprzeda� broni zosta�a zakazana!");
	/*if(PlayerInfo[playerid][pConnectTime] >= 4)
	{
		if(PlayerInfo[playerid][pGunLic] == 1)
		{
			if(PlayerToPoint(7.0, playerid, 296.1448,-38.1248,1001.5156))
			{
				if(kaska[playerid] < 1)
				{
					SendClientMessage(playerid, COLOR_GREY, "   Nie masz przy sobie wystarczaj�co du�o pieni�dzy !");
					return 1;
				}
				if(GUIExit[playerid] == 0)
				{
					ShowPlayerDialogEx(playerid, 80, DIALOG_STYLE_LIST, "Gun Shop", "Pistolety\t\t>>\nStrzelby\t\t>>\nPistolety Maszynowe\t>>\nKarabiny\t\t>>\nSnajperki\t\t>>\nBro� bia�a\t\t>>\nInne\t\t\t>>", "Wybierz", "Wyjd�");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE,"*** Nie jeste� przy kasach Mrucznikowego GS***");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE,"*** Nie mo�esz kupowa� w gun shopie bez licencji ***");
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_WHITE,"Musisz mie� przegrane 4h na serwerze aby m�c kupowa� bro�.");
		return 1;
	}*/
	return 1;
}

