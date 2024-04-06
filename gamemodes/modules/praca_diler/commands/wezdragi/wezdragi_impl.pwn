//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  wezdragi                                                 //
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
// Data utworzenia: 06.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_wezdragi_Impl(playerid)
{
	if(PlayerBoxing[playerid] > 0)
	{
		MruMessageFail(playerid, "Nie mo�esz u�ywa� drag�w podczas walki.");
		return 1;
	}

	if(PlayerInfo[playerid][pDrugs] <= 0)
	{
		MruMessageFail(playerid, "Nie masz ju� wi�cej narkotyk�w.");
		return 1;
	}

	new Float:hpBuff = 10.0 * (PlayerInfo[playerid][pDrugPerk] + 1);
	new Float:armorBuff = 10.0 * (PlayerInfo[playerid][pDrugPerk] + 1);

	new Float:hp, Float:armor;
	GetPlayerHealth(playerid, hp);
	GetPlayerArmour(playerid, armor);

	new Float:newHp = hp + hpBuff;
	new Float:newArmor = armor + armorBuff;
	if(newHp > 100.0) newHp = 100.0;
	if(newArmor > 100.0) newArmor = 100.0;

	SetPlayerHealth(playerid, newHp);
	SetPlayerArmour(playerid, newArmor);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);

	PlayerInfo[playerid][pDrugs] -= 1;

	MruMessageGoodInfoF(playerid, "Za�y�e� 1 gram narkotyk�w, dostajesz %.0f HP i %.0f pancerza.", hpBuff, armorBuff);
	ChatMe(playerid, "za�ywa narkotyk.");

	// efekty
	new rand = random(100);
	if(rand < 25 && IsPlayerSick(playerid, DRUG_BAD))
	{
		PlayerPlaySound(playerid, 5202, 0.0, 0.0, 0.0);
		CurePlayer(playerid, DRUG_BAD);
		MruMessageGoodInfo(playerid, "Pozby�e� si� efektu odstawiennictwa!");
	}
	else if(rand < 30 && IsPlayerSick(playerid, DRUG_BAD))
	{
		PlayerPlaySound(playerid, 5203, 0.0, 0.0, 0.0);
		MruMessageBadInfo(playerid, "Uzale�ni�e� si� od narkotyk�w!");
		InfectPlayer(playerid, DRUG_ADDICT);
	}
	else if(rand < 87)
	{
		// good effect
		PlayerPlaySound(playerid, 5202, 0.0, 0.0, 0.0);
		InfectPlayer(playerid, DRUG_GOOD);
	}
	else if(rand < 97)
	{
		// nothing - trefny towar
		PlayerPlaySound(playerid, 5204, 0.0, 0.0, 0.0);
		MruMessageBadInfo(playerid, "Towar najprawdopodobniej by� trefny - nie czujesz nic poza tym.");
	}
	else if(rand < 99)
	{
		// addict
		if(IsPlayerSick(playerid, DRUG_ADDICT))
		{
			// do nothing if already addicted
			PlayerPlaySound(playerid, 5204, 0.0, 0.0, 0.0);
			MruMessageBadInfo(playerid, "Towar najprawdopodobniej by� trefny - nie czujesz nic poza tym.");
		}
		else
		{
			PlayerPlaySound(playerid, 5203, 0.0, 0.0, 0.0);
			MruMessageBadInfo(playerid, "Uzale�ni�e� si� od narkotyk�w!");
			InfectPlayer(playerid, DRUG_ADDICT);
		}
	}
	else // 1% szans na negatywne efekty
	{
		PlayerPlaySound(playerid, 5206, 0.0, 0.0, 0.0);
		if(rand < 97)
		{
			SendClientMessage(playerid, COLOR_FADE1, "Marcepan_Marks Szepcze: hera koka hasz LSD, ta zabawa po nocach si� �ni... Lepiej id� do lekarza!");
			InfectOrDecreaseImmunity(playerid, SCHIZOFRENIA);
		}
		else if(rand < 99)
		{
			MruMessageBadInfo(playerid, "Twoja posta� zdaje si� traci� panowanie nad swoimi zdolno�ciami motorycznymi... Lepiej id� do lekarza!");
			InfectOrDecreaseImmunity(playerid, PADACZKA);
		}
		else
		{
			MruMessageBadInfo(playerid, "Zdaje si�, �e u�ycie ig�y z drugiej r�ki nie by�o najlepszym pomys�em... Lepiej id� do lekarza!");
			InfectOrDecreaseImmunity(playerid, HIV);
		}
	}
    return 1;
}

//end