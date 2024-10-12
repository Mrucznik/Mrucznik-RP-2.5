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
command_dajscene_Impl(playerid, params[256])
{
    if(IsPlayerConnected(playerid))
    {
		new giveplayerid, value; 
		if(sscanf(params, "k<fix>d", giveplayerid, value))
		{
			sendTipMessage(playerid, "U�yj /dajscene [ID] [0 - Zabierz || 1 - daj ]");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[playerid][pLider] == FRAC_SN && PlayerInfo[playerid][pLiderValue] != 3)
			{
				SN_ACCESS[giveplayerid] = value;
				sendTipMessage(playerid, "Zmieni�e� warto�� pozwolenia sceny"); 
				sendTipMessage(giveplayerid, "Zosta�a zmieniona Ci warto�� pozwolenia zarz�dzania scen�"); 
			}
			else
			{
				sendErrorMessage(playerid, "Brak uprawnie� do zarz�dzania przydzia�em!"); 
			}
		}
	}
	return 1;
}

//end
