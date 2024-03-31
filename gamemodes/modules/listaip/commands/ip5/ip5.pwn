//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                    ip5                                                    //
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
// Kod wygenerowany automatycznie narz�dziem Mrucznik CTL

// ================= UWAGA! =================
//
// WSZELKIE ZMIANY WPROWADZONE DO TEGO PLIKU
// ZOSTAN� NADPISANE PO WYWO�ANIU KOMENDY
// > mrucznikctl build
//
// ================= UWAGA! =================


//-------<[ include ]>-------
#include "ip5_impl.pwn"

//-------<[ initialize ]>-------
command_ip5()
{
    

    //aliases
    

    //permissions
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:ip5(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Wy�wietlanie 5 ostatnich adres�w IP, na kt�rych gra� gracz pod danym nickiem.");
        return 1;
    }
    //fetching params
    new giveplayer[32], isOffline;
    if(sscanf(params, "s[32]d", giveplayer, isOffline))
    {
        sendTipMessage(playerid, "U�yj /ip5 [Nick/ID] [Czy gracz offline] ");
        return 1;
    }
    
    //command body
    return command_ip5_Impl(playerid, giveplayer, isOffline);
}