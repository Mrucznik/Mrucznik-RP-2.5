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
	if(GetPlayerJob(playerid) != JOB_DRUG_DEALER)
	{
		MruMessageFail(playerid, "Nie jeste� dilerem narkotyk�w!");
		return 1;
	}

	if(GetPVarInt(playerid, "wydragowany") > 0) 
	{
		MruMessageFail(playerid, "Narkotyki mo�esz sprzedawa� raz na 10 sekund!");
		return 1;
	}

	if(weight < 1 || weight > 60) 
	{ 
		MruMessageFail(playerid, "Liczba gram od 1 do 60!"); 
		return 1; 
	}

	if(price < 1000 || price > 20000) 
	{ 
		MruMessageFail(playerid, "Cena od 1000 do 20000!"); 
		return 1; 
	}

	if(weight > PlayerInfo[playerid][pDrugs]) 
	{ 
		MruMessageFailF(playerid, "Masz przy sobie tylko %d narkotyk�w!", PlayerInfo[playerid][pDrugs]); 
		return 1; 
	}

	if(!IsPlayerNear(playerid, giveplayerid))
	{
		MruMessageFail(playerid, "Ten gracz nie jest przy tobie !");
		return 1;
	}

	if(giveplayerid == playerid)
	{
		MruMessageFail(playerid, "Nie mo�esz sprzeda� drag�w samemu sobie!");
		return 1;
	}

	DrugOffer[giveplayerid] = playerid;
	DrugPrice[giveplayerid] = price;
	DrugGram[giveplayerid] = weight;

	MruMessageGoodInfoF(playerid, "* Oferujesz %s sprzeda� %d gram za $%d .", GetNick(giveplayerid), weight, price);
	MruMessageGoodInfoF(giveplayerid, "* Diler Drag�w %s oferuje sprzeda� %d gram narkotyk�w za $%d, (wpisz /akceptuj dragi) aby kupi�.", GetNick(playerid), weight, price);
	return 1;
}

command_akceptuj_drugs(playerid)
{
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

					MruMessageGoodInfoF(playerid, "* Kupi�e� %d gram za $%d od Dilera Drag�w %s. Aby je wzi�� wpisz /wezdragi.",DrugGram[playerid],DrugPrice[playerid], GetNick(DrugOffer[playerid]));
					MruMessageGoodInfoF(DrugOffer[playerid], "* %s kupi� od ciebie %d gram, $%d zostanie dodane do twojej wyp�aty.",GetNick(playerid),DrugGram[playerid],DrugPrice[playerid]);
					SetPVarInt(DrugOffer[playerid], "wydragowany", 10);
					
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