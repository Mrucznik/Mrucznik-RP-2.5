//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ setmats ]------------------------------------------------//
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

CMD:setmats(playerid, params[])
{
	if (IsAHeadAdmin(playerid))
	{
		new gracz, wartosc;
		if(sscanf(params, "k<fix>d", gracz, wartosc))
		{
			sendTipMessage(playerid, "U�yj /setmats [playerid/Cz��Nicku] [ilo�� mats�w]");
			return 1;
		}

		if(IsPlayerConnected(gracz))
		{
			new sendername[MAX_PLAYER_NAME], giveplayer[MAX_PLAYER_NAME], string[128];
			GetPlayerName(gracz, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			PlayerInfo[gracz][pMats] = wartosc;
			format(string, sizeof(string),"AdmCmd: %s dal %d matsow graczowi %s.", sendername, wartosc, giveplayer);
            StatsLog(string);

            _MruAdmin(playerid, sprintf("Da�e� %d materia��w graczowi %s [ID: %d]", wartosc, GetNick(gracz, true), gracz));
            if(gracz != playerid) _MruAdmin(gracz, sprintf("Dosta�e� %d materia��w od admina %s [ID: %d]", wartosc, GetNick(playerid, true), playerid));


		}
		else
		{
			sendErrorMessage(playerid, "Ten gracz jest offline!");
		}

	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}
