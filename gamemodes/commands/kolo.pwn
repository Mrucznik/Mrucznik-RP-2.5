//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ kolo ]-------------------------------------------------//
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

CMD:kolofortuny(playerid) return cmd_kolo(playerid);
CMD:kf(playerid) return cmd_kolo(playerid);
CMD:kolo(playerid)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsPlayerInRangeOfPoint(playerid, 5.0, 1016.93560791,-1101.91369629,-67.59101868))
        {
            new kolo = true_random(61);
            GetPlayerName(playerid, sendername, sizeof(sendername));
            if(kolo >= 1 && kolo <= 30)//1
            {
                format(string, sizeof(string), "* %s zakr�ci� ko�em fortuny kt�re zatrzyma�o si� na: 1$", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(kolo > 30 && kolo <= 45)//2
            {
                format(string, sizeof(string), "* %s zakr�ci� ko�em fortuny kt�re zatrzyma�o si� na: 2$", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(kolo > 45 && kolo <= 53)//5
            {
                format(string, sizeof(string), "* %s zakr�ci� ko�em fortuny kt�re zatrzyma�o si� na: 5$", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(kolo > 53 && kolo <= 57)//10
            {
                format(string, sizeof(string), "* %s zakr�ci� ko�em fortuny kt�re zatrzyma�o si� na: 10$", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(kolo == 58 || kolo == 59)//20
            {
                format(string, sizeof(string), "* %s zakr�ci� ko�em fortuny kt�re zatrzyma�o si� na: 20$", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            else if(kolo == 60 || kolo == 61)//*
            {
                format(string, sizeof(string), "* %s zakr�ci� ko�em fortuny kt�re zatrzyma�o si� na gwie�dzie fortuny (40$)", sendername);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
            }
            DajKase(playerid, -5000);
			sendTipMessageEx(playerid, TEAM_AZTECAS_COLOR, "Kasyno pobiera op�at� za u�ycie ko�a fortuny (5000$)");
        }
        else
        {
            sendErrorMessage(playerid, "Nie jeste� przy kole fortuny!");
        }
    }
	return 1;
}





