//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   addmc                                                   //
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
// Autor: Mrucznik
// Data utworzenia: 02.07.2019


//

//------------------<[ Implementacja: ]>-------------------
command_addmc_Impl(playerid, giveplayerid, value)
{
	if(!IsAKox(playerid) && !IsAMCGiver(playerid)) 
	{
		return noAccessMessage(playerid);
	}

	if(IsAMCGiver(playerid)) 
	{
		new mc = GetAvaibleMC();
		if(value > mc) 
		{
			sendErrorMessage(playerid, sprintf("W bud�ecie MC jest dost�pne tylko %dMC", mc));
			return 1;
		}

		TakeMCFromBudget(value);
	}

	new mc = MruMySQL_GetMC(giveplayerid);
	PremiumInfo[giveplayerid][pMC] = mc + value;
	MruMySQL_SaveMc(giveplayerid);

	Log(premiumLog, INFO, "Admin %s doda� %s %dMC, poprzedni stan: %dMC", 
		GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), value, PremiumInfo[giveplayerid][pMC]-value
	);
	_MruAdmin(playerid, sprintf("Doda�e� %d MC graczowi %s [ID: %d]", value, GetNickEx(giveplayerid), giveplayerid));
	if(giveplayerid != playerid) _MruAdmin(giveplayerid, sprintf("Dosta�e� %d dodatkowych MC od Admina %s [ID: %d]", value, GetNickEx(playerid), playerid));
	return 1;
}
//end