//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ trasy ]-------------------------------------------------//
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

CMD:wyscigi(playerid) return cmd_trasy(playerid);
CMD:trasy(playerid)
{
	if(GUIExit[playerid] == 0)
	{
		if(IsANoA(playerid))
		{
			if(PlayerInfo[playerid][pRank] >= 4)
			{
				ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wy�cig�w: Wybierz opcj�", "Poka� trasy\nZorganizuj wy�cig\nEdytuj tras�\nUsu� tras�", "Wybierz", "Anuluj");
			}
			else if(PlayerInfo[playerid][pRank] >= 2)
			{
				ShowPlayerDialogEx(playerid, 1410, DIALOG_STYLE_LIST, "Panel wy�cig�w: Wybierz opcj�", "Poka� trasy\nZorganizuj wy�cig", "Wybierz", "Anuluj");
			}
			else
			{
				ShowPlayerDialogEx(playerid, 1411, DIALOG_STYLE_LIST, "Wszystkie trasy:", ListaWyscigow(), "Wi�cej", "Wyjd�");
			}
			return 1;
		}
		else
		{
			ShowPlayerDialogEx(playerid, 1411, DIALOG_STYLE_LIST, "Wszystkie trasy:", ListaWyscigow(), "Wi�cej", "Wyjd�");
		}
	}
	return 1;
}

