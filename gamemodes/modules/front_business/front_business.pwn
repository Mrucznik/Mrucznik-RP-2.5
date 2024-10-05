//-----------------------------------------------<< Source >>------------------------------------------------//
//                                               front_business                                              //
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
// Data utworzenia: 05.09.2024
//Opis:
/*
	System bzines�w-przykrywek dla organizacji przest�pczych
*/

//

//-----------------<[ Funkcje: ]>-------------------
LoadFrontBusinesses()
{
	for(new i; i<sizeof(FrontBusiness); i++)
	{
		if(!Redis_Exists(RedisClient,  RedisFrontBizKey(i, "initialized")))
		{
			// default values
			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "takeoverHour"), 16 + random(7));
			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "takeoverMinute"), 30 * random(2));
			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "takeoverTime"), 3600); // 60 minutes

			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "color"), COLOR_BROWN);
			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "owner"), 0);

			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "profit"), 0);
			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "leaderProfit"), 0);

			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "initialized"), 1);
		}
		FrontBusiness[i][TakeoverHour] = RedisGetInt(RedisFrontBizKey(i, "takeoverHour"));
		FrontBusiness[i][TakeoverMinute] = RedisGetInt(RedisFrontBizKey(i, "takeoverMinute"));
		FrontBusiness[i][TakeoverTime] = RedisGetInt(RedisFrontBizKey(i, "takeoverTime"));
		FrontBusiness[i][BizColor] = RedisGetInt(RedisFrontBizKey(i, "color"));
		FrontBusiness[i][Owner] = RedisGetInt(RedisFrontBizKey(i, "owner"));
		FrontBusiness[i][TakeoverArea] = -1;

		MruCreateDynamicMapIcon(FrontBusiness[i][OutX], FrontBusiness[i][OutY], FrontBusiness[i][OutZ], 
			GetFrontBusinessIcon(FrontBusiness[i][Type]),
			-1, // color, This should only be used with the square icon (ID: 0)
			FrontBusiness[i][OutVw], // worldid
			FrontBusiness[i][OutInt], // interiorid
			-1, // playerid
			2000.0, // streamdistance -1 = inifnite
			MAPICON_GLOBAL // style https://www.open.mp/docs/scripting/resources/mapiconstyles
		);

		new Float:areaMinX = FrontBusiness[i][OutX] - FRONT_BUSINESS_GANGZONE_SIZE;
		new Float:areaMinY = FrontBusiness[i][OutY] - FRONT_BUSINESS_GANGZONE_SIZE;
		new Float:areaMaxX = FrontBusiness[i][OutX] + FRONT_BUSINESS_GANGZONE_SIZE;
		new Float:areaMaxY = FrontBusiness[i][OutY] + FRONT_BUSINESS_GANGZONE_SIZE;
		FrontBusiness[i][BizGangZone] = GangZoneCreate(areaMinX, areaMinY, areaMaxX, areaMaxY);
		GangZoneShowForAll(FrontBusiness[i][BizGangZone], FrontBusiness[i][BizColor] | 0x44);

		FrontBusiness[i][GangZoneArea] = CreateDynamicRectangle(areaMinX, areaMinY, areaMaxX, areaMaxY, 
			FrontBusiness[i][OutVw], FrontBusiness[i][OutInt]);

		CreateDynamicPickup(GetFrontBusinessPickup(FrontBusiness[i][Type]), 1, 
			FrontBusiness[i][OutX], FrontBusiness[i][OutY], FrontBusiness[i][OutZ],
			FrontBusiness[i][OutVw], FrontBusiness[i][OutInt]);

		FrontBusiness[i][Out3DText] = CreateDynamic3DTextLabel(FrontBusiness[i][Name], FrontBusiness[i][BizColor], 
			FrontBusiness[i][OutX], FrontBusiness[i][OutY], FrontBusiness[i][OutZ] + 0.2, 
			EXTERIOR_3DTEXT_RANGE, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1,
			FrontBusiness[i][OutVw], FrontBusiness[i][OutInt]);

		if(FrontBusiness[i][InX] != 0.0) 
		{
			FrontBusiness[i][In3DText] = CreateDynamic3DTextLabel("Wyj�cie", FrontBusiness[i][BizColor], 
				FrontBusiness[i][InX], FrontBusiness[i][InY], FrontBusiness[i][InZ] + 0.2, 
				INTERIOR_3DTEXT_RANGE, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1,
				FrontBusiness[i][InVw], FrontBusiness[i][InInt]);
				
			DodajWejscieNoPickup(
				FrontBusiness[i][OutX], FrontBusiness[i][OutY], FrontBusiness[i][OutZ], FrontBusiness[i][OutVw], FrontBusiness[i][OutInt],
				FrontBusiness[i][InX], FrontBusiness[i][InY], FrontBusiness[i][InZ], FrontBusiness[i][InVw], FrontBusiness[i][InInt],
				0, 1000+i
			);
		}

		if(FrontBusiness[i][Type] == FRONT_BIZ_TYPE_SPRAY)
		{
			new idx = FrontBizPayNSprayID;
			StworzWjedz(FakePayNSpray[idx][0], FakePayNSpray[idx][1], FakePayNSpray[idx][2], 
				FrontBusiness[i][InX], FrontBusiness[i][InY], FrontBusiness[i][InZ], 
				25.0, FrontBusiness[i][InVw], FrontBusiness[i][InInt], " ", " ", 0, 0, LOCAL_PAY_N_SPRAY);
			FrontBizPayNSprayID++;
		}
	}
}

StartFrontBizTakeover(bizId)
{
	FrontBusiness[bizId][TakeoverActive] = true;
	FrontBusiness[bizId][TakeoverStartTime] = gettime();

	FrontBusiness[bizId][TakeoverCheckpoint] = CreateDynamicCP(FrontBusiness[bizId][TakeoverX], FrontBusiness[bizId][TakeoverY], FrontBusiness[bizId][TakeoverZ] - 0.5,
		20.0, FrontBusiness[bizId][TakeoverVw], FrontBusiness[bizId][TakeoverInt],
		INVALID_PLAYER_ID, FRONT_BUSINESS_GANGZONE_SIZE, FrontBusiness[bizId][GangZoneArea]);
	
	FrontBusiness[bizId][TakeoverArea] = CreateDynamicCylinder(FrontBusiness[bizId][OutX], FrontBusiness[bizId][OutY], 
		FrontBusiness[bizId][OutZ], FrontBusiness[bizId][OutZ] + 10, 
		TAKEOVER_ZONE_SIZE, FrontBusiness[bizId][OutVw], FrontBusiness[bizId][OutInt]);
}

StopFrontBizTakeover(bizId)
{
	FrontBusiness[bizId][TakeoverActive] = false;
	DestroyDynamicCP(FrontBusiness[bizId][TakeoverCheckpoint]);
	DestroyDynamicArea(FrontBusiness[bizId][TakeoverArea]);
	FrontBusiness[bizId][TakeoverArea] = -1;

	new winner = -1, maxScore;
	for(new i=1; i<MAX_ORG; i++)
	{
		new score = FrontBusiness[bizId][TakingOverScore][i];
		if(score > maxScore)
		{
			maxScore = score;
			winner = i;
		}

		// cleanup
		FrontBusiness[bizId][TakingOver][i] = 0;
		FrontBusiness[bizId][TakingOverScore][i] = 0;
	}

	// Check the winner
	if(winner != -1)
	{
		if(winner == FrontBusiness[bizId][Owner])
		{
			// successful defence
			SuccessfulDefenceMessage(bizId, winner);
		}
		else if(maxScore < TAKE_OVER_POINT_THRESHOLD)
		{
			SuccessfulDefenceMessage(bizId, FrontBusiness[bizId][Owner]);
			SendFamilyMessage(winner, COLOR_RED, "Koniec przejmowania!");
			SendFamilyMessage(winner, COLOR_RED, sprintf(
				"Niestety, Twojej organizacji nie uda�o si� prekroczy� progu %d punkt�w wymaganego do przej�cia biznesu",
				TAKE_OVER_POINT_THRESHOLD));
		}
		else
		{
			// successful attack
			new oldOwner = FrontBusiness[bizId][Owner];
			TakeOverFrontBusiness(bizId, winner);
			SuccessfulAttackMessage(bizId, winner, oldOwner);
		}
	}
}

TriggerTakingOver(bizId, org)
{
	GangZoneFlashForAll(FrontBusiness[bizId][BizGangZone], 0xFF000066);

	if(FrontBusiness[bizId][TakingOverScore][org] == 0)
	{
		new ownerOrg = FrontBusiness[bizId][Owner];
		if(IsActiveOrg(ownerOrg))
		{
			SendOrgMessage(ownerOrg, COLOR_PANICRED, "UWAGA! AGRESJA!");
			SendOrgMessage(ownerOrg, COLOR_PANICRED, sprintf("Kto� atakuje nale��cy do waszej organizacji biznes %s!", FrontBusiness[bizId][Name]));
		}
	}
}

StopTakingOver(bizId)
{
	new ownerOrg = FrontBusiness[bizId][Owner];
	GangZoneStopFlashForAll(FrontBusiness[bizId][BizGangZone]);

	if(IsActiveOrg(ownerOrg))
	{
		SendOrgMessage(ownerOrg, COLOR_LIGHTGREEN, sprintf("Atakuj�cy przestali przejmowa� biznes %s!", FrontBusiness[bizId][Name]));
	}
}

IncrTakeoverPointsStat(org)
{
	foreach(new i : Player)
	{
		new playerTakeoverOrg = GetPlayerOrg(i);
		if(playerTakeoverOrg != org || playerTakeoverOrg == 0)
		{
			continue;
		}

		new bizId = GetPVarInt(i, "in-takeover-zone") - 1;
		if(bizId < 0)
		{
			continue;
		}

		IncrPlayerTakeoverPoints(i, org, 1); // TODO: optimize
	}
}

TakeOverFrontBusiness(bizId, org)
{
	new color = OrgInfo[org][o_Color];
	FrontBusiness[bizId][Owner] = org;
	FrontBusiness[bizId][BizColor] = color;
	Redis_SetInt(RedisClient, RedisFrontBizKey(bizId, "color"), color);
	Redis_SetInt(RedisClient, RedisFrontBizKey(bizId, "owner"), org);

	GangZoneShowForAll(FrontBusiness[bizId][BizGangZone], color);
	GangZoneStopFlashForPlayer(FrontBusiness[bizId][BizGangZone], color);
}

SuccessfulDefenceMessage(bizId, org)
{
	if(!IsActiveOrg(org))
	{
		return;
	}
	SendOrgMessage(org, COLOR_LIGHTGREEN, sprintf("Twoja organizacja z sukcesem obroni�a biznes %s", FrontBusiness[bizId][Name]));
}

SuccessfulAttackMessage(bizId, org, oldOwner)
{
	SendOrgMessage(org, COLOR_LIGHTGREEN, "UDA�O SI�!");
	SendOrgMessage(org, COLOR_LIGHTGREEN, sprintf("Twoja organizacja przej�a biznes %s", FrontBusiness[bizId][Name]));

	if(IsActiveOrg(oldOwner))
	{
		SendOrgMessage(oldOwner, COLOR_PANICRED, "TRAGEDIA!");
		SendOrgMessage(oldOwner, COLOR_PANICRED, sprintf("Twoja organizacja straci�a kontrol� nad biznesem %s", FrontBusiness[bizId][Name]));
	}
}

IsPlayerNearOwnFrontBusiness(playerid, Float:proximity=5.0)
{
	new bizId = IsPlayerAtFrontBusinnesZone(playerid);
	if(bizId < 0)
	{
		return 0;
	}

	if(!IsFrontBusinnesOwnedByPlayerOrg(playerid, bizId))
	{
		return 0;
	}

	if(GetPlayerFrontBusinessProximity(playerid, bizId) > proximity)
	{
		return 0;
	}
	return 1;
}

IsPlayerAtFrontBusinnesZone(playerid)
{
	for(new i; i<sizeof(FrontBusiness); i++)
	{
		if(IsPlayerInDynamicArea(playerid, FrontBusiness[i][GangZoneArea]))
		{
			return i;
		}
	}
	return -1;
}

Float:GetPlayerFrontBusinessProximity(playerid, bizId)
{
	return GetPlayerDistanceFromPoint(playerid, FrontBusiness[bizId][OutX], FrontBusiness[bizId][OutY], FrontBusiness[bizId][OutZ]);
}

IsFrontBusinnesOwnedByPlayerOrg(playerid, bizId)
{
	return FrontBusiness[bizId][Owner] == GetPlayerOrg(playerid);
}

IsBusinessTypeOwnedByPlayerOrg(playerid, type)
{
	new org = GetPlayerOrg(playerid);
	if(!IsActiveOrg(org))
	{
		return 0;
	}

	for(new i; i<sizeof(FrontBusiness); i++)
	{
		if(FrontBusiness[i][Type] == type && FrontBusiness[i][Owner] == org)
		{
			return 1;
		}
	}
	return 0;
}

IsFrontBusinnesOwnedByOrg(bizId, org)
{
	return FrontBusiness[bizId][Owner] == org;
}

ShowFrontBusinessInfo(playerid, bizId)
{
	new owner[40];
	if(FrontBusiness[bizId][Owner] == 0)
		strcat(owner, "~r~~h~Brak");
	else
		format(owner, sizeof(owner), "~g~~h~%s", OrgInfo[FrontBusiness[bizId][Owner]][o_Name]);

	TextDrawShowForPlayer(playerid, ZoneTXD[0]);
	TextDrawShowForPlayer(playerid, ZoneTXD[4]);
	TextDrawShowForPlayer(playerid, ZoneTXD[2]);

	new hour, minute, endHour, endMinute;
	GetOrgTakeoverTimeWindow(bizId, hour, minute, endHour, endMinute);

	new string[1024];
	format(string, sizeof(string), "Biznes: ~g~~h~%s~n~" \
		"Typ biznesu: ~g~~h~%s~n~" \
		"Wlasciciel: ~n~  %s~n~" \
		"Do przejecia od: ~n~~g~~h~  %02d:%02d - %02d:%02d~n~" \
		"Zysk na godzine: ~g~~h~%d$~n~" \
		"Bonus za gracza online: ~g~~h~%d$~n~" \
		"+ %s", 
		Odpolszcz(FrontBusiness[bizId][Name]), 
		FrontBusinessType[FrontBusiness[bizId][Type]],
		owner,
		hour, minute, endHour, endMinute,
		FrontBusiness[bizId][BaseIncome], 
		FrontBusiness[bizId][IncomePerPlayer],
		FrontBusinessBenefits[FrontBusiness[bizId][Type]]);
    PlayerTextDrawSetString(playerid, ZonePTXD_Name[playerid], string);
    PlayerTextDrawShow(playerid, ZonePTXD_Name[playerid]);

	SetPVarInt(playerid, "business-info", 1);
}

GetOrgTakeoverTimeWindow(bizId, &hour, &minute, &endHour, &endMinute)
{
	hour = FrontBusiness[bizId][TakeoverHour];
	minute = FrontBusiness[bizId][TakeoverMinute];
	new takeoverTimeMinutes = FrontBusiness[bizId][TakeoverTime];
	new increasedMinutes = minute + (takeoverTimeMinutes/60);
	endHour = hour + (increasedMinutes/60);
	endMinute = (minute + (takeoverTimeMinutes/60)) % 60;
}

GenerateFrontBusinessIncome(bizId, profit)
{
	new org = FrontBusiness[bizId][Owner];
	if(IsActiveOrg(org))
	{
		SejfR_Add(org, profit);
	}
	RedisIncrBy(RedisFrontBizKey(bizId, "leaderProfit"), profit);
}

IsAtFrontBusinessInteriorType(playerid, type)
{
	new bizId = PlayerInfo[playerid][pLocal] - 1000;
	if(bizId > 0 && bizId < sizeof(FrontBusiness))
	{
		if(FrontBusiness[bizId][Type] == type)
		{
			return bizId;
		}
	}
	return -1;
}

UpdateColorForOrgBusinesses(org, color)
{
	for(new i; i<sizeof(FrontBusiness); i++)
	{
		if(FrontBusiness[i][Owner] == org)
		{
			FrontBusiness[i][BizColor] = color;
			Redis_SetInt(RedisClient, RedisFrontBizKey(i, "color"), color);
			GangZoneShowForAll(FrontBusiness[i][BizGangZone], color | 0x44);
			UpdateDynamic3DTextLabelText(FrontBusiness[i][Out3DText], color, FrontBusiness[i][Name]);
			if(FrontBusiness[i][InX] != 0.0)
			{
				UpdateDynamic3DTextLabelText(FrontBusiness[i][In3DText], color, "Wyj�cie");
			}
		}
	}
}

IsAtCasino(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 50.0, 1038.22924805,-1090.59741211,-67.52223969))
	{
		return 1;
	}

	if(IsAtFrontBusinessInteriorType(playerid, FRONT_BIZ_TYPE_CASINO) != -1)
	{
		return 1;
	}
	return 0;
}

//end