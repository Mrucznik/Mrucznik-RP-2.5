//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ dl ]--------------------------------------------------//
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

YCMD:dl(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsAnInstructor(playerid) || PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
        {
            if(PlayerInfo[playerid][pLocal] == 108 || PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
            {
	            new x_nr[16];
				new giveplayerid;
				if( sscanf(params, "s[16]k<fix>", x_nr, giveplayerid))
				{
				    sendTipMessageEx(playerid, COLOR_WHITE, "U�yj /dajlicencje [nazwa] [playerid/Cz��Nicku]");
				    sendTipMessageEx(playerid, COLOR_WHITE, "Dost�pne nazwy: Auto, Lot, Lodzie, Ryby, Bron.");//, Bron.");
					return 1;
				}
								
				if(!IsPlayerConnected(giveplayerid))
				{
					sendErrorMessage(playerid, "Nie ma takiego gracza !");
					return 1;
				}
				
			    if(strcmp(x_nr,"auto",true) == 0)
				{
				    if(PlayerInfo[playerid][pRank] >= 1 || PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
		            {
						if(PlayerInfo[giveplayerid][pDowod] >= 1 || PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
						{
						    if(PlayerInfo[giveplayerid][pCarLic] == 3 || PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
						    {
								if(kaska[playerid] >= 5000)
								{
									GetPlayerName(playerid, sendername, sizeof(sendername));
									GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
									format(string, sizeof(string), "* Da�e� licencj� na auto graczowi %s. Koszt licencji (5 000$) zosta� pobrany z twojego portfela.",giveplayer);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "* Urz�dnik %s da� tobie prawo jazdy.",sendername);
									SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "* Urz�dnik %s da� prawo jazdy %s. Urz�d zarobi� 5 000$.",sendername,giveplayer);
									SendLeaderRadioMessage(11, COLOR_LIGHTGREEN, string);
									ZabierzKase(playerid, 5000);
									Sejf_Add(FRAC_GOV, 5000);
									PlayerInfo[giveplayerid][pCarLic] = 1;
									Log(payLog, INFO, "Urz�dnik %s da� %s prawo jazdy (5 000$).", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
									return 1;
								}
								else
								{
									sendTipMessageEx(playerid, COLOR_GREY, "Koszt wydania tej licencji to 5 000$ a Ty tyle nie masz!");
								}
							}
							else
						    {
			       				sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie zaliczy� wszytkich egzamin�w i nie mo�e otrzyma� prawka!");
						    }
						}
		    			else
					    {
		       				sendTipMessageEx(playerid, COLOR_GREY, "Najpierw wyr�b graczowi dow�d ( komenda /wydaj ) !");
					    }
					}
					else
					{
						sendTipMessageEx(playerid, COLOR_GREY, "Potrzebujesz 3 rangi aby m�c wyda� t� licencj�");
					}
				}
				else if(strcmp(x_nr,"lot",true) == 0)
				{
				    if(PlayerInfo[playerid][pRank] >= 3)
		            {
						if(PlayerInfo[giveplayerid][pDowod] >= 1)
						{
							if(IsPlayerConnected(giveplayerid))
							{
							    if(giveplayerid != INVALID_PLAYER_ID)
							    {
							        if(kaska[playerid] >= 400000)
							        {
								        GetPlayerName(playerid, sendername, sizeof(sendername));
								        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							            format(string, sizeof(string), "* Da�e� licencj� na latanie graczowi %s. Koszt licencji (400 000$) zosta� pobrany z twojego portfela.",giveplayer);
								        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								        format(string, sizeof(string), "* Urz�dnik %s da� tobie licencj� na latanie.",sendername);
								        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
                                        format(string, sizeof(string), "* Urz�dnik %s da� licencje na latanie %s. Urz�d zarobi� 400 000$.",sendername,giveplayer);
									    SendLeaderRadioMessage(11, COLOR_LIGHTGREEN, string);
								        ZabierzKase(playerid, 400000);
                                        Sejf_Add(FRAC_GOV, 400000);
								        PlayerInfo[giveplayerid][pFlyLic] = 1;
										Log(payLog, INFO, "Urz�dnik %s da� %s licencje na latanie (400 000$).", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
								        return 1;
	                                }
								    else
								    {
								        sendTipMessageEx(playerid, COLOR_GREY, "Koszt wydania tej licencji to 400 000$ a ty tyle nie masz!");
								    }
								}
							}
							else
							{
							    sendErrorMessage(playerid, "Nie ma takiego gracza !");
							    return 1;
							}
	                    }
		    			else
					    {
		       				sendTipMessageEx(playerid, COLOR_GREY, "Najpierw wyr�b graczowi dow�d ( komenda /wydaj ) !");
					    }
					}
					else
					{
						sendTipMessageEx(playerid, COLOR_GREY, "Potrzebujesz 3 rangi aby m�c wyda� t� licencj�");
					}
				}
				else if(strcmp(x_nr,"lodzie",true) == 0)
				{
					if(PlayerInfo[playerid][pRank] >= 2)
		            {
						if(PlayerInfo[giveplayerid][pDowod] >= 1)
						{
							if(IsPlayerConnected(giveplayerid))
							{
							    if(giveplayerid != INVALID_PLAYER_ID)
							    {
							        if(kaska[playerid] >= 80000)
							        {
								        GetPlayerName(playerid, sendername, sizeof(sendername));
								        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							            format(string, sizeof(string), "* Da�e� licencj� na p�ywanie �odziami graczowi %s. Koszt licencji (80 000$) zosta� pobrany z twojego portfela.",giveplayer);
								        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								        format(string, sizeof(string), "* Urz�dnik %s da� tobie licencj� na p�ywanie �odziami.",sendername);
								        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
                                        format(string, sizeof(string), "* Urz�dnik %s da� licencj� na p�ywanie %s. Urz�d zarobi� 80 000$.",sendername,giveplayer);
									    SendLeaderRadioMessage(11, COLOR_LIGHTGREEN, string);
								        ZabierzKase(playerid, 80000);
                                        Sejf_Add(FRAC_GOV, 80000);
								        PlayerInfo[giveplayerid][pBoatLic] = 1;
										Log(payLog, INFO, "Urz�dnik %s da� %s licencje na p�ywanie (80 000$).", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
								        return 1;
							        }
								    else
								    {
								        sendTipMessageEx(playerid, COLOR_GREY, "Koszt wydania tej licencji to 80 000$ a ty tyle nie masz!");
								    }
								}
							}
							else
							{
							    sendErrorMessage(playerid, "Nie ma takiego gracza !");
							    return 1;
							}
						}
		    			else
					    {
		       				sendTipMessageEx(playerid, COLOR_GREY, "Najpierw wyr�b graczowi dow�d ( komenda /wydaj ) !");
					    }
					}
					else
					{
						sendTipMessageEx(playerid, COLOR_GREY, "Potrzebujesz 2 rangi aby m�c wyda� t� licencj�");
					}
				}
				else if(strcmp(x_nr,"ryby",true) == 0)
				{
					if(PlayerInfo[giveplayerid][pDowod] >= 1)
					{
						if(IsPlayerConnected(giveplayerid))
						{
						    if(giveplayerid != INVALID_PLAYER_ID)
						    {
						        if(kaska[playerid] >= 5000)
						        {
							        GetPlayerName(playerid, sendername, sizeof(sendername));
							        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						            format(string, sizeof(string), "* Da�e� kart� w�dkarsk� graczowi %s. Koszt licencji (5 000$) zosta� pobrany z twojego portfela.",giveplayer);
							        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							        format(string, sizeof(string), "* Urz�dnik %s da� tobie kart� w�dkarsk�.",sendername);
							        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string), "* Urz�dnik %s da� kart� w�dkarsk� %s. Urz�d zarobi� 5 000$.",sendername,giveplayer);
									SendLeaderRadioMessage(11, COLOR_LIGHTGREEN, string);
							        ZabierzKase(playerid, 5000);
                                    Sejf_Add(FRAC_GOV, 5000);
							        PlayerInfo[giveplayerid][pFishLic] = 1;
									Log(payLog, INFO, "Urz�dnik %s da� %s kart� w�dkarsk� (5000$).", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
							        return 1;
						        }
							    else
							    {
							        sendTipMessageEx(playerid, COLOR_GREY, "Koszt wydania tej licencji to 5 000$ a ty tyle nie masz!");
							    }
							}
						}
						else
						{
						    sendErrorMessage(playerid, "Nie ma takiego gracza !");
						    return 1;
						}
					}
	    			else
				    {
	       				sendTipMessageEx(playerid, COLOR_GREY, "Najpierw wyr�b graczowi dow�d ( komenda /wydaj ) !");
				    }
				}
				else if(strcmp(x_nr,"bron",true) == 0)
				{
					if(PlayerInfo[playerid][pRank] >= 1)
		            {
						if(PlayerInfo[giveplayerid][pDowod] >= 1)
						{
							if(IsPlayerConnected(giveplayerid))
							{
							    if(giveplayerid != INVALID_PLAYER_ID)
							    {
							        if(kaska[playerid] >= 45000)
							        {
								        GetPlayerName(playerid, sendername, sizeof(sendername));
								        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							            format(string, sizeof(string), "* Da�e� licencj� na bro� graczowi %s. Koszt licencji (45 000$) zosta� pobrany z twojego portfela.",giveplayer);
								        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								        format(string, sizeof(string), "* Urz�dnik %s da� tobie licencj� na bro�.",sendername);
								        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
                                        format(string, sizeof(string), "* Urz�dnik %s da� licencj� na bro� %s. Urz�d zarobi� 45 000$.",sendername,giveplayer);
									    SendLeaderRadioMessage(11, COLOR_LIGHTGREEN, string);
								        ZabierzKase(playerid, 45000);
                                        Sejf_Add(FRAC_GOV, 45000);
								        PlayerInfo[giveplayerid][pGunLic] = 1;
										Log(payLog, INFO, "Urz�dnik %s da� %s licencj� na bro� (45 000$).", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
								        return 1;
							        }
								    else
								    {
								        sendTipMessageEx(playerid, COLOR_GREY, "Koszt wydania tej licencji to 45 000$ a ty tyle nie masz!");
								    }
								}
							}
							else
							{
							    sendErrorMessage(playerid, "Nie ma takiego gracza !");
							    return 1;
							}
						}
		    			else
					    {
		       				sendTipMessageEx(playerid, COLOR_GREY, "Najpierw wyr�b graczowi dow�d ( komenda /wydaj ) !");
					    }
					}
					else
					{
						sendTipMessageEx(playerid, COLOR_GREY, "Potrzebujesz 1 rangi aby m�c wyda� t� licencj�");
					}
				}
				else
				{
				    sendTipMessageEx(playerid, COLOR_WHITE, "Dost�pne nazwy: Auto, Lot, Lodzie, Ryby, Bron.");
					return 1;
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w Urz�dzie Miasta!");
            	return 1;
			}
        }
        else
        {
            sendErrorMessage(playerid, "Nie jeste� instruktorem !");
            return 1;
        }
    }
    return 1;
}
