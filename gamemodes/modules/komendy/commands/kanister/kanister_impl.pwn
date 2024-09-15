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
command_kanister_Impl(playerid, params[256])
{
    if(IsPlayerConnected(playerid))
    {
	    if(PlayerInfo[playerid][pFuel] > 0)
	    {
	        //if(Gas[gLastCar[playerid]] < 81)
	        //{
		        sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Zatankowa�e� sw�j pojazd o 20 ze swojego kanistra.");
		        Gas[gLastCar[playerid]] += 20;
		        PlayerInfo[playerid][pFuel] = 0;
			//}
			//else
			//{
			    //SendClientMessage(playerid, COLOR_GREY, "   Ci�gle masz za ma�o paliwa aby jecha� !");
			//}
	    }
	    else
	    {
	        sendTipMessageEx(playerid, COLOR_GREY, "Nie masz kanistra z benzyn� !");
	    }
	}
	return 1;
}

//end
