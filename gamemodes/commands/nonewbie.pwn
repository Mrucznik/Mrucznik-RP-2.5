//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ nonewbie ]-----------------------------------------------//
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

CMD:nonewbie(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        new string[128];
		if (PlayerInfo[playerid][pAdmin] >= 5 && (!newbie) || IsAScripter(playerid) && (!newbie))
		{
			newbie = 1;
			BroadCast(COLOR_GRAD2, "Czat newbie zosta� zablokowany przez Administratora!");
            format(string, 128, "CMD_Info: /nonewbie u�yte przez %s [%d]", GetNick(playerid), playerid);
            SendCommandLogMessage(string);
            CMDLog(string);
		}
		else if (PlayerInfo[playerid][pAdmin] >= 5 && (newbie) || IsAScripter(playerid) && (newbie))
		{
			newbie = 0;
			SendClientMessageToAll(COLOR_P@,"|_________________________Rada dnia: czat /n(ewbie)_________________________|");
			SendClientMessageToAll(COLOR_WHITE,"Czat {ADFF2F}/n{FFFFFF} jest przeznaczony g��wnie dla newbie - czyli nowych graczy.");
			SendClientMessageToAll(COLOR_WHITE,"Je�eli jeste� nowym graczem i masz jakie� pytanie nie kr�puj si� i zadaj je na /n [pytanie] !");
			SendClientMessageToAll(COLOR_WHITE,"Gdy jednak pocz�tki gry masz ju� za sob�, nie zadawaj pyta� a jedynie udzielaj odpowiedzi :)");
			SendClientMessageToAll(COLOR_WHITE,"Obowi�zuj� jednak pewne {FFA500}zasady{FFFFFF} dot. tego czatu kt�rych trzeba przestrzega�:");
			SendClientMessageToAll(COLOR_WHITE,"1. Czat s�u�y tylko do zadawania pyta� i odpowiedzi!");
			SendClientMessageToAll(COLOR_WHITE,"2. Na czacie nie witamy si� || 3. Nie udzielamy odpowiedzi na /w - wszytkie odpowiedzi udzielamy na /n )");
			SendClientMessageToAll(COLOR_WHITE,"4. Je�eli chcesz og�osi�, �e 'pomagasz  w RP' to nie tutaj, gdy� to w�asnie na tym czacie tej pomocy udzielamy! )");
			SendClientMessageToAll(COLOR_WHITE,"Je�eli nie chcesz widzie� tego czatu, mozesz go wy��czy� komend� {CD5C5C}/togn");
			SendClientMessageToAll(COLOR_P@,"|________________________>>> Mrucznik-RP.pl <<<________________________|");
			BroadCast(COLOR_GRAD2, "Czat newbie zosta� odblokowany przez Administratora !");
            format(string, 128, "CMD_Info: /nonewbie u�yte przez %s [%d]", GetNick(playerid), playerid);
            SendCommandLogMessage(string);
            CMDLog(string);
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
