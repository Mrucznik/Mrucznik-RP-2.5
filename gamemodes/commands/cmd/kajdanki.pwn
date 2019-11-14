//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kajdanki ]-----------------------------------------------//
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

YCMD:kajdanki(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(IsACop(playerid) || (IsABOR(playerid) && PlayerInfo[playerid][pRank] >= 2))
        {
            new giveplayerid;
            if(sscanf(params, "k<fix>", giveplayerid))
            {
                sendTipMessage(playerid, "U�yj /kajdanki [ID_GRACZA]");
                return 1;
            }

            if(uzytekajdanki[playerid] != 1)
            {
                if(IsACop(playerid))
                {
                    if(OnDuty[playerid] == 0)
                    {
                        sendErrorMessage(playerid, "Nie jeste� na s�u�bie!");
                        return 1;
                    }
                }
                if(!IsPlayerConnected(giveplayerid))
                {
                    sendTipMessage(playerid, "Nie ma takiego gracza");
                    return 1;
                }
                if(IsACop(giveplayerid) && OnDuty[giveplayerid] == 1)
                {
                    sendErrorMessage(playerid, "Nie mo�esz sku� policjanta na s�u�bie!");
                    return 1;
                }
                if(Spectate[giveplayerid] != INVALID_PLAYER_ID)
                {
                    sendTipMessage(playerid, "Jeste� zbyt daleko od gracza");
                    return 1;
                }
                if(PoziomPoszukiwania[giveplayerid] == 0)
                {
                    sendTipMessage(playerid,"Chyba nie chcesz aresztowa� niewinnego cz�owieka?");
                    return 1;
                }
                if(GetDistanceBetweenPlayers(playerid,giveplayerid) < 5)
                {
                    if(GetPlayerState(playerid) == 1 && GetPlayerState(giveplayerid) == 1)
                    {
                        if(zakuty[giveplayerid] == 0)
                        {
                            new string[128];
                            if(PlayerInfo[giveplayerid][pBW] >= 1)
                            {

                                //Wiadomo�ci
                                format(string, sizeof(string), "* %s docisn�� do ziemi nieprzytomnego %s i sku� go.", GetNick(playerid, true), GetNick(giveplayerid, true));
                                ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                format(string, sizeof(string), "Dzi�ki szybkiej interwencji uda�o Ci si� sku� %s.", GetNick(giveplayerid, true));
                                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                                sendTipMessageEx(giveplayerid, COLOR_BLUE, "Jeste� nieprzytomny - policjant sku� ci� bez wi�kszego wysi�ku.");


                                //czynno�ci
                                PlayerInfo[giveplayerid][pBW] = 0;
                                zakuty[giveplayerid] = 1;
                                uzytekajdanki[playerid] = 1;
                                PDkuje[giveplayerid] = playerid;
                                SkutyGracz[playerid] = giveplayerid;
                                ClearAnimations(giveplayerid);
                                SetPlayerSpecialAction(giveplayerid, SPECIAL_ACTION_CUFFED);
                                SetPlayerAttachedObject(giveplayerid, 5, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977,-81.700035, 0.891999, 1.000000, 1.168000);
                                SetTimerEx("UzyteKajdany",30000,0,"d",giveplayerid);
                                SetTimerEx("Kajdanki_debug", 1000, 0, "d", giveplayerid);
                                return 1;
                            }
                            if(PlayerInfo[giveplayerid][pBW] == 0)
                            {
                                format(string, sizeof(string), "* %s wyci�ga kajdanki i pr�buje je za�o�y� %s.", GetNick(playerid, true),GetNick(giveplayerid, true));
                                ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                ShowPlayerDialogEx(giveplayerid, 98, DIALOG_STYLE_MSGBOX, "Aresztowanie", "Policjant chce za�o�y� ci kajdanki, je�li osacza ci� niedu�a liczba policjant�w mo�esz spr�bowa� si� wyrwa�\nJednak pami�taj je�li si� wyrwiesz i jeste� uzbrojony policjant ma prawo ci� zabi�. \nMo�esz tak�e dobrowolnie podda� si� policjantom.", "Poddaj si�", "Wyrwij si�");
                                PDkuje[giveplayerid] = playerid;
                                //uzytekajdanki[giveplayerid] = 1;
                                SetTimerEx("UzyteKajdany",30000,0,"d",giveplayerid);
                                return 1;
                            }
                        }
                        else
                        {
                            new str[32];
                            valstr(str, giveplayerid);
                            RunCommand(playerid, "/rozkuj",  str);
                        }
                    } else
                    {
                        sendErrorMessage(playerid, "�aden z was nie mo�e by� w wozie!");
                    }
                } else
                {
                    sendTipMessage(playerid, "Jeste� zbyt daleko od gracza");
                }
            } else
            {
                new str[32];
                valstr(str, giveplayerid);
                RunCommand(playerid, "/rozkuj",  str);
                return 1;
            }
        } else
        {
            sendTipMessage(playerid, "Nie posiadasz kajdanek");
        }
    }
    return 1;
}
