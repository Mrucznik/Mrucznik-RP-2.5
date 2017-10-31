//premium.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Modu�: premium.pwn ]------------------------------------------//
//Opis:
/*

*/
//Adnotacje:
/*

*/
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

//

//-----------------<[ Funkcje: ]>-------------------
premium_ConvertToNewSystem(playerid)
{
	if(PlayerInfo[playerid][pDonateRank] != 11 && PlayerInfo[playerid][pDonateRank] != 0)
	{

		PlayerInfo[playerid][pDonateRank] = 0;

		DajKP(playerid, gettime()+8046000, false); // KP na 3 msc dla os�b, kt�re mieli premiuma na starym systemie
		DajMC(playerid, 500); // i jeszcze prezent...

		_MruGracz(playerid, "Uwaga! Twoje premium zosta�o przeniesione na nowy system!");
		_MruGracz(playerid, "Otrzyma�e� Konto Premium na 3 miesi�ce i dodatkowe 500 MC do wykorzystania.");
	}
}

premium_clearCache(playerid)
{
	PremiumInfo[playerid][pMC] = 0;
	PremiumInfo[playerid][pKP] = 0;
	PremiumInfo[playerid][pSponsor] = 0;
	PremiumInfo[playerid][pExpires] = 0;

	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		UniqueSkins[playerid][i] = false;
	}
}

premium_loadForPlayer(playerid)
{

	if(PlayerInfo[playerid][pDonateRank] != 11 && PlayerInfo[playerid][pDonateRank] != 0)
	{
		premium_ConvertToNewSystem(playerid);
	}

	new qr[256], kpMC, kpStarted, kpEnds, kpLastLogin, kpActive;

	format(qr, sizeof(qr), "SELECT `p_MC`, UNIX_TIMESTAMP(`p_endDate`), UNIX_TIMESTAMP(`p_startDate`), UNIX_TIMESTAMP(`p_LastCheck`), `p_activeKp` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(qr);
	mysql_store_result();
	{
		mysql_fetch_row_format(qr, "|");
        mysql_free_result();
        sscanf(qr, "p<|>ddddd", kpMC, kpEnds, kpStarted, kpLastLogin, kpActive);


        if(kpActive)
        {
        	new shouldEnd = kpEnds-(gettime()+3600);
			if(kpEnds != 0 && shouldEnd <= 0)
			{
			    sendErrorMessage(playerid, "Twoje konto premium wygas�o!");
			    PremiumInfo[playerid][pKP] = 0;
			    ZabierzKP(playerid);
			}
			else
			{

				if(GetPVarInt(playerid, "kp_readd") == 1)
                {

                    new bantime, unbantime;
                    unbantime = MRP_CheckLastBlock(playerid, bantime);
                    new logintime, ip[16];
                    MRP_CheckLastLogin(PlayerInfo[playerid][pUID], logintime, ip);
                    if(logintime <= bantime && bantime != 0 && unbantime != 0)
                    {
                        unbantime-=bantime;
                        if(unbantime < 0)
                        {
                            sendErrorMessage(playerid, "Napotkano konflikt, gdzie kara nie zostala zdjeta prawid�owo. Skontaktuj si� z administracj�.");
                        }
                        else
                        {
                            format(qr, 128, "Przed�u�ono Twoje premium o %d dni i %d godzin.", floatround(floatdiv(unbantime, 86400), floatround_floor), floatround(floatdiv(unbantime, 3600), floatround_floor)%24);

                            _MruAdmin(playerid, qr);

                            PremiumInfo[playerid][pKP] = 1;

                            format(qr, sizeof(qr), "UPDATE `mru_premium` SET `p_LastCheck`=FROM_UNIXTIME(%d) WHERE `p_charUID`='%d'", kpLastLogin+unbantime, PlayerInfo[playerid][pUID]);
                            mysql_query(qr);
                        }
                    }
                    SetPVarInt(playerid, "kp_readd", 0);
                }
                else
                {
                	new lVal = kpEnds-gettime();

                	if(lVal > 0)
                	{
                		format(qr, 170, "Twoje konto premium wygasa za %d dni i %d godzin.", floatround(floatdiv(lVal, 86400), floatround_floor), floatround(floatdiv(lVal, 3600), floatround_floor)%24);
						_MruAdmin(playerid, qr);
                	}

					PremiumInfo[playerid][pKP] = 1;

                }
			}
			if(IsPlayerPremium(playerid)) PremiumInfo[playerid][pExpires] = kpEnds;
        }

        if(kpMC > 0) PremiumInfo[playerid][pMC] = kpMC;
        
	}

	format(qr, sizeof(qr), "SELECT `s_ID` FROM `mru_premium_skins` WHERE `s_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(qr);
	new skinID;
	mysql_store_result();
	{
		if(mysql_num_rows()>0)
		{
			while(mysql_fetch_row_format(qr, "|"))
			{
				sscanf(qr, "p<|>d", skinID);

				for(new i; i<MAX_PREMIUM_SKINS; i++)
					if(SkinyPremium[i][Model] == skinID)
						UniqueSkins[playerid][i] = true;
			}
		}
        mysql_free_result();
	}
}

premium_saveMc(playerid)
{
	new query[128];
    format(query, sizeof(query), "SELECT `p_UID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(query);
	mysql_store_result();
    if(mysql_num_rows())
    {
        mysql_free_result();
        format(query, sizeof(query), "UPDATE `mru_premium` SET `p_MC`='%d' WHERE `p_charUID`='%d'", PremiumInfo[playerid][pMC], PlayerInfo[playerid][pUID]);
        mysql_query(query);
    }
    else
    {
        mysql_free_result();
        if(PremiumInfo[playerid][pMC] > 0)
        {
            format(query, sizeof(query), "INSERT INTO `mru_premium` (`p_charUID`, `p_MC`) VALUES('%d', '%d')", PlayerInfo[playerid][pUID], PremiumInfo[playerid][pMC]);
            mysql_query(query);
        }
    }
}

premium_printMcQuantity(playerid)
{
	return _MruGracz(playerid, sprintf("Aktualnie na Twoim koncie znajduje si� %d MruCoins.", PremiumInfo[playerid][pMC]));
}

ZabierzKP(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		PremiumInfo[playerid][pKP] = 0;
		new query[128];
		format(query, sizeof(query), "SELECT `p_UID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
    	mysql_query(query);
    	mysql_store_result();
        if(mysql_num_rows())
        {
            format(query, sizeof(query), "UPDATE `mru_premium` SET `p_activeKp`=0, `p_endDate`=NOW() WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        else
        {
        	printf("ERROR: ZabierzKP zosta�o wykonane na osobie, kt�ra nie posiada�a premium! UID Postaci: %d", PlayerInfo[playerid][pUID]);
        }
	}
}

DajKP(playerid, time, bool:msg=true)
{
	//PremiumInfo[playerid][pKP] = 1;
	if(IsPlayerConnected(playerid))
    {
        new query[170];
        format(query, sizeof(query), "SELECT `p_UID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
    	mysql_query(query);
    	mysql_store_result();
        if(mysql_num_rows())
        {
            format(query, sizeof(query), "UPDATE `mru_premium` SET `p_endDate`=FROM_UNIXTIME('%d'), `p_startDate`=NOW(), `p_LastCheck`=NOW(), `p_activeKp`=1 WHERE `p_charUID`='%d'", time, PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        else
        {
            format(query, sizeof(query), "INSERT INTO `mru_premium` (`p_endDate`, `p_charUID`, `p_LastCheck`, `p_startDate`, `p_activeKp`) VALUES(FROM_UNIXTIME('%d'), '%d', NOW(), NOW(), 1)", time, PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        mysql_free_result();

        new lVal = time-(gettime()+3600);

        if(lVal > 0 && time != 0)
        {
        	if(msg)
        	{
	            format(query, 170, "Otrzyma�e� Konto Premium. Wygasa ono za %d dni i %d godzin.", floatround(floatdiv(lVal, 86400), floatround_floor), floatround(floatdiv(lVal, 3600), floatround_floor)%24);
	            _MruAdmin(playerid, query);
        	}

			PremiumInfo[playerid][pExpires] = time;

            PremiumInfo[playerid][pKP] = 1;
        }
        else if(time == 0)
        {
            _MruAdmin(playerid, "Otrzyma�e� konto Premium na czas nieokre�lony.");

            PremiumInfo[playerid][pKP] = 1;
        }
    }
}

DajMC(playerid, mc)
{
	if(mc <= 0)
	{
		printf("ERROR: funkcja DajMC miala ujemna wartosc dla playerid: %s [%d] Wartosc: %d", GetNick(playerid), playerid, mc);
		return 0;
	}
	PremiumInfo[playerid][pMC] += mc;

	premium_saveMc(playerid);

	return 1;
}

ZabierzMC(playerid, mc)
{
	if(mc <= 0)
	{
		printf("ERROR: funkcja ZabierzMC miala ujemna wartosc dla playerid: %s [%d] Wartosc: %d", GetNick(playerid), playerid, mc);
		return 0;
	}
	PremiumInfo[playerid][pMC] -= mc;

	premium_saveMc(playerid);

	return 1;
}

KupKP(playerid)
{
	ZabierzMC(playerid, MIESIAC_KP_CENA);

	_MruGracz(playerid, "Gratulacj�! Zakupi�e� konto premium. Od teraz masz dost�p do mo�liwo�ci premium. Dzi�kujemy za wspieranie serwera!"); 
	DajKP(playerid, gettime()+2682000, false);

	return 1;
}

KupPojazdPremium(playerid, id)
{
	if(!(id < MAX_PREMIUM_VEHICLES && id >= 0))
	{
		DialogPojazdyPremium(playerid);
		return 1;
	}
	if(PremiumInfo[playerid][pMC] < PojazdyPremium[id][Cena])
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na ten pojazd");
		return DialogPojazdyPremium(playerid);
	}

	new string[128];
	MRP_ShopPurchaseCar(playerid, PojazdyPremium[id][Model], PojazdyPremium[id][Cena]);
	format(string, sizeof(string), "%s kupil pojazd premium %s za %d MC", GetNick(playerid), VehicleNames[PojazdyPremium[id][Model]-400], PojazdyPremium[id][Cena]);
	PremiumLog(string);

	premium_printMcQuantity(playerid);

	return 1;
}

KupSkinPremium(playerid, skin)
{

	new id = -1;

	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(SkinyPremium[i][Model] == skin)
		{
			id = i;
			break;
		}
	}

	if(id==-1) return DialogSkiny(playerid);

	if(PremiumInfo[playerid][pMC] < UNIKATOWY_SKIN_CENA)
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na ten skin");
		return DialogSkiny(playerid);
	}

	new string[128];

	format(string, sizeof(string), "INSERT INTO `mru_premium_skins` (`s_charUID`, `s_ID`) VALUES('%d', '%d')", PlayerInfo[playerid][pUID], SkinyPremium[id][Model]);
    mysql_query(string);

	format(string, sizeof(string), "%s kupil skin %d za %d MC", GetNick(playerid), SkinyPremium[id][Model], UNIKATOWY_SKIN_CENA);
	PremiumLog(string);

	UniqueSkins[playerid][id] = true;

	ZabierzMC(playerid, UNIKATOWY_SKIN_CENA);

	_MruAdmin(playerid, sprintf("Gratulujemy dobrego wyboru. Kupi�e� skin o ID %d za %d MC.", SkinyPremium[id][Model], UNIKATOWY_SKIN_CENA));
	_MruAdmin(playerid, "List� swoich skin�w premium znajdziesz pod komend� /skiny");

	premium_printMcQuantity(playerid);

	return 1;
}

KupSlotPojazdu(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

	if(PremiumInfo[playerid][pMC] < CAR_SLOT_CENA)
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na zakup dodatkowego slotu.");
		return DialogZmianyNicku(playerid);
	}

	if(MRP_GetPlayerCarSlots(playerid) >= 10)
	{
		sendErrorMessage(playerid, "Masz ju� maksymaln� ilo�� slot�w.");
		return DialogMenuDotacje(playerid);
	}

	ZabierzMC(playerid, CAR_SLOT_CENA);

	new string[128];

	format(string, sizeof(string), "%s kupil slot wozu za %d MC", GetNick(playerid), CAR_SLOT_CENA);
	PremiumLog(string);

	MRP_SetPlayerCarSlots(playerid, MRP_GetPlayerCarSlots(playerid)+1);

	_MruAdmin(playerid, sprintf("Kupi�e� sobie slot na auto za %d MC. Masz teraz %d slot�w.", CAR_SLOT_CENA, MRP_GetPlayerCarSlots(playerid)));

	premium_printMcQuantity(playerid);

	return 1;
}

KupZmianeNicku(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

	if(PremiumInfo[playerid][pMC] < ZMIANA_NICKU_CENA)
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na zakup dodatkowej zmiany nicku");
		return DialogZmianyNicku(playerid);
	}

	ZabierzMC(playerid, ZMIANA_NICKU_CENA);

	MRP_SetPlayerNickChanges(playerid, MRP_GetPlayerNickChanges(playerid)+1);

	new string[128];

	format(string, sizeof(string), "%s kupil zmiane nicku za %d MC", GetNick(playerid), ZMIANA_NICKU_CENA);
	PremiumLog(string);

	_MruAdmin(playerid, sprintf("Kupi�e� sobie zmian� nicku za %d MC. Masz teraz %d zmian nicku.", ZMIANA_NICKU_CENA, MRP_GetPlayerNickChanges(playerid)));

	premium_printMcQuantity(playerid);

	return 1;
}

KupNumerTelefonu(playerid, string:_numer[])
{
	if(!IsPlayerConnected(playerid)) return 1;
	if(strlen(_numer) < 1) return DialogTelefon(playerid);
	if(strlen(_numer) > 9) return DialogTelefon(playerid);

	new numer = strval(_numer);

	if(!MRP_IsPhoneNumberAvailable(numer))
	{

		new cena;

		if(strlen(_numer) == 1)
			cena = TELEFON_CENA_1;
		else if(strlen(_numer) == 2)
			cena = TELEFON_CENA_2;
		else if(strlen(_numer) == 3)
			cena = TELEFON_CENA_3;
		else if(strlen(_numer) == 4)
			cena = TELEFON_CENA_4;
		else
			cena = TELEFON_CENA_5;

		if(PremiumInfo[playerid][pMC] < cena)
		{
			sendErrorMessage(playerid, "Nie sta� Ci� na ten numer telefonu");
			return DialogTelefon(playerid);
		}

		new string[128];

		ZabierzMC(playerid, cena);

		MRP_SetPlayerPhone(playerid, numer);

		_MruAdmin(playerid, sprintf("Tw�j nowy numer telefonu: %d.", numer));

		format(string, sizeof(string), "%s kupil numer telefonu %d za %d MC.", GetNick(playerid), numer, cena);
		PremiumLog(string);

		DialogMenuDotacje(playerid);

		premium_printMcQuantity(playerid);
	}
	else
	{
		sendErrorMessage(playerid, "Ten numer jest ju� zaj�ty!");
		return DialogTelefon(playerid);
	}

	return 1;
}

//---< Is >---
IsPlayerSponsor(playerid)
{
	if(PremiumInfo[playerid][pSponsor] == 1)
		return 1;
	return 0;
}

IsPlayerPremium(playerid)
{
	if(PremiumInfo[playerid][pKP] == 1)
		return 1;
	return 0;
}

IsAUnikat(modelid)
{
	for(new i; i<MAX_PREMIUM_VEHICLES; i++)
		if(modelid == PojazdyPremium[i][Model])
			return 1;
	return 0;
}

PlayerHasSkin(playerid, skinid)
{
	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(SkinyPremium[i][Model] == skinid)
		{
			return UniqueSkins[playerid][i];
		}
	}
	return false;
}


//-----------------<[ Komendy: ]>-------------------
CMD:kp(playerid, params[]) return cmd_premium(playerid, params);
CMD:dotacje(playerid, params[]) return cmd_premium(playerid, params);
CMD:premium(playerid, params[])
{
    if(IsPlayerConnected(playerid) && gPlayerLogged[playerid] != 0)
    {
        DialogMenuDotacje(playerid);
    }
    else
    {
        SendClientMessage(playerid, COLOR_GREY, "B��d!");
    }
    return 1;
} 

COMMAND:unikat(playerid, params[]) return cmd_premiumskin(playerid, params);
COMMAND:premiumskin(playerid, params[])
{
	if(isnull(params))
		return sendTipMessage(playerid, "U�yj /premiumskin [ID Skina]");

	new skin = strval(params);

	if(!PlayerHasSkin(playerid, skin))
		return sendErrorMessage(playerid, "Nie masz tego skina.");

	if((OnDuty[playerid] == 1 && OnDutyCD[playerid] == 0) || SanDuty[playerid] == 1)
	{
		return sendErrorMessage(playerid, "B�d�c na s�u�bie nie mo�esz aktywowa� unikatowego skina.");
	}
	
	PlayerInfo[playerid][pModel] = skin;

	SetPlayerSkin(playerid, skin);

	_MruAdmin(playerid, sprintf("Aktywowa�e� sw�j unikatowy skin [ID: %d]", skin));

	return 1;
}

COMMAND:skiny(playerid, params[])
{
	ListPlayerUniqueSkins(playerid);

	return 1;
}

//----- Admin -----
CMD:setmc(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 5000)
	{
		new giveplayerid, VARmcVal;
		if( sscanf(params, "k<fix>d", giveplayerid, VARmcVal))
		{
			sendTipMessage(playerid, "U�yj /setmc [playerid/Cz��Nicku] [mrucznik coins]");
			return 1;
		}
		
		new string[90];

		format(string, sizeof(string), "AdmCmd: %s dal %s %d mrucznik coinsow", GetNick(playerid), GetNick(giveplayerid), VARmcVal);

		CKLog(string);

		PremiumInfo[giveplayerid][pMC] = VARmcVal;

		premium_saveMc(giveplayerid);

		_MruAdmin(playerid, sprintf("Da�e� %d MC graczowi %s [ID: %d]", VARmcVal, GetNick(giveplayerid, true), giveplayerid));
		if(giveplayerid != playerid) _MruAdmin(giveplayerid, sprintf("Dosta�e� %d MC od Admina %s [ID: %d]", VARmcVal, GetNick(playerid, true), playerid));

		return 1;

	}
	else return noAccessMessage(playerid);
}


CMD:dajkp(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 5000)
	{
		new giveplayerid, givetime;

		if(sscanf(params, "k<fix>d", giveplayerid, givetime))
		{
			sendTipMessage(playerid, "U�yj /dajkp [playerid/Cz��Nicku] [Czas kp w sekundach (0=Na zawsze)]");
			return 1;
		}

		new string[90];

		format(string, sizeof(string), "AdmCmd: %s dal %s KP na %d", GetNick(playerid), GetNick(giveplayerid), givetime);
		CKLog(string);

		if(givetime == 0)
		{
			DajKP(giveplayerid, 0, true);
		}
		else
		{
			DajKP(giveplayerid, gettime()+givetime, true);
		}

		_MruAdmin(playerid, sprintf("Da�e� KP graczowi %s [ID: %d] na czas %d.", GetNick(giveplayerid, true), giveplayerid, givetime));
		if(giveplayerid != playerid) _MruAdmin(giveplayerid, sprintf("Dosta�e� KP od Admina %s [ID: %d]", GetNick(playerid, true), playerid));
	}
	else return noAccessMessage(playerid);
}

//end
//end