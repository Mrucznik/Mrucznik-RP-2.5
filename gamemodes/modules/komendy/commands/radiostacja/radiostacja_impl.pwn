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
command_radiostacja_Impl(playerid)
{
    if(GetPlayerLocal(playerid) == PLOCAL_ORG_SN)
    {
        if(IsPlayerInFraction(playerid, FRAC_SN))
	    {
            if(PlayerInfo[playerid][pRank] < 3) return sendTipMessageEx(playerid, COLOR_GREY, "Od 3 rangi!");
            ShowPlayerDialogEx(playerid, 667, DIALOG_STYLE_LIST, "Wybierz nag�o�ni�", "R SAN 01\nR SAN 02", "Wybierz", "Anuluj");
        }
        else return sendErrorMessage(playerid, "Nie nale�ysz do SN!");
	}
	else
	{
		sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w budynku San News");
	}

	return 1;
}

//end
