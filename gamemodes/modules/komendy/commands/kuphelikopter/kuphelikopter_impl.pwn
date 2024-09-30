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
command_kuphelikopter_Impl(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, -1262.5095,40.3263,14.1392) || // Kupowanie helikopter�w Los Santos
		IsPlayerInRangeOfPoint(playerid, 5.0, -5885.2761, 1316.9617, 9.3252)) // Kupowanie helikopter�w Vice City
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
                ShowPlayerDialogEx(playerid, 420, DIALOG_STYLE_LIST, "Kupowanie Helikopteru", "Sparrow\t\t125 000 000$\nMaverick\t\t200 000 000$\nLeviathan\t\t265 000 000$\nRaindance\t\t325 000 000$", "Wybierz", "Wyjd�");
            }
	    }
	    else
	    {
	        sendErrorMessage(playerid, "Posiadasz ju� helikopter.");
	    }
    }
    else
    {
        sendErrorMessage(playerid, "Nie jeste� w salonie helikopter�w/samolot�w.");
    }
	return 1;
}

//end
