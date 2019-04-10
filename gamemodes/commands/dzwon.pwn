//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ dzwon ]-------------------------------------------------//
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

CMD:call(playerid, params[]) return cmd_dzwon(playerid, params);
CMD:dzwon(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
    if(!IsPlayerConnected(playerid))
	{
		return 1;
	}
	
	if(gPlayerLogged[playerid] == 0)
	{
		return 1;
	}
	
	if(PlayerInfo[playerid][pPnumber] == 0)
	{
		sendErrorMessage(playerid, "Nie posiadasz telefonu !");
		return 1;
	}
	
	new numerTelefonuOdbiorcy;
	new reciverid;
	if( sscanf(params, "d", numerTelefonuOdbiorcy))
	{
		sendTipMessage(playerid, "U�yj /dzwon [numer telefonu]");
		return 1;
	}
	
	if(numerTelefonuOdbiorcy == PlayerInfo[playerid][pPnumber])
	{
		sendErrorMessage(playerid, "Nie mo�esz zadzwoni� sam do siebie.");
		return 1;
	}
	
	if(numerTelefonuOdbiorcy < 1)
	{
		sendErrorMessage(playerid, "Niepoprawny numer telefonu.");
		return 1;
	}
	
	if(Mobile[playerid] != INVALID_PLAYER_ID)
	{
		sendErrorMessage(playerid, "Dzwonisz ju� do kogo�.");
		return 1;
	}
	if(GetPVarInt(reciverid, "dutyadmin") == 1)
	{
		sendErrorMessage(playerid, "Osoba do kt�rej pr�bujesz zadzwoni� jest nieosi�galna!"); 
		return 1;
	}
	if(GetPlayerAdminDutyStatus(playerid) == 1)
	{
		sendErrorMessage(playerid, "Nie mo�esz u�ywa� telefonu podczas s�u�by administratora!"); 
		return 1;
	}
	
	if(numerTelefonuOdbiorcy != 911)
	{
		reciverid = FindPlayerByNumber(numerTelefonuOdbiorcy);
		if(reciverid == INVALID_PLAYER_ID)
		{
			sendErrorMessage(playerid, "Gracz o takim numerze jest offline.");
			return 1;
		}
		
		if(PhoneOnline[reciverid] == 1)
		{
			sendErrorMessage(playerid, "Gracz ma wy��czony telefon.");
			return 1;
		}
		
		if(Mobile[reciverid] != INVALID_PLAYER_ID)
		{
			sendErrorMessage(playerid, "Gracz ju� z kim� rozmawia.");
			return 1;
		}
	}
	
	//all ok, lecim
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string, sizeof(string), "* %s wyjmuje telefon, wybiera numer i wykonuje po��czenie.", sendername);
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	
	SendClientMessage(playerid, COLOR_WHITE, "Trwa ��czenie, prosz� czeka�...");
	SendClientMessage(playerid, COLOR_WHITE, "WSKAZ�WKA: U�yj chatu IC aby rozmawia� przez telefon i /z aby sie roz��czy�.");
	PlayerPlaySound(playerid, 3600, 0.0, 0.0, 0.0);
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);

	if(numerTelefonuOdbiorcy == 911)
	{
		if(GUIExit[playerid] == 0)
		{
			ShowPlayerDialogEx(playerid, 112, DIALOG_STYLE_LIST, "Numer alarmowy", "Policja\nStra� Po�arna\nMedyk\nSheriff", "Wybierz", "Roz��cz si�");
		}
		else
		{
			sendErrorMessage(playerid, "Masz ju� otwarte inne okienko GUI, zamknij je i spr�buj jeszcze raz.");
		}
		return 1;
	}
	else
	{
		StartACall(playerid, reciverid);
	}
	return 1;
}

