//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ blokujnews ]----------------------------------------------//
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

CMD:tognews(playerid) return cmd_blokujnews(playerid);
CMD:zablokujnews(playerid) return cmd_blokujnews(playerid);
CMD:blokujnews(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if (!gNews[playerid])
		{
			gNews[playerid] = 1;
            MSGBOX_Show(playerid, "Wiadomosci ~r~OFF", MSGBOX_ICON_TYPE_OK);
		}
		else if (gNews[playerid])
		{
			gNews[playerid] = 0;
            MSGBOX_Show(playerid, "Wiadomosci ~g~ON", MSGBOX_ICON_TYPE_OK);
		}
	}
	return 1;
}

