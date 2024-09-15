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
command_adminstats_Impl(playerid, params[256])
{
    if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1 || IsAScripter(playerid))
	{
		new string[325];
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			format(string, sizeof(string), "{C0C0C0}Statystyki\n{800080}Nick administratora: {C0C0C0}%s\n{800080}Nadane Bany+Blocki: {C0C0C0}%d\n{800080}Nadane Warny: {C0C0C0}%d\n{800080}Nadane Kicki: {C0C0C0}%d\n{800080}Inne akcje: {C0C0C0}%d\n{800080}Poza AdminDuty: {C0C0C0}%d\n\n{C2A2DA}Na s�u�bie ju�: {C0C0C0}%d godzin i %d minut", GetNickEx(playerid),iloscBan[playerid],iloscWarn[playerid],iloscKick[playerid],(iloscInne[playerid]+iloscAJ[playerid]), iloscPozaDuty[playerid], AdminDutyGodziny[playerid], AdminDutyMinuty[playerid]);
			ShowPlayerDialogEx(playerid, 1091, DIALOG_STYLE_MSGBOX, "System @DUTY", string, "Okej", "");	
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� podczas s�u�by administratora!"); 
		}
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}

//end
