//-----------------------------------------------<< Timers >>------------------------------------------------//
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

//-----------------<[ Timery: ]>-------------------
public WakeUpAfterFight(beatenPlayer, beatingPlayer){
	new beatenPlayerNick[MAX_PLAYER_NAME], string[128];
	GetPlayerName(beatenPlayer, beatenPlayerNick, sizeof(beatenPlayerNick));

	format(string, sizeof(string), "* %s ockn�� si� w pe�ni po pobiciu.", beatenPlayerNick);
	ProxDetector(30.0, beatenPlayer, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	GameTextForPlayer(beatenPlayer, "~r~Ocknales sie!", 2500, 3);

	PlayerInfo[beatenPlayer][pMuted] = 0;
	TogglePlayerControllable(beatenPlayer, 1);
	SetPVarInt(beatenPlayer, "bw-sync", 0);
	PlayerInfo[beatenPlayer][pMuted] = 0;
	
	isBeatenUp[beatenPlayer] = false;
	wasRecentlyFighting[beatingPlayer] = false;
	wasRecentlyFighting[beatenPlayer] = false;

	return 1;
}

public BattleTimeIsUp(defenderid, attackerid)
{
	SendClientMessage(attackerid, COLOR_NEWS, "Wygra�e� bitw� poniewa� broni�cy za d�ugo wpisywa� znaki!");
	SendClientMessage(defenderid, COLOR_NEWS, "Wpisa�e� tekst za wolno i przegra�e�!");

	battleIsTooLate[defenderid] = true;
	LoseBattle(defenderid, attackerid);

	return 1;
}
//end