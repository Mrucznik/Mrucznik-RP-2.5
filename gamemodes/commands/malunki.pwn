//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ malunki ]------------------------------------------------//
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

CMD:malunki(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(GUIExit[playerid] == 0)
    	{
			ShowPlayerDialogEx(playerid,50,DIALOG_STYLE_MSGBOX,"Dost�pne malunki woz�w","LovRider`s:\n(Savanna,Tornado,Blade)\n0- ��te p�omienie\n1- Czerwono ��te paski\n2- Czerwone p�omienie z przodu\n3- Wyczy�� malunek\n\nRemington\n\n0- Br�zowe hieroglify\n1- Czerwono ��te p�omienie\n2- Niebieskie p�omienie\n3- Wyczy�� malunek\n\nSlamvan \n\n0- Czarny z r�owymi paskami\n1- Kolorowe p�omyczki\n2- ��te p�omienie\n3- Wyczy�� malunek\n\nNaci�nij DALEJ aby zobaczy� dalsz� list�","DALEJ","WYJD�");
		}
	}
	return 1;
}

