//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zmienhaslo ]----------------------------------------------//
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

CMD:zmienhaslo(playerid, params[])
{
	new string[256];

    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 0)
        {
            sendErrorMessage(playerid, "Nie zalogowa�e� si�!");
            return 1;
        }
        new tmppass[64], password[129];
		if(sscanf(params, "s[64]", tmppass))
		{
			sendTipMessage(playerid, "U�yj /zmienhaslo [nowehaslo]");
			return 1;
		}
		
		if(strfind(params, "%") != -1)
		{
            sendErrorMessage(playerid, "Has�o nie mo�e zawiera� znaku procenta!");
            return 1;
		}
		
		sendErrorMessage(playerid, "Twoje has�o do konta w grze zosta�o zmienione!!!!");
		sendErrorMessage(playerid, "Je�li wpisa�e� t� komend� przypadkowo, nie wychod� z serwera i zmie� has�o ponownie za pomoc� tej komendy");
		sendErrorMessage(playerid, "Nowe has�o:");
		SendClientMessage(playerid, COLOR_PANICRED, tmppass);

		
		WP_Hash(password, sizeof(password), tmppass);
		format(string, sizeof(string), "UPDATE `mru_konta` SET `Key` = '%s' WHERE `Nick` = '%s'", password, GetNick(playerid));
		mysql_query(string);
	}
	return 1;
}
//---------------------------------------[Zmiana skin�w dla HA]---------------------------------------------------------------------------------

