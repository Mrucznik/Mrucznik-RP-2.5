//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ wezdragi ]-----------------------------------------------//
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

CMD:usedrugs(playerid) return cmd_wezdragi(playerid);
CMD:weznarkotyki(playerid) return cmd_wezdragi(playerid);
CMD:wezdragi(playerid)
{
	new string[128];

    if(IsPlayerConnected(playerid))
   	{
   	    if(PlayerBoxing[playerid] > 0)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz u�ywa� drag�w podczas walki !");
            return 1;
        }
		if(PlayerInfo[playerid][pDrugs] > 1)
		{
		    PlayerStoned[playerid] += 1;
		    if(PlayerStoned[playerid] >= 4) { GameTextForPlayer(playerid, "~w~Jestes~n~~p~Nacpany", 4000, 1); }
		    new Float:health;
		    GetPlayerHealth(playerid, health);
		    if(PlayerInfo[playerid][pDrugPerk] > 0)
		    {
		        new hp = 2 * PlayerInfo[playerid][pDrugPerk]; hp += 20;
				SetPlayerHealth(playerid, health + hp);
		    }
		    else
		    {
		        SetPlayerHealth(playerid, health + 20.0);
		    }
		    new nick[MAX_PLAYER_NAME];
		    GetPlayerName(playerid, nick, sizeof(nick));
		    SendClientMessage(playerid, COLOR_GREY, "   2 gramy narkotyk�w za�yte !");
		    format(string, sizeof(string), "* %s wyci�ga skr�ta i zaci�ga si�", nick);
			ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
		    PlayerInfo[playerid][pDrugs] -= 2;
		    //SetPlayerDrunkLevel(playerid, 8000);
		    //SetPlayerWeather(playerid, -66);
		    
		    
		    if(STDPlayer[playerid]==1)
			{
			     STDPlayer[playerid] = 0;
			     SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Nie jeste� ju� chroy dzi�ki narkotykom !");
			}
			else if(STDPlayer[playerid]==2)
			{
			     STDPlayer[playerid] = 1;
			     SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Twoja chroba zmala�a do Chlamydia dzi�ki narkotykom !");
			}
			else if(STDPlayer[playerid]==3)
			{
			     STDPlayer[playerid] = 2;
			     SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Twoja chroboa zmala�a do Gonorrhea dzi�ki narkotykom !");
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz ju� wi�cej narkotyk�w !");
		}
	}//not connected
	return 1;
}


