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
command_kupdildo_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if(PlayerToPoint(30.0, playerid, -105.0829,-10.6207,1000.7188))
		{
	        if(kaska[playerid] < 1)
			{
			    sendTipMessage(playerid, "Nie masz przy sobie wystarczaj�co du�o pieni�dzy!");
			    return 1;
			}
			if(GUIExit[playerid] == 0)
 	    	{
				ShowPlayerDialogEx(playerid, 81, DIALOG_STYLE_LIST, "Los Santos Sex Shop XXX- wibratory, filmy i zabawki", "Purpurowe dildo\t\t25 000$\nMa�y wibrator\t\t\t7500$\nDu�y bia�y wibrator\t\t20 000$\nSrebrny wibrator\t\t12 000$\nLaska sado-maso\t\t1500$\nKwiaty\t\t\t\t500$\nPrezerwatywy\t\t\t50$", "Kup", "Wyjd�");
			}
		}
		else
		{
		    sendErrorMessage(playerid,"Nie jeste� w sex shopie");
		    return 1;
		}
	}
	return 1;
}

//end
