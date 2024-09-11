//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  orgpanel                                                 //
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
// Data utworzenia: 07.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_orgpanel_Impl(playerid, action[16], params[256])
{
	new org = GetPlayerOrg(playerid);
	if(GetPlayerOrg(playerid) == 0)
	{
		sendErrorMessage(playerid, "Nie jestes w rodzinie !");
		return 1;
	}

	if(!IsPlayerOrgLeader(playerid))
	{
		sendErrorMessage(playerid, " Nie jeste� liderem organizacji!");
		return 1;
	}

	if(strcmp(action, "name",true) == 0 || strcmp(action, "nazwa",true) == 0)
	{
		new name[33];
		if( sscanf(params, "s[33]", name))
		{
			sendTipMessage(playerid, "U�yj /orgpanel nazwa [nowa nazwa organizacji]");
			sendTipMessage(playerid, "Koszt komendy: "#CHANGE_ORG_NAME_COST" kontrabandy.");
			return 1;
		}
		mysql_real_escape_string(name, name);

		if(strlen(name) > 32)
		{
			MruMessageFail(playerid, "Nazwa mo�e mie� maksymalnie 32 znaki.");
			return 1;
		}

		if(GetContraband(playerid) < CHANGE_ORG_NAME_COST)
		{
			MruMessageFail(playerid, "Zmiana nazwy organizacji kosztuje "#CHANGE_ORG_NAME_COST" kontrabandy, a Ty tyle nie masz.");
			return 1;
		}

		SendOrgMessage(org, TEAM_AZTECAS_COLOR, sprintf("Lider %s zmieni� nazw� frakcji z: \"%s\" na: \"%s\".", GetNick(playerid), OrgInfo[org][o_Name], name));

		SetOrgName(org, name);
		TakeContraband(playerid, CHANGE_ORG_NAME_COST);
		MruMessageGoodInfoF(playerid, "Zmieni�e� nazw� swojej organizacji na %s, wykorzysta�e� "#CHANGE_ORG_NAME_COST" paczk� kontrabandy.", name);
	}
	else if(strcmp(action, "motto",true) == 0)
	{
		new motto[129];
		if( sscanf(params, "s[129]", motto))
		{
			sendTipMessage(playerid, "U�yj /orgpanel motto [motto organizacji]");
			sendTipMessage(playerid, "Koszt komendy: "#CHANGE_ORG_MOTTO_COST"$.");
			return 1;
		}
		mysql_real_escape_string(motto, motto);
		
		if(strlen(motto) > 32)
		{
			MruMessageFail(playerid, "Motto mo�e mie� maksymalnie 128 znak�w.");
			return 1;
		}

		if(kaska[playerid] < CHANGE_ORG_MOTTO_COST)
		{
			MruMessageFail(playerid, "Zmiana motta organizacji kosztuje "#CHANGE_ORG_MOTTO_COST"$, a Ty tyle nie masz.");
			return 1;
		}

		SendOrgMessage(org, TEAM_AZTECAS_COLOR, sprintf("Lider %s zmieni� motto frakcji z: \"%s\" na: \"%s\".", GetNick(playerid), OrgInfo[org][o_Motto], motto));

		SetOrgMotto(org, motto);
		ZabierzKase(playerid, CHANGE_ORG_MOTTO_COST);
		MruMessageGoodInfoF(playerid, "Zmieni�e� motto organizacji na: %s.", motto);
		
	}
	else if(strcmp(action, "color", true) == 0 || strcmp(action, "kolor", true) == 0)
	{
		new color;
		if( sscanf(params, "h", color))
		{
			sendTipMessage(playerid, "U�yj /orgpanel kolor [kolor rodziny w formacie hex (np. F1A151)]");
			sendTipMessage(playerid, "Koszt komendy: "#CHANGE_ORG_COLOR_COST" kontrabandy.");
			return 1;
		}
		if(color <= 0x0 || color >= 0xFFFFFF)
		{
			MruMessageFail(playerid, "  Niepoprawny kolor, zakres od 0 do FFFFFF.");
			return 1;
		}

		if(GetContraband(playerid) < CHANGE_ORG_COLOR_COST)
		{
			MruMessageFail(playerid, "Zmiana koloru organizacji kosztuje "#CHANGE_ORG_COLOR_COST" kontrabandy, a Ty tyle nie masz.");
			return 1;
		}

		SendOrgMessage(org, TEAM_AZTECAS_COLOR, sprintf("Lider %s zmieni� kolor organizacji.", GetNick(playerid)));

		color = (color << 8); // aplha channel
		OrgInfo[org][o_Color] = color;
		TakeContraband(playerid, CHANGE_ORG_COLOR_COST);
		SendClientMessage(playerid, color, "Teraz Twoja organizacja b�dzie w takim kolorze.");
		SaveOrg(org);
	}
	else if(strcmp(action, "spawn", true) == 0)
	{
		if(GetContraband(playerid) < CHANGE_ORG_SPAWN_COST)
		{
			MruMessageFail(playerid, "Zmiana spawnu organizacji kosztuje "#CHANGE_ORG_SPAWN_COST" kontrabandy, a Ty tyle nie masz.");
			return 1;
		}

		new bizId = IsPlayerAtFrontBusinnesZone(playerid);
		if(bizId == 0 || FrontBusiness[bizId][Owner] != org)
		{
			new Float:proximity = GetPlayerFrontBusinessProximity(playerid, bizId);
			if(proximity > ORG_SPAWN_BUSINESS_PROXIMITY_MAX || proximity < ORG_SPAWN_BUSINESS_PROXIMITY_MIN)
			{
				MruMessageFail(playerid, "Spawn organizacji musi znajdowa� si� w promieniu "#ORG_SPAWN_BUSINESS_PROXIMITY_MAX" metr�w od przej�tego biznesu, ale nie bli�ej ni� "#ORG_SPAWN_BUSINESS_PROXIMITY_MIN" metr�w.");
			}
			return 1;
		}

		SendOrgMessage(org, TEAM_AZTECAS_COLOR, sprintf("Lider %s zmieni� spawn frakcji.", GetNick(playerid)));

		TakeContraband(playerid, CHANGE_ORG_SPAWN_COST);
		SetOrgSpawnAtPlayerPos(playerid, org);
    	MruMessageGoodInfo(playerid, "Spawn organizacji ustawiony w tym miejscu zmieniony.");
	}
	else if(strcmp(action, "invite", true) == 0 || strcmp(action, "przyjmij", true) == 0)
	{
		new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /orgpanel przyjmij [playerid/Cz��Nicku]");
			sendTipMessage(playerid, "Koszt komendy: "#JOIN_MEMBER_COST"$.");
			return 1;
		}

		if(!IsPlayerConnected(giveplayerid))
		{
			MruMessageFail(playerid, "Nie ma takiego gracza!");
			return 1;
		}

		if(gPlayerLogged[giveplayerid] == 0)
		{
			MruMessageFail(playerid, " Gracz nie jest zalogowany.");
			return 1;
		}

		if(GetPlayerOrg(giveplayerid) != 0 || GetPlayerFraction(giveplayerid) != 0)
		{
			MruMessageFail(playerid, "Ten gracz jest ju� w organizacji/frakcji!");
			return 1;
		}

		if(kaska[playerid] < JOIN_MEMBER_COST)
		{
			MruMessageFail(playerid, "Przyj�cie nowego pracownika kosztuje "#JOIN_MEMBER_COST"$, a Ty tyle nie masz.");
			return 1;
		}

		if(playerid == giveplayerid)
		{
			MruMessageFail(playerid, "Nie mo�esz przyj�� samego siebie!");
			return 1;
		}

		InvitePlayerToOrg(giveplayerid, org);
		ZabierzKase(playerid, JOIN_MEMBER_COST);

		MruMessageGoodInfoF(playerid, "Przyj��e� %s do swojej organizacji, zap�aci�e� "#JOIN_MEMBER_COST"$",GetNick(giveplayerid));
		MruMessageGoodInfoF(giveplayerid, "%s przyj�� Ci� do organizacji %s.",GetNick(playerid), OrgInfo[org][o_Name]);
		Log(serverLog, INFO, "Lider %s przyj�� %s do rodziny %d.", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), org);
		return 1;
	}
	else if(strcmp(action, "uninvite", true) == 0 || strcmp(action, "zwolnij", true) == 0)
	{
		new giveplayerid;
		if( sscanf(params, "k<fix>",giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /orgpanel zwolnij [playerid/Cz��Nicku]");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			MruMessageFail(playerid, "Nie ma takiego gracza!");
			return 1;
		}

		if(gPlayerLogged[giveplayerid] == 0)
		{
			MruMessageFail(playerid, " Gracz nie jest zalogowany.");
			return 1;
		}

		if(GetPlayerOrg(giveplayerid) != org)
		{
			MruMessageFail(playerid, "Ten gracz nie jest w Twojej organizacji!");
			return 1;
		}

		if(playerid == giveplayerid)
		{
			MruMessageFail(playerid, " Nie mo�esz wyrzuci� samego siebie!");
			return 1;
		}

		RemovePlayerFromOrg(giveplayerid);

		MruMessageGoodInfoF(playerid, "Wyrzuci�e� %s ze swojej rodziny.",GetNick(giveplayerid));
		MruMessageBadInfoF(giveplayerid, "Lider %s wyrzuci� ci� z rodziny.",GetNick(playerid));
		Log(serverLog, INFO, "Lider %s wyrzuci� %s z rodziny %d.", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), org);
		return 1;
	}
	else if(strcmp(action, "rank", true) == 0 || strcmp(action, "ranga", true) == 0)
	{
		new giveplayerid, rank;
		if( sscanf(params, "k<fix>d",giveplayerid, rank))
		{
			sendTipMessage(playerid, "U�yj /orgpanel ranga [playerid/Cz��Nicku] [ranga]");
			return 1;
		}

		if(rank < 0 || rank > MAX_MEMBER_RANK) 
		{ 
			MruMessageFail(playerid, "Ranga od 0 do "#MAX_MEMBER_RANK"!"); 
			return 1; 
		}

		if(!IsPlayerConnected(giveplayerid))
		{
			MruMessageFail(playerid, "Nie ma takiego gracza!");
			return 1;
		}

		if(gPlayerLogged[giveplayerid] == 0)
		{
			MruMessageFail(playerid, " Gracz nie jest zalogowany.");
			return 1;
		}

		if(GetPlayerOrg(giveplayerid) != org)
		{
			MruMessageFail(playerid, "Ten gracz nie jest w twojej organizacji!");
			return 1;
		}

		if(strlen(OrgRank[org][rank]) > 1)
		{
			MruMessageFail(playerid, "Ta ranga nie jest stworzona, u�yj: /liderranga");
			return 1;
		}

		if(playerid == giveplayerid)
		{
			MruMessageFail(playerid, " Nie mo�esz da� rangi samemu sobie!");
			return 1;
		}

		GivePlayerOrgRank(giveplayerid, rank);

		MruMessageGoodInfoF(playerid, "Da�es %d rang� graczowi %s", rank, GetNick(giveplayerid));
		MruMessageGoodInfoF(giveplayerid, "Otrzyma�e� %d rang� (%s) w organizacji %s od lidera %s.", rank, OrgRank[org][rank], OrgInfo[org][o_Name], GetNick(playerid));
		Log(serverLog, INFO, "Lider %s rodziny %d da� %s rang� %d.", GetPlayerLogName(playerid), org, GetPlayerLogName(giveplayerid), rank);
		return 1;
	}
	else if(strcmp(action, "pracownicy", true) == 0 || strcmp(action, "members",true) == 0)
	{
		ShowMemberList(playerid, GetPlayerOrg(playerid));
	}
	else if(strcmp(action, "stawka", true) == 0)
	{
		new stake;
		if( sscanf(params, "d", stake))
		{
			sendTipMessage(playerid, "U�yj /orgpanel stawka [procent lidera (min "#MIN_LEADER_STAKE" max "#MAX_LEADER_STAKE")]");
			sendTipMessage(playerid, "Procent lidera to procent zarobk�w z przej�tych biznes�w, kt�ry potr�cisz pracownikom podczas PayDay'a.");
			return 1;
		}

		if(stake < MIN_LEADER_STAKE || stake > MAX_LEADER_STAKE)
		{
			MruMessageFail(playerid, "Procent lidera musi by� w granicach od "#MIN_LEADER_STAKE" do "#MAX_LEADER_STAKE".");
			return 1;
		}

		OrgInfo[org][o_LeaderStake] = stake;
		SaveOrg(org);

		MruMessageGoodInfoF(playerid, "Ustawi�e� procent zarobk�w z przej�tych biznes�w, kt�ry potr�cisz pracownikom podczas PayDay'a na %d%%", stake);
		Log(serverLog, INFO, "Lider %s rodziny %d ustawil swoj procent na %d.", GetPlayerLogName(playerid), org, stake);
	}
	else if(strcmp(action, "oddaj",true) == 0)
	{
		new giveplayerid, confimation[32];
		if( sscanf(params, "k<fix>S[32]()",giveplayerid, confimation))
		{
			sendTipMessage(playerid, "U�yj /orgpanel oddaj [playerid/Cz��Nicku]");
			sendTipMessage(playerid, "Koszt komendy: "#PASS_ORG_COST" kontrabandy.");
			return 1;
		}
		
		if(IsPlayerConnected(giveplayerid))
		{
			MruMessageFail(playerid, "Nie ma takiego gracza!");
			return 1;
		}

		if(gPlayerLogged[giveplayerid] == 0)
		{
			MruMessageFail(playerid, " Gracz nie jest zalogowany.");
			return 1;
		}

		if(GetPlayerOrg(giveplayerid) != org)
		{
			MruMessageFail(playerid, "Ten gracz nie jest w twojej organizacji!");
			return 1;
		}

		if(GetContraband(playerid) < PASS_ORG_COST)
		{
			MruMessageFail(playerid, "Przekazanie organizacji kosztuje "#PASS_ORG_COST" kontrabandy, a Ty tyle nie masz.");
			return 1;
		}

		if(strcmp(confimation, "definitywnie", true) != 0)
		{
			SendClientMessage(playerid, COLOR_PANICRED, "Czy jeste� pewny, �e chcesz odda� swoj� organizacje razem z jej cz�onkami i maj�tkiem?");
			SendClientMessage(playerid, COLOR_PANICRED, "Je�li tak, wpisz /orgpanel oddaj [id] definitywnie.");
			return 1;
		}

		SendOrgMessage(org, TEAM_AZTECAS_COLOR, sprintf("Lider %s odda� frakcj� w r�ce %s.", GetNick(playerid), GetNick(giveplayerid)));

		TakeContraband(playerid, PASS_ORG_COST);
		GivePlayerOrgRank(playerid, 9);
		GivePlayerOrgRank(giveplayerid, 1000);

		MruMessageGoodInfoF(playerid, "Przekaza�e� swoj� organizacj� graczowi %s", GetNick(giveplayerid));
		MruMessageGoodInfoF(giveplayerid, "Otrzyma�e� kontrol� na organizacj� %s od by�ego lidera %s.", OrgInfo[org][o_Name], GetNick(playerid));
		Log(serverLog, INFO, "Lider %s rodziny %d dal kontrole nad organizacja %s.", GetPlayerLogName(playerid), org, GetPlayerLogName(giveplayerid));
	}
	else if(strcmp(action, "usun",true) == 0)
	{
		if(strcmp(params, "definitywnie", true) != 0)
		{
			SendClientMessage(playerid, COLOR_PANICRED, "Czy jeste� pewny, �e chcesz usun�� swoj� organizacje razem z jej cz�onkami, pojazdami i biznesami?");
			SendClientMessage(playerid, COLOR_PANICRED, "Je�li tak, wpisz /orgpanel usun definitywnie. Ta decyzja jest nieodwracalna!!!");
			return 1;
		}

		RemovePlayerFromOrg(playerid);
		RemoveOrganisation(org);

		MruMessageBadInfo(playerid, "Usun��e� swoj� organizacje wraz ca�ym maj�tkiem i zwolni�e� wszystkich cz�onk�w.");
		Log(serverLog, INFO, "Lider %s rodziny %d usunal swoja organizacje.", GetPlayerLogName(playerid), org);
	}
	else if(strcmp(action, "stworzrange",true) == 0)
	{
        RunCommand(playerid, "/liderranga",  params);
	}
	else if(strcmp(action, "pojazd",true) == 0)
	{
        RunCommand(playerid, "/lidercar",  params);
	}
	else if(strcmp(action, "sejf",true) == 0)
	{
        RunCommand(playerid, "/sejf",  params);
	}
	else
	{
		sendTipMessageEx(playerid, COLOR_GREY, "Z�a nazwa panelu!");
		return 1;
	}
    return 1;
}

ShowMemberList(playerid, org)
{
	VECTOR_clear(VMembersOrg[playerid]);
	new query[512];
	format(query, sizeof(query), "SELECT `UID`, `Nick`, `Rank`, `connected` FROM `mru_konta` WHERE `FMember`=%i ORDER BY `connected` DESC, `Rank` DESC", PlayerInfo[playerid][pOrg]);
	mysql_query(query);
	mysql_store_result();
	if(mysql_num_rows()) {
		while(mysql_fetch_row_format(query, "|")) {
			new uid, nick[MAX_PLAYER_NAME], rank, isconnected;
			sscanf(query, "p<|>is[24]ii", uid, nick, rank, isconnected);
			new lider = rank >= 1000;
			new str_rank[64];
			if(lider) {
				rank -= 1000;
				strcat(str_rank, "LIDER");
			} else {
				format(str_rank, sizeof(str_rank), "[%i] %s", rank, OrgRank[GetPlayerOrg(playerid)][rank]);
			}
			new benefit = GetPlayerOrgBenefit(uid, org);
			AddDialogListitem(playerid, "%s\t%s\t{%s}%d$\t{%s}%s", nick, str_rank, benefit > 0 ? ("00FF00") : ("FF0000"), benefit, isconnected ? ("00FF00") : ("FF0000"), isconnected ? ("ONLINE") : ("OFFLINE"));
			VECTOR_push_back_val(VMembersOrg[playerid], uid);
		}
		ShowPlayerDialogPages(playerid, "RodzinaPracownicy", DIALOG_STYLE_TABLIST, sprintf("Cz�onkowie %s", OrgInfo[org][o_Name]), "OK", "Zamknij", 15, "{888888}Nast�pna strona >>>", "{888888}<<< Poprzednia strona");
	}
	mysql_free_result();
}


DialogPages:RodzinaPracownicy(playerid, response, listitem, inputtext[]) {
	new uid = VECTOR_get_val(VMembersOrg[playerid], listitem);
	VECTOR_clear(VMembersOrg[playerid]);
	if (!response) return 1;

	foreach(new i: Player) {
		if(PlayerInfo[i][pUID] == uid) {
			sendTipMessage(playerid, "Gracz jest online, uzyj /orgpanel aby nim zarz�dza�");
			Command_ReProcess(playerid, "orgpanel pracownicy", false);
			return 1;
		}
	}

	// skopiowane z fpanel
	new nick[MAX_PLAYER_NAME], rank, rankName[32], lider;
	new str[1024];
               
    strcat(nick, MruMySQL_GetNameFromUID(uid));
    rank = MruMySQL_GetAccInt("Rank", nick);
    lider = rank > 1000;
	if (lider) {
		sendTipMessage(playerid, "Nie mo�esz zarz�dza� liderem!");
		Command_ReProcess(playerid, "orgpanel pracownicy", false);
		return 1;
	}
	SetPVarInt(playerid, "prpanel_uid", uid);
	new org = GetPlayerOrg(playerid);
	new benefit = GetPlayerOrgBenefit(uid, org);
	new points = GetPlayerTakeoverPoints(uid, org);
	strcat(rankName, OrgRank[org][rank]);
    format(str, sizeof(str), ""#KARA_STRZALKA"    �� "#KARA_TEKST"Nick: "#KARA_TEKST"%s", nick);
    format(str, sizeof(str), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST"Ranga: "#KARA_TEKST"%s", str, rankName);
    format(str, sizeof(str), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST"Doch�d z pracownika: "#KARA_TEKST"%d", str, benefit);
    format(str, sizeof(str), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST"Punkty przej�cia: "#KARA_TEKST"%d", str, points);
    format(str, sizeof(str), "%s\n ", str);
    format(str, sizeof(str), "%s\n"#HQ_COLOR_STRZALKA"    �� {dafc10}Wyrzu� cz�onka", str);  
    format(str, sizeof(str), "%s\n"#HQ_COLOR_STRZALKA"    �� {dafc10}Zmie� rang�", str);  
    ShowPlayerDialogEx(playerid, D_ORGMEMBER, DIALOG_STYLE_LIST, "Zarz�dzanie cz�onkiem rodziny", str, "Ok", "Wstecz");
    return 1;
}

orgpanel_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	#pragma unused inputtext

	if(dialogid == D_ORGMEMBER) 
	{
		if(!IsPlayerOrgLeader(playerid)) 
		{
			Log(serverLog, ERROR, "Gracz %s probowal zarzadzac czlonkiem rodziny nie bedac liderem! [prpanel_uid=%i]", GetPVarInt(playerid, "prpanel_uid"));
			sendErrorMessage(playerid, "Wyst�pi� b��d!");
			DeletePVar(playerid, "prpanel_uid");
			return 1;
		}
		if(response) 
		{
			switch(listitem) 
			{
				case 5: 
				{ // zwolnij
					new uid = GetPVarInt(playerid, "prpanel_uid");
					new nick[MAX_PLAYER_NAME];
					strcat(nick, MruMySQL_GetNameFromUID(uid));
					new rodzina = MruMySQL_GetAccInt("FMember", nick);
					if(rodzina != GetPlayerOrg(playerid)) {
						Log(serverLog, ERROR, "Gracz %s probowal zarzadzac czlonkiem rodziny ale nie nalezy do niej! [prpanel_uid=%i, rodzina=%i]", uid, rodzina);
						sendErrorMessage(playerid, "Wyst�pi� b��d!)");
						DeletePVar(playerid, "prpanel_uid");
						return 1;
					}
					new msg[1024];
					format(msg, sizeof(msg), "UPDATE `mru_konta` SET `FMember`=0, `Rank`=99, `Member`=99, `Uniform`=0, `Team`=3 WHERE `UID`=%i AND `Rank`<1000", uid);
					mysql_query(msg);
					format(msg, sizeof(msg), "* Wyrzuci�e� %s ze swojej rodziny.", nick);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, msg);
					DeletePVar(playerid, "prpanel_uid");
				}
				case 6: 
				{ // ranga
					new org = GetPlayerOrg(playerid);
					new str[512];
					for(new i=0;i<10;i++)
					{
						if(strlen(OrgRank[org][i]) < 2)
							format(str, 512, "%s[%d] -\n", str, i);
						else
							format(str, 512, "%s[%d] %s\n", str, i, OrgRank[org][i]);
					}

					return ShowPlayerDialogEx(playerid, D_ORGMEMBER_RANK, DIALOG_STYLE_LIST, "Wybierz rang�, kt�r� chcesz nada� graczowi", str, "Nadaj", "Anuluj");
				}
				default:
				{
					Command_ReProcess(playerid, "orgpanel pracownicy", false);
				}
			}
		} 
		else 
		{
			DeletePVar(playerid, "prpanel_uid");
			Command_ReProcess(playerid, "orgpanel pracownicy", false);
		}
		return 1;
	}
	else if(dialogid == D_ORGMEMBER_RANK) 
	{
		if(!IsPlayerOrgLeader(playerid)) 
		{
			Log(serverLog, ERROR, "Gracz %s probowal zarzadzac czlonkiem rodziny nie bedac liderem! [prpanel_uid=%i]", GetPVarInt(playerid, "prpanel_uid"));
			sendErrorMessage(playerid, "Wyst�pi� b��d!");
			DeletePVar(playerid, "prpanel_uid");
			return 1;
		}
		if(response) 
		{
			new org = GetPlayerOrg(playerid);
			if(listitem >= MAX_RANG || listitem < 0 || strlen(OrgRank[org][listitem]) < 1) 
			{
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Ta ranga nie jest stworzona!");
				DeletePVar(playerid, "prpanel_uid");
				Command_ReProcess(playerid, "orgpanel pracownicy", false);
				return 1;
			}
			new uid = GetPVarInt(playerid, "prpanel_uid");
			new nick[MAX_PLAYER_NAME];
			strcat(nick, MruMySQL_GetNameFromUID(uid));
			new rodzina = MruMySQL_GetAccInt("FMember", nick);
			if(rodzina != GetPlayerOrg(playerid)) 
			{
				Log(serverLog, ERROR, "Gracz %s probowal zarzadzac czlonkiem rodziny ale nie nalezy do niej! [prpanel_uid=%i, rodzina=%i]", uid, rodzina);
				sendErrorMessage(playerid, "Wyst�pi� b��d!");
				DeletePVar(playerid, "prpanel_uid");
				return 1;
			}
			new msg[1024];
			format(msg, sizeof(msg), "UPDATE `mru_konta` SET `Rank`=%i WHERE `UID`=%i AND `Rank`<1000", listitem, uid);
			mysql_query(msg);
			format(msg, sizeof(msg), "Da�es %d rang� graczowi %s", listitem, nick);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, msg);
		}
		DeletePVar(playerid, "fpanel_uid");
		Command_ReProcess(playerid, "orgpanel pracownicy", false);
		return 1;
	}
	return 0;
}

//end