//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------[ sprzedajalkohol ]--------------------------------------------//
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

YCMD:sprzedajalkohol(playerid, params[], help)
{
	if(!IsAPrzestepca(playerid))
	{
		MruMessageFail(playerid, "Nie jeste� w organizacji!");
		return 1;
	}

	if(IsBusinessTypeOwnedByPlayerOrg(playerid, FRONT_BIZ_TYPE_CLUB))
	{
		MruMessageFail(playerid, "Tylko organizacje kt�re posiadaj� klub maj� dost�p do tej komendy.");
		return 1;
	}

	new x_nr[16];
	new giveplayerid;
	if(!sscanf(params, "s[16]k<fix>", x_nr, giveplayerid))
	{	
		if(!IsPlayerConnected(giveplayerid))
		{
			MruMessageFail(playerid, "Nie ma takiego gracza!");
			return 1;
		}

		if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 5)
		{
			MruMessageFail(playerid, "Gracz jest za daleko!");
			return 1;
		}

		if(strcmp(x_nr,"piwo",true) == 0)
		{
			MruMessageGoodInfoF(playerid, "Sprzeda�e� Piwo graczowi: %s, koszt sprzeda�y: 40$.", GetNick(giveplayerid));
			MruMessageGoodInfoF(giveplayerid, "Gracz %s sprzeda� tobie 5 Piw 'Mruczny Gul'.", GetNick(playerid));
			PlayerInfo[giveplayerid][pPiwo] = 5;
			ZabierzKase(playerid, 400);
			return 1;
		}
		else if(strcmp(x_nr,"wino",true) == 0)
		{
			MruMessageGoodInfoF(playerid, "Sprzeda�e� Wino graczowi: %s, koszt sprzeda�y: 50$.", GetNick(giveplayerid));
			MruMessageGoodInfoF(giveplayerid, "Gracz %s sprzeda� tobie 5 Win 'Komandos'.", GetNick(playerid));
			PlayerInfo[giveplayerid][pWino] = 5;
			ZabierzKase(playerid, 500);
			return 1;
		}
		else if(strcmp(x_nr,"sprunk",true) == 0)
		{
			MruMessageGoodInfoF(playerid, "Sprzeda�e� Sprunka graczowi: %s, koszt sprzeda�y: 30$.", GetNick(giveplayerid));
			MruMessageGoodInfoF(giveplayerid, "Gracz %s sprzeda� tobie 5 Sprunk�w.", GetNick(playerid));
			PlayerInfo[giveplayerid][pSprunk] = 5;
			ZabierzKase(playerid, 300);
			return 1;
		}
		else if(strcmp(x_nr,"cygaro",true) == 0)
		{
			MruMessageGoodInfoF(playerid, "Sprzeda�e� Paczk� Cygar graczowi: %s, koszt sprzeda�y: 75$.", GetNick(giveplayerid));
			MruMessageGoodInfoF(giveplayerid, "Gracz %s sprzeda� tobie paczk� 5 cygar kolumbijskich.", GetNick(playerid));
			PlayerInfo[giveplayerid][pCygaro] = 5;
			ZabierzKase(playerid, 750);
			return 1;
		}
	}

	sendTipMessage(playerid, "U�YJ: /sprzedaja [nazwa] [playerid]");
	sendTipMessage(playerid, "Dost�pne nazwy: Piwo, Wino, Sprunk, Cygaro");
    return 1;
}
