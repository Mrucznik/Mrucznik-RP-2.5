//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  dompomoc                                                 //
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
command_dompomoc_Impl(playerid)
{
    SendClientMessage(playerid, COLOR_GREEN, "_______________________DOM POMOC_______________________");
    SendClientMessage(playerid, COLOR_WHITE, "*** Wpisz komend�, aby uzyska� wi�cej pomocy.");
    SendClientMessage(playerid, COLOR_WHITE, "** DOM ** /dom /dominfo /wejdz /wyjdz /sprzedajdom /zlomujdom");
    SendClientMessage(playerid, COLOR_WHITE, "** DOM ** /apteczka /sejfpanel /zbrojownia");
    SendClientMessage(playerid, COLOR_WHITE, "*** INNE *** /autopomoc /bizpomoc /ircpomoc /liderpomoc /opispomoc /rybypomoc /telefonpomoc");
    SendClientMessage(playerid, COLOR_WHITE, "*** INNE *** /orgpomoc /pracapomoc /vopispomoc /wynajempomoc /samppomoc");
    SendClientMessage(playerid, COLOR_GREEN, "______________________________________________________");
    return 1;
}

//end