//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ quitpraca ]-----------------------------------------------//
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

CMD:quitjob(playerid) return cmd_quitpraca(playerid);
CMD:opuscprace(playerid) return cmd_quitpraca(playerid);
CMD:quitpraca(playerid)
{
	new string[128];

    if(IsPlayerConnected(playerid))
   	{
	    if(PlayerInfo[playerid][pJob] > 0)
	    {
	        if(PlayerInfo[playerid][pDonateRank] > 0)
	        {
	            if(PlayerInfo[playerid][pContractTime] >= 2)
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wype�ni�e� 1 godzinny kontrakt wi�c mo�esz zwolni� si� z pracy.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zwolni�e� si� ze swojej pracy, jeste� bezrobotny.");
				    PlayerInfo[playerid][pJob] = 0;
				    PlayerInfo[playerid][pSkin] = 0;
				    PlayerInfo[playerid][pContractTime] = 0;
				}
				else
				{
				    new chours = 2 - PlayerInfo[playerid][pContractTime];
				    format(string, sizeof(string), "* Masz jeszcze %d godzin do ko�ca kontraktu, dopiero wtedy bedziesz m�g� si� zwolni�.", chours / 2);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				}
	        }
	        else
	        {
				if(PlayerInfo[playerid][pContractTime] >= 3)
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wype�ni�e� 2.5 godzinny kontrakt wi�c mo�esz zwolni� si� z pracy.");
				    PlayerInfo[playerid][pJob] = 0;
				    PlayerInfo[playerid][pSkin] = 0;
				    PlayerInfo[playerid][pContractTime] = 0;
				}
				else
				{
				    new chours = 10 - PlayerInfo[playerid][pContractTime];
				    format(string, sizeof(string), "* Masz jeszcze %d godzin do ko�ca kontraktu, dopiero wtedy bedziesz m�g� si� zwolni�.", chours / 2);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				}
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie masz pracy (je�li jeste� we frakcji wpisz /quitfrakcja) !");
		}
	}//not connected
	return 1;
}


