//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ antybh ]------------------------------------------------//
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

CMD:antybh(playerid, params[])
{
	new string[64];

    if(IsPlayerConnected(playerid))
    {
		new bh;
		if( sscanf(params, "d", bh))
		{
			sendTipMessage(playerid, "U�yj /antybh [0-off, 1-on]");
			return 1;
		}


		if (PlayerInfo[playerid][pAdmin] == 5000)
		{
	 		if(bh == 0 || bh == 1)
 			{
 			    if(bh != AntyBH)
 			    {
		            AntyBH = bh;
		            format(string, sizeof(string), "Anty BH = %d", bh);
    				SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
				}
				else
				{
					new txtbh[20];
				    if(AntyBH == 0)
				    {
						txtbh = "wy��czony";
				    }
				    else if(AntyBH == 1)
				    {
				        txtbh = "w��czony";
				    }
				    format(string, sizeof(string), "Anty BH ju� jest %s!", txtbh);
    				SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
    			}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
//---------------------------------[QuitFaction]-------------------------------------


