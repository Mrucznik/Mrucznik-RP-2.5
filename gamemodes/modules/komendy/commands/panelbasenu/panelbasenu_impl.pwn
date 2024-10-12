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
command_panelbasenu_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
	{
		if(IsAPoolBusinessOwner(playerid))
		{
			if(IsPlayerOrgLeader(playerid))
			{
				if(IsPlayerInRangeOfPoint(playerid, 3.0, 1203.39294, -1772.58777, 13.71199))
				{
					new string[128];
					if(poolStatus == 0)
					{
						format(string, sizeof(string), "Otw�rz Basen\nZmie� cen� kredyt�w\nUstal muzyk�\nWy�lij og�oszenie"); 
						ShowPlayerDialogEx(playerid, 1093, DIALOG_STYLE_TABLIST, "Laptop Lidera", string, "Wybierz", "Odrzu�");
					}
					else
					{
						format(string, sizeof(string), "Zamknij Basen\nZmie� cen� kredyt�w\nUstal muzyk�\nWy�lij og�oszenie"); 
						ShowPlayerDialogEx(playerid, 1093, DIALOG_STYLE_TABLIST, "Laptop Lidera", string, "Wybierz", "Odrzu�");

					}
				}
				else
				{
					sendTipMessage(playerid, "Nie jeste� przy laptopie lidera"); 
					return 1;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Nie jeste� liderem basenu tsunami!"); 
				return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� pracownikiem basenu!"); 
			return 1;
		}
	
	
	}


	return 1;
}

//end
