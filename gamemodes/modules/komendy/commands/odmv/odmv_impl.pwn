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
command_odmv_Impl(playerid, params[256])
{
    new string[128];
	new sendername[MAX_PLAYER_NAME];

	if((IsAnInstructor(playerid) && PlayerInfo[playerid][pRank] >= 1))
	{
		if(dmv == 0)
		{
		
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "|____________Urz�d Miasta otwarty przez %s_____________|", sendername);
			SendClientMessageToAll(COLOR_LIGHTGREEN, string);
			dmv = 1;
		}
		else
		{
			sendErrorMessage(playerid, "Urz�d jest otwarty!"); 
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� instruktorem");
	}
	return 1;
}

//end
