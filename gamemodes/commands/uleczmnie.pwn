//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ uleczmnie ]-----------------------------------------------//
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

CMD:healme(playerid) return cmd_uleczmnie(playerid);
CMD:uleczmnie(playerid)
{
	new string[128];

    if(IsPlayerConnected(playerid))
   	{
        if (PlayerToPoint(3, playerid,1173.2563,-1323.3102,15.3943)||PlayerToPoint(3, playerid,2029.5945,-1404.6426,17.2512))
		{
            if(STDPlayer[playerid] > 0)
            {
                if(PlayerInfo[playerid][pPainPerk] >= 1)
				{
				    new painpreking = PlayerInfo[playerid][pPainPerk]*300;
				    new placenie = 1000-painpreking;
					STDPlayer[playerid] = 0;
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeste� zdrowy dzi�ki szpitalnej pomocy !");
					ZabierzKase(playerid, placenie);
					format(string, sizeof(string), "Doktor: Koszt pobytu w szpitalu wynosi $%d,-. Mi�ego dnia!", placenie);
					SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
				}
				else
 				{
 				    STDPlayer[playerid] = 0;
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Jeste� zdrowy dzi�ki szpitalnej pomocy !");
					DajKase(playerid, -1000);
					SendClientMessage(playerid, TEAM_CYAN_COLOR, "Doktor: Koszt pobytu w szpitalu wynosi $1000,-. Mi�ego dnia!");
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� chory, nie potrzebujesz leczenia !");
			    return 1;
			}
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w szpitalu !");
        }
    }
	return 1;
}


