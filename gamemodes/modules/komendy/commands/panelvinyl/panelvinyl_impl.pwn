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
command_panelvinyl_Impl(playerid, params[256])
{
    if(IsPlayerConnected(playerid))
	{
        if(GetPlayerFraction(playerid) == FRAC_SN && PlayerInfo[playerid][pRank] >= 6)
        {
            sendTipMessage(playerid, "Witamy w panelu zarz�dzania Vinyl-Club");
            ShowPlayerDialogEx(playerid, 6999, DIALOG_STYLE_TABLIST, "Laptop Lidera", "Open/Close\nUstal cen� Norm.\nUstal cen� VIP\nUstal cen� napoj�w\nUstal nazw� napoj�w", "Wybierz", "Odrzu�");
        }
        else
        {
            sendErrorMessage(playerid, "Nie jeste� z San News, nie mo�esz zarz�dza� vinylem!");
        }
    }
	return 1;
}

//end
