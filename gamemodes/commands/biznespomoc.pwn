//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ biznespomoc ]----------------------------------------------//
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

CMD:businesshelp(playerid) return cmd_biznespomoc(playerid);
CMD:bizpomoc(playerid) return cmd_biznespomoc(playerid);
CMD:biznespomoc(playerid)
{
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	SendClientMessage(playerid, COLOR_WHITE,"*** BIZNES POMOC *** wpisz komende aby uzyska� wi�cej pomocy");
	SendClientMessage(playerid, COLOR_GRAD3,"*** BIZNES *** /bizinfo /wejdz /wyjdz | WKR�TCE - /kupbiznes /sprzedajbiznes");
	SendClientMessage(playerid, COLOR_GRAD3, "*** BIZNES *** /bizlock");
	SendClientMessage(playerid, COLOR_GRAD6,"*** INNE *** /telefonpomoc /dompomoc /wynajempomoc /pomoc /liderpomoc /rybypomoc /gotowaniepomoc /ircpomoc");
	return 1;
}


