//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ balans ]------------------------------------------------//
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

CMD:balance(playerid) return cmd_balans(playerid);
CMD:stan(playerid) return cmd_balans(playerid);
CMD:balans(playerid)
{
/*
	new string[64];

    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pLocal] == 103 || GraczBankomat(playerid))
        {
			format(string, sizeof(string), "Masz teraz $%d na swoim koncie.",PlayerInfo[playerid][pAccount]);
			sendTipMessageEx(playerid, COLOR_YELLOW, string);
		}
		else
		{
			sendTipMessage(playerid, "Nie jeste� w Banku ani przy bankomacie !");
            return 1;
        }
	}*/
	if(IsPlayerConnected(playerid))
	{
		sendTipMessage(playerid, "U�yj /kontobankowe (W skr�cie /kb)"); 
	}
	return 1;
}


