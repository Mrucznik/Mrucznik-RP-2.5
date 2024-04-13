//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                    kurs                                                   //
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
// Data utworzenia: 31.03.2024


//

//------------------<[ Implementacja: ]>-------------------
command_kurs_Impl(playerid, price)
{
    if(GetPlayerJob(playerid) != JOB_DRIVER && PlayerInfo[playerid][pMember] != 10 && PlayerInfo[playerid][pLider] == 10)
	{
		MruMessageFail(playerid, "Nie jeste� kierowc� taks�wki/autobusu.");
		return 1;
	}

	if(!IsPlayerInAnyVehicle(playerid))
	{
		MruMessageFail(playerid, "Musisz by� w poje�dzie.");
		return 1;
	}

	if(AntySpam[playerid] != 0)
	{
		sendTipMessageEx(playerid, COLOR_GREY, "Odczekaj 7 sekund !");
		return 1;
	}

	if(TransportDuty[playerid] > 0)
	{
		Taxi_FareEnd(playerid);
		return 1;
	}

	new vehicleid = GetPlayerVehicleID(playerid);
	if(!CanPlayerUseTaxometr(playerid, vehicleid))
	{
		MruMessageFail(playerid, "W tym poje�dzie nie ma zamontowanego taskometru lub nie masz uprawnie� by z niego korzysta�.");
		return 1;
	}

	new string[128], sendername[MAX_PLAYER_NAME];
	if(IsVehicleWithTaxometr(vehicleid))
	{
		new maxPrice = 100 + 100 * GetPlayerJobSkill(playerid, JOB_DRIVER);

		if(IsAMiniBus(vehicleid))
		{
			if(price < 25 || price > maxPrice) 
			{ 
				MruMessageFailF(playerid, "Cena biletu od $25 do $%d!", maxPrice); 
				return 1; 
			}
			BusDrivers += 1; TransportDuty[playerid] = 2; TransportValue[playerid]= price;
			GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "Kierowca autobusu %s jest na s�u�bie, cena biletu: %d$", sendername, TransportValue[playerid]);
			OOCNews(COLOR_YELLOW,string);
		}
		else if(GetVehicleModel(vehicleid) == 431 || GetVehicleModel(vehicleid) == 437)
		{
			if(price < 25 || price > maxPrice) 
			{ 
				MruMessageFailF(playerid, "Cena biletu od $25 do $%d!", maxPrice); 
				return 1; 
			}
			BusDrivers += 1; TransportDuty[playerid] = 2; TransportValue[playerid]= price;
			GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "Kierowca autobusu %s jest na s�u�bie, cena biletu: $%d.", sendername, TransportValue[playerid]);
			OOCNews(TEAM_GROVE_COLOR,string);
		}
		else if(IsATrain(vehicleid))
		{
			GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "Maszynista %s jest na s�u�bie i kursuje po stanie San Andreas.", sendername);
			OOCNews(COLOR_YELLOW,string);
		}
		else if(IsAPlane(vehicleid))
		{
			if(price < 900 || price > 5000) { sendTipMessageEx(playerid, COLOR_GREY, "Cena kursu od $900 do $5000!"); return 1; }
			TaxiDrivers += 1; TransportDuty[playerid] = 1; TransportValue[playerid] = price;
			GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "Pilot %s jest na s�u�bie wpisz /wezwij heli aby skorzysta� z jego us�ug, koszt %d$", sendername, TransportValue[playerid]);
			OOCNews(COLOR_YELLOW,string);
		}
		else
		{
			if(GetVehicleModel(vehicleid) == 418 || GetVehicleModel(vehicleid) == 525 || GetVehicleModel(vehicleid) == 402 || GetVehicleModel(vehicleid) == 541) return sendTipMessageEx(playerid,COLOR_GREY,"W tym poje�dzie nie mo�esz wej�� na s�u�b� !");
			if(price < 150 || price > 2000) { sendTipMessageEx(playerid, COLOR_GREY, "Cena kursu od $150 do $2000 !"); return 1; }
			TaxiDrivers += 1; TransportDuty[playerid] = 1; TransportValue[playerid] = price;
			GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "Taks�wkarz %s jest na s�u�bie wpisz /wezwij taxi aby skorzysta� z jego us�ug, koszt %d$", sendername, TransportValue[playerid]);
			OOCNews(COLOR_YELLOW,string);
		}

		SetPlayerColor(playerid, COLOR_YELLOW);
	}
	else if(IsATrain(vehicleid))//poci�gi
	{
		format(string, sizeof(string), "Koleje Brown Streak rozpocz�y tras� po stanie San Andreas!");
		OOCNews(COLOR_YELLOW,string);
	}
	else
	{
		sendTipMessageEx(playerid,COLOR_GREY,"W tym poje�dzie nie mo�esz wej�� na s�u�b� !");
		return 1;
	}

	AntySpam[playerid] = 1;
	SetTimerEx("AntySpamTimer",7000,0,"d",playerid);
    return 1;
}

//end