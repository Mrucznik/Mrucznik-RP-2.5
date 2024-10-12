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
command_basenstats_Impl(playerid)
{
    if(IsAPoolBusinessOwner(playerid))
	{
		new string[128];
		format(string, sizeof(string), "Zarobiona kasa: %d$\nSprzedane kredyty: %d\nOdwiedzin Sauny: %d\nWej�� na basen: %d\nKorzystania z trampoliny: %d", poolCashStats, poolCreditStatus, poolSaunaStats, poolStats, poolTrampolineStats);
		ShowPlayerDialogEx(playerid, 1095, DIALOG_STYLE_MSGBOX, "Statystyki", string, "Akceptuj", "");
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� z basenu Tsunami!"); 
	}
	return 1;
}

//end
