//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ kupsamoloty ]----------------------------------------------//
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

CMD:kupsamolot(playerid) return cmd_kupsamoloty(playerid);
CMD:kuplot(playerid) return cmd_kupsamoloty(playerid);
CMD:buyplane(playerid) return cmd_kupsamoloty(playerid);
CMD:kupsamoloty(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, -1262.5095,40.3263,14.1392))//kupowanie samolotu
    {
		if(IsPlayerInAnyVehicle(playerid))
		{
			sendErrorMessage(playerid, "Aby tego u�y� musisz wyj�� z pojazdu"); 
			return 1;
		}
        if(PlayerInfo[playerid][pSamolot] == 0)
	    {
	        if(GUIExit[playerid] == 0)
	    	{
		        ShowPlayerDialogEx(playerid, 410, DIALOG_STYLE_LIST, "Kupowanie samolotu", "Dodo\t\t\t50 000 000$\nCropduster\t35 000 000$\nBeagle\t\t170 000 000$\nStuntplane\t185 000 000$\nNevada\t\t280 000 000$\nShamal\t\t515 250 000$", "Wybierz", "Wyjd�");
            }
	    }
	    else
	    {
	        sendErrorMessage(playerid, "Posiadasz ju� samolot.");
	    }
    }
    else
    {
        sendErrorMessage(playerid, "Nie jeste� w salonie helikopter�w/samolot�w.");
    }
	return 1;
}




