//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ ircpomoc ]-----------------------------------------------//
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

CMD:irchelp(playerid) return cmd_ircpomoc(playerid);
CMD:ircpomoc(playerid)
{
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	SendClientMessage(playerid, COLOR_WHITE,"*** IRC POMOC *** wpisz komende aby uzyska� wi�cej pomocy");
	SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc join [nrkana�u] or /irc join [nrkana�u] [password])  (/irc leave)");
	SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc Password [nrkana�u])  (/irc NeedPass [nrkana�u])  (/irc Lock [nrkana�u])");
	SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc Admins)  (/irc MOTD [motdtext])  (/irc status [nrkana�u])  (/i [text])");
    return 1;
}


