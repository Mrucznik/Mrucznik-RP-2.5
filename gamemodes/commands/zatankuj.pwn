//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zatankuj ]-----------------------------------------------//
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

CMD:fill(playerid) return cmd_zatankuj(playerid);
CMD:tankuj(playerid) return cmd_zatankuj(playerid);
CMD:zatankuj(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if(IsAtGasStation(playerid))
		{
		    if(IsPlayerInAnyVehicle(playerid))
		    {
                new engine, niewazne;
                GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, niewazne, niewazne, niewazne, niewazne, niewazne, niewazne); 
                if(engine == 1) return SendClientMessage(playerid, COLOR_GREY, "Nie mo�esz tankowa�, gdy silnik jest odpalony!");
                //easter egg dla bugerow :D
                if(OdpalanieSpam[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Nie pr�buj bugowa� bo przez Ciebie musze przy kodzie siedziec :D");
			    GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~~n~Tankowanie pojazdu, prosze czekac",2000,3);
				SetTimer("Fillup",RefuelWait,0);
				Refueling[playerid] = 1;
			}
		}
		else
		{
			sendTipMessageEx(playerid,COLOR_GREY,"Nie jeste� na stacji benzynowej!");
		}
	}
	return 1;
}


