//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ lspd ]-------------------------------------------------//
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

CMD:pd(playerid, params[]) return cmd_lspd(playerid, params);
CMD:lspd(playerid, params[])
{
	new string[256];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		if(IsPlayerInFraction(playerid, FRAC_LSPD))
		{
			if(PlayerInfo[playerid][pRank] < 2)
			{
			    //SendClientMessage(playerid, COLOR_GREY, "   Musisz mie� 2 range aby u�ywa� tej komendy !");
                sendErrorMessage(playerid, "Komenda dost�pna od 2 rangi!");
			    return 1;
			}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if(isnull(params))
			{
				sendTipMessage(playerid, "U�yj /pd [text]");
				return 1;
			}
			if(PlayerInfo[playerid][pBP] >= 1)
			{
			    format(string, sizeof(string), "Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
				sendTipMessage(playerid, string, TEAM_CYAN_COLOR);
				return 1;
			}
			if (strfind(params , "ip:" , true)>=0 ||strfind(params , "www." , true)>=0 || strfind(params , ".pl" , true)>=0 || strfind(params , ",pl" , true)>=0  || strfind(params , " ip" , true)>=0 || strfind(params , ":7" , true)>=0 || strfind(params , "795" , true)>=0 || strfind(params , ":3" , true)>=0 || strfind(params , ":4" , true)>=0 || strfind(params , ":5" , true)>=0 || strfind(params , ":6" , true)>=0 || strfind(params , ":8" , true)>=0)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "NIE CHCEMY REKLAM!");
				format(string, sizeof(string), "AdmWarning: [%d] %s REKLAMA: %s.",playerid,sendername,params);
				ABroadCast(COLOR_LIGHTRED,string,1);
				CzitLog(string);
			}
			else
			{
				SendClientMessageToAll(COLOR_WHITE, "|___________ Komunikat LSPD ___________|");
				format(string, sizeof(string), "Oficer %s: %s", GetNick(playerid, true), params);
				SendClientMessageToAll(COLOR_LIGHTBLUE, string);
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� policjantem !");
		    return 1;
		}
	}
	return 1;
}

