//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ wezwijwoz ]-----------------------------------------------//
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

CMD:callcar(playerid) return cmd_wezwijwoz(playerid);
CMD:wezwijwoz(playerid)
{
	new string[128];

    if(IsPlayerConnected(playerid))
    {
	    if(CarCalls[playerid] > 0)
	    {
	        new Float:plocx,Float:plocy,Float:plocz;
            GetPlayerPos(playerid, plocx, plocy, plocz);
			SetVehiclePos(CarID[playerid],plocx,plocy+4, plocz);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Kupiony w�z przywo�any.");
			CarCalls[playerid] -= 1;
			format(string, sizeof(string), "* Mo�esz wezwa� sw�j w�z jeszcze %d razy.", CarCalls[playerid]);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	    }
	    else
	    {
	        sendTipMessageEx(playerid, COLOR_GREY, "Nie masz wozu !");
	    }
	}
    return 1;
}


