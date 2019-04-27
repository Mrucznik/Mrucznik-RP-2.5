//-----------------------------------------------<< Komendy >>-----------------------------------------------//
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

#include "cmd/pakietmrucznika.pwn"
#include "cmd/skille.pwn"
#include "cmd/streamer.pwn"
#include "cmd/loadconfig.pwn"
#include "cmd/loadinfo.pwn"
#include "cmd/loadcommands.pwn"
#include "cmd/wczytajskiny.pwn"
#include "cmd/wczytajrangi.pwn"
#include "cmd/rodzinaskrypt.pwn"
#include "cmd/vopis.pwn"
#include "cmd/opispomoc.pwn"
#include "cmd/vopispomoc.pwn"
#include "cmd/pomoc2.pwn"
#include "cmd/funiadajadmina.pwn"
#include "cmd/dajbilet.pwn"
#include "cmd/konsola.pwn"
#include "cmd/sprzedajmaterialy.pwn"
#include "cmd/pokazcb.pwn"
#include "cmd/cbradio.pwn"
#include "cmd/togcb.pwn"
#include "cmd/wywalcb.pwn"
#include "cmd/przelew.pwn"
#include "cmd/kb.pwn"
#include "cmd/sejffrakcja.pwn"
#include "cmd/sejfrodzina.pwn"
#include "cmd/ranny.pwn"
#include "cmd/autoranny.pwn"
#include "cmd/wezportfel.pwn"
#include "cmd/poscig.pwn"
#include "cmd/gps.pwn"
#include "cmd/namierz.pwn"
#include "cmd/odznaka.pwn"
#include "cmd/kajdanki.pwn"
#include "cmd/barierka.pwn"
#include "cmd/obezwladnij.pwn"
#include "cmd/wyrzucbronie.pwn"
#include "cmd/zdejmijkevlar.pwn"
#include "cmd/usunbron.pwn"
#include "cmd/uwb.pwn"
#include "cmd/graj.pwn"
#include "cmd/awans.pwn"
#include "cmd/degraduj.pwn"
#include "cmd/apteczka.pwn"
#include "cmd/zastrzyk.pwn"
#include "cmd/zmienplec.pwn"
#include "cmd/reklama.pwn"
#include "cmd/alkomat.pwn"
#include "cmd/wypisz.pwn"
#include "cmd/maska.pwn"
#include "cmd/bandana.pwn"
#include "cmd/wtazer.pwn"
#include "cmd/stazer.pwn"
#include "cmd/yo.pwn"
#include "cmd/yo3.pwn"
#include "cmd/yo2.pwn"
#include "cmd/yo4.pwn"
#include "cmd/elo.pwn"
#include "cmd/elo2.pwn"
#include "cmd/witaj.pwn"
#include "cmd/caluj.pwn"
#include "cmd/bdaj.pwn"
#include "cmd/killtimer.pwn"
#include "cmd/killalltimer.pwn"
#include "cmd/wobiekt.pwn"
#include "cmd/pokazdowod.pwn"
#include "cmd/odmv.pwn"
#include "cmd/zdmv.pwn"
#include "cmd/kamerau.pwn"
#include "cmd/armia.pwn"
#include "cmd/sad.pwn"
#include "cmd/trasa.pwn"
#include "cmd/zd.pwn"
#include "cmd/zakoncztrase.pwn"
#include "cmd/mojskin.pwn"
#include "cmd/okienko.pwn"
#include "cmd/pjtest.pwn"
#include "cmd/sprawdztest.pwn"
#include "cmd/wrzuc.pwn"
#include "cmd/brama.pwn"
#include "cmd/winda.pwn"
#include "cmd/winda2.pwn"
#include "cmd/roleta.pwn"
#include "cmd/cela2.pwn"
#include "cmd/kod.pwn"
#include "cmd/zawodnik.pwn"
#include "cmd/dajkm.pwn"
#include "cmd/gokarty.pwn"
#include "cmd/zuzel.pwn"
#include "cmd/zawodnicy.pwn"
#include "cmd/wyniki.pwn"
#include "cmd/komentuj.pwn"
#include "cmd/zuzel_start.pwn"
#include "cmd/zuzel_stop.pwn"
#include "cmd/sprawdzteam.pwn"
#include "cmd/zmiendom.pwn"
#include "cmd/zmiendomk.pwn"
#include "cmd/sprawdzdom.pwn"
#include "cmd/unfrakcja.pwn"
#include "cmd/skinf.pwn"
#include "cmd/wybieralka.pwn"
#include "cmd/ubranie.pwn"
#include "cmd/qf.pwn"
#include "cmd/zmiennick.pwn"
#include "cmd/zmienhaslo.pwn"
#include "cmd/zmienskin.pwn"
#include "cmd/piwo.pwn"
#include "cmd/komandos.pwn"
#include "cmd/sprunk.pwn"
#include "cmd/cygaro.pwn"
#include "cmd/skret.pwn"
#include "cmd/pobij.pwn"
#include "cmd/sprzedajalkohol.pwn"
#include "cmd/naucz.pwn"
#include "cmd/nos.pwn"
#include "cmd/hydraulika.pwn"
#include "cmd/malunek.pwn"
#include "cmd/felga.pwn"
#include "cmd/dajfiltr.pwn"
#include "cmd/spoiler.pwn"
#include "cmd/zderzaki.pwn"
#include "cmd/dajneony.pwn"
#include "cmd/kupkredyty.pwn"
#include "cmd/basenstats.pwn"
#include "cmd/kupneony.pwn"
#include "cmd/trasy.pwn"
#include "cmd/wyscig.pwn"
#include "cmd/wyscig_start.pwn"
#include "cmd/wyscig_stop.pwn"
#include "cmd/stworztrase.pwn"
#include "cmd/cp.pwn"
#include "cmd/cp_usun.pwn"
#include "cmd/finisz.pwn"
#include "cmd/malunki.pwn"
#include "cmd/kolory.pwn"
#include "cmd/felgi.pwn"
#include "cmd/spoilery.pwn"
#include "cmd/wezpizze.pwn"
#include "cmd/wezzlecenie.pwn"
#include "cmd/poddajsie2.pwn"
#include "cmd/poddajsie.pwn"
#include "cmd/poddajesie.pwn"
#include "cmd/oczyscmdc.pwn"
#include "cmd/zbijwl.pwn"
#include "cmd/kamera_wiezienie.pwn"
#include "cmd/uniform2.pwn"
#include "cmd/podszyjsie.pwn"
#include "cmd/fooc.pwn"
#include "cmd/federalne.pwn"
#include "cmd/bus.pwn"
#include "cmd/stworzdom.pwn"
#include "cmd/domint.pwn"
#include "cmd/houseowner.pwn"
#include "cmd/losowostworzdom.pwn"
#include "cmd/deletedom.pwn"
#include "cmd/kupowaniedomu.pwn"
#include "cmd/opuscdom.pwn"
#include "cmd/blokujsprzedarz.pwn"
#include "cmd/pomocdom.pwn"
#include "cmd/houseinfo.pwn"
#include "cmd/house.pwn"
#include "cmd/sejfpomoc.pwn"
#include "cmd/zbrojuj.pwn"
#include "cmd/rentroom.pwn"
#include "cmd/giveroom.pwn"
#include "cmd/unrentroom.pwn"
#include "cmd/selldom.pwn"
#include "cmd/adds.pwn"
#include "cmd/addshelp.pwn"
#include "cmd/kuppojazd.pwn"
#include "cmd/kuplodzie.pwn"
#include "cmd/kupsamoloty.pwn"
#include "cmd/kuphelikopter.pwn"
#include "cmd/zaparkuj.pwn"
#include "cmd/dajklucze.pwn"
#include "cmd/zk.pwn"
#include "cmd/wk.pwn"
#include "cmd/wymiana.pwn"
#include "cmd/sprzedajauto.pwn"
#include "cmd/zlomuj.pwn"
#include "cmd/dr.pwn"
#include "cmd/kogut.pwn"
#include "cmd/car.pwn"
#include "cmd/autok.pwn"
#include "cmd/carhelp.pwn"
#include "cmd/plac.pwn"
#include "cmd/teczka.pwn"
#include "cmd/datek.pwn"
#include "cmd/staty.pwn"
#include "cmd/ksiazkatel.pwn"
#include "cmd/sprawdzkase.pwn"
#include "cmd/nastepnylevel.pwn"
#include "cmd/reset_ulepszen.pwn"
#include "cmd/kuparmor.pwn"
#include "cmd/kupbron.pwn"
#include "cmd/kupdildo.pwn"
#include "cmd/ulepsz.pwn"
#include "cmd/noooc.pwn"
#include "cmd/paliwo.pwn"
#include "cmd/owarsztat.pwn"
#include "cmd/cwarsztat.pwn"
#include "cmd/noa.pwn"
#include "cmd/togooc.pwn"
#include "cmd/togpodglad.pwn"
#include "cmd/togwl.pwn"
#include "cmd/toglicznik.pwn"
#include "cmd/icons.pwn"
#include "cmd/blokujnews.pwn"
#include "cmd/blokujnoba.pwn"
#include "cmd/togfam.pwn"
#include "cmd/zablokujw.pwn"
#include "cmd/togadmin.pwn"
#include "cmd/wywaltelefon.pwn"
#include "cmd/zablokujtel.pwn"
#include "cmd/sprobuj.pwn"
#include "cmd/odpal.pwn"
#include "cmd/forum.pwn"
#include "cmd/zgas.pwn"
#include "cmd/megafon.pwn"
#include "cmd/panelbasenu.pwn"
#include "cmd/kupskin.pwn"
#include "cmd/dutymoto.pwn"
#include "cmd/dutycd.pwn"
#include "cmd/sluzba.pwn"
#include "cmd/swat.pwn"
#include "cmd/kamizelka.pwn"
#include "cmd/szturmowy.pwn"
#include "cmd/kurtka.pwn"
#include "cmd/fskin.pwn"
#include "cmd/departament.pwn"
#include "cmd/togdepo.pwn"
#include "cmd/depo.pwn"
#include "cmd/tablet.pwn"
#include "cmd/mdc.pwn"
#include "cmd/po.pwn"
#include "cmd/wiadomosc.pwn"
#include "cmd/re.pwn"
#include "cmd/wyplac.pwn"
#include "cmd/wplac.pwn"
#include "cmd/balans.pwn"
#include "cmd/kostka2.pwn"
#include "cmd/kostka.pwn"
#include "cmd/ruleta.pwn"
#include "cmd/blackjack.pwn"
#include "cmd/kolo.pwn"
#include "cmd/kup.pwn"
#include "cmd/dzwon.pwn"
#include "cmd/zamknijlinie.pwn"
#include "cmd/linie.pwn"
#include "cmd/otworzlinie.pwn"
#include "cmd/resms.pwn"
#include "cmd/sms.pwn"
#include "cmd/od.pwn"
#include "cmd/z.pwn"
#include "cmd/kontakty.pwn"
#include "cmd/wizytowka.pwn"
#include "cmd/fixr.pwn"
#include "cmd/czas.pwn"
#include "cmd/ustawcena.pwn"
#include "cmd/kupbiletpociag.pwn"
#include "cmd/wejdzw.pwn"
#include "cmd/lockint.pwn"
#include "cmd/windalock.pwn"
#include "cmd/trampolina.pwn"
#include "cmd/wejdz.pwn"
#include "cmd/fbidrzwi.pwn"
#include "cmd/wyjdz.pwn"
#include "cmd/armor.pwn"
#include "cmd/ulecz.pwn"
#include "cmd/bigears.pwn"
#include "cmd/mi.pwn"
#include "cmd/cmdinfo.pwn"
#include "cmd/a.pwn"
#include "cmd/newbie.pwn"
#include "cmd/przyjmij.pwn"
#include "cmd/zwolnij.pwn"
#include "cmd/dodajweryfikacje.pwn"
#include "cmd/dajrange.pwn"
#include "cmd/oldcar.pwn"
#include "cmd/newcar.pwn"
#include "cmd/mojeauta.pwn"
#include "cmd/veh.pwn"
#include "cmd/pogoda.pwn"
#include "cmd/glosuja.pwn"
#include "cmd/endround.pwn"
#include "cmd/zasady.pwn"
#include "cmd/taryfikator.pwn"
#include "cmd/muzyczka.pwn"
#include "cmd/telefonpomoc.pwn"
#include "cmd/wynajempomoc.pwn"
#include "cmd/biznespomoc.pwn"
#include "cmd/liderpomoc.pwn"
#include "cmd/ircpomoc.pwn"
#include "cmd/rybypomoc.pwn"
#include "cmd/ah.pwn"
#include "cmd/stopanim.pwn"
#include "cmd/skill.pwn"
#include "cmd/idz.pwn"
#include "cmd/dl.pwn"
#include "cmd/startujlekcje.pwn"
#include "cmd/zatrzymajlekcje.pwn"
#include "cmd/zaliczegz.pwn"
#include "cmd/organizacje.pwn"
#include "cmd/pr.pwn"
#include "cmd/rozwod.pwn"
#include "cmd/slub.pwn"
#include "cmd/swiadek.pwn"
#include "cmd/irc.pwn"
#include "cmd/i.pwn"
#include "cmd/podatek.pwn"
#include "cmd/dajpodatek.pwn"
#include "cmd/stanowe.pwn"
#include "cmd/innyspawn.pwn"
#include "cmd/raport.pwn"
#include "cmd/reflektor.pwn"
#include "cmd/przebierz.pwn"
#include "cmd/studia.pwn"
#include "cmd/skin.pwn"
#include "cmd/lotto.pwn"
#include "cmd/zabierz.pwn"
#include "cmd/wypij.pwn"
#include "cmd/boksstats.pwn"
#include "cmd/boks.pwn"
#include "cmd/mp3.pwn"
#include "cmd/glosnik.pwn"
#include "cmd/radiostacja.pwn"
#include "cmd/wezwij.pwn"
#include "cmd/zwiaz.pwn"
#include "cmd/rozwiaz.pwn"
#include "cmd/kurs.pwn"
#include "cmd/zjedz.pwn"
#include "cmd/ugotuj.pwn"
#include "cmd/gotowane.pwn"
#include "cmd/zlap.pwn"
#include "cmd/ryby.pwn"
#include "cmd/wypuscrybe.pwn"
#include "cmd/sprzedajrybe.pwn"
#include "cmd/wywalrybe.pwn"
#include "cmd/wywalryby.pwn"
#include "cmd/licencje.pwn"
#include "cmd/pl.pwn"
#include "cmd/przeszukaj.pwn"
#include "cmd/sb.pwn"
#include "cmd/laptop.pwn"
#include "cmd/materialy.pwn"
#include "cmd/sprzedajbron.pwn"
#include "cmd/wez.pwn"
#include "cmd/dolacz.pwn"
#include "cmd/zatankuj.pwn"
#include "cmd/kanister.pwn"
#include "cmd/wywaldmv.pwn"
#include "cmd/tazer.pwn"
#include "cmd/paralizuj.pwn"
#include "cmd/zakuj.pwn"
#include "cmd/rozkuj.pwn"
#include "cmd/ochrona.pwn"
#include "cmd/placmedyk.pwn"
#include "cmd/wypusc.pwn"
#include "cmd/anuluj.pwn"
#include "cmd/akceptuj.pwn"
#include "cmd/tankowanie.pwn"
#include "cmd/napraw.pwn"
#include "cmd/wezwijwoz.pwn"
#include "cmd/sprzedajnarkotyki.pwn"
#include "cmd/wezdragi.pwn"
#include "cmd/uleczmnie.pwn"
#include "cmd/wywal.pwn"
#include "cmd/sex.pwn"
#include "cmd/szukani.pwn"
#include "cmd/ukradnij.pwn"
#include "cmd/kradnij.pwn"
#include "cmd/quitpraca.pwn"
#include "cmd/kaucja.pwn"
#include "cmd/wyczysc.pwn"
#include "cmd/wywaz.pwn"
#include "cmd/mandacik.pwn"
#include "cmd/paka.pwn"
#include "cmd/aresztuj.pwn"
#include "cmd/kontrakt.pwn"
#include "cmd/temat.pwn"
#include "cmd/rezonans.pwn"
#include "cmd/teleturniej.pwn"
#include "cmd/zamek.pwn"
#include "cmd/wieza.pwn"
#include "cmd/lot.pwn"
#include "cmd/mikser.pwn"
#include "cmd/kamera.pwn"
#include "cmd/wyprowadz.pwn"
#include "cmd/ibiza.pwn"
#include "cmd/sprzedajbilet.pwn"
#include "cmd/polej.pwn"
#include "cmd/cennik.pwn"
#include "cmd/editobject.pwn"
#include "cmd/atakuj.pwn"
#include "cmd/zaznacz.pwn"
#include "cmd/zoneid.pwn"
#include "cmd/lock.pwn"
#include "cmd/wywalzsad.pwn"
#include "cmd/alarm.pwn"
#include "cmd/kolejka.pwn"
#include "cmd/patrol.pwn"
#include "cmd/c.pwn"
#include "cmd/lsmcelevator.pwn"
#include "cmd/czysc.pwn"
#include "cmd/tjdcp1.pwn"
#include "cmd/tjdcp2.pwn"
#include "cmd/boombox.pwn"
#include "cmd/disabletruckerjob.pwn"
#include "cmd/zapytaj.pwn"
#include "cmd/togname.pwn"
#include "cmd/bonehead.pwn"
#include "cmd/pozwolenie.pwn"
#include "cmd/app.pwn"
#include "cmd/wyjedz.pwn"
#include "cmd/sprawdzneon.pwn"
#include "cmd/marcepan.pwn"
#include "cmd/edytujupr.pwn"
#include "cmd/uprawnienia.pwn"
#include "cmd/sprawdzkredyty.pwn"
#include "cmd/id.pwn"
#include "cmd/wywaldragi.pwn"
#include "cmd/wywalmaterialy.pwn"
#include "cmd/pracownicy.pwn"

#include "cmd/adminduty.pwn"
#include "cmd/adminstats.pwn"
#include "cmd/b.pwn"
#include "cmd/biegnij.pwn"
#include "cmd/bizinfo.pwn"
#include "cmd/bizlock.pwn"
#include "cmd/bizmoneydebug.pwn"
#include "cmd/checkadminstats.pwn"
#include "cmd/dajbiznes.pwn"
#include "cmd/dajkp.pwn"
#include "cmd/do.pwn"
#include "cmd/dopasuj.pwn"
#include "cmd/finfo.pwn"
#include "cmd/ja.pwn"
#include "cmd/k.pwn"
#include "cmd/komunikat.pwn"
#include "cmd/nazywo.pwn"
#include "cmd/news.pwn"
#include "cmd/o.pwn"
#include "cmd/og.pwn"
#include "cmd/premium.pwn"
#include "cmd/przejazd.pwn"
#include "cmd/r.pwn"
#include "cmd/rodzinny.pwn"
#include "cmd/rooc.pwn"
#include "cmd/say.pwn"
#include "cmd/setmc.pwn"
#include "cmd/setstrong.pwn"
#include "cmd/sprawdzgwiazdki.pwn"
#include "cmd/sprzedajbiznes.pwn"
#include "cmd/stopbieg.pwn"
#include "cmd/szept.pwn"
#include "cmd/togfinfo.pwn"
#include "cmd/trasybiegu.pwn"
#include "cmd/zabierzbiznes.pwn"
#include "cmd/skiny.pwn"
#include "cmd/premiumskin.pwn"

InitCommands()
{

    return 1;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	#if DEBUG == 1
		printf("%s wykonal komende %s", GetNick(playerid), cmdtext);
	#endif
	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
	#if DEBUG == 1
		printf("%s wpisal komende %s", GetNick(playerid), cmdtext);
	#endif
	if(GUIExit[playerid] != 0 || gPlayerLogged[playerid] == 0)
	{
		SendClientMessage(playerid, COLOR_WHITE, "SERWER: "SZARY"Nie jeste� zalogowany/Masz otwarte okno dialogowe!");
		return 0;
	}
    /*if(GetTickDiff(GetTickCount(), StaryCzas[playerid]) < 100)//antyspam
	{
		SendClientMessage(playerid, COLOR_WHITE, "SERWER: "SZARY"Odczekaj chwil� zanim wpiszesz nast�pn� komende!");
		return 0;
	}*/
    if(IsCommandBlocked(cmdtext))
    {
        SendClientMessage(playerid, COLOR_WHITE, "SERWER: "SZARY"Komenda jest wy��czona.");
        return 0;
    }
	StaryCzas[playerid] = GetTickCount();
	return 1;
}