//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                     a                                                     //
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
// Data utworzenia: 15.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_ircpomoc_Impl(playerid)
{
    SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
    SendClientMessage(playerid, COLOR_WHITE,"*** IRC POMOC *** wpisz komende aby uzyska� wi�cej pomocy");
    SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc join [nrkana�u] or /irc join [nrkana�u] [password])  (/irc leave)");
    SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc Password [nrkana�u])  (/irc NeedPass [nrkana�u])  (/irc Lock [nrkana�u])");
    SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc Admins)  (/irc MOTD [motdtext])  (/irc status [nrkana�u])  (/i [text])");
    return 1;
}

//end
