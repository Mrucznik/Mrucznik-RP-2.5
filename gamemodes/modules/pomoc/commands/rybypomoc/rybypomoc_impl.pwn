//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 rybypomoc                                                 //
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
// Data utworzenia: 17.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_rybypomoc_Impl(playerid)
{
    SendClientMessage(playerid, COLOR_GREEN, "______________________RYBY POMOC______________________");
    SendClientMessage(playerid, COLOR_WHITE, "*** Wpisz komend�, aby uzyska� wi�cej pomocy.");
    SendClientMessage(playerid, COLOR_WHITE, "** W�DKOWANIE ** /wedkuj (pr�bujesz z�apa� ryb�) /ryby (pokazuje jakie ryby z�apa�em�)");
    SendClientMessage(playerid, COLOR_WHITE, "** W�DKOWANIE ** /wywalrybe (wywala ostatni� z�apan� ryb�) /wywalryby (wywala wszystkie ryby)");
    SendClientMessage(playerid, COLOR_WHITE, "** W�DKOWANIE ** /sprzedajrybe (sprzedaje wybran� ryb� w sklepie 24/7)");
    SendClientMessage(playerid, COLOR_WHITE, "*** INNE *** /autopomoc /bizpomoc /dompomoc /ircpomoc /liderpomoc /opispomoc /telefonpomoc");
    SendClientMessage(playerid, COLOR_WHITE, "*** INNE *** /vopispomoc /wynajempomoc");
    SendClientMessage(playerid, COLOR_GREEN, "______________________________________________________");
    return 1;
}

//end