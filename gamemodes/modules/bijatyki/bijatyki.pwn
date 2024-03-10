//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  bijatyki                                                 //
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
// Autor: NikodemBanan
// Data utworzenia: 01.03.2024
//Opis:
/*
	Uporz�dkowany system /pobij.
*/

//

//-----------------<[ Funkcje: ]>-------------------

BattlePhaseStart(playerid, opponentid, lengthSeconds)
{
	new message_s[256];

	new playerName[MAX_PLAYER_NAME];
	new opponentName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playerName, sizeof(playerName));
	GetPlayerName(opponentid, opponentName, sizeof(opponentName));

	new randomFightTextID = random(30);
	format(battleCodeToRetype[playerid], sizeof(battleCodeToRetype[]), "%s", BATTLE_CODE_RETYPE_TEXTS[randomFightTextID]);

	format(message_s, sizeof(message_s), "Pr�bujesz pobi� %s, za %d sekund rostrzygnie si� bitwa!", opponentName, lengthSeconds);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, message_s);

	format(message_s, sizeof(message_s), "%s pr�buje ci� pobi�! Wpisz ten kod aby si� obroni�:\n%s", playerName, battleCodeToRetype[playerid]);
	ShowPlayerDialogEx(opponentid, BATTLE_FIGHT_DIALOG, DIALOG_STYLE_INPUT, "BITWA!!", message_s, "Wybierz", "Wyjd�");

	ApplyAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 1, 0, 1);
	ApplyAnimation(opponentid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 1, 0, 1);

	battleIsTooLate[playerid] = false;
	battleIsTooLate[opponentid] = false;
	isFightingNow[playerid] = true;
	isFightingNow[opponentid] = true;

	new battleTimer = SetTimerEx("BattleTimeIsUp", lengthSeconds * 1000, false, "dd", opponentid, playerid);
	SetPVarInt(opponentid, "battleTimer", battleTimer);
}

LoseBattle(playerid, opponentid)
{
	new message_s[256];

	new opponentName[MAX_PLAYER_NAME];
	new playerName[MAX_PLAYER_NAME];

	GetPlayerName(opponentid, opponentName, sizeof(opponentName));
	GetPlayerName(playerid, playerName, sizeof(playerName));

	format(message_s, sizeof(message_s), "* %s wyprowadzi� cios i pobi� %s.", opponentName, playerName);
	ProxDetector(30.0, playerid, message_s, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

	format(message_s, sizeof(message_s), "%s znokautowa� ci� bez wi�kszego problemu.", opponentName);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, message_s);
	format(message_s, sizeof(message_s), "Odczekaj %d sekund", BATTLE_WAKE_UP_SEC);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, message_s);

	format(message_s, sizeof(message_s), "Pobi�e� %s bez wi�kszego trudu.", playerName);
	SendClientMessage(opponentid, COLOR_LIGHTBLUE, message_s);

	PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);
	PlayerPlaySound(opponentid, 1130, 0.0, 0.0, 0.0);
	PlayerFixRadio(playerid);
	PlayerFixRadio(opponentid);

	TogglePlayerControllable(playerid, 0);
	TogglePlayerControllable(opponentid, 1);
	SetPlayerHealth(playerid, 30.0);

	ClearAnimations(opponentid);
	ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0999, 1, 0, 0, 1, 0, 1);

	isFightingNow[playerid] = false;
	isFightingNow[opponentid] = false;
	fightingOpponentOf[opponentid] = INVALID_PLAYER_ID;
	fightingOpponentOf[playerid] = INVALID_PLAYER_ID;
	isBeatenUp[playerid] = true;
	PlayerInfo[playerid][pMuted] = 1;

	SetTimerEx("WakeUpAfterFight", BATTLE_WAKE_UP_SEC * 1000, 0, "dd", playerid, opponentid);
}


IsPobijInvalid(playerid, opponentid)
{
	if(!IsPlayerConnected(playerid))
    {
		return 1;
	}
	if(PlayerInfo[playerid][pLevel] < 3)
	{
		sendTipMessage(playerid, "Musisz mie� co najmniej 3 poziom, by u�ywa� tej komendy!");
		return 1;
	}
	if(IsAMedyk(playerid))
	{
		sendErrorMessage(playerid, "Nie mo�esz uzywa� tej komendy");
		return 1;
	}
	if(IsPlayerInRangeOfPoint(playerid, 50.0, 1038.22924805,-1090.59741211,-67.52223969))
	{
		SendClientMessage(playerid, COLOR_GRAD2, "Komenda nie dzia�a w kasynie!");
		return 1;
	}
	if(wasRecentlyFighting[playerid])
	{
		sendTipMessage(playerid, "Jeste� ju� zm�czony po ostatniej walce, odpocznij chwil� zanim zaczniesz znowu.", COLOR_GRAD1);
		return 1;
	}
	if(opponentid == INVALID_PLAYER_ID || !IsPlayerConnected(opponentid))
	{
		sendErrorMessage(playerid, "Tego gracza nie ma na serwerze!");
		return 1;
	}
	if(opponentid == playerid)
	{
		sendErrorMessage(playerid, "Nie mo�esz pobi� samego siebie!");
		return 1;
	}
	if(!ProxDetectorS(5.0, playerid, opponentid) || Spectate[opponentid] != INVALID_PLAYER_ID)
	{
		sendErrorMessage(playerid, "Ten gracz jest za daleko!");
		return 1;
	}
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || GetPlayerState(opponentid) != PLAYER_STATE_ONFOOT)
	{
		sendErrorMessage(playerid, "�aden z was nie mo�e by� w poje�dzie!");
		return 1;
	}
	if(GetPlayerAdminDutyStatus(playerid) == 1 || GetPlayerAdminDutyStatus(opponentid) == 1)
	{
		sendErrorMessage(playerid, "�aden z was nie mo�e by� na @duty!"); 
		return 1;
	}
	if(isFightingNow[opponentid])
	{
		sendErrorMessage(playerid, "Kto� ju� toczy walk� z tym graczem!");
		return 1;
	}
	if(GUIExit[playerid] || GUIExit[opponentid])
	{
		sendErrorMessage(playerid, "�aden z was nie mo�e mie� otwartego okienka dialogowego!");
		return 1;	
	}
	if(isBeatenUp[opponentid] || isBeatenUp[playerid] ||
		isPlayerCuffed[opponentid] || isPlayerCuffed[playerid] ||
		PlayerInfo[opponentid][pBW] != 0 || PlayerInfo[playerid][pBW] != 0 ||
		PlayerInfo[opponentid][pInjury] != 0 || PlayerInfo[playerid][pInjury] != 0)
	{
		sendTipMessage(playerid, "Nie mo�esz pobi� rannego lub pobitego gracza / jeste� ranny lub pobity, nie mo�esz bi� innych.");
		return 1;
	}
	if(GetPlayerWeapon(opponentid) >= 22)
	{
		sendTipMessage(playerid, "Nie mo�esz pobi� gracza z broni� w d�oni!");
		return 1;
	}

	return 0;
}


ZerujZmienne_Bijatyki(playerid)
{
	isBeatenUp[playerid] = false;
	wasRecentlyFighting[playerid] = false;
	isFightingNow[playerid] = false;
	fightingOpponentOf[playerid] = INVALID_PLAYER_ID;

	return ZerujZmienne(playerid);
}
#if defined _ALS_ZerujZmienne
    #undef ZerujZmienne
#else
    #define _ALS_ZerujZmienne
#endif
#define ZerujZmienne ZerujZmienne_Bijatyki

//end