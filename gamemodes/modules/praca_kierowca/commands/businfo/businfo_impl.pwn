//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  businfo                                                  //
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
command_businfo_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(GUIExit[playerid] == 0)
    	{
            command_businfo_showDialog(playerid);
		}
	}
    return 1;
}

command_businfo_showDialog(playerid)
{
    ShowPlayerDialogEx(playerid, 5000, DIALOG_STYLE_LIST, "Wybierz interesuj�c� ci� zagadnienie", "Linia 55 - skill 1\nLinia 72 - skill 1\nLinia 82 - skill 2\nLinia 96 - skill 2\nLinia 85 - skill 2\nInformacje\nPomoc", "Wybierz", "Wyjd�");
}

command_businfo_dialog(playerid, dialogid, response, listitem, inputtext[])
{
	#pragma unused inputtext
    if(dialogid == 5000)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0:
                {
                    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 55","Przystanki ko�cowe:\nKo�ci� <==> Mrucznik Tower\n\nCzas przejazdu trasy: 9minut \n\nIlo�� przystank�w: 13\n\nSzczeg�owy rozpis trasy:\n Ko�ci�\n Motel Jefferson\n Glen Park\n Skate Park\n Unity Station\n Urz�d Miasta\n Bank\n Kasyno\n Market Station\n Baza San News i Restauracja\n Siedziba FBI\n Molo W�dkarskie\n Mrucznik Tower","Wr��","Wyjd�");
                    //\n\nOpis:\n Wsiadaj�c do tego autobusu na pewno odwiedzisz\n ka�de miejsce naprawd� warte twojej uwagi\n Jednak z powodu du�ej liczby przystnak�w\n czas podr�y znacznie si� wyd�u�a.
                }
                case 1:
                {
                    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 72","Przystanki ko�cowe:\nBaza Mechanik�w <==> Mrucznik Tower\n\nCzas przejazdu trasy: 3min 50s\n\nIlo�� przystank�w: 9\n\nSzczeg�owy rozpis trasy:\n Mrucznik Tower (praca prawnika i �owcy)\n Market Station\n Szpital\n AmmuNation (praca dilera broni)\n Bank)\n Urz�d Miasta (wyr�b licencji)\n Stacja Benzynowa\n Si�ownia (praca ochroniarza - sprzedaje pancerze i boksera)\n Willowfield\n Baza Mechanik�w","Wr��","Wyjd�");
                    //\n\nOpis:\n Szybka linia zapewniaj�ca g��wnie cywilom szybki\n transport mi�dzy kluczowymi punktami w mie�cie\n Najwa�niejsza i najszybsza linia LSBD
                }
                case 2:
                {
                    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 82","Przystanki ko�cowe:\nZajezdnia Commerce <==> Bay Side LV\n\nCzas przejazdu trasy:  11 minut \n\nIlo�� przystank�w:  9\n\nSzczeg�owy rozpis trasy:\n Zajezdnia Commerce / Basen 'tsunami'\n Urz�d Miasta\n Baza Mechanik�w\n Agencja Ochrony\n miasteczko Palomino Creek\n Hilltop Farm\n Dillimore\n Bluberry\n Bay Side","Wr��","Wyjd�");
                    // \n Trasa po Red County jest bardzo malownicza\n za� droga do bay side usypiaj�ca\n Najd�u�sza trasa LSDB
                }
                case 3:
                {
                    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 96","W Przystanki ko�cowe:\nBaza Wojskowa <==> Mrucznik Tower\n\nCzas przejazdu trasy:  ? \n\nIlo�� przystank�w:  12\n\nSzczeg�owy rozpis trasy:\n Baza Wojskowa\n Fabryka (dostawa mats�w)\n Pas Startowy \n Wiadukt\n Unity Station\n Verdant Bluffs (ty�y Urz�du Miasta)\n Zajezdnia Commerce\n Galerie Handlowe\n Burger Shot Marina\n Baza FBI\n Wypo�yczalnia aut (odbi�r mats�w)\n Mrucznik Tower","Wr��","Wyjd�");
                        //\n\nOpis:\nKolejna trasa ze wschodu na zach�d, jednak tym razem\n szlakiem mniej ucz�szczanych miejsc\n Ulubiona trasa pocz�tkuj�cych diler�w broni
                }
                case 4:
                {
                    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Linia 85","Przystanki ko�cowe:\nWysypisko <==> Szpital\n\nCzas przejazdu trasy:  ? \n\nIlo�� przystank�w:  12\n\nSzczeg�owy rozpis trasy:\n Wysypisko\n Clukin Bell Willofield\n Myjnia Samochodowa\n Baza Mechanik�w\n Agencja Ochrony\n Las Colinas \n Motel Jefferson\n Glen Park\n Mrucznikowy GS\n Bank\n Szpital\n\n Opis:\n Niebezpieczna trasa prowadz�ce przez tereny prawie wszytkich gang�w","Wr��","Wyjd�");
                }
                case 5:
                {
                    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Informacje","Z autobusu najlepiej korzysta� wtedy gdy jeste� pewien �e dana linia jest w trasie\n\nPami�taj, ze autobusy oznaczone numeremm linii poruszaj� si� zgodnie z okre�lon� tras�\n\nJak zosta� kierowc� autobusu?\nNale�y z�o�y� podanie na forum do Korporacji Transportowej\nMo�na r�wnie� podj�� si� pracy kierowcy dost�pnej przy basenie","Wr��","Wyjd�");
                }
                case 6:
                {
                    ShowPlayerDialogEx(playerid,5001,DIALOG_STYLE_MSGBOX,"Komendy","Dla pasa�era:\n\n/businfo - wy�wietla informacje o autobusach\n/wezwij bus - pozwala wezwa� autobus ktory podwiezie ci� w dowolne miejsce\n/anuluj bus - kasuje wezwanie autobusu\n\n\nDla Kierowcy:\n/fare [cena] - pozwala wej�� na s�u�b� i ustali� cen� za bilet\n/trasa - rozpoczyna kurs wed�ug wyznaczonej trasy\n/zakoncztrase - przerywa tras�\n/zd - zamyka drzwi i umo�liwia ruszenie z przystanku","Wr��","Wyjd�");
                }
            }
        }
        return 1;
    }
    else if(dialogid == 5003 || dialogid == 5002 || dialogid == 5001)
    {
        if(response)
        {
            command_businfo_showDialog(playerid);
        }
        return 1;
    }
    return 0;
}

//end