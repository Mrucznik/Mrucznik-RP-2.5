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
command_fracinfo_Impl(playerid, params[256])
{
    if(IsPlayerConnected(playerid))
    {
		new valueFrac, string[256];
		if( sscanf(params, "d", valueFrac))
		{
			sendTipMessage(playerid, "U�yj /fracinfo [ID FRAKCJI]");
			return 1;
		}
		if(valueFrac <= 0 || valueFrac >= MAX_FRAC)
		{
			sendErrorMessage(playerid, "Nieprawid�owe ID frakcji!"); 
			return 1;
		}
		new countWorkers;
		foreach(new i : Player)
		{
			if(PlayerInfo[i][pMember] == valueFrac)
			{
				countWorkers++; 
			}
		}
		format(string, sizeof(string), "{FFFFFF}Name: {AA3333}%s\n{FFFFFF}Slot: {AA3333}%d\n{FFFFFF}Lider�w: {AA3333}%d\n{FFFFFF}Pracownik�w [On-Line]: {AA3333}%d", FractionNames[valueFrac], valueFrac, LeadersValue[LEADER_FRAC][valueFrac], countWorkers);
		ShowPlayerInfoDialog(playerid, "Mrucznik Role Play", string, false);
	}
	return 1;
}

//end
