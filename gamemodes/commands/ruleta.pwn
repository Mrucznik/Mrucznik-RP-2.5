//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ ruleta ]------------------------------------------------//
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

CMD:ruletka(playerid) return cmd_ruleta(playerid);
CMD:ruleta(playerid)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsPlayerInRangeOfPoint(playerid, 5.0, 1038.22924805,-1090.59741211,-67.52223969))
        {
			new ruletka = true_random(36);
			if(ruletka == 0)
			{
			    GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "* %s Kr�ci ruletk� i kulka zatrzymuje si� na zielonym 0", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
			}
			else if(ruletka == 1 || ruletka == 3 || ruletka == 5 || ruletka == 7 || ruletka == 9 || ruletka == 12 || ruletka == 14 || ruletka == 16 || ruletka == 18 || ruletka == 19 || ruletka == 21 || ruletka == 23 || ruletka == 25 || ruletka == 27 || ruletka == 30 || ruletka == 32 || ruletka == 34 || ruletka == 36)
			{
			    GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "* %s Kr�ci ruletk� i kulka zatrzymuje si� na czerwonej %d", sendername, ruletka);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
			}
			else
			{
			    GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "* %s Kr�ci ruletk� i kulka zatrzymuje si� na czarnej %d", sendername, ruletka);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
			}
			DajKase(playerid, -10000);
			sendTipMessageEx(playerid, TEAM_AZTECAS_COLOR, "Kasyno pobiera op�at� za u�ycie ruletki (10 000$)");
        }
        else
        {
        	sendErrorMessage(playerid, "Nie jeste� przy stole z ruletk�");
			return 1;
        }
	}
	return 1;
}


