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
command_swat_Impl(playerid)
{
    new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(IsAPolicja(playerid))
		{
			if(IsAtDutyPlace(playerid))
			{
				if(OnDuty[playerid] == 1)
				{
					format(string, sizeof(string), "* %s bierze mundur i tarcz� SWAT.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	    		    SetPlayerSkin(playerid, 285);
					SetPlayerColor(playerid, 0x000000FF); // czarny
                    SetPlayerArmour(playerid, 90);
	    		    if(IsPlayerAttachedObjectSlotUsed(playerid, 2))
	    		    {
	    		    	RemovePlayerAttachedObject(playerid, 2);
	    		    }
	    		    else
	    		    {
	    		        SetPlayerAttachedObject(playerid, 2, 18637, 13, 0.35, 0.0, 0.0, 0, 0, 180);
	    		    }
				}
				else
				{
				    sendTipMessage(playerid, "Nie jeste� na s�u�bie !");
				}
			}
			else
			{
				sendTipMessage(playerid, "Nie jeste� w szatni !");
				return 1;
			}
		}
        else
		{
			sendErrorMessage(playerid, "Nie jeste� ze s�u�b porz�dkowych !");
			return 1;
		}
	}
	return 1;
}

//end
