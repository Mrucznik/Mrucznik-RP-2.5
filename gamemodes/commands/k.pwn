//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ k ]---------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

CMD:krzyk(playerid, params[]) return cmd_k(playerid, params);
CMD:k(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(gPlayerLogged[playerid] == 0)
		{
			return 1;
		}
		if(PlayerInfo[playerid][pMuted] == 1)
		{
			sendTipMessage(playerid, "Jeste� uciszony! Nie mo�esz m�wi�"); 
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Dobry admin nie powinien robi� OOC w IC! U�yj /b [tre��]"); 
			return 1;
		}
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj /(k) krzycz [tekst]");
			return 1;
		}
		
		PlayerTalkIC(playerid, params, "krzyczy", 15.0, true); 		
	}
	if(!IsPlayerInAnyVehicle(playerid))
	{
		ApplyAnimation(playerid, "ON_LOOKERS", "shout_01", 4.0, 0, 0, 0, 0, 0);
		ApplyAnimation(playerid, "ON_LOOKERS", "shout_01", 4.0, 0, 0, 0, 0, 0);
	}
	return 1;
}

