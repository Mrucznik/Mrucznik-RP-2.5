//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  ircpomoc                                                 //
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
command_ircpomoc_Impl(playerid)
{
    SendClientMessage(playerid, COLOR_GREEN, "_______________________IRC POMOC_______________________");
    SendClientMessage(playerid, COLOR_WHITE, "*** Wpisz komend�, aby uzyska� wi�cej pomocy.");
    SendClientMessage(playerid, COLOR_WHITE, "** IRC ** (/irc join [nrkana�u] or /irc join [nrkana�u] [password]) (/irc leave)");
    SendClientMessage(playerid, COLOR_WHITE, "** IRC ** (/irc Password [nrkana�u])  (/irc NeedPass [nrkana�u])  (/irc Lock [nrkana�u])");
    SendClientMessage(playerid, COLOR_WHITE, "** IRC ** (/irc Admins)  (/irc MOTD [motdtext]) (/irc status [nrkana�u]) (/i [text])");
    ShowHelpCommands(playerid, COLOR_WHITE, "/ircpomoc");
    SendClientMessage(playerid, COLOR_GREEN, "_______________________________________________________");
    return 1;
}

//end