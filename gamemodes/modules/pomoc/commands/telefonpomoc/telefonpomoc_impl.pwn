//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                telefonpomoc                                               //
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
command_telefonpomoc_Impl(playerid)
{
    SendClientMessage(playerid, COLOR_GREEN, "____________________TELEFON POMOC____________________");
    SendClientMessage(playerid, COLOR_WHITE, "*** Wpisz komend�, aby uzyska� wi�cej pomocy.");
    SendClientMessage(playerid, COLOR_WHITE, "** TELEFON ** /dzwon | na policje:'/dzwon 911' | /sms /resms (/od)bierz (/z)akoncz /numer /wizytowka /kontakty");
    SendClientMessage(playerid, COLOR_WHITE, "*** INNE *** /autopomoc /bizpomoc /dompomoc /ircpomoc /liderpomoc /opispomoc /rybypomoc");
    SendClientMessage(playerid, COLOR_WHITE, "*** INNE *** /orgpomoc /pracapomoc /vopispomoc /wynajempomoc /samppomoc");
    SendClientMessage(playerid, COLOR_GREEN, "_____________________________________________________");
    return 1;
}

//end