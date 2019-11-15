BreakLines(string[], delimiter[], limit)
{
	new inserts, tempLimit = limit, pos[50], string2[150], lastEmptyPos;
	format(string2, 150, string);
	
	for(new i; i < strlen(string); i++)
	{
		if( string[i] == ' ' ) lastEmptyPos = i;
		if( string[i] == '~' && string[i+1] == 'n' && string[i+2] == '~' ) tempLimit = i + limit;
		if( i >= tempLimit )
		{
			inserts += 1;
			tempLimit = i + limit;
			
			pos[inserts-1] = lastEmptyPos + ((inserts-1) * strlen(delimiter));
			if( inserts > 1 ) pos[inserts-1] -= (inserts-1);
		}
	}
	
	for(new d; d < 50; d++)
	{
		if( pos[d] == 0 ) break;
		strdel(string2, pos[d], pos[d]+1);
		strins(string2, delimiter, pos[d]);
	}
	
	return _:string2;
}

#define DLG_NO_ACTION		1
#define DG_DESC_DELETE 		2
#define DG_DESC_ADD 		3
#define DG_DESC_USEOLD		4

opis_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid==4192)
	{
		if( response == 0 ) return 1;
		new dg_value = DynamicGui_GetValue(playerid, listitem);

		if( dg_value == DG_DESC_DELETE )
		{
			Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, "");
			PlayerInfo[playerid][pDesc][0] = EOS;
			sendTipMessage(playerid, "Usun��e� sw�j opis");
		}
		else if( dg_value == DG_DESC_ADD)
		{
			ShowPlayerDialogEx(playerid, 4193, DIALOG_STYLE_INPUT, "Ustaw opis postaci", "Wpisz nowy opis postaci\t", "Ok", "Wyjd�");
		}
		else if( dg_value == DG_DESC_USEOLD )
		{
			new DBResult:db_result;
			db_result = db_query(db_handle, sprintf("SELECT * FROM `mru_opisy` WHERE `uid`=%d", DynamicGui_GetDataInt(playerid, listitem)));

			new oldDesc[256];
			db_get_field_assoc(db_result, "text", oldDesc, 256);

			db_result = db_query(db_handle, sprintf("UPDATE * FROM `mru_opisy` SET `last_used`=%d WHERE `uid`=%d", gettime(), DynamicGui_GetDataInt(playerid, listitem)));

			strcopy(PlayerInfo[playerid][pDesc], oldDesc);
			
			Attach3DTextLabelToPlayer(PlayerInfo[playerid][pDescLabel], playerid, 0.0, 0.0, -0.7);


			Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, BreakLines(oldDesc, "\n", 32));
			
			sendTipMessage(playerid, "Ustawi�e� nowy opis");
		}
	}
	if(dialogid==4193)
	{
		if( response == 0 ) return RunCommand(playerid, "/opis",  "");

		if(strlen(inputtext) > 110) return sendTipMessage(playerid, "Zbyt d�uga wiadomo��");

		new inputOpis[256];
		strcopy(inputOpis, inputtext, 256);

		mysql_real_escape_string(inputOpis, inputOpis);
		
		new DBResult:db_result;
		db_result = db_query(db_handle, sprintf("SELECT * FROM `mru_opisy` WHERE `owner`='%d' AND `text`='%s'", PlayerInfo[playerid][pUID], inputOpis));

		new rows = db_num_rows(db_result);

		new dLen = strlen(inputOpis);
		
		new initPoint, endPoint, tempCounts;

		for(endPoint = 0; endPoint < dLen; endPoint++) {

		    if(inputOpis[endPoint] == '{') {

		        initPoint = endPoint;
		        endPoint += 7;
		        if(endPoint < dLen) {

		            if(inputOpis[endPoint] == '}') {

		                for(tempCounts = 1; tempCounts < 7; tempCounts++) {

		                    if(!(tolower(inputOpis[initPoint+tempCounts]) >= 97
		                    && tolower(inputOpis[initPoint+tempCounts]) <= 102)
		                    && !(inputOpis[initPoint+tempCounts] >= 48
		                    && inputOpis[initPoint+tempCounts] <= 57))
		                        break;
						}
						if(tempCounts != 7)
						    continue;

						strdel(inputOpis, initPoint, ++endPoint);
						dLen = strlen(inputOpis);
						endPoint -= 8;
					}
				}
			}
		}

		if( rows )
		{
			new descUid = db_get_field_assoc_int(db_result, "uid");

			db_result = db_query(db_handle, sprintf("UPDATE `mru_opisy` SET `last_used`=%d WHERE `uid`=%d", gettime(), descUid));
		}
		else
		{
			db_free_result(db_query(db_handle, sprintf("INSERT INTO `mru_opisy` (`uid`,`text`, `owner`, `last_used`) VALUES (null, '%s', '%d', '%d')", inputOpis, PlayerInfo[playerid][pUID], gettime())));
		}

		strcopy(PlayerInfo[playerid][pDesc], inputOpis);


		Attach3DTextLabelToPlayer(PlayerInfo[playerid][pDescLabel], playerid, 0.0, 0.0, -0.7);
		Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, BreakLines(inputOpis, "\n", 32));
		sendTipMessage(playerid, "Ustawi�e� nowy opis");
	}
	return 0;
}


#define CHANGELOG_MAIN		1

changeLog_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	#pragma unused inputtext
	if(dialogid == 1963)
	{
		return showChangeLog(playerid);
	}
	if(dialogid == 1962)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0:
			{
				new string[2200];
				format(string, 2200, "{FFFFFF}Lista zmian aktualizacji 2.5.84\n\n");
				format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}Przyczepialne obiekty kamizelki\t\n", string);
				format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}Anty-sprint po obezw�adnieniu\t\n", string);
				format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}Nowa wybiera�ka\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}Inny spos�b sprawdzania uprawnie� pojazd�w\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}Zmiana spawnu NOA\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}Brak kamizelki na spawnie dla s�u�b porz�dkowych\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}G�o�nik nie jest ju� wyjmowany z pojazdu SAN\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}Zmiany w ilo�ci pieni�dzy przyznawanej za zabicie przest�pcy\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}80%% trafia do sejfu, 20%% do oficera\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}20 os�b na stron� dla komendy /fpanel\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}Zmiany w komendzie /napraw\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}Zwi�kszenie cen za tankowanie i napraw�\t\n", string);
				format(string, 2200, "%s{C0C0C0}bugfix\t{FFFFFF}Bugfix GPS\t\n", string);
				format(string, 2200, "%s{C0C0C0}bugfix\t{FFFFFF}Naprawiono bug z pust� list� /wanted u �owc�w nagr�d\t\n", string);
				format(string, 2200, "%s{C0C0C0}bugfix\t{FFFFFF}Ograniczono /wezportfel do 1 000 000$\t\n", string);

				ShowPlayerDialogEx(playerid, 1963, DIALOG_STYLE_MSGBOX, "{C0C0C0}Mrucznik-RP � Zmiany w wersji 2.5.84", string, "Ok", "");
			}
			case 1:
			{
				new string[2200];
				format(string, 2200, "{FFFFFF}Lista zmian aktualizacji 2.5.83\n\n");
				format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}wprowadzono opisy z mapy 3.0 ( /opis )\t\n", string);
				format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}przebieranie si� w skiny frakcyjne/cywilne dla frakcji bez /duty ( /skinf )\t\n", string);
				format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}mechanicy mog� sprawdzi� neony w aucie ( /sprawdzneon ) (koszt 10k)\t\n", string);
				format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}na ko�cu komunikatu o AFK b�dzie pojawia�o si� ID gracza\t\n", string);
				format(string, 2200, "%s{C0C0C0}bugfix\t{FFFFFF}naprawa b��du uniemo�liwiaj�cego YKZ u�y� /wepchnij\t\n", string);
				format(string, 2200, "%s{C0C0C0}bugfix\t{FFFFFF}usuni�to mo�liwo�� u�ywania /ub po /wb (do czasu respawnu)\t\n", string);
				format(string, 2200, "%s{C0C0C0}bugfix\t{FFFFFF}poprawiono kilka pomniejszych b��d�w\t\n", string);
				format(string, 2200, "%s{C0C0C0}bugfix\t{FFFFFF}pozbyto si� bug�w, przez kt�re z�odzieje mogli korzysta� z sejf�w innych bez has�a\t\n", string);

				if (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] == 5)
				{
					format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}dodano /marcepan kt�ry przeprowadza symulacj� Marcepana\t\n", string);
					format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}gdy gracz wyjdzie i ma dosta� Marcepana admini zobacz� log na czacie\t\n", string);
					format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}/opis usun [id] to teraz /usunopis [id]\t\n", string);
				}

				ShowPlayerDialogEx(playerid, 1963, DIALOG_STYLE_MSGBOX, "{C0C0C0}Mrucznik-RP � Zmiany w wersji 2.5.83", string, "Ok", "");
			}
			case 2:
			{
				new string[2200];
		        format(string, 2200, "{FFFFFF}Lista zmian aktualizacji 2.5.82\n\n");
		        format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}panel dla lider�w frakcji ( /fpanel )\t\n", string);
		        format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}powr�t komendy /pobij - brak aj za /q oraz 45s czekania po pobiciu\t\n", string);
		        format(string, 2200, "%s{C0C0C0}bugfix\t{FFFFFF}naprawiony bug z domkami\t\n", string);
		        format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}/hq dla sasd oraz sasd w /call 911\t\n", string);
		        format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}przejazd na granicach p�atny $1750 ( /przejazd )\t\n", string);
		        format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}ulepszenie matsiarz daje bonusowe materia�y przy dostarczeniu\t\n", string);
		        format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}dopasowanie kamizelki na skinie ( /dopasuj )\t\n", string);
		        format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}po p�j�ciu do paki przez cmd /paka /aresztuj po�cig si� deaktywuje\t\n", string);
		        format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}interior biura i magazyny dla /rodziny 23\t\n", string);
		        format(string, 2200, "%s{C0C0C0}zmiana\t{FFFFFF}niewielkie poprawki stabilno�ci\t\n", string);

		        if (PlayerInfo[playerid][pAdmin] >= 1000)
				{
					format(string, 2200, "%s{C0C0C0}nowo��\t{FFFFFF}dodano /fixallveh\t\n", string);
				}

		        ShowPlayerDialogEx(playerid, 1963, DIALOG_STYLE_MSGBOX, "{C0C0C0}Mrucznik-RP � Zmiany w wersji 2.5.82", string, "Ok", "");
			}
			case 3:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono bugi i b��dy.");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Obiekty   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Central Bank Los Santos - exterior banku");
				SendClientMessage(playerid,COLOR_WHITE,"Centrum rozrywki Los Santos - interior");
				SendClientMessage(playerid,COLOR_WHITE,"Centrum rozrywki Los Santos - exterior");
				SendClientMessage(playerid,COLOR_WHITE,"OP dla g�ry Chiliad ");
				SendClientMessage(playerid,COLOR_WHITE,"Ciekawostki na mapie");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawienie b��d�w Rockstar");
				SendClientMessage(playerid,COLOR_WHITE,"Oznakowanie Los Santos");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�cie parkingu LSPD");
				SendClientMessage(playerid,COLOR_WHITE,"Nowy parking LSPD - ulepszany z ka�dym kolejnym update");
				SendClientMessage(playerid,COLOR_WHITE,"Parking na zaholowane pojazdy dla LSPD");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono wypadaj�ce samochody GSA");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono wypadaj�ce samochody FBI");
				SendClientMessage(playerid,COLOR_WHITE,"Dodanie nowego miejsca dla biznesu - LSCDF");
				SendClientMessage(playerid,COLOR_WHITE,"Upi�kszenia Los Santos");
				SendClientMessage(playerid,COLOR_WHITE,"Parking przed LSMC");
				SendClientMessage(playerid,COLOR_WHITE,"Obiekty z propozycji");
				SendClientMessage(playerid,COLOR_WHITE,"Obiekty dla Money Makers");
				SendClientMessage(playerid,COLOR_WHITE,"Obiekty dla CassinoAutoService");
				SendClientMessage(playerid,COLOR_WHITE,"Obiekty dla low folow ");

				showChangeLog(playerid);
			}
			case 4:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------   BY PECET   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"System Po�ar�w v0.2");
				SendClientMessage(playerid,COLOR_WHITE,"Do sejfu LSFD trafia 20k od zgaszonego po�aru");
				SendClientMessage(playerid,COLOR_WHITE,"Wyd�u�ono czas gaszenia po�ar�w");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano wi�cej scenariuszy po�ar�w");
				SendClientMessage(playerid,COLOR_WHITE,"Usprawniono informowanie o po�arach (dla Administracji)");
				SendClientMessage(playerid,COLOR_WHITE,"Do sejfu LSFD i do stra�aka trafia po 2,5k za usuni�t� plam� oleju");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano komend� /windalock dla S�du (w przysz�o�ci planowane dodanie dla innych frakcji, kt�re b�d� chcia�y komend�)");
				SendClientMessage(playerid,COLOR_WHITE,"Usprawniono interior S�du (jest ja�niej i niezale�nie od pogody na zewn�trz - wewn�trz nie pada)");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano /odznaka dla pracownik�w S�du");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano /dutysbi dla SASP");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono komend� /tp (dla Administracji)");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano /togpodglad (dla Administracji)");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano /wejdz i /wyjdz na strzelnic� dla Gunshop LS");
				SendClientMessage(playerid,COLOR_WHITE,"Domenda /akceptuj naprawa tylko na wy��czonym silniku, trwa okre�lon� ilo�� czasu i wymaga mechanika w pobli�u, kt�ry w momencie naprawiania musi sta� obok pojazdu");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano komend� /armia-wiadomosc dla U.S. Army");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano komend� /sprzedajrybe - OD TERAZ MO�ESZ SPRZEDA� RYBY, KT�RE Z�OWI�E� W 24/7! Cena za kilogram: 20$!");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano komend� /su, /ob, /barierka, brak otrzymywania WL za zab�jstwo dla F.S. Army");
				SendClientMessage(playerid,COLOR_WHITE,"Mniejsze poprawki maj�ce na celu optymalizacj� i usprawnienie skryptu.");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Obiekty   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Pos�g Los Santos - KilsOn");
				SendClientMessage(playerid,COLOR_WHITE,"Przeniesiona centrala GSA - _Szymon");
				SendClientMessage(playerid,COLOR_WHITE,"Obiekty 'Ciekawostki' - _Szymon");
				SendClientMessage(playerid,COLOR_WHITE,"Cz�sto skracane zakr�ty - _Szymon");
				SendClientMessage(playerid,COLOR_WHITE,"Nowa baza San Andreas Army - soldiercolt");
				SendClientMessage(playerid,COLOR_WHITE,"OP dla Blueberry - _Szymon");
				SendClientMessage(playerid,COLOR_WHITE,"Interior rady miasta Blueberry - _Szymon");
				SendClientMessage(playerid,COLOR_WHITE,"Interior 'Komisja ds. Mechanik�w' - _Szymon");
				SendClientMessage(playerid,COLOR_WHITE,"Op dla Dillimore - Niuniek");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawki Rockstar/obecnej mapy - KilsOn i _Szymon");
				SendClientMessage(playerid,COLOR_WHITE,"Obiekty przed DMV - KilsOn");
				SendClientMessage(playerid,COLOR_WHITE,"Parking podziemny dla FBI - _Szymon");

				showChangeLog(playerid);
			}
			case 5:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------   BY niceCzlowiek   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Frakcje porz�dkowe otrzymuj� teraz pieni�dze do sejfu frakcyjnego za aresztowania, mandaty oraz kaucje.");
				SendClientMessage(playerid,COLOR_WHITE,"Pozwolenia prawnicze wydaje si� teraz za pomoc� /pozwolenie [id], druga osoba musi je akceptowa� za pomoc� /app ");
				SendClientMessage(playerid,COLOR_WHITE,"Wprowadzono komend� /bwtime, kt�ra pozwala administracji ustali� czas BW,");
				SendClientMessage(playerid,COLOR_WHITE,"Wprowadzono komend� /kamizelka, kt�ra pozwala policjantom przywdzia� kamizelk� (obiekt oraz 100% pancerza),");
				SendClientMessage(playerid,COLOR_WHITE,"Podniesiono skill SDPistol,");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono resetowanie patrolu, gdy jeden z patroluj�cych wyjdzie z serwera,");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano zawijanie czatu do normalnego czatu, oraz komend: /w /s /k /me /do,");
				SendClientMessage(playerid,COLOR_WHITE,"Oddzielono anty-spam /report od reszty licznik�w anty-spamu,");
				SendClientMessage(playerid,COLOR_WHITE,"W��czono BW na ca�e San Andreas,");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano mo�liwo�� zmiany muzyki w klubie bonehead");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�to bug z /tankuj");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano legalno�� broni Od teraz, ka�da zakupiona bro� w gunstore b�dzie w /sb wy�wietla�a si� jako LEGALNA...");
				SendClientMessage(playerid,COLOR_WHITE,"... a ka�da bro� zakupiona od mafii b�dzie okre�lona jako Z NIEZNANEGO �R�D�A");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono sloty rodzin oraz odbudowano sejfy frakcyjne");
				SendClientMessage(playerid,COLOR_BLUE,"----------   BY PECET   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano system po�ar�w by PECET");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano komend� /tablet dla org. porz�dkowych - PECET");

				showChangeLog(playerid);
			}
			case 6: 
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
		        SendClientMessage(playerid,COLOR_WHITE,"Dodano now� frakcj� - SASP (San Andreas State Police).");
		        SendClientMessage(playerid,COLOR_WHITE,"Dodano bramki SASP na autostradach.");
		        SendClientMessage(playerid,COLOR_WHITE,"Nowy interior posterunku BaySide.");
		        SendClientMessage(playerid,COLOR_WHITE,"Nowy wygl�d komendy /zmienskin dla HA.");
		        SendClientMessage(playerid,COLOR_WHITE,"Nowe miejsce DeMorgan.");

		        showChangeLog(playerid);
			}
			case 7:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
		        SendClientMessage(playerid,COLOR_BLUE,"----------    Systemy   ---------");
		        SendClientMessage(playerid,COLOR_WHITE,"Stworzono system stref gang�w i wojny gang�w. Frakcje takie jak Groove, BallaZ, Nortenos, WPS oraz");
		        SendClientMessage(playerid,COLOR_WHITE,"gangi na slotach rodzin od 5 do 10 maj� uprawnienia do podbijania stref. Frakcje w/w maj� swoje sta�e");
		        SendClientMessage(playerid,COLOR_WHITE,"strefy kontroli, kt�rych nie da si� przej��. Gangi przejmuj� teren, gdy maj� wystarczaj�c� ilo�� os�b");
		        SendClientMessage(playerid,COLOR_WHITE,"w tej samej strefie. Atak rozpoczyna osoba z rang� 4 lub wi�ksz�. Warunkiem przej�cia jest r�wnie�");
		        SendClientMessage(playerid,COLOR_WHITE,"taka sama lub wi�ksza ilo�� gangster�w online kontroluj�cych dan� stref�. Stref� przejmuje si� w ci�gu 15 minut.");
		        SendClientMessage(playerid,COLOR_WHITE,"Podczas ataku, osoby umieraj�ce otrzymuj� BW na 3 minuty, kt�re mo�e by� nadane tylko przez gangster�w lub policj�.");
		        SendClientMessage(playerid,COLOR_WHITE,"Strefa zostaje przej�ta, gdy ��czna ilo�� obro�c�w w strefie jest mniejsza od ilo�ci atakuj�cych.");
		        SendClientMessage(playerid,COLOR_WHITE,"Atak na stref� jest oznaczony na mapie poprzez miganie strefy na kolor czerwony.");
		        SendClientMessage(playerid,COLOR_BLUE,"----------   Komendy   ---------");
		        SendClientMessage(playerid,COLOR_WHITE,"Dla administracji: /unbw oraz /respawncar");
		        SendClientMessage(playerid,COLOR_WHITE,"Dla rodzin: /pr kolor (wymagane do podboj�w)");
		        SendClientMessage(playerid,COLOR_WHITE,"/zaznacz - pozwala wybra� Textdraw (np. do licznika)");
		        SendClientMessage(playerid,COLOR_BLUE,"----------   Inne   ---------");
		        SendClientMessage(playerid,COLOR_WHITE,"Przesuni�to TXD stref gang�w");
		        SendClientMessage(playerid,COLOR_WHITE,"Dodano nowy licznik pr�dko�ci");
		        SendClientMessage(playerid,COLOR_BLUE,"----------   ZMIANY   ---------");
		        SendClientMessage(playerid,COLOR_WHITE,"29.08 - Naprawa crashu z adresu 0x00756B89");
		        SendClientMessage(playerid,COLOR_WHITE,"30.08 - /vopis, zmiana koloru czatu /zg");
		        SendClientMessage(playerid,COLOR_WHITE,"Ikona w prawym g�rnym rogu oznacza informacje ze strony serwera, aby zaznaczy� wpisz (/zaznacz i ESC)");

		        showChangeLog(playerid);
			}
			case 8:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
		        SendClientMessage(playerid,COLOR_BLUE,"----------    Systemy   ---------");
		        SendClientMessage(playerid,COLOR_WHITE,"Likwidacja starego systemu pojazd�w frakcyjnych (przypisanych na sta�e) wprowadzenie nowego");
		        SendClientMessage(playerid,COLOR_WHITE,"Poprawiono optymalnos� g��wnych timer�w serwera");
		        SendClientMessage(playerid,COLOR_WHITE,"Wprowadzenie ban�w w MySQL");
		        SendClientMessage(playerid,COLOR_WHITE,"Og�lna poprawa kondycji kont graczy w MySQL");
		        SendClientMessage(playerid,COLOR_WHITE,"System uprawnie� (do panelu kar i log�w oraz do pewnych komend np. /dajzaufanego)");
		        SendClientMessage(playerid,COLOR_WHITE,"Nowy system barierek dla frakcji (/barierka i /barierka usun). Maksymalna ilos� to 10 na frakcj�!");
		        SendClientMessage(playerid,COLOR_WHITE,"Dynamiczne nazwy rang - mo�liwosc zmiany rang aktualnie tylko przez te osoby (0Verte, Mrucznik, Kubi)");
		        SendClientMessage(playerid,COLOR_WHITE,"Kierunkowskazy dla pojazd�w ko�owych");
		        SendClientMessage(playerid,COLOR_BLUE,"----------    Obiekty   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Biuro ICC (projekt DywaniK)");
				SendClientMessage(playerid,COLOR_WHITE,"Przebudowa szpitala LSMC (projekt abram01)");
				SendClientMessage(playerid,COLOR_WHITE,"Stworzenie remizy stra�ackiej (projekt abram01)");
		        SendClientMessage(playerid,COLOR_WHITE,"Nowa siedziba San News (projekt DywaniK)");
		        SendClientMessage(playerid,COLOR_WHITE,"Nowa baza wojska SFHQ (projekt DywaniK)");
		        SendClientMessage(playerid,COLOR_WHITE,"Poprawiona wersja warsztat�w rodziny RSC (14)");
		        SendClientMessage(playerid,COLOR_WHITE,"Nowy bar na Glen Park");
		        SendClientMessage(playerid,COLOR_WHITE,"Vinyl Club interior (projekt Albert i Patryk)");
		        SendClientMessage(playerid,COLOR_WHITE,"Ibiza Club interior");
		        SendClientMessage(playerid,COLOR_WHITE,"Ca�kowicie zmiana bazy KT, nowy wygl�d z zewn�trz i nowe biura (projekt Kubi)");
		        SendClientMessage(playerid,COLOR_WHITE,"Nowy interior AT-400 (projekt Kubi)");
		        SendClientMessage(playerid,COLOR_BLUE,"----------   Komendy   ---------");
		        SendClientMessage(playerid,COLOR_WHITE,"Przerobione komend� /spec dla administracji");
		        SendClientMessage(playerid,COLOR_WHITE,"Dodano komend� /opis (FINALLY) wi�cej informacji w /opispomoc");
		        SendClientMessage(playerid,COLOR_WHITE,"ICC otrzyma�o komend� na otwieranie drzwi restauracji (/zamek)");
		        SendClientMessage(playerid,COLOR_WHITE,"Modyfikacja /kajdanki dla BOR");
		        SendClientMessage(playerid,COLOR_WHITE,"Modyfikacja /su dla BOR (mog� nada� tylko pierwszy WL)");
		        SendClientMessage(playerid,COLOR_WHITE,"Dla taks�wek: /fare od teraz liczy tras� w kilometrach");
		        SendClientMessage(playerid,COLOR_WHITE,"Przywr�cono AT-400 oraz komendy do zarz�dzania lotniskami i lotami (/lot)");
		        SendClientMessage(playerid,COLOR_BLUE,"----------   Poprawki   ---------");
		        SendClientMessage(playerid,COLOR_WHITE,"Naprawiono b��d, gdzie policja mog�a u�ywa� /mdc po wyjsciu z interioru");
		        SendClientMessage(playerid,COLOR_WHITE,"Poprawiono komend� /rodziny i /biznesy, wywietlaj� teraz prawid�owe informacje");
		        SendClientMessage(playerid,COLOR_WHITE,"Kostka w kasynie zosta�a ca�kowicie zmieniona");
		        SendClientMessage(playerid,COLOR_WHITE,"G�osnik SN ma teraz d�u�szy link do wpisania");
		        SendClientMessage(playerid,COLOR_BLUE,"----------   Inne   ---------");
		        SendClientMessage(playerid,COLOR_WHITE,"Usuni�to mo�liwosc teleportacji do wi�zienia stanowego (przez komisariat)");
		        SendClientMessage(playerid,COLOR_WHITE,"Pi�kno: Dodano animacje podczas postrza�u w cz�sci cia�a");
		        SendClientMessage(playerid,COLOR_WHITE,"Pi�kno: Dodano nowy styl TXD dla rozmaitych informacji (np. /togw /togtel)");
		        SendClientMessage(playerid,COLOR_WHITE,"Ballas dosta�o zmian� pojazd�w, spawna");
		        SendClientMessage(playerid,COLOR_WHITE,"Frakcja LSFD otrzyma�a w�asny slot 17. Od teraz jest osobn� frakcj� o czatach radiowych");
		        SendClientMessage(playerid,COLOR_WHITE,"Pi�kno: D�wi�k dzwoni�cego telefonu oraz wybierania numer�w");
		        SendClientMessage(playerid,COLOR_WHITE,"Pi�kno: Modernizacja /call 911 - dodano list� GUI i mo�liwos� wezwania stra�y");
		        SendClientMessage(playerid,COLOR_P@,"|_______________________>>> Wersja 2.4.92 <<<_______________________|");

		        showChangeLog(playerid);
			}
			case 9:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------    Systemy   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Przywr�cono system �owienia ryb oraz gotowania posi�k�w (z mapy Godfather)");
				SendClientMessage(playerid,COLOR_WHITE,"Przeniesiono ca�kowicie stary system kont na nowy");//komenda /zmiennick na standardy mysql
				SendClientMessage(playerid,COLOR_P@,"|_______________________>>> Wersja 2.4.911 <<<_______________________|");

				showChangeLog(playerid);
			}
			case 10:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------    Systemy   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Automat do usuwania podw�jnych w�ascicieli, kontroli aktywno�ci i bugu z ikonk�.");
				//SendClientMessage(playerid,COLOR_WHITE,"Przerobiono system ban�w na nowy, wydajniejszy i wygodniejszy");
				//SendClientMessage(playerid,COLOR_WHITE,"Taksometr KT wylicza stawki za kilometr i nie znika (by Kubi)");//NIE DZIA�A
				//SendClientMessage(playerid,COLOR_WHITE,"Ulepszono prac� �owcy nagr�d (poddawanie si� w GUI, automatyczny dob�r zlece�, pogonie i inne)");
				//SendClientMessage(playerid,COLOR_WHITE,"");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Obiekty   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Wybudowano dom przy molo bez ko�a (by Sejciak)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Utworzono ruchom� bram� na plac manewrowy(by abram01)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Dodano i opracowano now� baz� BOR (by abram01)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Zmieniono bram� NoA (by abram01)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Wstawiono i opracowano nowy interior FBI (by Dywan)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Wn�trze karetki dost�pne poprzez /wejdzw (by abram01 & Mrucznik)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Wn�trze Kampinga (model 508 - Journey) dost�pne poprzez /wejdzw (by CrucixTM & Mrucznik)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Zamykane sklepy w Verona Mall (by Kobaltowy Eryk)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Lepiej oznakowano wej�cie do placu manewrowego DMV (by abram01)");
				SendClientMessage(playerid,COLOR_WHITE,"Znaki drogowe pod DMV (by Dywan)");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Pojazdy   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Zmienione pozycje i kolor pojazd�w Vagos");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Znaki TAXI dla heli, sultana i limuzyny KT");//sprawdzone - dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Full tuning dla sultana KT");//sprawdzone - dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Zmiana pojazd�w LSPD ID 66(427)/151(482)/281(521) na modele 498/413/528"); //sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Dodanie napis�w SWAT dla Boxville'a LSPD (id 66) ");//sprawdzone - dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Niedaleko bazy mechanik�w znajduje si� Predator LSPD (id 212)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"�odzie YKZ s� dost�pne niezale�nie od posiadanej rangi");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Zmiana pozycji Hummera NG (id 16)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Podmiana pojazd�w NG ID 280(539)/23(497)/24(595) na modele 497/548/430");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�cie PCJ-600 FBI (id 142) i zmiana spawn�w wybranych pojazd�w.");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Podmiana pojazd�w FBI ID 141(541)/139(541) na modele 490/482");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Dodanie napis�w FBI 'Emergency Support Unit' dla Buritto FBI (id 141)");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_BLUE,"----------   Drobne    ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Nowy spawn Vagos");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Za�atano dziur� w bazie HA");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Inny stream w Bonehead Club");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Zmiana nazwy dla przykrywki YKZ");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Ca�kowita zmiana nazwy frakcji z TFaTf na NoA");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Automatyczne wznawianie GUI przy zakupach w 24/7");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�to informacje o posiadaniu pojazd�w, przywr�ceniu broni i kosztach leczenia przy wej�ciu na serwer");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_BLUE,"----------   Komendy   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Za pomoc� /fixr mo�na naprawi� bug z d�wi�kiem helikoptera");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Odpalanie i gaszenie silnika klawiszem Y - {7CFC00}WA�NE");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Koguty mo�na w��cza� klawiszem H");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Komenda /kajdanki dzia�a tak�e dla agent�w BOR z 2 rang�");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Medycy mog� teraz aktywowa� i odbiera� sygna� GPS");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Po zmiane nicku wywo�ywany jest kreator postaci umo�liwiaj�cy zmian� wieku, pochodzenia i p�ci.");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Dodano komend� /taryfikator zawieraj�ca spis przewinie� za kt�re mo�na otrzyma� mandat");//nie dzia�a przerzucanie dialog�w, pomoc prawna crashuje serwer
				if (IsPlayerPremiumOld(playerid))
				{
					SendClientMessage(playerid,COLOR_WHITE,"Mo�liwo�c zyskania jednej zmiany nicku za pomoca komendy /odejmijzmiane (dla KP lvl 3)");//sprawdzone-dzia�a
				}
				SendClientMessage(playerid,COLOR_BLUE,"----------   B��dy i niedor�bki   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Przywr�cono ko�ci� i poprawiono napis nad nim.");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono komend� /odznaka dla stra�y po�arnej");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Komenda /wezportfel dzia�a poprawnie dla frakcji WPS");//sprawdzone-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono licznik KT.");//chyba-dzia�a
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono wyj�cie ze sklepu przy stacji benzynowej");//chyba-dzia�a
				if (PlayerInfo[playerid][pAdmin] >= 1)
				{
					SendClientMessage(playerid,COLOR_BLUE,"----------   Dla admin�w   ---------");
					SendClientMessage(playerid,COLOR_WHITE,"Dopisano wszytkie komendy admina do /ah");//sprawdzone-dzia�a
					SendClientMessage(playerid,COLOR_WHITE,"Rangi @ z nowy komendami to teraz: 1,5,(7),10,15,20,25,35,50,100,200,1000,2000,5000");//sprawdzone-dzia�a
					SendClientMessage(playerid,COLOR_WHITE,"Wp�aty na /charity s� teraz widoczne dla wszytkich @");//sprawdzone-dzia�a
					SendClientMessage(playerid,COLOR_WHITE,"Data w pay.log");//sprawdzone-dzia�a
					SendClientMessage(playerid,COLOR_WHITE,"Dodano komunikat o ZNIWELOWANIU maj�tku do pay.log");//chyba-dzia�a
					SendClientMessage(playerid,COLOR_WHITE,"Dodano komunikat o Z�OMOWANIU DOMU z powodu: nieaktywno�ci i podw�jnego w�asciciela do pay.log");//chyba-dzia�a
					SendClientMessage(playerid,COLOR_WHITE,"Po wpisaniu komendy /spec wy�wietla si� dodatkowo level i prawo jazdy gracza (0=brak, 1=posiada)");//sprawdzone-dzia�a
				}
				//Dodaj kary w txd by kubi
				SendClientMessage(playerid,COLOR_P@,"|_______________________>>> Wersja 2.4.91 <<<_______________________|");

				showChangeLog(playerid);
			}
			case 11:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------   G��wne systemy   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Podpi�to map� pod bazy danych");
				SendClientMessage(playerid,COLOR_WHITE,"W��czono konwersje plik�w kont na bazy danych");
				SendClientMessage(playerid,COLOR_P@,"|_______________________>>> Wersja v2.4.9 <<<_______________________|");

				showChangeLog(playerid);
			}
			case 12:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------   B��dy i niedor�bki   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Skiny WPS (206 202 133 291) nie s� ju� dost�pne dla os�b spoza tej frakcji");
				SendClientMessage(playerid,COLOR_WHITE,"Wy�wietlanie nazwy WPS i ich rang w /stats");
				SendClientMessage(playerid,COLOR_WHITE,"KT po zalogowaniu i �mierci otrzymuj� skin i kolor cywila");
				SendClientMessage(playerid,COLOR_WHITE,"Frakcja WPS mo�e ju� korzysta� z komend przest�pczych");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Obiekty   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano interior Bonehead Club wraz z bramami");
				SendClientMessage(playerid,COLOR_WHITE,"Zoptymalizowano obiety");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Modyfikacje komend   ---------");
				//SendClientMessage(playerid,COLOR_WHITE,"Zmodyfikowano komend� /w - teraz zbyt d�ugi tekst przenoszony jest do nast�pnego /w");
				//SendClientMessage(playerid,COLOR_WHITE,"Komenda /podglad nie przywraca podgl�du po relogu gracza");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano czat /f i /fo dla frakcji WPS");
				SendClientMessage(playerid,COLOR_WHITE,"Przywr�cono czat /fo dla BOR i Urz�du");
				SendClientMessage(playerid,COLOR_WHITE,"Patent �eglarski mo�na wydawa� dopiero od 2 rangi");
				SendClientMessage(playerid,COLOR_WHITE,"Komenda /omdv i /cmdv jest dost�pna od 1 rangi");
				SendClientMessage(playerid,COLOR_WHITE,"Prawo jazdy mo�na teraz wydawa� od pierwszej rangi");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Inne   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano skin klauna, kurczaka i lidera DMV do wybieralki");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano skin Tempenego dla LSPD");
				if(PlayerInfo[playerid][pAdmin] == 5000)
				{
					SendClientMessage(playerid,COLOR_BLUE,"----------   Skryptowe   ---------");
					SendClientMessage(playerid,COLOR_WHITE,"Dodano nowe funkcje: AntyReklama(string[]), AntyCzitText(string[])");
				}
				SendClientMessage(playerid,COLOR_P@,"|_______________________>>> Wersja v2.4.811 <<<_______________________|");

				showChangeLog(playerid);
			}
			case 13:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Obiekty   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Zablokowano wjazd do fabryki broni. Poprawiono jej wn�trze.");
				SendClientMessage(playerid,COLOR_WHITE,"Nowe Verona Mall (z pomieszczeniami do zagospodarowania)");
				SendClientMessage(playerid,COLOR_WHITE,"Zmodyfikowany dwa sultany LSPD, tak aby bardziej przypomina�y radiolki");
				SendClientMessage(playerid,COLOR_WHITE,"Oznakowano dwa Sultany FBI");
				SendClientMessage(playerid,COLOR_WHITE,"Osoba zakuta w kajdanki ma je na r�kach");
				SendClientMessage(playerid,COLOR_WHITE,"Ruchomy diabelski m�yn (by Pablo_Borsellino)");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano konfesjona�y (by abram01)");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano koguty dla tax�wek specjalnych");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Modyfikacje komend   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Mo�liwo�c stosowania komend: /fed /su i /tazer wobec SP nie b�d�cych na s�u�bie");
				SendClientMessage(playerid,COLOR_WHITE,"Zmiana komunikat�w dot. s�u�by SP wy�wietlanej w /odznaka");
				SendClientMessage(playerid,COLOR_WHITE,"Osoby z WL nie mog� bra� /duty");
				SendClientMessage(playerid,COLOR_WHITE,"W komendzie /mandat kwoty pieni�ne zast�piono stawkami dziennymi");
				SendClientMessage(playerid,COLOR_WHITE,"Po w��czeniu czatu /n wy�wietlany jest samouczek na temat zachowania si� na tym czacie");
				SendClientMessage(playerid,COLOR_WHITE,"W komendach z pieni�dzmi mo�emy wpisywa� u�ywa� skr�tu 'k', np. /przelew 45 60kk = /przelew 45 60000000 ");
				SendClientMessage(playerid,COLOR_WHITE,"Bro� u dilera mog� kupi� osoby z co najmniej 2lvl i licencj� na bro�.");
				SendClientMessage(playerid,COLOR_WHITE,"Sd pistol to bro� od 2 skilla dilera broni a pistolety (z mo�liwo�ci� kupna bez licencji) od 1 skilla");
				SendClientMessage(playerid,COLOR_WHITE,"Komenda /take dzia�a od 1 rangi");
				SendClientMessage(playerid,COLOR_WHITE,"Wym�g posiadania s�u�by dla komend: /ob , /kajdanki");
				SendClientMessage(playerid,COLOR_WHITE,"Zmiana nazw niekt�rych rang na czacie /n");
				SendClientMessage(playerid,COLOR_BLUE,"----------   B��dy i niedor�bki   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�to b��d z niewidocznymi powodami kar.");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono niedor�bki zwi�zane z nowym komi.");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�to czystk� ballas");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono licznik zabi� z /stats");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono warning o Drive-By");
				SendClientMessage(playerid,COLOR_WHITE,"Brak komunikatu o wpisanie /spec off przy wpisaniu pustego /spec");
				SendClientMessage(playerid,COLOR_WHITE,"Brak komunikatu o wpisanie /sethp [id] [ilosc] przy wpisaniu pustego /sethp [id]");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�to podw�jne 'dalej' w samouczku");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�to ma�e bugi i b��dy.");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Personalizacja frakcji   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Zmiana kobiecego skina SAN(9) z ID 148 na 141");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Skryptowe   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Uporz�dkowano czytelno�� i wydajno�� kodu w wybranych callback'ach");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�to cz�c zb�dnych zmiennych i funkcji");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Systemy   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Aktualizator hase�: co 6 miesi�cy system b�dzie prosi� gracza o zmian� has�a w celu poprawy bezpiecze�stwa kont");
				SendClientMessage(playerid,COLOR_WHITE,"Podwy�szenie zarobk�w w pracy kierowcy autobusu");
				SendClientMessage(playerid,COLOR_WHITE,"Ulepszono zamykanie drzwi, zmodyfikowano tras� lini nr 72");
				SendClientMessage(playerid,COLOR_WHITE,"Nieznaczna zmiana miejsca dostarczania materia��w");
				SendClientMessage(playerid,COLOR_WHITE,"Zwi�kszenie cen materia��w (500$/1 paczka) i benzyny (40/1%%)");
				SendClientMessage(playerid,COLOR_WHITE,"Przebudowano system nadawania WL za morderstwo");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Nowe komendy   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"/setint - ustawia graczowi interior (1 @lvl)");
				SendClientMessage(playerid,COLOR_WHITE,"/setvw - ustawia graczowi vw (1@)");
				SendClientMessage(playerid,COLOR_WHITE,"/clearwlall - zeruje wszystkim graczom WL (1@)");
				SendClientMessage(playerid,COLOR_WHITE,"/getint - pobiera interior gracza");
				SendClientMessage(playerid,COLOR_WHITE,"/getvw - pobiera vw gracza");
				SendClientMessage(playerid,COLOR_WHITE,"/changelog [wersja] - wy�wietla zmiany wprowadzone w ostatniej aktualizacji lub podanej wersji");
				SendClientMessage(playerid,COLOR_P@,"|_______________________>>> Wersja v2.4.810 <<<_______________________|");

				showChangeLog(playerid);
			}
			case 14:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Obiekty   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Nowy interior LSMC.");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�te zb�dne obiekty (bank, parking przy LSMC).");
				SendClientMessage(playerid,COLOR_WHITE,"Wr�ci�a stara baza mech�w.");
				SendClientMessage(playerid,COLOR_WHITE,"Zaktualizowano i zoptymalizowano obiekty.");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Modyfikacje komend   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Nowy /komunikat dla biznes�w.");
				SendClientMessage(playerid,COLOR_WHITE,"Maska od [2] rangi dla FBI.");
				SendClientMessage(playerid,COLOR_WHITE,"System Nieruchomo�ci - /biznespomoc.");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano /sprzedajmats.");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Personalizacja frakcji   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Zmiana skina dla YKZ.");
				SendClientMessage(playerid,COLOR_WHITE,"Zmiana ceny kursu taks�wek.");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Skryptowe   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawki AC.");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano znaczniki na map�.");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano komunikat dla graczy przy roz��czaniu si� gracza w pobli�u.");
				if(PlayerInfo[playerid][pAdmin] >= 1)
				{
					SendClientMessage(playerid,COLOR_BLUE,"----------   Komendy i poprawki   ---------");
					SendClientMessage(playerid,COLOR_WHITE,"Poprawki do /spec (mo�e pomog�).");
					SendClientMessage(playerid,COLOR_WHITE,"Komenda /zbijwl nie wyrzuca komunikatu o policjancie w pobli�u, gdy ten jest na specu.");
					SendClientMessage(playerid,COLOR_WHITE,"Komenda /dajbiznes i /zabierzbiznes dla Admin�w z 5000lvl i wy�ej.");
				}
				SendClientMessage(playerid,COLOR_P@,"|_______________________>>> Wersja v2.5.92 <<<_______________________|");

				showChangeLog(playerid);
			}
			case 15:
			{
				SendClientMessage(playerid,COLOR_P@,"|_____________________________Lista zmian_____________________________|");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Nowo�ci   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Nowy system telefon�w. Od teraz gdy kto� do nas zadzwoni to ju� nie wy�wietli si� jego nick z gry, lecz sam numer telefonu (autor: Mrucznik)");
				SendClientMessage(playerid,COLOR_WHITE,"Nowa komenda /resms - odpowiada na ostatni� otrzyman� wiadomo�� SMS");
				SendClientMessage(playerid,COLOR_WHITE,"Nowa komenda /wizyt�wka - za pomoc� kt�rej mo�esz wr�czy� graczowi wizyt�wk�");
				SendClientMessage(playerid,COLOR_WHITE,"Nowa komenda /kontakty - umo�liwia zarz�dzaniem kontaktami");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Obiekty   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Urz�d Miasta Los Santos (autor: Satius)");
				SendClientMessage(playerid,COLOR_WHITE,"Ammu Nation Los Santos (autor: Beczka)");
				SendClientMessage(playerid,COLOR_WHITE,"Pojazd San Van (autor: skLuke)");
				SendClientMessage(playerid,COLOR_WHITE,"Ramirez Car Service (autor: Abstynent)");
				SendClientMessage(playerid,COLOR_WHITE,"Hells Angels MC (autor: Charlie112)");
				SendClientMessage(playerid,COLOR_WHITE,"Plac manewrowy (autor: Satius)");
				SendClientMessage(playerid,COLOR_WHITE,"Dos Santos Car Service (autor: Abstynent)??");
				SendClientMessage(playerid,COLOR_WHITE,"Przywr�cenie starych dok�w (autor: Simeone)??");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawione liter�wki San Andres Network");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawione liter�wki USSS");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawione b��dy Rockstara");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono interior nr. 11");
				SendClientMessage(playerid,COLOR_WHITE,"Dodano barierki zagradzaj�ce wjazd do banku");
				SendClientMessage(playerid,COLOR_WHITE,"Object Pack dla skTom jako nagroda za pochwa�y od graczy.");
				SendClientMessage(playerid,COLOR_BLUE,"----------   Poprawki b��d�w   ---------");
				SendClientMessage(playerid,COLOR_WHITE,"Darmowa bro� od dilera po �mierci - poprawiono");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono komend� dla DMV (/pjtest)");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono bug wywiadu (gdy reporter wychodzi z serwera wywiad automatycznie si� ko�czy)");
				SendClientMessage(playerid,COLOR_WHITE,"Skill pracy dorywczej busiarza dzia�a poprawnie");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawka panelu dla administracji");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono bug barierek dla frakcji USSS");
				SendClientMessage(playerid,COLOR_WHITE,"Skill pracy dorywczej kuriera dzia�a poprawnie");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawki komend dla administracji");
				SendClientMessage(playerid,COLOR_WHITE,"Dodanie nowych komend dla administracji");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono bug /tankowanie");
				SendClientMessage(playerid,COLOR_WHITE,"Nowe komendy dla p�administrator�w");
				SendClientMessage(playerid,COLOR_WHITE,"Komenda /kajdanki zosta�a naprawiona");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono komend� /skinf dla frakcji");
				SendClientMessage(playerid,COLOR_WHITE,"Gaszenie silniku tylko dla pojazd�w, kt�re maj� silnik");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�to komunikat o kasku w aucie");
				SendClientMessage(playerid,COLOR_WHITE,"W demorgan nie mo�na mie� ju� broni");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono bugi we frakcji FBI");
				SendClientMessage(playerid,COLOR_WHITE,"Nowe komendy i naprawa panelu KO");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawienie �cie�ek MP3");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono kamery w kancelarii prawniczej");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono bug z interiorem Cluckin'Bell");
				SendClientMessage(playerid,COLOR_WHITE,"Odblokowanie czatu OOC podczas BW");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono wynagrodzenie za plamy i po�ary dla LSFD");
				SendClientMessage(playerid,COLOR_WHITE,"Naprawiono bug z rad� miasteczka Dillimore");
				SendClientMessage(playerid,COLOR_WHITE,"Od teraz /trasa w KT jest od [0] rangi");
				SendClientMessage(playerid,COLOR_WHITE,"Usuni�cie b��du zwi�zanego z kradzie�� auta");
				SendClientMessage(playerid,COLOR_WHITE,"Dodanie BW dla USSS.");
				SendClientMessage(playerid,COLOR_WHITE,"Poprawiono drobne b��dy j�zykowe");
				if(PlayerInfo[playerid][pAdmin] >= 1)
				{
					SendClientMessage(playerid,COLOR_BLUE,"----------   Dla administracji   ---------");
					SendClientMessage(playerid,COLOR_WHITE,"Stworzenie nowych komend: /tankveh, /gotobank, /gotostacja");
					SendClientMessage(playerid,COLOR_WHITE,"Naprawiono komendy: /gotosalon, /gotomechy, /gotoadmin, /gotostad");
					SendClientMessage(playerid,COLOR_WHITE,"Poprawa liter�wek w komendach administracyjnych");
					SendClientMessage(playerid,COLOR_WHITE,"Naprawiono /spec");
					SendClientMessage(playerid,COLOR_WHITE,"Usuni�cie komunikatu o /q na /spec");
					SendClientMessage(playerid,COLOR_WHITE,"Nowe prace do wyboru pod komend� /setstat");
					SendClientMessage(playerid,COLOR_WHITE,"Nowe komendy dla P�Administrator�w: /pwarn, /warn, /unbw, /pogodaall");
					SendClientMessage(playerid,COLOR_WHITE,"Nowa komenda /czyjtonumer(sprawdza do kogo nalezy dany numer telefonu)");
					SendClientMessage(playerid,COLOR_WHITE,"Naprawa b��du zwi�zanego z /dowod, /pl na specu");
					SendClientMessage(playerid,COLOR_WHITE,"Naprawienie komendy /mole");
					SendClientMessage(playerid,COLOR_WHITE,"Dodanie /addcar i /removecar dla KO");
					SendClientMessage(playerid,COLOR_WHITE,"Dodanie komendy /usunopisveh dla panelu KO");
					SendClientMessage(playerid,COLOR_WHITE,"Naprawa /panel unwarn gdy gracz jest online");
					SendClientMessage(playerid,COLOR_WHITE,"Naprawa panelu KO");
				}
				SendClientMessage(playerid,COLOR_P@,"|_______________________>>> Wersja v2.5.93 <<<_______________________|");

				showChangeLog(playerid);
			}
		}
	}
	return 0;
}

showChangeLog(playerid, page = CHANGELOG_MAIN)
{
	if(page == CHANGELOG_MAIN)
	{
		new string[900];
		format(string, sizeof(string), "##\t"#HQ_COLOR_TEKST2"2.5.84\n");
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.5.83\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.5.82\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.5.8\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.5.7\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.5.6\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.5.2\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.4.93\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.4.92\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.4.911\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.4.91\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.4.9\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.4.811\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.4.810\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.5.92\n", string);
		format(string, sizeof(string), "%s##\t"#HQ_COLOR_TEKST2"2.5.93", string);
		ShowPlayerDialogEx(playerid, 1962, DIALOG_STYLE_LIST, "Wybierz aktualizacj�", string, "Ok", "Wyjd�");
	}
	return 1;
}


#define FPANEL_MAIN			1
#define FPANEL_MANAGEP		2
#define FPANEL_MANAGEV		3
#define FPANEL_MANAGES		4
#define FPANEL_SEJF			5

#define FPANEL_PER_PAGE 	20 // ilo�� os� na stron�

#define FPANEL_DG_OSOBA		1
#define FPANEL_DG_PREV		2
#define FPANEL_DG_NEXT		3

fPanel_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	opis_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	changeLog_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	if(dialogid == 1958)
	{
		if(!response) return 1;

		switch(listitem)
		{
			case 0: factionLeaderPanel(playerid, FPANEL_MANAGEP);
			case 1: factionLeaderPanel(playerid, FPANEL_MANAGEV);
			case 2: factionLeaderPanel(playerid, FPANEL_MANAGES);
			case 3: factionLeaderPanel(playerid, FPANEL_SEJF);
		}

		return 1;
	}
	if(dialogid == 1959)
	{
		if( !response ) return factionLeaderPanel(playerid);

		switch( DynamicGui_GetValue(playerid, listitem) )
		{
			case FPANEL_DG_NEXT: showFactionWorkers(playerid, GetPVarInt(playerid, "fpanel_Page")+1);
			case FPANEL_DG_PREV: showFactionWorkers(playerid, GetPVarInt(playerid, "fpanel_Page")-1);
			case FPANEL_DG_OSOBA: 
			{
				new pracownik_uid = DynamicGui_GetDataInt(playerid, listitem);

				showEmployeeInfo(playerid, pracownik_uid);
			}
		}
	}
	if(dialogid == 1960)
	{
		if ( !response ) {
			showFactionWorkers(playerid, GetPVarInt(playerid, "fpanel_Page"));
			DeletePVar(playerid, "fpanel_uid");
			return 1;
		}

    	if(listitem == 3)
    	{
    		new pracownik_nick[26];
    		strmid(pracownik_nick, MruMySQL_GetNameFromUID(GetPVarInt(playerid, "fpanel_uid")), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
			if(ReturnUser(pracownik_nick) != INVALID_PLAYER_ID) {
                sendTipMessage(playerid, "Gracz jest online, u�yj /zwolnij");
                return showFactionWorkers(playerid, GetPVarInt(playerid, "fpanel_Page"));
            }
            if(MruMySQL_GetAccInt("Member", pracownik_nick) != PlayerInfo[playerid][pLider] ) return sendErrorMessage(playerid, "No �adne hakowanie!");
            MruMySQL_SetAccInt("Rank", pracownik_nick, 99);
            MruMySQL_SetAccInt("Member", pracownik_nick, 99);
            MruMySQL_SetAccInt("PodszywanieSie", pracownik_nick, 0);
            MruMySQL_SetAccInt("Uniform", pracownik_nick, 0);
            MruMySQL_SetAccInt("Team", pracownik_nick, 3);
            new msg[75];
            format(msg, sizeof(msg), "Zwolni�e� %s ze swojej frakcji", pracownik_nick, FractionNames[PlayerInfo[playerid][pLider]]);
            sendTipMessage(playerid, msg, COLOR_LIGHTBLUE);
            DeletePVar(playerid, "fpanel_uid");

            return showFactionWorkers(playerid, GetPVarInt(playerid, "fpanel_Page"));
    	} 
    	else if(listitem == 4)
    	{

    		new fracid = PlayerInfo[playerid][pLider];
    		new typ = 0;
    		new str[512];
		    for(new i=0;i<10;i++)
		    {
		        if(strlen((typ == 0) ? (FracRang[fracid][i]) : (FamRang[fracid][i])) < 2)
		            format(str, 512, "%s[%d] -\n", str, i);
		        else
		            format(str, 512, "%s[%d] %s\n", str, i, (typ == 0) ? (FracRang[fracid][i]) : (FamRang[fracid][i]));
		    }

		    return ShowPlayerDialogEx(playerid, 1966, DIALOG_STYLE_LIST, "Wybierz rang�, kt�r� chcesz nada� graczowi", str, "Nadaj", "Anuluj");
    	}
    	else
    	{
    		new uid = GetPVarInt(playerid, "fpanel_uid");
			DeletePVar(playerid, "fpanel_uid");    		
    		return showEmployeeInfo(playerid, uid);
    	}
	}
	if(dialogid == 1966)
	{
		if( !response )
		{
			showEmployeeInfo(playerid, GetPVarInt(playerid, "fpanel_uid"));
			DeletePVar(playerid, "fpanel_uid");
			return 1;
		}
		if(strlen(FracRang[GetPlayerFraction(playerid)][listitem]) < 1) return sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Ta ranga nie jest stworzona!");

		new pracownik_nick[26];
    	strmid(pracownik_nick, MruMySQL_GetNameFromUID(GetPVarInt(playerid, "fpanel_uid")), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
		if(ReturnUser(pracownik_nick) != INVALID_PLAYER_ID) {
            sendTipMessage(playerid, "Gracz jest online, u�yj /dajrange");
            return showFactionWorkers(playerid, GetPVarInt(playerid, "fpanel_Page"));
        }
        if(MruMySQL_GetAccInt("Member", pracownik_nick) != PlayerInfo[playerid][pLider] ) return sendErrorMessage(playerid, "No �adne hakowanie!");

		new upordown[58];
		upordown = (MruMySQL_GetAccInt("Rank", pracownik_nick) <= listitem) ? "Awansowa�e�" : "Zdegradowa�e�";
		MruMySQL_SetAccInt("Rank", pracownik_nick, listitem);

		new msg[144];

		format(msg, sizeof(msg), "%s %s na rang� %s", upordown, pracownik_nick, FracRang[PlayerInfo[playerid][pLider]][listitem]);
        sendTipMessage(playerid, msg, COLOR_LIGHTBLUE);

        new uid = GetPVarInt(playerid, "fpanel_uid");
		DeletePVar(playerid, "fpanel_uid");    		
    	return showEmployeeInfo(playerid, uid);
	}
	return 0;
}

showEmployeeInfo(playerid, employeeUid)
{
	new pracownik_nick[26], rankname[26], ranga, employeestring[1100];
    new isLider;
               
    strmid(pracownik_nick, MruMySQL_GetNameFromUID(employeeUid), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
    ranga = MruMySQL_GetAccInt("Rank", pracownik_nick);
    isLider = MruMySQL_GetAccInt("Lider", pracownik_nick);
    new dorangi = MruMySQL_GetAccInt("Member", pracownik_nick);

    if(isLider > 0) {
        sendTipMessage(playerid, "Dost�p do danych na temat os�b z panelem zabroniony", COLOR_LIGHTBLUE);
        return showFactionWorkers(playerid, GetPVarInt(playerid, "fpanel_Page"));
    }
    strmid(rankname, FracRang[dorangi][ranga], 0, 25, 26);
    format(employeestring, sizeof(employeestring), ""#KARA_STRZALKA"    �� "#KARA_TEKST"Nick: "#KARA_TEKST"%s", pracownik_nick);
    format(employeestring, sizeof(employeestring), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST"Ranga: "#KARA_TEKST"%s", employeestring, rankname);
    format(employeestring, sizeof(employeestring), "%s\n ", employeestring);
    format(employeestring, sizeof(employeestring), "%s\n"#HQ_COLOR_STRZALKA"    �� {dafc10}Wyrzu� Pracownika", employeestring);  
    format(employeestring, sizeof(employeestring), "%s\n"#HQ_COLOR_STRZALKA"    �� {dafc10}Zmie� rang�", employeestring);  
    SetPVarInt(playerid, "fpanel_uid", employeeUid);
    ShowPlayerDialogEx(playerid, 1960, DIALOG_STYLE_LIST, "Panel Lidera � Zarz�dzanie Pracownikiem", employeestring, "Ok", "Wstecz");
    return 1;
}

factionLeaderPanel(playerid, page = FPANEL_MAIN)
{
	if(page == FPANEL_MAIN)
	{
		new mainstring[350];
		new ftitle[130];
		new id = PlayerInfo[playerid][pLider];
    	format(mainstring, sizeof(mainstring), ""#KARA_TEKST"�� Zarz�dzanie pracownikami");
    	format(mainstring, sizeof(mainstring), "%s\n"#KARA_TEKST"�� Zarz�dzanie pojazdami", mainstring);
    	format(mainstring, sizeof(mainstring), "%s\n"#KARA_TEKST"�� Zarz�dzanie skinami", mainstring);
    	format(mainstring, sizeof(mainstring), "%s\n"#KARA_TEKST"�� Zarz�dzanie sejfem", mainstring);
    	format(ftitle, sizeof(ftitle), "%s", FractionNames[id]);
    	ShowPlayerDialogEx(playerid, 1958, DIALOG_STYLE_LIST, ftitle, mainstring, "Ok", "Wyjd�");
	}
	if(page == FPANEL_MANAGEP)
	{
		return showFactionWorkers(playerid, 1);
	}
	if(page == FPANEL_MANAGES)
	{
		sendTipMessage(playerid, "Ta opcja b�dzie dost�pna wkr�tce");
		return factionLeaderPanel(playerid);
	}
	if(page == FPANEL_MANAGEV)
	{
		sendTipMessage(playerid, "Ta opcja b�dzie dost�pna wkr�tce");
		return factionLeaderPanel(playerid);
	}
	return 1;
}


#define HELP_MAIN			0
#define HELP_TYPY_KAR 		1
#define HELP_PRZEWINIENIA	2
#define HELP_ZASADYKAR 		3
#define HELP_WHATISRP 		4
#define HELP_PROFITYFORO 	5
#define HELP_MOREHELP 		6
#define HELP_CMD			7

new opis_przewinienia[50][600];
new przewinienia[3000];

LoadPrzewinienia()
{
	new File:file = fopen("kary.mrp", io_read), line[700];
    format(przewinienia, sizeof(przewinienia), "Przewinienie\t\t\tTyp kary");
    new counter = 0;
    while(fread(file, line))
    {
        new typKary;
        new przewinienie[70];
        new typKaryStr[45];
        new opisp[600];
        sscanf(line, "p<|>s[70]ds[600]", przewinienie, typKary, opisp);
        switch(typKary) {
            case 0: typKaryStr = ""#KARA_NIEZNACZNA"Kara nieznaczna";
            case 1: typKaryStr = ""#KARA_LEKKA"Kara lekka";
            case 2: typKaryStr = ""#KARA_SREDNIA"Kara �rednia";
            case 3: typKaryStr = ""#KARA_CIEZKA"Kara ci�ka";
            case 4: typKaryStr = ""#KARA_BARDZOCIEZKA"Kara bardzo ci�ka";
            case 5: typKaryStr = ""#KARA_BANICJI"Kara banicji";
            case 6: typKaryStr = ""#KARA_SPECJALNA"Kara specjalna";
        }
        format(przewinienia, sizeof(przewinienia), "%s\n"#KARA_TEKST2"%s\t\t\t%s", przewinienia, przewinienie, typKaryStr);
        for(new i = strlen(opisp) - 1; i > -1; i--) {
            if(opisp[i] == '*') {
                opisp[i] = '\n';
            }
        }
        format(opis_przewinienia[counter], sizeof(opisp), "%s", opisp);
        counter++;
	}
}

noYsi_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	#pragma unused inputtext
	if(dialogid == 1590)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 1: ShowPodrecznik(playerid, HELP_TYPY_KAR);
			case 2: ShowPodrecznik(playerid, HELP_PRZEWINIENIA);
			case 3: ShowPodrecznik(playerid, HELP_ZASADYKAR);
			case 5: ShowPodrecznik(playerid, HELP_WHATISRP);
			case 6: ShowPodrecznik(playerid, HELP_PROFITYFORO);
			case 7: ShowPodrecznik(playerid, HELP_MOREHELP);
			case 9: RunCommand(playerid, "/pomoc2", "");
			default: ShowPodrecznik(playerid);
		}
	}
	else if(dialogid == 1591)
	{
		if(!response) return ShowPodrecznik(playerid);
		ShowPodrecznik(playerid, HELP_TYPY_KAR);
	}
	else if(dialogid == 1592)
	{
		if(!response) return ShowPodrecznik(playerid);
		ShowPlayerDialogEx(playerid, 1593, DIALOG_STYLE_MSGBOX, "Opis Przewinienia", opis_przewinienia[listitem], "Ok", "");
	}
	else if(dialogid == 1593)
	{
		if(response) return ShowPodrecznik(playerid);
		else return 1;
	}
	else if(dialogid == 1594)
	{
		if(response) return ShowPodrecznik(playerid);
	}
	return 0;
}

ShowPodrecznik(playerid, page=HELP_MAIN)
{
	new mainstring[2000];
	if( page == HELP_MAIN )
	{
		format(mainstring, sizeof(mainstring), ""#KARA_TEKST"Zasady panuj�ce na serwerze");
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST2"Typy Kar", mainstring);
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST2"Przewinienia", mainstring);
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST2"Zasady Nadawania Kar", mainstring);
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_TEKST"Dla nowicjuszy", mainstring);
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST2"Czym jest Role Play", mainstring);
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST2"Profity posiadania konta na forum", mainstring);
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST2"Jak uzyska� dodatkow� pomoc", mainstring);
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_TEKST"Inne", mainstring);
	    format(mainstring, sizeof(mainstring), "%s\n"#KARA_STRZALKA"    �� "#KARA_TEKST2"Komendy dost�pne na serwerze", mainstring);

	    ShowPlayerDialogEx(playerid, 1590, DIALOG_STYLE_LIST, "Podr�cznik", mainstring, "Dalej", "Wyjd�");
	}	
	if( page == HELP_TYPY_KAR )
	{
		new typy_kar[500];
        format(typy_kar, sizeof(typy_kar), "Stopie�\t\t\tKara");
        format(typy_kar, sizeof(typy_kar), "%s\n"#KARA_NIEZNACZNA"Kara Nieznaczna (I stopie�)\t\t\t"#KARA_TEKST2"Do 5 minut AJ", typy_kar);
        format(typy_kar, sizeof(typy_kar), "%s\n"#KARA_LEKKA"Kara Lekka (II stopie�)\t\t\t"#KARA_TEKST2"Do 10 minut AJ", typy_kar);
        format(typy_kar, sizeof(typy_kar), "%s\n"#KARA_SREDNIA"Kara �rednia (III stopie�)\t\t\t"#KARA_TEKST2"Do 20 minut AJ", typy_kar);
        format(typy_kar, sizeof(typy_kar), "%s\n"#KARA_CIEZKA"Kara Ci�ka (IV stopie�)\t\t\t"#KARA_TEKST2"Do 30 minut AJ, Warn", typy_kar);
        format(typy_kar, sizeof(typy_kar), "%s\n"#KARA_BARDZOCIEZKA"Kara Bardzo Ci�ka (V stopie�)\t\t\t"#KARA_TEKST2"Warn, Ban", typy_kar);
        format(typy_kar, sizeof(typy_kar), "%s\n"#KARA_SPECJALNA"Kara Specjalna\t\t\t"#KARA_TEKST2"Opisana przy przypadku", typy_kar);
        format(typy_kar, sizeof(typy_kar), "%s\n"#KARA_BANICJI"Kara Banicji\t\t\t"#KARA_TEKST2"Ban", typy_kar);
        ShowPlayerDialogEx(playerid, 1591, DIALOG_STYLE_TABLIST_HEADERS, "Typy Kar", typy_kar, "Ok", "Wr��");
	}

	if( page == HELP_PRZEWINIENIA ) 
	{
		ShowPlayerDialogEx(playerid, 1592, DIALOG_STYLE_TABLIST_HEADERS, "Przewinienia", przewinienia, "Ok", "Wr��");
	}

	if( page == HELP_ZASADYKAR )
	{
		new zasady[2000];
		format(zasady, sizeof(zasady), "1. Admin ma prawo nada� kar� tylko i wy��cznie za czynno�ci przewidziane w LKiZ oraz o wysoko�ci przewidzianej w LKiZ. \n\tZa jedn� czynno�� niezgodn� z LKiZ gracz mo�e otrzyma� tylko 1 kar�.");
        format(zasady, sizeof(zasady), "%s\n \n2. Je�eli czynno�� jest zabroniona w LKiZ, ale wykonywanie tej czynno�ci przez gracza nikomu nie przeszkadza oraz jest \n\takceptowana przez wszystkich obecnych graczy, admin mo�e si� powstrzyma� od ukarania (tylko gdy jest pewien, �e akcja nie przeszkadza �adnemu graczowi kt�ry j� widzi/s�yszy).", zasady);
        format(zasady, sizeof(zasady), "%s\n \n3. Staramy si� nadawa� kar� adekwatnie do sytuacji oraz postawy gracza", zasady);
        format(zasady, sizeof(zasady), "%s\n \n4. Obowi�zuje zakaz ��czenia warto�ci kar. Je�eli gracz pope�ni� 2 czyny do 15minut AJ oraz 1 do 30minut AJ to dajemy mu kar� maksymalnie 30 minut AJ \n\ti reszt� jego przewinie� mo�emy umie�ci� w nawiasie.", zasady);
        format(zasady, sizeof(zasady), "%s\n \n5. Podawany pow�d musi by� czytelny i jednoznaczny, powinien wyra�nie informowa� co gracz zrobi� �le.", zasady);
        format(zasady, sizeof(zasady), "%s\n \n6. Je�eli gracz z�o�y� skarg� na forum, stopie� kary mo�e zosta� podniesiony o 1 poziom (lub warto�� mo�e by� zwi�kszona x2 w przypadku kar specjalnych)", zasady);
        format(zasady, sizeof(zasady), "%s\n \n7. Je�eli jaka� czynno�� jest wykonywana nagminnie, pomimo upomnie� i kar, mo�na nada� warna \n\t(nawet je�eli stopie� przewinienia tego nie przewiduje) lub zwi�kszy� warto�� kary x2 lub stopie� kary o 1.", zasady);
        format(zasady, sizeof(zasady), "%s\n \n8. Je�eli czynno�� dotyczy wielu graczy, jest wykonywana na wi�cej ni� 3 osobach, mamy prawo podnie�� stopie� kary o 1. \n\t(np. HK dla 10 = Masowe HK i kara stopnia 5)\n\tUwaga! Przy nadawaniu takiej kary administrator musi wpisa� w powodzie s�owo \"Masowe\".\n\tUwaga! Zasada dzia�a jedynie dla nast�puj�cych przewinie�: DM(i jego odmiany), DB, HK, CK, DD/CZ", zasady);
        ShowPlayerDialogEx(playerid, 1594, DIALOG_STYLE_MSGBOX, "Zasady", zasady, "Ok", "");
	}

	if( page == HELP_WHATISRP )
	{
		new zasady[2350];
		format(zasady, sizeof(zasady), "To odgrywanie prawdziwego �ycia w �wiecie wirtualnym. Role Play na naszym serwerze polega na kreowaniu swojej postaci i odgrywaniu prawdziwego �ycia w grze. \nOznacza to �e mo�emy pracowa� (jako policjant, mechanik czy te� p�atny morderca), kupowa� domy, samochody oraz wiele innych rzeczy.");
        format(zasady, sizeof(zasady), "%s\nOdgrywamy tak�e r�ne sytuacje, np. napady na bank, wy�cigi uliczne, sprzeda� narkotyk�w. Nasze postacie zarabiaj� pieni�dze oraz zdobywaj� umiej�tno�ci i znajomo�ci.\n\tAby gra� zgodnie z zasadami RP - po prostu wczuj si� w posta� tak, jakby� to ty ni� by�.", zasady);
        format(zasady, sizeof(zasady), "%s\nJednak na naszym podej�ciu panuje tak�e tak zwane \"Lu�ne RP\". Oznacza to, �e na naszym serwerze odgrywanie prawdziwego �ycia\n\tprzystosowuje si� do warunk�w jakie daje GTA SA i to, �e nie musimy szanowa� �ycia swojej postaci jak w�asnego.", zasady);
        format(zasady, sizeof(zasady), "%s\nW ten spos�b aby odegrywa� prawid�owo nie pytamy si� siebie w my�li - \"co bym zrobi� gdybym by� \n\tw prawdziwym �yciu\" - tylko - \"co bym zrobi� w prawdziwym �yciu gdyby prawdziwe �ycie wygl�da�o tak jak sytuacja og�lna w grze\".", zasady);
        format(zasady, sizeof(zasady), "%s\n \nAby wczu� si� w Role Play panuj�cy na Mruczniku, prezentujemy kr�tki rys fabularny serwera: \n ", zasady);           
        format(zasady, sizeof(zasady), "%s\nLos Santos jest miastem opanowanym przez przest�pc�w, nawet cywile chodz� po mie�cie uzbrojeni. Ka�dy walczy o swoje miejsce si�� a tych,\n\t\tkt�rzy stoj� na drodze do ich celu traktuj� seri� z ka�acha.", zasady);
        format(zasady, sizeof(zasady), "%s\nSantos to nie el dorado pokoju gdzie ludzie �yj� w zgodzie z Policj� i wszyscy po�wi�caj� si� radosnej i owocnej wsp�pracy.\n\tTo miasto, w kt�rym co drugi obywatel jest kryminalist� a na ka�dym zakr�cie mo�e czeka� ci� �mier�.", zasady);
        format(zasady, sizeof(zasady), "%s\nWi�c nie czekaj, we� sprawy w swoje r�c� i do��cz do ludzi siej�cych zam�t w Los Santos lub grup, kt�re maj� na celu uspokojenie mot�ochu i sprawienie by sprawiedliwo�� zatriumfowa�a.\n\tB�d� zosta� (nie)uczciwym pracownikiem i sta� si� najbogatszym cz�owiekiem w LS.", zasady);
        format(zasady, sizeof(zasady), "%s\n \nJak �ycie twojej postaci potoczy si� dalej, zale�y tylko i wy��cznie od ciebie! Powodzenia!", zasady);
		ShowPlayerDialogEx(playerid, 1594, DIALOG_STYLE_MSGBOX, "Czym jest Role Play", zasady, "Ok", ""); 
	}

	if( page == HELP_PROFITYFORO )
	{
		new zasady[900];
		format(zasady, sizeof(zasady), ""#KARA_TEKST2"Opcja\t"#KARA_BANICJI"Bez forum\t"#KARA_NIEZNACZNA"Z forum");
        format(zasady, sizeof(zasady), "%s\n"#KARA_TEKST2"Swobodna gra na serwerze\t"#KARA_NIEZNACZNA"Tak\t"#KARA_NIEZNACZNA"Tak", zasady);
        format(zasady, sizeof(zasady), "%s\n"#KARA_TEKST2"Branie udzia�u w �yciu spo�eczno�ci\t"#KARA_BANICJI"Nie\t"#KARA_NIEZNACZNA"Tak", zasady);
        format(zasady, sizeof(zasady), "%s\n"#KARA_TEKST2"Do��czanie do frakcji\t"#KARA_SREDNIA"Zazwyczaj nie\t"#KARA_NIEZNACZNA"Tak", zasady);
        format(zasady, sizeof(zasady), "%s\n"#KARA_TEKST2"Dost�p do poradnik�w\t"#KARA_BANICJI"Nie\t"#KARA_NIEZNACZNA"Tak", zasady);
        format(zasady, sizeof(zasady), "%s\n"#KARA_TEKST2"Dost�p do informacji o aktualizacjach\t"#KARA_BANICJI"Nie\t"#KARA_NIEZNACZNA"Tak", zasady);
        format(zasady, sizeof(zasady), "%s\n \n \n"#KARA_TEKST2"Nie czekaj! Zarejestruj si� na {FFFFFF}Mrucznik-RP.pl", zasady);

        ShowPlayerDialogEx(playerid, 1594, DIALOG_STYLE_TABLIST_HEADERS, "Profity posiadania konta na Forum", zasady, "Ok", ""); 
	}

	if ( page == HELP_MOREHELP )
	{
		ShowPlayerDialogEx(playerid, 1594, DIALOG_STYLE_MSGBOX, "Profity posiadania konta na Forum", "W celu uzyskania dodatkowej pomocy, skorzystaj z komendy /zapytaj.\n \nWpisz /zapytaj [NAG��WEK- na przyk�ad SALON AUT] Tre��- na przyk�ad: gdzie znajduje si� salon aut\n \n", "Ok", ""); 	
	}

	return 1;
}




#define HQ_MAIN 	1
#define HQ_WL		2
#define HQ_ZGL		3

#define DG_SELECT_ZGL	1


hq_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	fPanel_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	noYsi_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	if(dialogid == 1595)
	{
		if(!response) return 1;
		if(listitem == 0)
			ShowHeadquarters(playerid, HQ_WL);
		if(listitem == 1)
			ShowHeadquarters(playerid, HQ_ZGL);
	}
	if(dialogid == 1596)
	{
		if(!response) return ShowHeadquarters(playerid);
		if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLider] == 1)
		{
			new string[2500];
			if(!response) return ShowHeadquarters(playerid);

			//new szczegol;
			new dg_value = DynamicGui_GetValue(playerid, listitem), dg_data = DynamicGui_GetDataInt(playerid, listitem);

			if(response && dg_value != DG_SELECT_ZGL) return 1;

	        format(string, sizeof(string), ""#HQ_COLOR_TEKST2"Informacja o zg�oszeniu");
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_PLACEHOLDER"====================================================", string);
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Tre��: "#HQ_COLOR_TEKST2"%s", string, Zgloszenie[dg_data][zgloszenie_tresc]);
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Godzina: "#HQ_COLOR_TEKST2"%s", string, Zgloszenie[dg_data][zgloszenie_kiedy]);
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Zg�osi�: "#HQ_COLOR_TEKST2"%s", string, Zgloszenie[dg_data][zgloszenie_nadal]);
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Obszar: "#HQ_COLOR_TEKST2"%s", string, Zgloszenie[dg_data][zgloszenie_lokacja]);
	        new statusTxt[30];
	        switch(Zgloszenie[dg_data][zgloszenie_status]) {
	            case 0: statusTxt = "Nie podj�to jeszcze decyzji";
	            case 1: statusTxt = "Akceptowane";
	            case 2: statusTxt = "Odrzucone";
	            case 3: statusTxt = "Fa�szywe";
	            case 4: statusTxt = "Wykonane";
	            case 5: statusTxt = "Anulowane";
	        }
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Status: "#HQ_COLOR_TEKST2"%s", string, statusTxt);
	        format(string, sizeof(string), "%s\n ", string);
	        if(Zgloszenie[dg_data][zgloszenie_status] == 1) {
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Przyj��: "#HQ_COLOR_TEKST2"%s", string, Zgloszenie[dg_data][zgloszenie_przyjal]);
	            if(!strcmp(Zgloszenie[dg_data][zgloszenie_przyjal], GetNick(playerid, true))) {
	                format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_AKCEPTOWANE"Oznacz jako: WYKONANE", string);
	                format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ODRZUCONE"Oznacz jako: FA�SZYWE", string);    
	                format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ANULOWANE"Oznacz jako: ANULOWANE", string);
	            }
	        } else if(Zgloszenie[dg_data][zgloszenie_status] == 0) {
	            format(string, sizeof(string), "%s\n ", string);
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_AKCEPTOWANE"Akceptuj zg�oszenie", string);
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ODRZUCONE"Odrzu� zg�oszenie", string);    
	        } else if(Zgloszenie[dg_data][zgloszenie_status] == 2) {
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Odrzuci�: "#HQ_COLOR_TEKST2"%s", string, Zgloszenie[dg_data][zgloszenie_przyjal]);
	        } else {
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Wyda� decyzj�: "#HQ_COLOR_TEKST2"%s", string, Zgloszenie[dg_data][zgloszenie_przyjal]);
			}

			SetPVarInt(playerid, "zarzadzajZgl", dg_data);

			ShowPlayerDialogEx(playerid, 1597, DIALOG_STYLE_LIST, "Szczeg�y Zgloszenia", string, "Wybierz", "Wr��");
		}
		if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLider] == 3)
		{
			new string[2500];
			if(!response) return ShowHeadquarters(playerid);

			//new szczegol;
			new dg_value = DynamicGui_GetValue(playerid, listitem), dg_data = DynamicGui_GetDataInt(playerid, listitem);

			if(response && dg_value != DG_SELECT_ZGL) return 1;

	        format(string, sizeof(string), ""#HQ_COLOR_TEKST2"Informacja o zg�oszeniu");
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_PLACEHOLDER"====================================================", string);
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Tre��: "#HQ_COLOR_TEKST2"%s", string, ZgloszenieSasp[dg_data][zgloszenie_tresc]);
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Godzina: "#HQ_COLOR_TEKST2"%s", string, ZgloszenieSasp[dg_data][zgloszenie_kiedy]);
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Zg�osi�: "#HQ_COLOR_TEKST2"%s", string, ZgloszenieSasp[dg_data][zgloszenie_nadal]);
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Obszar: "#HQ_COLOR_TEKST2"%s", string, ZgloszenieSasp[dg_data][zgloszenie_lokacja]);
	        new statusTxt[30];
	        switch(ZgloszenieSasp[dg_data][zgloszenie_status]) {
	            case 0: statusTxt = "Nie podj�to jeszcze decyzji";
	            case 1: statusTxt = "Akceptowane";
	            case 2: statusTxt = "Odrzucone";
	            case 3: statusTxt = "Fa�szywe";
	            case 4: statusTxt = "Wykonane";
	            case 5: statusTxt = "Anulowane";
	        }
	        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Status: "#HQ_COLOR_TEKST2"%s", string, statusTxt);
	        format(string, sizeof(string), "%s\n ", string);
	        if(ZgloszenieSasp[dg_data][zgloszenie_status] == 1) {
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Przyj��: "#HQ_COLOR_TEKST2"%s", string, ZgloszenieSasp[dg_data][zgloszenie_przyjal]);
	            if(!strcmp(ZgloszenieSasp[dg_data][zgloszenie_przyjal], GetNick(playerid, true))) {
	                format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_AKCEPTOWANE"Oznacz jako: WYKONANE", string);
	                format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ODRZUCONE"Oznacz jako: FA�SZYWE", string);    
	                format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ANULOWANE"Oznacz jako: ANULOWANE", string);
	            }
	        } else if(ZgloszenieSasp[dg_data][zgloszenie_status] == 0) {
	            format(string, sizeof(string), "%s\n ", string);
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_AKCEPTOWANE"Akceptuj zg�oszenie", string);
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ODRZUCONE"Odrzu� zg�oszenie", string);    
	        } else if(ZgloszenieSasp[dg_data][zgloszenie_status] == 2) {
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Odrzuci�: "#HQ_COLOR_TEKST2"%s", string, ZgloszenieSasp[dg_data][zgloszenie_przyjal]);
	        } else {
	            format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Wyda� decyzj�: "#HQ_COLOR_TEKST2"%s", string, ZgloszenieSasp[dg_data][zgloszenie_przyjal]);
			}

			SetPVarInt(playerid, "zarzadzajZgl", dg_data);

			ShowPlayerDialogEx(playerid, 1597, DIALOG_STYLE_LIST, "Szczeg�y Zgloszenia", string, "Wybierz", "Wr��");
		}
	}
	if(dialogid == 1597)
	{
		if(!response) return ShowHeadquarters(playerid);
		if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLider] == 1)
		{
			new szczegol = GetPVarInt(playerid, "zarzadzajZgl");
	        if(listitem == 9)
	        {
	            new zglstatus = Zgloszenie[szczegol][zgloszenie_status];
	            if(zglstatus == 0)
	            {
	                if(!strcmp(Zgloszenie[szczegol][zgloszenie_nadal], "Brak")) return sendErrorMessage(playerid, "Pustych zg�osze� nie mo�na akceptowa�!");
	                strmid(Zgloszenie[szczegol][zgloszenie_przyjal], GetNick(playerid, true), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
	                Zgloszenie[szczegol][zgloszenie_status] = 1;
	            }
	            else
	            { 
	                Zgloszenie[szczegol][zgloszenie_status] = 4;
	            }
	        } else if (listitem == 10) {
	            new zglstatus = Zgloszenie[szczegol][zgloszenie_status];
	            if(zglstatus == 0) {
	                if(!strcmp(Zgloszenie[szczegol][zgloszenie_nadal], "Brak")) return sendErrorMessage(playerid, "Pustych zg�osze� nie mo�na odrzuca�!");
	                strmid(Zgloszenie[szczegol][zgloszenie_przyjal], GetNick(playerid, true), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
	                Zgloszenie[szczegol][zgloszenie_status] = 2;
	            } else {
	                Zgloszenie[szczegol][zgloszenie_status] = 3;
	            }
	        } else if(listitem == 11) {
	            Zgloszenie[szczegol][zgloszenie_status] = 5;
	        }
	        ShowHeadquarters(playerid, HQ_ZGL);
    	}
    	if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLider] == 3)
		{
			new szczegol = GetPVarInt(playerid, "zarzadzajZgl");
	        if(listitem == 9)
	        {
	            new zglstatus = ZgloszenieSasp[szczegol][zgloszenie_status];
	            if(zglstatus == 0)
	            {
	                if(!strcmp(ZgloszenieSasp[szczegol][zgloszenie_nadal], "Brak")) return sendErrorMessage(playerid, "Pustych zg�osze� nie mo�na akceptowa�!");
	                strmid(ZgloszenieSasp[szczegol][zgloszenie_przyjal], GetNick(playerid, true), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
	                ZgloszenieSasp[szczegol][zgloszenie_status] = 1;
	            }
	            else
	            { 
	                ZgloszenieSasp[szczegol][zgloszenie_status] = 4;
	            }
	        } else if (listitem == 10) {
	            new zglstatus = ZgloszenieSasp[szczegol][zgloszenie_status];
	            if(zglstatus == 0) {
	                if(!strcmp(ZgloszenieSasp[szczegol][zgloszenie_nadal], "Brak")) return sendErrorMessage(playerid, "Pustych zg�osze� nie mo�na odrzuca�!");
	                strmid(ZgloszenieSasp[szczegol][zgloszenie_przyjal], GetNick(playerid, true), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
	                ZgloszenieSasp[szczegol][zgloszenie_status] = 2;
	            } else {
	                ZgloszenieSasp[szczegol][zgloszenie_status] = 3;
	            }
	        } else if(listitem == 11) {
	            ZgloszenieSasp[szczegol][zgloszenie_status] = 5;
	        }
	        ShowHeadquarters(playerid, HQ_ZGL);
    	}
	}
	return 0;
}


ShowHeadquarters(playerid, page=HQ_MAIN)
{
	if(page == HQ_MAIN)
	{
		new string[256];
		format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Lista poszukiwanych", string);
        format(string, sizeof(string), "%s\n"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"Ostatnie zg�oszenia", string);

  		ShowPlayerDialogEx(playerid, 1595, DIALOG_STYLE_LIST, "HeadQuarters/MDC", string, "Ok", "Wyjd�");
	}
	if(page == HQ_WL)
	{
		RunCommand(playerid, "/wanted", "");
		return ShowHeadquarters(playerid);
	}
	if(page == HQ_ZGL)
	{
		DynamicGui_Init(playerid);
		new string[1200] = "";
		format(string, sizeof(string), "");
		if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLider] == 1)
		{
			for(new i = 0, j=OSTATNIE_ZGLOSZENIA; i<j; i++) {
		        if(Zgloszenie[i][zgloszenie_status] == 0) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"%s\n", string, Zgloszenie[i][zgloszenie_tresc]);
			    } else if(Zgloszenie[i][zgloszenie_status] == 1) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_AKCEPTOWANE"%s\n", string, Zgloszenie[i][zgloszenie_tresc]);
			    } else if(Zgloszenie[i][zgloszenie_status] == 2) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ODRZUCONE"[Odrzucone] %s\n", string, Zgloszenie[i][zgloszenie_tresc]);
			    } else if(Zgloszenie[i][zgloszenie_status] == 3) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_FALSZYWE"[Fa�szywe] %s\n", string, Zgloszenie[i][zgloszenie_tresc]);
			    } else if(Zgloszenie[i][zgloszenie_status] == 4) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_WYKONANE"[Wykonane] %s\n", string, Zgloszenie[i][zgloszenie_tresc]);
			    } else if(Zgloszenie[i][zgloszenie_status] == 5) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ANULOWANE"[Anulowane] %s\n", string, Zgloszenie[i][zgloszenie_tresc]);
		        }
	        	DynamicGui_AddRow(playerid, DG_SELECT_ZGL, i);
        	}
        	ShowPlayerDialogEx(playerid, 1596, DIALOG_STYLE_LIST, ("Ostatnie zg�oszenia"), string, "Ok", "Wstecz");
		}
		if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLider] == 3)
		{
	        for(new i = 0, j=OSTATNIE_ZGLOSZENIASASP; i<j; i++) {
		        if(ZgloszenieSasp[i][zgloszenie_status] == 0) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_TEKST"%s\n", string, ZgloszenieSasp[i][zgloszenie_tresc]);
			    } else if(ZgloszenieSasp[i][zgloszenie_status] == 1) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_AKCEPTOWANE"%s\n", string, ZgloszenieSasp[i][zgloszenie_tresc]);
			    } else if(ZgloszenieSasp[i][zgloszenie_status] == 2) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ODRZUCONE"[Odrzucone] %s\n", string, ZgloszenieSasp[i][zgloszenie_tresc]);
			    } else if(ZgloszenieSasp[i][zgloszenie_status] == 3) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_FALSZYWE"[Fa�szywe] %s\n", string, ZgloszenieSasp[i][zgloszenie_tresc]);
			    } else if(ZgloszenieSasp[i][zgloszenie_status] == 4) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_WYKONANE"[Wykonane] %s\n", string, ZgloszenieSasp[i][zgloszenie_tresc]);
			    } else if(ZgloszenieSasp[i][zgloszenie_status] == 5) {
			        format(string, sizeof(string), "%s"#HQ_COLOR_STRZALKA"    �� "#HQ_COLOR_ANULOWANE"[Anulowane] %s\n", string, ZgloszenieSasp[i][zgloszenie_tresc]);
		        }
		        DynamicGui_AddRow(playerid, DG_SELECT_ZGL, i);
	        }
	        ShowPlayerDialogEx(playerid, 1596, DIALOG_STYLE_LIST, ("Ostatnie zg�oszenia"), string, "Ok", "Wstecz");
    	}
	}
	return 1;
}
