//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ blackjack ]-----------------------------------------------//
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

CMD:oczko(playerid) return cmd_blackjack(playerid);
CMD:blackjack(playerid)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, 1032.69775391,-1092.17980957,-67.58734131) || IsPlayerInRangeOfPoint(playerid, 3.0, 1032.90014648,-1088.91455078,-67.58734131) || IsPlayerInRangeOfPoint(playerid, 3.0, 1023.03601074,-1092.15148926,-67.58734131) || IsPlayerInRangeOfPoint(playerid, 3.0, 1022.98620605,-1088.74023438,-67.58734131))
        {
            new oczko = true_random(13)+2;
            GetPlayerName(playerid, sendername, sizeof(sendername));
            if(oczko >= 2 && oczko <= 10)
            {
                format(string, sizeof(string), "* %s wyci�ga kart� i jest to: %d", sendername, oczko);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(oczko == 11)
            {
                format(string, sizeof(string), "* %s wyci�ga kart� i jest to: J (walet)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(oczko == 12)
            {
                format(string, sizeof(string), "* %s wyci�ga kart� i jest to: Q (dama)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(oczko == 13)
            {
                format(string, sizeof(string), "* %s wyci�ga kart� i jest to: K (kr�l)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(oczko == 14 || oczko == 15)
            {
                format(string, sizeof(string), "* %s wyci�ga kart� i jest to: A (as)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            DajKase(playerid, -100);
			sendTipMessageEx(playerid, TEAM_AZTECAS_COLOR, "Kasyno pobiera op�at� za u�ycie talii kart (100$)");
        }
        else
        {
            sendErrorMessage(playerid, "Nie jeste� przy stole do black jacka!");
        }
    }
	return 1;
}


