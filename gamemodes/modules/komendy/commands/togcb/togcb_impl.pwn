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
command_togcb_Impl(playerid)
{
    if(PlayerInfo[playerid][pCB] == 1)
	{
		if(cbradijo[playerid] == 0)
		{
			cbradijo[playerid] = 1;
			//SendClientMessage(playerid, COLOR_WHITE, "CB-radio wy��czone !");
            MSGBOX_Show(playerid, "CB-RADIO ~r~OFF", MSGBOX_ICON_TYPE_OK);
			return 1;
		}
		else
		{
			cbradijo[playerid] = 0;
			MSGBOX_Show(playerid, "CB-RADIO ~r~ON", MSGBOX_ICON_TYPE_OK);
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie masz CB-Radia");
		return 1;
	}
	return 1;
}

//end
