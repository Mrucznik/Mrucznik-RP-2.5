//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                  choroby                                                  //
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
// Autor: Mrucznik
// Data utworzenia: 07.02.2020
//Opis:
/*
	System chor�b.
*/

//

#include <YSI\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
choroby_OnPlayerLogin(playerid)
{
	MruMySQL_LoadDiseasesData(playerid);
	return 1;
}

hook OnGameModeInit()
{
	choroby_InitEffects();
	TourettRegexp = regex_exbuild(".*[^a-zA-Z](kurwa|chuj|huj|cipa|fiut|zjeb|kurwy|jeb|pizda|pizdy|szmul|dzban|kutas|dupa|cipka|pierdol|pierdolony)[^a-zA-Z].*");
}

hook OnPlayerConnect(playerid)
{
	PlayerImmunity[playerid] = 2;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	VECTOR_clear(VPlayerDiseases[playerid]);
	Grypa[playerid] = 0;
	Tourett[playerid] = 0;
	TourettActive[playerid] = 0;
	PTSDCounter[playerid] = 0;
	return 1;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	//infecting on contact
	if(weaponid >= 0 && weaponid <= 15) //melee weapons only
	{
		if(!IsPlayerHealthy(issuerid)) 
		{
			VECTOR_foreach(i : VPlayerDiseases[issuerid])
			{
				new eDiseases:disease = eDiseases:MEM_get_val(i);
				if(DiseaseData[disease][SpreadingOnContact])
				{
					if(IsPlayerSick(playerid, disease)) 
						return 1;
					
					//0.5% chance to get infected
					if(RandomizeSouldBeInfected(0.5, DiseaseData[disease][ContagiousRatio])) 
						return 1;

					InfectPlayer(playerid, disease);
					new messageTime = random(60000);//minuta
					defer InfectedEffectMessage[messageTime](playerid);
				}
			}
		}
	}
	else if(weaponid == 42) //ga�nica
	{
		PlayerImmunity[playerid] = 2;
	}
	else 
	{
		//padaczka
		if(bodypart == BODY_PART_HEAD)
		{
			if(random(200) == 0)
			{
				InfectPlayer(playerid, PADACZKA);
			}
		}
		else if(bodypart == BODY_PART_LEFT_ARM || bodypart == BODY_PART_RIGHT_ARM)
		{
			if(random(1000) == 0)//0.1% szans
			{
				InfectPlayer(playerid, PARKINSON);
			}
		}
	}
	return 1;
}

hook OnPlayerText(playerid, text[])
{
	if(regex_exmatch(text, TourettRegexp) >= 0)
	{
		Tourett[playerid]++;
		if(Tourett[playerid] >= 30)
		{
			InfectPlayer(playerid, TOURETT);
			Tourett[playerid] = 0;
		}
	}
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	if(reason == WEAPON_DROWN)
	{
		if(random(2) == 0)//50%
		{
			InfectPlayer(playerid, ASTMA);
		}
	}

	if(random(20) == 0)//5%
	{
		InfectPlayer(playerid, URAZ);
	}

	if(IsPlayerConnected(killerid))
	{
		PTSDCounter[killerid]++;
		if(PTSDCounter[killerid] >= 10)
		{
			if(random(5) == 0) //20%
			{
				InfectPlayer(killerid, PTSD);
			}
		}
	}
}

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	if(random(10000) == 0) //0.01% szans
	{
		InfectPlayer(playerid, ASTYGMATYZM);
	}
}

//end