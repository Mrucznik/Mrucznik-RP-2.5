//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 selldrugs                                                 //
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
// Autor: mrucznik
// Data utworzenia: 06.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_selldrugs_Impl(playerid, giveplayerid, weight, price)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
	    if(PlayerInfo[playerid][pJob] != 4)
	    {
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� Dilerem Drag�w!");
			return 1;
	    }
        if(GetPVarInt(playerid, "wydragowany") > 0) return sendErrorMessage(playerid, "Dragi mo�esz sprzedawa� raz na minut�!");
		if(weight < 1 || weight > 99) { SendClientMessage(playerid, COLOR_GREY, "   Ilo�� gram od 1 do 60!"); return 1; }
		if(price < 1 || price > 9999) { SendClientMessage(playerid, COLOR_GREY, "   Cena od 1 do 9999!"); return 1; }
		if(weight > PlayerInfo[playerid][pDrugs]) { SendClientMessage(playerid, COLOR_GREY, "   Nie masz a� tylu narkotyk�w przy sobie !"); return 1; }
		if(IsPlayerConnected(giveplayerid))
		{
		    if(giveplayerid != INVALID_PLAYER_ID)
		    {
				if (ProxDetectorS(8.0, playerid, giveplayerid))
				{
				    if(giveplayerid == playerid)
				    {
				        sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz sprzeda� drag�w samemu sobie!");
				        return 1;
				    }
				    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
				    format(string, sizeof(string), "* Oferujesz %s sprzeda� %d gram za $%d .", giveplayer, weight, price);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "* Diler Drag�w %s oferuje sprzeda� %d gram narkotyk�w za $%d, (wpisz /akceptuj dragi) aby kupi�.", sendername, weight, price);
					SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					DrugOffer[giveplayerid] = playerid;
					DrugPrice[giveplayerid] = price;
					DrugGram[giveplayerid] = weight;
				}
				else
				{
				    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
				}
			}
		}
		else
		{
		    sendErrorMessage(playerid, "   Nie ma takiego gracza.");
		}
	}
	return 1;
}

command_akceptuj_drugs(playerid)
{
	new string[MAX_MESSAGE_LENGTH];
	if(DrugOffer[playerid] < 999)
	{
		if(kaska[playerid] > DrugPrice[playerid] && DrugPrice[playerid] > 0)
		{
			if(PlayerInfo[playerid][pDrugs] < 10)
			{
				if(IsPlayerConnected(DrugOffer[playerid]))
				{
					if(PlayerInfo[playerid][pDrugs] + DrugGram[playerid] > 10)
					{
						DrugGram[playerid] = 10 - PlayerInfo[playerid][pDrugs];
					}

					new sendername[MAX_PLAYER_NAME], giveplayer[MAX_PLAYER_NAME];
					GetPlayerName(DrugOffer[playerid], giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "* Kupi�e� %d gram za $%d od Dilera Drag�w %s. Aby je wzi�� wpisz /wezdragi.",DrugGram[playerid],DrugPrice[playerid],giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "* %s kupi� od ciebie %d gram, $%d zostanie dodane do twojej wyp�aty.",sendername,DrugGram[playerid],DrugPrice[playerid]);
					SetPVarInt(DrugOffer[playerid], "wydragowany", 60);
					SendClientMessage(DrugOffer[playerid], COLOR_LIGHTBLUE, string);
					//
					format(string, sizeof(string), "%s kupi� dragi za $%d od %s", sendername, DrugPrice[playerid], giveplayer);
					ABroadCast(COLOR_YELLOW,string,1);
					Log(payLog, INFO, "%s kupi� od %s paczk� %d narkotyk�w za %d$", GetPlayerLogName(playerid), GetPlayerLogName(DrugOffer[playerid]), DrugGram[playerid], DrugPrice[playerid]);
					//
					PlayerInfo[DrugOffer[playerid]][pPayCheck] += DrugPrice[playerid];
					PlayerInfo[DrugOffer[playerid]][pDrugsSkill] ++;
					ZabierzKase(playerid, DrugPrice[playerid]);
					PlayerInfo[playerid][pDrugs] += DrugGram[playerid];
					PlayerInfo[DrugOffer[playerid]][pDrugs] -= DrugGram[playerid];
					if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 50)
					{ SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Twoje umiej�tno�ci dilera drag�w wynosz� teraz 2, mo�esz kupowac wi�cej drag�w w melinie."); }
					else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 100)
					{ SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Twoje umiej�tno�ci dilera drag�w wynosz� teraz 3, mo�esz kupowac wi�cej drag�w w melinie."); }
					else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 200)
					{ SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Twoje umiej�tno�ci dilera drag�w wynosz� teraz 4, mo�esz kupowac wi�cej drag�w w melinie."); }
					else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 400)
					{ SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Twoje umiej�tno�ci dilera drag�w wynosz� teraz 5, mo�esz kupowac wi�cej drag�w w melinie."); }
					DrugOffer[playerid] = 999;
					DrugPrice[playerid] = 0;
					DrugGram[playerid] = 0;
					return 1;
				}
				return 1;
			}
			else
			{
				sendTipMessageEx(playerid, COLOR_GREY, "Masz ju� za du�o narkotyk�w, u�yj ich najpierw !");
				return 1;
			}
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie mo�esz zakupi� narkotyk�w !");
			return 1;
		}
	}
	else
	{
		sendTipMessageEx(playerid, COLOR_GREY, "Nikt nie oferowa� ci sprzeda�y narkotyk�w !");
		return 1;
	}
}

//end