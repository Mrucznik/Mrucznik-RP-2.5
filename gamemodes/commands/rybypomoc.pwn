//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ rybypomoc ]-----------------------------------------------//
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

CMD:fishhelp(playerid) return cmd_rybypomoc(playerid);
CMD:rybypomoc(playerid)
{
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	SendClientMessage(playerid, COLOR_WHITE,"*** RYBY POMOC *** wpisz komende aby uzyska� wi�cej pomocy");
	SendClientMessage(playerid, COLOR_GRAD3,"*** WEDKOWANIE *** /wedkuj (Pr�bujesz z�apa� ryb�)   /ryby (Pokazuje jakie ryby z�apa�e�)");
	SendClientMessage(playerid, COLOR_GRAD3,"*** WEDKOWANIE *** /wywalrybe (Wywala ostatni� z�apan� rybe)   /wywalryby");
	SendClientMessage(playerid, COLOR_GRAD3,"*** WEDKOWANIE *** /wypuscrybe (Wypuszcza wybran� ryb�)");
	SendClientMessage(playerid, COLOR_GRAD3,"*** WEDKOWANIE *** [NOWE] /sprzedajrybe (sprzedajesz wybran� ryb� w 24/7)");
	SendClientMessage(playerid, COLOR_GRAD6,"*** INNE *** /telefonpomoc /dompomoc /wynajempomoc /bizpomoc /liderpomoc /pomoc /gotowaniepomoc /ircpomoc");
	return 1;
}







