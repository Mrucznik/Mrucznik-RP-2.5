//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ reklama ]------------------------------------------------//
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

CMD:ha(playerid) return cmd_reklama(playerid);
CMD:reklama(playerid)
{
	if(!IsAHA(playerid))
	{
		sendErrorMessage(playerid, "Nie jeste� z agencji!");
		return 1;
	}
	if(AntySpam[playerid] == 0)
	{
        new string[128];
		if(PlayerInfo[playerid][pBP] >= 1)
		{
			format(string, sizeof(string), "   Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
			sendTipMessage(playerid, string);
			return 1;
		}
		SendClientMessageToAll(COLOR_WHITE, "|___________ Firma Sprz�taj�ca ___________|");
		SendClientMessageToAll(COLOR_LIGHTBLUE, "Chcesz pozby� si� jakiego� �miecia? Skorzystaj z us�ug ciecia! ((/kontrakt))");
        format(string, sizeof(string), "CMD_Info: /ha u�yte przez %s [%d]", GetNick(playerid), playerid);
        SendCommandLogMessage(string);
		foreach(Player, i)
		{
			if(PlayerInfo[i][pMember] == 8 || PlayerInfo[i][pLider] == 8 )
			{
				SendClientMessage(i, 0xD8C173FF, string);
			}
		}
        CMDLog(string);
		AntySpam[playerid] = 1;
		SetTimerEx("AntySpamTimer",10000,0,"d",playerid);
	}
	else
	{
		sendTipMessage(playerid, "Odczekaj 10 sekund");
	}
	return 1;
}

