//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ dolacz ]------------------------------------------------//
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

CMD:join(playerid) return cmd_dolacz(playerid);
CMD:dolacz(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pJob] == 0 )
		{
		    if(PlayerInfo[playerid][pJob] == 0 )
			{
			    if((PlayerInfo[playerid][pMember] >= 1 && PlayerInfo[playerid][pMember] <= 4) || (PlayerInfo[playerid][pMember] >= 9 && PlayerInfo[playerid][pMember] <= 11) 
					|| (PlayerInfo[playerid][pLider] >= 1 && PlayerInfo[playerid][pLider] <= 4) || (PlayerInfo[playerid][pLider] >= 9 && PlayerInfo[playerid][pLider] <= 11))
			    {
			        sendTipMessageEx(playerid, COLOR_GREY, "Musisz by� cywilem albo cz�onkiem rodziny/mafii/gangu aby wzi�� t� prac�!");
			        return 1;
			    }
			    if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,322.3034,317.0233,999.1484))
				{
				    if(PlayerInfo[playerid][pGunLic] == 1)
				    {
					    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLider] > 0 || GetPlayerOrg(playerid) != 0) { sendTipMessageEx(playerid, COLOR_GREY, "Frakcje nie mog� bra� tej pracy !"); return 1; }
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� �owcy� Nagr�d, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
					    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
					    SendClientMessage(playerid, COLOR_WHITE, "   Twoje zadanie polega na �ciganiu przest�pc�w i oferowania im poddania si�. W przypadku odmowy stosuje si� bardziej radykalne metody...");
					    SendClientMessage(playerid, COLOR_WHITE, "   Wynagrodzenie zale�y od wysoko�ci WL oraz sposobu zatrzymania (za �ywego dostaje si� wi�cej)");
					    SendClientMessage(playerid, COLOR_WHITE, "   Wy�szy skill pozwala na d�u�sze namierzanie, dost�p do bardziej niebezpiecznych przest�pc�w i lepszych pojazd�w.");
					    SendClientMessage(playerid, COLOR_WHITE, "   Dobry �owca nagr�d mo�e zarobi� ponad 50k w godzin�. Pocz�tkuj�cy jakie� 6k-10k. Minus koszty broni. Pieni�dze wyp�acamy od razu.");
					    SendClientMessage(playerid, COLOR_WHITE, "   Je�eli masz troch� kasy na bro�, masz nerwy ze stali, mn�stwo sprytu i cierpliwo�ci to ta wymagaj�ca praca jest dla Ciebie.");
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
					    GettingJob[playerid] = 1;
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_WHITE, "Do tej pracy wymagana jest licencja na bro�");
					}
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,310.3626,-1503.3282,13.8096))
				{
				    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLider] > 0 || GetPlayerOrg(playerid) != 0) { sendTipMessageEx(playerid, COLOR_GREY, "Frakcje nie mog� bra� tej pracy !"); return 1; }
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Prawnikiem, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Do twoich zada� nale�y wyci�ganie ludzi z wi�zienia (za kaucj� lub bez), czyszczenia im kartotek i obni�ania poziom�w poszukiwania");
				    SendClientMessage(playerid, COLOR_WHITE, "   Praca jest legalna jednak w LS dobry prawnik to taki kt�ry zna sporo skorumpowanych gliniarzy lub ma znajomego w policji...");
				    SendClientMessage(playerid, COLOR_WHITE, "   Jako pocz�tkuj�cy prawnik w g�ownej mierze b�dziesz zajmowa� si� drobnymi z�odziejaszkami, zarobki r�wnie� nie sa wysokie a o klienta trudno.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Tylko najlepsi prawnicy w mie�cie maj� szans� na zarobki z rz�du 200k-300k na godzin�, wi�kszo�� zarabia ok. 30k, pieni�dze otrzymujesz od klient�w.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Wy�szy skill umo�liwia zbijanie wy�szych poziom�w WL, uwlanianie gro�niejszych przest�pc�w oraz zmniejsza koszty �ap�wek.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 2;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1215.1304,-11.8431,1000.9219))
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Prostytutk�, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Praca polega na zaspokajaniu potrzeb seksualnych mieszka�c�w.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Jeden z kilku wymagaj�cyh zawod�w. Nie sprowadza si� on tylko do wpisania komendy.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Tutaj najwa�niejsze jest dobre odgrywanie na /me i /do, im b�dzie ono lepsze tym wy�szy zarobek.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Mimo, ze praca posiada skill nie ma on tak du�ego znaczenia. Gdy� nikt nie wynajmuje prostytutki aby doda� sobie HP.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Je�eli potrafisz dobrze odgrywa� akcje mo�esz zarobi� nawet 500k za godzin�, jednak zazwyczaj jest to 40k-70k. Pieni�dze dostajesz od klient�w.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 3;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,2166.3772,-1675.3829,15.0859))
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Dilerem Drag�w, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Masz za zadanie odbiera� dragi z meliny i rozprowadza� je po ca�ym Los Santos, ty dyktujesz cen�.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Sprzedaj�c narkotyki nie daj sie z�apac policji kt�ra tylko czeka na okazj� by przyskrzyni� dilera.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Niestety popularno�� narkotyk�w maleje i nowy diler przy du�ym szcz�ciu zarabia ok. 7k za godzin�.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Im wy�szy skill tym wi�cej narkotyk�w mo�esz miec przy sobie, spada te� ich cena w melinie.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Ta praca jest najlepsza dla os�b kt�re ju� s� albo aspiruj� do bycia gangsterem. To co zarobisz wyp�acamy co godzin� (w Pay Day)");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 4;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1109.3318,-1796.3042,16.5938))
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Z�odziejem Aut, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Twoje zadanie jest bardzo proste. Ukra�� w�z i przewie�� go w stanie nienaruszonym na statek przemytnik�w w San Fierro.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Tylko niekt�re pojazdy w Los Santos mo�na ukra��. Dodatkowo przemytnicy przyjmuj� twoje �upy co 20 minut.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Im wy�szy skill tym wi�cej dostaniesz od przemytnik�w za pojazd oraz �atwiej b�dzie ci co� zw�dzi�.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Warto r�wnie� zaparkowa� sw�j w�asny pojazd pod statkiem przemytnik�w �eby mie� czym wr�ci� do Los Santos.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Zarobki to ok. 20k za godzin�, tak ma�o g��wnie dlatego �e to �atwe zaj�cie. To co zarobisz wyp�acamy co godzin� (w Pay Day)");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 5;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,-1932.3859,276.2117,41.0391) || PlayerToPoint(5.0, playerid,2769.8376,-1610.7819,10.9219))
				{
				    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLider] > 0 || GetPlayerOrg(playerid) != 0) { sendTipMessageEx(playerid, COLOR_GREY, "Frakcje nie mog� wzi�c tej pracy!"); return 1; }
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Mechanikiem, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Naprawiaj, tankuj, tunninguj, odbieraj zlecenia z terenu. To przede wszytkim robi mechanik.");
				    SendClientMessage(playerid, COLOR_WHITE, "   m�wi�, �e to najlepsza praca dla pocz�tkuj�cego gracza. I maj� racj�. Nie trzeba mie� prawka ani do�wiadczenia. Wystarcz� dore ch�ci.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Na pocz�tku wystarczy, �e pokr�cisz si� w okolicach naszej bazy lub Urz�du Miasta oferuj�c kierowcom tankowanie lub napraw�.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Zarobki nie s� na pocz�tku osza�amiaj�ce, jakie� 3k-7k co godzin�. Jednak zdobywa si� je do�� �atwo i przyjemnie. Pracy dla mechanik�w nigdy nie brakuje.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Wy�szy skill pozwala si� porusza� specjalnymi pojazdami oraz umo�liwia tunningowanie pojazd�w, ktore jest bardziej dochodowe ni� ich serwisowanie.");
				    SendClientMessage(playerid, COLOR_WHITE, "   To co zarobisz wyp�acamy co godzin� (w Pay Day). W przypadku tunningu to ty pobierasz pieni�dze od klient�w (zawsze ��daj wi�cej ni� kosztuje us�uga).");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 7;
		  		}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,2226.1716,-1718.1792,13.5165))
				{
				    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLider] > 0 || GetPlayerOrg(playerid) != 0) { sendTipMessageEx(playerid, COLOR_GREY, "Frakcje nie mog� bra� tej pracy !"); return 1; }
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Ochroniarzem, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Mo�esz ochrania� ludzi, jednak jest to tylko przykrywka dla sprzedawania pancerzy - tym masz si� przede wszytkim zajmowa�.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Praca jest do�� monotonna gdy� praktycznie polega na wciskaniu wszytkim kamizelki kuloodpornej.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Podobno niekt�rzy przy du�ym szcz�ciu potrafia zarobi� nawet 90k-130k. Jednak norm� jest 10k a przy du�ym pechu 2k.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Praca nie posiada systemu skilla. To co zarobisz wyp�acamy co godzin� (w Pay Day).");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 8;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1366.7279,-1275.4633,13.5469) && IsADilerBroni(playerid))
		  		{
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Dilerem Broni, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Sprzedajesz nielegaln� bro� tym, kt�rzy nie s� w stanie naby� jej w legalny spos�b. Praca jest nielaglna.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Jednak zanim przyst�pisz do sprzeda�y musisz zdoby� zabronione w LS materia�y. To do�� skomplikowany proces.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Pakiet max. 10paczek odbierzesz w budynku ko�o wypo�yczalni aut. Fabryka w Ocean Docks przerobi je na 500 materia��w.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Dopiero z materia��w mo�esz wyrabia� bro�. Im wy�szy skill tym lepsze broni znajd� sie w twojej ofercie. ");
				    SendClientMessage(playerid, COLOR_WHITE, "   Dobry diler potrafi zarobic nawet 150k w godzin�. Jednak pocz�tkuj�cy cz�sto musz� dok�ada� do interesu. Ty pobierasz pieni�dze od klient�w.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 9;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1154.2208,-1770.8203,16.5992))
		  		{
		  		    if(PlayerInfo[playerid][pCarLic] == 1)
				    {
					    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLider] > 0 || GetPlayerOrg(playerid) != 0) { sendTipMessageEx(playerid, COLOR_GREY, "Frakcje nie mog� bra� tej pracy !"); return 1; }
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Kierowc� Autobusu, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
	 				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
					    SendClientMessage(playerid, COLOR_WHITE, "   Pod��asz wyznaczonymi trasami, zatrzymujesz si� na przystankach i wozisz mieszka�cow Los Santos. Busy jako taks�wki? Zapomnij, to tylko dla najepszych.");
					    SendClientMessage(playerid, COLOR_WHITE, "   Pocz�tkuj�cy kierowcy maj� ma�y wyb�r tras a ich jedynym pojazdem jest Moonbeam - czyli mini bus.");
					    SendClientMessage(playerid, COLOR_WHITE, "   Wy�szy skill to  g��wnie wy�sze zarobki, ale do�wiadczeni busiarze dzia�aj� tak�e jako tanie taks�wki, organizuj� wycieczki lub realizuj� kursy mi�dzymiastowe.");
					    SendClientMessage(playerid, COLOR_WHITE, "   Przeci�tny pracowity kierowca zarabia ok. 10k na godzin�. Najlepsi mog� zarobi� nawet kilkaset tysi�cy.");
					    SendClientMessage(playerid, COLOR_WHITE, "   To praca dla tych kt�rzy lubi� komunikacj� publiczn�. Inaczej stanie si� ona do�� monotonna. P�acimy po zako�czneniu trasy lub s�u�by.");
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
					    GettingJob[playerid] = 10;
					}
					else
					{
					    sendTipMessageEx(playerid, COLOR_WHITE, "Do tej pracy wymagane jest prawo jazdy");
					}
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,766.0804,14.5133,1000.7004))
		  		{
		  		    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLider] > 0 || GetPlayerOrg(playerid) != 0) { sendTipMessageEx(playerid, COLOR_GREY, "Frakcje nie mog� bra� tej pracy !"); return 1; }
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Bokserem, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Jako bokser bierzesz udzia� w galach boksu, toczysz za pieni�dze sparingi z innymi i uczysz nowych technik walki.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Jednak prawda jest taka, �e gale s� bardzo rzadko, za sparingi ma�o kto chce p�aci� i tak naprawd� pe�nisz rol� nauczyciela.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Praca posiada system skilla oraz licznik wygranych walk. Tw�j tytu� bokserski zale�y od liczby zwyci�stw. Skill zwi�ksza liczb�...");
				    SendClientMessage(playerid, COLOR_WHITE, "   ...punkt�w HP jakie otrzymujesz na pocz�tku walki oraz daje dost�p do nauczania lepszych styl�w walki.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Zarobki s� bardzo zr�nicowane i zale�� od skilla. Zazwyczaj jest to ok. 30k ale nie jest to zarobek regularny.");
				    SendClientMessage(playerid, COLOR_WHITE, "   To co zarobisz za sparingi wyp�acamy co godzin� (w Pay Day). Za nauczanie pobierasz op�at� sam.");
				    SendClientMessage(playerid, COLOR_WHITE, "   Kwoty podane przy sztukach walki to pieni�dze jakie zostan� ci zabrane. Podawaj zawsze wy�sze ceny by osi�gn�� zysk.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 12;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1751.4445, -2054.9761, 13.0593))//-77.7288,-1136.3896,1.0781
		  		{
                    if(PlayerInfo[playerid][pCarLic] != 1) return sendTipMessageEx(playerid, COLOR_WHITE, "Do tej pracy wymagane jest prawo jazdy");

		  		    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLider] > 0 || GetPlayerOrg(playerid) != 0) { sendTipMessageEx(playerid, COLOR_GREY, "Families cannot take on this Job !"); return 1; }
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Chcesz zosta� Truckerem, lecz najpierw musisz podpisa� kontrakt na 5 godzin.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Aby zrezygnowa� z tej pracy musi min�� czas kontraktu, dopiero wtedy b�dziesz m�g� si� zwolni�.");
				    SendClientMessage(playerid, COLOR_P@, "   -----Informacje o pracy i warunki kontraktu-----");
				    SendClientMessage(playerid, COLOR_WHITE, "   Praca polega na przewo�eniu w�zkiem wid�owym paczek do magazynu.");
                    SendClientMessage(playerid, COLOR_WHITE, "   W niej r�wnie� transportujesz towar w wyznaczone miejsca.");
                    SendClientMessage(playerid, COLOR_WHITE, "   Praca nie przynosi kokos�w zw�aszcza siedz�c na w�zku. Mo�na zarobi� 34.1k na godzin�.");
                    SendClientMessage(playerid, COLOR_WHITE, "   Atutem jest zarabianie kasy do r�ki, za ka�de wykonane zlecenie.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Je�li akceptujesz zasady kontraktu wpisz /akceptuj praca.");
				    GettingJob[playerid] = 16;
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Nie posiadasz dowodu osobistego, wyr�b go w Urz�dzie Miasta !");
			}
		}
		else
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Masz ju� prac�, wpisz /quitjob aby z niej zrezygnowa� !");
		}
	}//not connected
    return 1;
}



