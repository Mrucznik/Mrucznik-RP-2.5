//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ dajneony ]-----------------------------------------------//
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

CMD:sprzedajneon(playerid, params[]) return cmd_dajneony(playerid, params);
CMD:dajneon(playerid, params[]) return cmd_dajneony(playerid, params);
CMD:sprzedajneony(playerid, params[]) return cmd_dajneony(playerid, params);
CMD:dajneony(playerid, params[])
{
    new string[256];
    new giveplayer[MAX_PLAYER_NAME];
    new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsANoA(playerid) && PlayerInfo[playerid][pRank] >= 3)
        {
            if(IsPlayerInRangeOfPoint(playerid, 25.0, 2333.9292,-1245.2999,22.5000))
            {

                new playa;
                if( sscanf(params, "k<fix>", playa))
                {
                    SendClientMessage(playerid, COLOR_GRAD2, "U�YJ: /dajneon [Nick/ID]");
                    SendClientMessage(playerid, COLOR_RED, "UWAGA: Koszt zamontowania neon�w to 3 000 000$. Automatycznie ponosi je kupuj�cy. Ty zarabiasz na tym 25 000$");
                    return 1;
                }


                //
                if(ProxDetectorS(10.0, playerid, playa))
                {
                    if(IsPlayerInAnyVehicle(playa))
                    {
                        new pojazd = GetPlayerVehicleID(playa);
                        if(IsCarOwner(playa, pojazd))
                        {
                            if(IsABoat(pojazd) || IsAPlane(pojazd) || IsABike(pojazd))
                            {
                                SendClientMessage(playerid, COLOR_GREY, "W helikoptrze/samolocie/�odzi/motorze nie mo�na zamontowa� neon�w.");
                                return  1;
                            }
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            GetPlayerName(playa, giveplayer, sizeof(giveplayer));
                            format(string, sizeof(string), "%s oferuje ci kupno neon�w za 3 000 000$. Je�li chcesz zakupi� neony do swojego %s wpisz /akceptuj neon.", sendername, VehicleNames[GetVehicleModel(pojazd)-400]);
                            SendClientMessage(playa, 0xFFC0CB, string);
                            format(string, sizeof(string), "Oferujesz %s kupno neon�w", giveplayer);
                            SendClientMessage(playerid, 0xFFC0CB, string);
                            GraczDajacyNeon[playa] = playerid;
                        }
                        else
                        {
                            SendClientMessage(playerid, COLOR_GREY, "Pojazd w kt�rym siedzi klient nie nale�y do niego.");
                        }
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_GREY, "Ten gracz nie siedzi w samochodzie.");
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_GREY, "Jeste� za daleko od gracza");
                }
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "Nie jeste� w warsztacie");
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "Nie jeste� z NoA/nie masz 3 lub wi�kszej rangi");
        }
    }
    //rup
    return 1;
}

