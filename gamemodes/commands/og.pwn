//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ og ]--------------------------------------------------//
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

CMD:advertise(playerid, params[]) return cmd_og(playerid, params);
CMD:ad(playerid, params[]) return cmd_og(playerid, params);
CMD:ogloszenie(playerid, params[]) return cmd_og(playerid, params);
CMD:og(playerid, params[])
{
    new string[256];
    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "Nie jeste� zalogowany!");
            return 1;
        }
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie mo�esz pisa� og�osze� podczas s�u�by administratora!"); 
			return 1;
		}
        if(PlayerInfo[playerid][pPnumber] == 0)
        {
            SendClientMessage(playerid, COLOR_GREY, "Nie masz telefonu. Kup go w 24/7 !");
            return 1;
        }
        if(isnull(params))
        {
            SendClientMessage(playerid, COLOR_GRAD2, "U�YJ: (/og)loszenie [tekst og�oszenia]");
            return 1;
        }
		if(sprawdzReklame(params, playerid) == 1)
		{
			return 1;
		}
		if(sprawdzWulgaryzmy(params, playerid) == 1)
		{
		
			return 1;
		}
		if(PlayerInfo[playerid][pBP] >= 1)
		{
			format(string, sizeof(string), "Nie mo�esz napisa� na tym czacie, gdy� masz zakaz pisania na globalnych czatach! Minie on za %d godzin.", PlayerInfo[playerid][pBP]);
			SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
			return 1;
		}
		if ((!adds) && PlayerInfo[playerid][pDonateRank] < 2 && PlayerInfo[playerid][pAdmin] < 10)
		{
			format(string, sizeof(string), "Spr�buj p�niej, %d sekund mi�dzy og�oszeniami !",  (addtimer/1000));
			SendClientMessage(playerid, COLOR_GRAD2, string);
			return 1;
		}
		new payout = strlen(params) * 25;
		if(kaska[playerid] < payout)
		{
			format(string, sizeof(string), "* U�y�e� %d znak�w i masz zap�aci� $%d, nie posiadasz a� tyle.", strlen(params), payout);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 1;
		}
		DajKase(playerid, - payout);
		format(string, sizeof(string), "Og�oszenie: %s, Kontakt: %s Tel: %d",  params, GetNick(playerid, true), PlayerInfo[playerid][pPnumber]);
		OOCNews(TEAM_GROVE_COLOR,string);
		format(string, sizeof(string), "~r~Zaplaciles $%d~n~~w~Za: %d Znakow", payout, strlen(params));
		GameTextForPlayer(playerid, string, 5000, 5);
		if (PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pDonateRank] < 2)
		{
			SetTimer("AddsOn", addtimer, 0);adds = 0;
		}
        
    }
    return 1;
}
