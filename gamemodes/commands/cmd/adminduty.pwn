//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ adminduty ]-----------------------------------------------//
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

YCMD:adminduty(playerid, params[], help)
{
	if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pHalfAdmin] >= 1)
	{	
		if(GetPlayerAdminDutyStatus(playerid) == 0)
		{
			if(OnDuty[playerid] == 1 || OnDutyCD[playerid] == 1)
			{
				sendErrorMessage(playerid, "Nie w��czy� s�u�by gdy jeste� na s�u�bie IC!"); 
				return 1;
			}

			new nick[24];
			if(GetPVarString(playerid, "maska_nick", nick, 24))
			{
				SendClientMessage(playerid, COLOR_GREY, " Musisz �ci�gn�� mask� z twarzy! (/maska).");
				return 1;
			}
		/*	if(strlen(PlayerInfo[playerid][pAdminName]) >= 3)
			{
				foreach(new i : Player)
				{
					if(strfind(GetNick(i), PlayerInfo[playerid][pAdminName]) == 1)
					{
						sendErrorMessage(playerid, "Taki nick jest u�ywany, twoje obecne ustawienie zosta�o wyzerowane.");
						ShowPlayerDialogEx(playerid, 10001, DIALOG_STYLE_INPUT, "Mrucznik Role Play", "Wprowad� poni�ej sw�j nick administratora\nB�dziesz go u�ywa� za ka�dym razem!", "Akceptuj", "Odrzu�"); 
						return 1;
					}
				}
				AdminDutyPlayer(playerid, 1); 
			}
			else
			{
				ShowPlayerDialogEx(playerid, 10001, DIALOG_STYLE_INPUT, "Mrucznik Role Play", "Wprowad� poni�ej sw�j nick administratora\nB�dziesz go u�ywa� za ka�dym razem!", "Akceptuj", "Odrzu�"); 
			}*/
			AdminDutyPlayer(playerid, 1); 
				
			return 1;	
		}
		else if(GetPlayerAdminDutyStatus(playerid) == 1)//Wykonuje zej�cie z duty
		{	
			AdminDutyPlayer(playerid, 0); 
			return 1;
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� administratorem, wi�c nie mo�esz tego u�y�!"); 
		MSGBOX_Show(playerid, "Nie masz uprawnien!", MSGBOX_ICON_TYPE_ERROR);
		return 1; 
	}

	return 1;
}

