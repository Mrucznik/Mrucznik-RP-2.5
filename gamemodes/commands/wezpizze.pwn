//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ wezpizze ]-----------------------------------------------//
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

CMD:wezpizze(playerid, params[])
{
    if(PlayerInfo[playerid][pJob] == JOB_PIZZA)
    {
        new veh = GetPlayerVehicleID(playerid);
        if(veh == 0) return sendTipMessage(playerid, "Musisz by� w poje�dzie firmowym.");
        if(Car_GetOwnerType(veh) != CAR_OWNER_JOB || Car_GetOwner(veh) != JOB_PIZZA) return sendTipMessage(playerid, "Musisz by� w poje�dzie firmowym.");
        if(!PlayerToPoint(5.0,playerid,2103.8123,-1798.7085,13.6504)) return sendTipMessage(playerid, "W tym miejscu nie mo�esz wzi�� zlecenia.");
		//if(GetVehicleModel(veh) != 578) return sendErrorMessage(playerid, " Tym pojazdem nie we�miesz zlecenia.");

        if(PizzaJob[playerid] == 0)
        {
            SendClientMessage(playerid, COLOR_WHITE, "Przyj��e� zlecenie! Musisz dostarczy� pizz� pod wskazany adres!");
            SendClientMessage(playerid, COLOR_GREEN, "GPS: Na mapie wy�wietlono miejsce, do kt�rego musisz si� uda�!");
            SendClientMessage(playerid, COLOR_WHITE, "Pospiesz si�! Im szybciej dostarczysz pizz�, tym wi�kszy napiwek dostaniesz! Masz 2 minuty!");
			new randpizza = random(1);
			if(randpizza == 0)
			{
				Actor01 = CreateActor(235,2151.0234,-1294.7612,23.9795,180.0);
				SetPlayerCheckpoint(playerid, 2151.0444,-1298.7473,23.8281, 3.0);
				randpizza = 1;
				PizzaJob[playerid] = 1;
			}
			else if(randpizza == 1)
			{
				Actor01 = CreateActor(235,2151.0234,-1294.7612,23.9795,180.0);
				SetPlayerCheckpoint(playerid, 2151.0444,-1298.7473,23.8281, 3.0);
				randpizza = 1;
				PizzaJob[playerid] = 1;
			}
        }
        else return sendErrorMessage(playerid, "Masz ju� zlecenie.");
        return 1;
    }
	return 1;
}
