//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ carhelp ]------------------------------------------------//
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

YCMD:carhelp(playerid, params[], help)
{
    if(GUIExit[playerid] == 0)
    {
    	ShowPlayerDialogEx(playerid, 449, DIALOG_STYLE_MSGBOX, "Komendy auta", "/parkuj\n/auto\n/autoklucze\n/dajklucze\n/oddajklucze\n/dajauto\n/sprzedajlodz\n/sprzedajheli\n/lwymiana\n/hwymiana\n/garazuj\n/wywalklucze\n/lock", "Wyjd�", "Wyjdz");
	}
	return 1;
}
