//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  fishing                                                  //
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
// Data utworzenia: 03.03.2020
//Opis:
/*
	System �owienia ryb.
*/

//

//-----------------<[ Funkcje: ]>-------------------
ClearFishes(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    Fishes[playerid][pFid1] = 0; Fishes[playerid][pFid2] = 0; Fishes[playerid][pFid3] = 0;
		Fishes[playerid][pFid4] = 0; Fishes[playerid][pFid5] = 0;
		Fishes[playerid][pWeight1] = 0; Fishes[playerid][pWeight2] = 0; Fishes[playerid][pWeight3] = 0;
		Fishes[playerid][pWeight4] = 0; Fishes[playerid][pWeight5] = 0;
		new string[MAX_PLAYER_NAME];
		format(string, sizeof(string), "None");
		strmid(Fishes[playerid][pFish1], string, 0, strlen(string), 255);
		strmid(Fishes[playerid][pFish2], string, 0, strlen(string), 255);
		strmid(Fishes[playerid][pFish3], string, 0, strlen(string), 255);
		strmid(Fishes[playerid][pFish4], string, 0, strlen(string), 255);
		strmid(Fishes[playerid][pFish5], string, 0, strlen(string), 255);
		if(gPlayerLogged[playerid]) {
			new lStr[256];
			format(lStr, 256, "UPDATE `mru_ryby` SET Fish1='None', Fish2='None', Fish3='None', Fish4='None', Fish5='None', Weight1=0, Weight2=0, Weight3=0, Weight4=0, Weight5=0, Fid1=0, Fid2=0, Fid3=0, Fid4=0, Fid5=0 WHERE Player=%i",
			PlayerInfo[playerid][pUID]);
			mysql_query(lStr);
		}
	}
	return 1;
}

ClearFishID(playerid, fish)
{
	if(IsPlayerConnected(playerid))
	{
		new string[MAX_PLAYER_NAME];
		format(string, sizeof(string), "None");
		switch (fish)
		{
		    case 1:
		    {
		        strmid(Fishes[playerid][pFish1], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight1] = 0;
		        Fishes[playerid][pFid1] = 0;
		    }
		    case 2:
		    {
		        strmid(Fishes[playerid][pFish2], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight2] = 0;
		        Fishes[playerid][pFid2] = 0;
		    }
		    case 3:
		    {
		        strmid(Fishes[playerid][pFish3], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight3] = 0;
		        Fishes[playerid][pFid3] = 0;
		    }
		    case 4:
		    {
		        strmid(Fishes[playerid][pFish4], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight4] = 0;
		        Fishes[playerid][pFid4] = 0;
		    }
		    case 5:
		    {
		        strmid(Fishes[playerid][pFish5], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight5] = 0;
		        Fishes[playerid][pFid5] = 0;
		    }
		}
		MruMySQL_UpdateFish(playerid, fish);
	}
	return 1;
}

PlayerHasFishes(playerid)
{
	return Fishes[playerid][pWeight1] > 0 || Fishes[playerid][pWeight2] > 0 || Fishes[playerid][pWeight3] > 0 || Fishes[playerid][pWeight4] > 0 || Fishes[playerid][pWeight5] > 0;
}

CalculateFishes(playerid) {
	new fishes = 0;
	if(Fishes[playerid][pWeight1] > 0)
		fishes++;
	if(Fishes[playerid][pWeight2] > 0)
		fishes++;
	if(Fishes[playerid][pWeight3] > 0)
		fishes++;
	if(Fishes[playerid][pWeight4] > 0)
		fishes++;
	if(Fishes[playerid][pWeight5] > 0)
		fishes++;
	return fishes;
}

IsAtFishPlace(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(PlayerToPoint(1.0,playerid,403.8266,-2088.7598,7.8359) || PlayerToPoint(1.0,playerid,398.7553,-2088.7490,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		else if(PlayerToPoint(1.0,playerid,396.2197,-2088.6692,7.8359) || PlayerToPoint(1.0,playerid,391.1094,-2088.7976,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		else if(PlayerToPoint(1.0,playerid,383.4157,-2088.7849,7.8359) || PlayerToPoint(1.0,playerid,374.9598,-2088.7979,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		else if(PlayerToPoint(1.0,playerid,369.8107,-2088.7927,7.8359) || PlayerToPoint(1.0,playerid,367.3637,-2088.7925,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		else if(PlayerToPoint(1.0,playerid,362.2244,-2088.7981,7.8359) || PlayerToPoint(1.0,playerid,354.5382,-2088.7979,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 403.9787,-2088.7947,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 398.8863,-2088.4109,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 395.9289,-2088.2773,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 391.1751,-2088.2493,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 383.6028,-2088.4607,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 374.8348,-2088.3501,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 370.0244,-2088.3254,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 367.5755,-2088.2151,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 362.0309,-2088.1899,7.8359))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 354.6362,-2088.3010,7.8359))
		{
			return 1;
		}
		// Vice City
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4195.1348, -1272.4592, 7.7526))
		{ // molo rybackie 2 miasto 5m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4197.1558, -1275.4037, 7.7526))
		{ // molo rybackie 2 miasto 5m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4197.4019, -1281.9413, 7.7526))
		{ // molo rybackie 2 miasto 5m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4197.2681, -1288.9069, 7.7526))
		{ // molo rybackie 2 miasto 5m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4197.5981, -1295.7142, 7.7526))
		{ // molo rybackie 2 miasto 5m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4197.2632, -1303.0806, 7.7526))
		{ // molo rybackie 2 miasto 5m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4197.4736, -1309.2416, 7.7526))
		{ // molo rybackie 2 miasto 5m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4194.1665, -1312.9655, 7.7526))
		{ // molo rybackie 2 miasto 5m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 4626.1807, -1172.5938, 8.5813))
		{ // prywatne molo rybackie
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 5245.6401, -649.5212, 7.5536))
		{ // molo rybackie 1 miasto
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 5333.7188, -379.5435, 7.8307))
		{ // molo rybackie 1 miasto
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 25.0, 5303.0806, -2652.2378, 8.5437))
		{ // molo rybackie 1 miasto obok latarni - 25m
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 5267.5693, -2651.1758, 8.5474))
		{ // molo rybackie 1 miasto obok latarni - poczatek mostu
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 5326.4194, -2651.4761, 8.5393))
		{ // molo rybackie 1 miasto obok latarni - koniec mostu
			return 1;
		}

	}
	return 0;
}

//end