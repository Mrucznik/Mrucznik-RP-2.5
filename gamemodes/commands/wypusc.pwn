//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wypusc ]------------------------------------------------//
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

CMD:free(playerid, params[]) return cmd_wypusc(playerid, params);
CMD:uwolnij(playerid, params[]) return cmd_wypusc(playerid, params);
CMD:wypusc(playerid, params[])
{
	new string[128];

    if(PlayerInfo[playerid][pJob] != 2)
    {
        sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� prawnikiem!");
        return 1;
    }
	new giveplayerid, money;
	if( sscanf(params, "k<fix>d", giveplayerid, money))
	{
		sendTipMessage(playerid, "U�yj /uwolnij [playerid/Cz��Nicku] [Kwota]");
		return 1;
	}
	if(money > 250000)
	{
		sendTipMessageEx(playerid, COLOR_GREY, "Nie przesadzasz troszk�? Maksymalna kwota uwolnienia to 250.000$");
		return 1;
	}
	if(money < 40000)
	{
		sendTipMessageEx(playerid, COLOR_GREY, "Minimalna kwota uwolnienia to 40.000$"); 
		return 1;
	}
	if(ApprovedLawyer[playerid] == 0)
	{
		sendErrorMessage(playerid, "Nie masz pozwolenia prawniczego!"); 
		return 1;
	}
	
	if(IsPlayerConnected(giveplayerid))
	{
		if(giveplayerid != INVALID_PLAYER_ID)
		{
			if(PlayerInfo[giveplayerid][pJailed] == 1  && ApprovedLawyer[playerid] == 1 || PlayerInfo[giveplayerid][pJailed] == 2 && ApprovedLawyer[playerid] == 1)
			{
				if(ProxDetectorS(10.5, playerid, giveplayerid))
				{
					format(string, sizeof(string), "Prawnik %s proponuje Ci uwolnienie z wi�zienia za %d$ {AC3737}[Aby akceptowa� wpisz /akceptuj uwolnienie]", GetNick(playerid, true), money);
					SendClientMessage(giveplayerid, COLOR_BLUE, string);
					
					format(string, sizeof(string), "Zaoferowa�e� uwolnienie %s z wi�zienia za kwot� %d$ - oczekuj na akceptacj�!", GetNick(giveplayerid, true), money); 
					SendClientMessage(playerid, COLOR_BLUE, string);
					
					LawyerOffer[giveplayerid] = 1;
					OfferPlayer[giveplayerid] = playerid;
					OfferPrice[giveplayerid] = money;
				
				}
				else
				{
					sendErrorMessage(playerid, "Nie mo�esz uwolni� gracza, kt�ry nie jest przy tobie!"); 
					return 1;
				}
			
			
			}
			else
			{
				sendErrorMessage(playerid, "Nie jeste� prawniekiem || Osoba nie jest w wi�zieniu || Nie masz pozwolenia");
				return 1;
			}
		
		
		}
		else
		{
			sendErrorMessage(playerid, "Nie mo�esz uwolni� samego siebie"); 
			return 1;
		}
	
	}
	else
	{
		sendErrorMessage(playerid, "Na serwerze nie ma takiego gracza!"); 
		return 1;
	}
/*
    if(IsPlayerConnected(giveplayerid))
    {
        if(giveplayerid != INVALID_PLAYER_ID)
        {
            if(giveplayerid == playerid) { sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz uwalnia� samego siebie!"); return 1; }
			if(PlayerInfo[giveplayerid][pJailed] == 1 && ApprovedLawyer[playerid] == 1 || PlayerInfo[giveplayerid][pJailed] == 2 && ApprovedLawyer[playerid] == 1)
			{
				if(ProxDetectorS(10.0, playerid, giveplayerid))
				{
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "* Uwolni�e� %s z wi�zienia.", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "* Zosta�e� uwolniony przez prawnika %s.", sendername);
					SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					ApprovedLawyer[playerid] = 0;
					WantLawyer[giveplayerid] = 0;
					CallLawyer[giveplayerid] = 0;
					JailPrice[giveplayerid] = 0;
					PlayerInfo[giveplayerid][pJailTime] = 1;
					PlayerInfo[playerid][pLawSkill] +=2;
					SendClientMessage(playerid, COLOR_GRAD2, "Skill +2");
					//SetPlayerWorldBounds(playerid,20000.0000,-20000.0000,20000.0000,-20000.0000); //Reset world to player
					if(PlayerInfo[playerid][pLawSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci prawnika wynosz� teraz 2, Mo�esz taniej zbija� WL."); }
					else if(PlayerInfo[playerid][pLawSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci prawnika wynosz� teraz 3, Mo�esz taniej zbija� WL."); }
					else if(PlayerInfo[playerid][pLawSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci prawnika wynosz� teraz 4, Mo�esz taniej zbija� WL."); }
					else if(PlayerInfo[playerid][pLawSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci prawnika wynosz� teraz 5, Mo�esz taniej zbija� WL."); }
				}
				else
				{
					sendTipMessageEx(playerid, COLOR_GRAD1, "Nie jeste� obok tego gracza, nie mo�esz go uwolni�");
				}
			}
			else
			{
				sendTipMessageEx(playerid, COLOR_GRAD1, "Gracz nie nie jest w wi�zieniu / nie posiadasz zgody od policjanta (popro� o /akceptuj prawnik) !");
			}
		}
	}
	else
	{
	    sendErrorMessage(playerid, "Nie ma takiego gracza!");
	}//not connected */
	return 1;
}


