//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ odpal ]-------------------------------------------------//
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

CMD:odpal(playerid)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 0)
        {
            return 1;
        }
        if(Refueling[playerid] == 1) return sendTipMessage(playerid, "Nie mo�na odpali� silnika, gdy pojazd jest tankowany!");

        if(Naprawiasie[playerid] == 1) return sendTipMessage(playerid, "Nie mo�na odpali� silnika, gdy pojazd jest naprawiany!");

        if(OdpalanieSpam[playerid] == 1)
        {
            sendTipMessage(playerid, "Odpalasz ju� w�z!");
            return 1;
        }
		if(GetPlayerVehicleID(playerid) <= CAR_End) //do kradziezy
        {
            if(KradniecieWozu[playerid] != GetPlayerVehicleID(playerid))
		    {
				sendErrorMessage(playerid, "Nie mo�esz odpali� wozu podczas kradni�cia");
				return 1;
			}
		}

        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
			new engine, unused;
			GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine , unused , unused, unused, unused, unused, unused);
			if(IsARower(GetPlayerVehicleID(playerid)))
			{
				sendErrorMessage(playerid, "Rower nie ma silnika!");
				return 1;
			}
			if(engine == 1)
			{
				sendTipMessage(playerid, "Silnik jest ju� odpalony !");
				return 1;
			}
			
            new Float:lHP;
            GetVehicleHealth(GetPlayerVehicleID(playerid), lHP);
            if(lHP <= 250.0) return sendErrorMessage(playerid, "Silnik jest zepsuty!"); //        8.12.2016 propozycja uid 30923
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "* %s wk�ada kluczyk do stacyjki i przekr�ca.", sendername);
			ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetTimerEx("odpalanie",3000,0,"d",playerid);
			OdpalanieSpam[playerid] = 1;

            MSGBOX_Show(playerid, "Odpalanie pojazdu", MSGBOX_ICON_TYPE_WAIT, 3);
		}
		else
		{
		    sendErrorMessage(playerid, "Nie jeste� kierowc� !");
            return 1;
		}
	}
	return 1;
}

