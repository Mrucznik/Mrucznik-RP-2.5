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
command_blokujsprzedaz_Impl(playerid, params[256])
{
    new string[64];

    if(gPlayerLogged[playerid] == 1)
    {
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] >= 5000)
			{
			    new dom;
				if( sscanf(params, "d", dom))
				{
					sendTipMessage(playerid, "U�yj /blokujdom [id domu]");
					return 1;
				}

				format(string, sizeof(string), "Domy/Dom%d.ini", dom);
				if(dini_Exists(string))
				{
				    if(Dom[dom][hBlokada] == 0)
				    {
					    Dom[dom][hBlokada] = 1;
						ZapiszDom(dom);
						SendClientMessage(playerid, COLOR_RED, "Dom zablokowany");
					}
					else if(Dom[dom][hBlokada] == 1)
					{
                        Dom[dom][hBlokada] = 0;
						ZapiszDom(dom);
						SendClientMessage(playerid, COLOR_GREEN, "Dom odblokowany");
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GRAD2, "Dom nie istnieje");
				}
			}
		}
	}
	return 1;
}

//end
