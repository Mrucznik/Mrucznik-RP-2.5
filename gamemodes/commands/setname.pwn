//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ setname ]------------------------------------------------//
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

CMD:setname(playerid, params[])
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

	new newname[MAX_PLAYER_NAME];
	if (PlayerInfo[playerid][pAdmin] >= 5000)//(Uprawnienia(playerid, ACCESS_OWNER))
	{
		new giveplayerid;
		if( sscanf(params, "k<fix>s[24]", giveplayerid, newname))
		{
			sendTipMessage(playerid, "U�yj /setname [playerid] [nowynick]");
			return 1;
		}

		if(giveplayerid != INVALID_PLAYER_ID)
		{
		    if(PlayerInfo[giveplayerid][pDom] == 0)
		    {
		        if(PlayerInfo[giveplayerid][pPbiskey] == 255)
		        {
                    GetPlayerName(giveplayerid, giveplayer, MAX_PLAYER_NAME);
                    GetPlayerName(playerid, sendername, MAX_PLAYER_NAME);
                    if(ChangePlayerName(giveplayerid, newname))
                    {
    					format(string, sizeof(string), "Administrator %s zmieni� nick %s[%d] - Nowy nick: %s", sendername,giveplayer,PlayerInfo[giveplayerid][pUID],newname);
    					SendClientMessageToAll(COLOR_LIGHTRED, string);
    					NickLog(string);

                        ShowPlayerDialogEx(giveplayerid, 70, DIALOG_STYLE_MSGBOX, "Zmiana nicku", "W�a�nie zmieni�e� nick. Nast�puj�ce elementy zosta�y wyzerowane:\n\nPraca\nFrakcja\nWanted Level\nRodzina\nLider\nRanga\nSkin\nZaufany Gracz\n\n\nPami�taj, �e ka�da zmiana nicku jest na wag� z�ota wi�c nie trwo� ich pochopnie!\nJe�eli dosz�o do b��dnej zmiany zg�o� ten fakt pr�dko na forum w panelu strat!\nPami�taj: nowa posta� = nowe �ycie.", "Dalej", "");

    					SetPlayerName(giveplayerid, newname);
                    }
				}
				else
				{
				    sendErrorMessage(playerid, "Ten gracz ma biznes, nie mo�esz zmieni� mu nicku");
				}
			}
			else
			{
			    sendErrorMessage(playerid, "Ten gracz ma dom, nie mo�esz zmieni� mu nicku");
			}
		}
		else if(giveplayerid == INVALID_PLAYER_ID)
		{
			format(string, sizeof(string), "%d nie jest aktywnym graczem.", giveplayerid);
			sendErrorMessage(playerid, string);
		}
	}
	return 1;
}

