//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ owarsztat ]-----------------------------------------------//
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

YCMD:owarsztat(playerid, params[], help)
{
	if(IsAMechazordWarsztatowy(playerid))
	{
		if(!openwarsztat)
		{
			new imiegracza[MAX_PLAYERS];
			new linijka[64];
			GetPlayerName(playerid,imiegracza, sizeof(imiegracza));
			SendClientMessageToAll(0xCC33FF,"|____________[ FDU ]____________|");
			format(linijka, sizeof(linijka),"%s : Warsztat Jefferson Otwarty.", imiegracza);
			SendClientMessageToAll(0xCC33FF,linijka);
			openwarsztat = true;
		}
		else
		{
			sendTipMessage(playerid,"Warsztat jest juz otwarty, uzyj /cwarsztat by go zamknac");
		}
	}
	else
	{
		sendErrorMessage(playerid,"Nie jeste� z FDU");
	}
	return 1;
}
