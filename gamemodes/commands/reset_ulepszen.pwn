//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------[ reset_ulepszen ]--------------------------------------------//
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

CMD:resetupgrades(playerid) return cmd_reset_ulepszen(playerid);
CMD:resetujulepszenia(playerid) return cmd_reset_ulepszen(playerid);
CMD:resetulepszen(playerid) return cmd_reset_ulepszen(playerid);
CMD:resetuj_ulepszenia(playerid) return cmd_reset_ulepszen(playerid);
CMD:reset_ulepszen(playerid)
{
	new string[128];

    if(IsPlayerConnected(playerid))
    {
		if (gPlayerLogged[playerid] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Nie jeste� zalogowany!");
			return 1;
		}
		if (kaska[playerid] < 100000)
		{
			sendTipMessage(playerid, "To kosztuje $100000 ($100k)");
			return 1;
		}
		if (PlayerInfo[playerid][pLevel] < 2)
		{
			sendTipMessage(playerid, "Musisz mie� wi�cej ni� 2 level");
			return 1;
		}
		PlayerInfo[playerid][gPupgrade] = (PlayerInfo[playerid][pLevel]-1)*2;
		PlayerInfo[playerid][pSHealth] = 0.0;
		PlayerInfo[playerid][pAlcoholPerk] = 0;
		PlayerInfo[playerid][pDrugPerk] = 0;
		PlayerInfo[playerid][pMiserPerk] = 0;
		PlayerInfo[playerid][pPainPerk] = 0;
		PlayerInfo[playerid][pTraderPerk] = 0;
		DajKase(playerid,-100000);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		format(string, sizeof(string), "   Masz teraz %d niewykorzystanych Punkt�w Ulepszenia !",PlayerInfo[playerid][gPupgrade]);
		SendClientMessage(playerid, COLOR_GRAD2, string);
	}
	return 1;
}

