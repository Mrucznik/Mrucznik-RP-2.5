//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ stan ]-------------------------------------------------//
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

YCMD:stan(playerid, params[], help)
{
	new string[128];
    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 1)
        {
	        if(!IsAtBank(playerid) && !IsAtBankomat(playerid))
	        {
          		sendTipMessage(playerid, "Nie jeste� w Banku ani przy bankomacie!");
	            return 1;
	        }
			format(string, sizeof(string), "Na swoim koncie bankowym masz aktualnie $%d.", PlayerInfo[playerid][pAccount]);
			sendTipMessageEx(playerid, COLOR_GREEN, string); 
		}
	}
	return 1;
}
