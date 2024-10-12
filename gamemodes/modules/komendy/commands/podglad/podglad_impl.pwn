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
command_podglad_Impl(playerid, params[256])
{
    if(IsPlayerConnected(playerid))
    {
		new giveplayerid, reason[64];
		if( sscanf(params, "k<fix>s[64]D("#MAX_SENT_MESSAGES")", giveplayerid, reason))
		{
			sendTipMessage(playerid, "U�yj /podglad [playerid/Cz��Nicku] [pow�d] (liczba wiadomosci)");
			return 1;
		}

		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
		    if(IsPlayerConnected(giveplayerid))
		    {
				ShowPlayerSentMessages(giveplayerid, playerid);
				SendClientMessage(giveplayerid, COLOR_PANICRED, sprintf("Admin %s sprawdzi� histori� twoich wiadomo�ci. Pow�d: %s", GetNickEx(playerid), reason));
				Log(adminLog, INFO, "Admin %s podejrza� wiadomo�ci gracza %s, pow�d: %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), reason);
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}

//end
