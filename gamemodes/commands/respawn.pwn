//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ respawn ]------------------------------------------------//
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

CMD:respawn(playerid)
{
	new string[128];
	if(Count >= 20)
	{
		if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1 && PlayerInfo[playerid][pNewAP] <= 3 || PlayerInfo[playerid][pNewAP] == 5)
		{
			SendClientMessage(playerid,COLOR_YELLOW, "Odliczanie rozpocz�te");
			BroadCast(COLOR_PANICRED, "Uwaga! Za 20 sekund nast�pi respawn nieu�ywanych pojazd�w !");
			format(string, sizeof(string), "AdmCmd: %s [ID: %d] rozpocz�� odliczanie do Respawnu Aut !", GetNick(playerid, true), playerid);
			ABroadCast(COLOR_PANICRED,string,1);
			CountDown();
		}
		else
		{
			sendErrorMessage(playerid, "Poczekaj a� sko�czy si� to odliczanie!!!");
		}
	}
	return 1;
}

