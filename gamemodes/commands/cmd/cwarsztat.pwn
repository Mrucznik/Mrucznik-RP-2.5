//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ cwarsztat ]-----------------------------------------------//
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

YCMD:cwarsztat(playerid, params[], help)
{
	if(IsAMechazordWarsztatowy(playerid))
	{
		if(openwarsztat)
		{
			new imiegracza[MAX_PLAYERS];
			new linijka[64];
			GetPlayerName(playerid,imiegracza, sizeof(imiegracza));
			SendClientMessageToAll(0x9933FF,"|____________[ FDU ]____________|");
			format(linijka, sizeof(linijka),"%s : Warsztat Jefferson Zamkniety", imiegracza);
			SendClientMessageToAll(0x9933FF,linijka);
			openwarsztat = false;
		}
		else
		{
			sendTipMessage(playerid,"Warsztat jest zamkniety!! uzyj /owarsztat by go otworzyc.");
		}
	}
	else
	{
		sendErrorMessage(playerid,"Nie jeste� z FDU");
	}
	return 1;
}
