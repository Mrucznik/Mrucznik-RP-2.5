//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ sprzedajauto ]---------------------------------------------//
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

CMD:dajauto(playerid, params[]) return cmd_sprzedajauto(playerid, params);
CMD:dajsamochod(playerid, params[]) return cmd_sprzedajauto(playerid, params);
CMD:sprzedajauto(playerid, params[])
{
	new string[256];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

	if(IsPlayerInAnyVehicle(playerid))
    {
   		new playa, cena;
		if( sscanf(params, "k<fix>s[32]", playa, string))
		{
			sendTipMessage(playerid, "U�yj /dajauto [Nick/ID] [cena]");
			return 1;
		}
        if(GetPVarInt(playa, "offer-car")) return sendErrorMessage(playerid, "Ten gracz otrzyma� ju� ofert� kupna pojazdu! Zaczekaj 30 sekund");
        if(!IsPlayerConnected(playa)) return sendErrorMessage(playerid, "Brak takiego gracza.");
		cena = FunkcjaK(string);
		//
        new lVeh = GetPlayerVehicleID(playerid);
		if(!IsCarOwner(playerid, lVeh)) return sendTipMessage(playerid, "Nie jeste� w�a�cicielem tego pojazdu.");
		if(PlayerInfo[playa][pLevel] == 1) return sendTipMessage(playerid, "Nie mo�esz sprzeda� temu graczowi pojazdu poniewa� ma 1lvl");
		if(PlayerInfo[playerid][pLevel] == 1) return sendTipMessage(playerid, "Nie mo�esz sprzedawa� pojazdu bo masz 1 lvl");

		new vehid = VehicleUID[lVeh][vUID];

 		if(!ProxDetectorS(10.0, playerid, playa)) return sendErrorMessage(playerid, "Ten gracz jest za daleko !");
		if(!(cena > 0 && cena < 900000001)) return sendErrorMessage(playerid, "Cena od 1 do 900 000 000$ !");

        if(lVeh <= CAR_End) return sendErrorMessage(playerid, "Tego pojazdu nie mo�na sprzeda�");

	    if(kaska[playa] == 0) return sendErrorMessage(playerid, "B��d");

	    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));

        SetPVarInt(playa, "offer-car", gettime() + 30);
	    format(string, sizeof(string), "%s oferuje ci sprzeda� %s za %d$. Je�li chcesz kupi� to auto wpisz /akceptuj pojazd aby kupi�.", sendername, VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400], cena);
        SendClientMessage(playa, 0xFFC0CB, string);
        //TODO
        if(PlayerInfo[playa][pDonateRank] == 0)
        {
            if(CarData[vehid][c_Neon] != 18652 && CarData[vehid][c_Neon] != 0)
            {
                SendClientMessage(playa, 0xFF0000FF, "UWAGA!: Ten samoch�d ma kolorowe neony dost�pne tylko dla kont premium. Gdy zakupisz to auto neony automatycznie zmieni� kolor na {FFFFFF}bia�y!");
            }
        }
        format(string, sizeof(string), "Oferujesz %s kupno twojego %s za %d$", giveplayer, VehicleNames[GetVehicleModel(lVeh)-400], cena);
        SendClientMessage(playerid, 0xFFC0CB, string);
        GraczDajacy[playa] = playerid;
		CenaDawanegoAuta[playa] = cena;
        IDAuta[playa] = vehid;
	}
 	else
 	{
		sendTipMessage(playerid, "Nie jeste� w poje�dzie");
    }
	return 1;
}

