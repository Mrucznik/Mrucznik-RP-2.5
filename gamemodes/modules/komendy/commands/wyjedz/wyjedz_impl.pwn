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
command_wyjedz_Impl(playerid)
{
    if(GetPVarInt(playerid, "Lockdown-izolacja") != 0) return sendTipMessageEx(playerid, COLOR_PANICRED, "Nie mo�esz u�ywa� tej komendy w trakcie weryfikacji.");
	if(GetPVarInt(playerid, "IsAGetInTheCar") == 1)
	{
		sendErrorMessage(playerid, "Jeste� podczas wsiadania - odczekaj chwile."); 
		return 1;
	}	
	SetAntyCheatForPlayer(playerid, 4); 
	if(!SprawdzWjazdy(playerid))
	{
		sendErrorMessage(playerid, "Nie jeste� w obszarze, w kt�rym mo�na wjecha�"); 
	}
	return 1;
}

//end
