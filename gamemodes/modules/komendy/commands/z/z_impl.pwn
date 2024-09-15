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
command_z_Impl(playerid, params[256])
{
    if(GetPVarInt(playerid, "smuggling") >= 1)
	{
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		sendTipMessageEx(playerid, COLOR_GRAD2, "Zako�czono rozmow�.");
		DeletePVar(playerid, "smuggling");
		return 1;
	}

	if(Mobile[playerid] == INVALID_PLAYER_ID)
	{
		sendErrorMessage(playerid, "Nikt do Ciebie nie dzwoni.");
		return 1;
	}
	
	sendTipMessageEx(Mobile[playerid], COLOR_GRAD2, "Tw�j rozm�wca odrzuci� po��czenie.");
	sendTipMessageEx(playerid, COLOR_GRAD2, "Zako�czono rozmow�.");
	StopACall(playerid);
	return 1;
}

//end
