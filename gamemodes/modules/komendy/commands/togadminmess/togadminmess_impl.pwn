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
command_togadminmess_Impl(playerid, params[256])
{
    if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
		{
			sendTipMessage(playerid, "Nie s�yszysz ju� nic! Nie widzisz ju� nic! Taki z ciebie admin"); 
			DeathWarning[playerid] = 0;
			TogPodglad[playerid] = 1;
			gOoc[playerid] = 1;
			SetPVarInt(playerid, "togadmincmd", 1);
			SetPVarInt(playerid, "togcmdlog", 1);
		}
	}
	return 1;
}

//end
