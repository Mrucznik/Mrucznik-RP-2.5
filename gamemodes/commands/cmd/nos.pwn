//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ nos ]--------------------------------------------------//
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

YCMD:nos(playerid, params[], help)
{
    new string[256];
    new sendername[MAX_PLAYER_NAME];
    new giveplayer[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(IsAMechazordWarsztatowy(playerid) || PlayerInfo[playerid][pJob] == 7)
        {
            new cost = 5000;
            if(IsAMechazordWarsztatowy(playerid))
            {
                cost /= 2;
            }

            if(!IsAtWarsztat(playerid)) return sendErrorMessage(playerid, "Nie jeste� w warsztacie, w kt�rym mo�na prowadzi� tuning");
            new playa;
            if( sscanf(params, "k<fix>", playa))
            {
                SendClientMessage(playerid, COLOR_GRAD2, "U�YJ: /nitro [Nick/ID]");
                format(string, sizeof(string), "INFORMACJA: Koszt zamontowania to: %d$", cost);
                SendClientMessage(playerid, COLOR_GRAD3, string);
                return 1;
            }


            if(IsPlayerConnected(playa))
            {
                if(playa != INVALID_PLAYER_ID)
                {
                    if(GetDistanceBetweenPlayers(playerid,playa) < 10)
                    {
                        if(IsPlayerInAnyVehicle(playa))
                        {
                            if(kaska[playerid] > cost)
                            {
                                new pojazd = GetPlayerVehicleID(playa);
                                if(!IsCarOwner(playa, pojazd))
                                    return SendClientMessage(playerid, COLOR_GRAD2, "Ten pojazd nie nale�y do tego gracza.");

                                if(PlayerInfo[playerid][pMechSkill] <= 50)
                                {
                                    GetPlayerName(playerid, sendername, sizeof(sendername));
                                    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
                                    format(string, sizeof(string), "* Zamontowa�e� graczowi %s nitro(pojemno��: 2) w jego samochodzie [-%d$](wi�kszy skill-wi�ksza pojemno��)",giveplayer, cost);
                                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string), "* Mechanik %s zamontowa� nitro o pojemno�ci 2 w twoim samochodzie",sendername);
                                    SendClientMessage(playa, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string),"* Mechanik %s wyci�ga narz�dzia i montuje nitro w %s.", sendername, VehicleNames[GetVehicleModel(pojazd)-400]);
                                    ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                    AddVehicleComponent(pojazd, 1009);
                                    ZabierzKase(playerid, cost);
                                    format(string, sizeof(string), "~r~-$%d", cost);
                                    GameTextForPlayer(playerid, string, cost, 1);
                                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                                    if(playa != playerid)
                                    {
                                        PlayerInfo[playerid][pMechSkill] ++;
                                        SendClientMessage(playerid, COLOR_GRAD2, "Skill +1");
                                        PlayerPlaySound(playa, 1133, 0.0, 0.0, 0.0);
                                    }
                                    CarData[VehicleUID[pojazd][vUID]][c_Nitro] = 1009;
                                }
                                else if(PlayerInfo[playerid][pMechSkill] >= 50 && PlayerInfo[playerid][pMechSkill] <= 99)
                                {
                                    GetPlayerName(playerid, sendername, sizeof(sendername));
                                    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
                                    format(string, sizeof(string), "* Zamontowa�e� graczowi %s nitro(pojemno��: 5) w jego samochodzie [-%d$](wi�kszy skill-wi�ksza pojemno��)",giveplayer,cost);
                                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string), "* Mechanik %s zamontowa� nitro o pojemno�ci 5 w twoim samochodzie",sendername);
                                    SendClientMessage(playa, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string),"* Mechanik %s wyci�ga narz�dzia i montuje nitro w %s.", sendername, VehicleNames[GetVehicleModel(pojazd)-400]);
                                    ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                    AddVehicleComponent(pojazd, 1008);
                                    ZabierzKase(playerid, cost);
                                    format(string, sizeof(string), "~r~-$%d", cost);
                                    GameTextForPlayer(playerid, string, cost, 1);
                                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                                    if(playa != playerid)
                                    {
                                        PlayerInfo[playerid][pMechSkill] ++;
                                        SendClientMessage(playerid, COLOR_GRAD2, "Skill +1");
                                        PlayerPlaySound(playa, 1133, 0.0, 0.0, 0.0);
                                    }
                                    CarData[VehicleUID[pojazd][vUID]][c_Nitro] = 1008;
                                }
                                else if(PlayerInfo[playerid][pMechSkill] >= 100)
                                {
                                    GetPlayerName(playerid, sendername, sizeof(sendername));
                                    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
                                    format(string, sizeof(string), "* Zamontowa�e� graczowi %s nitro(pojemno��: 10) w jego samochodzie [-%d$](wi�kszy skill-wi�ksza pojemno��)",giveplayer,cost);
                                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string), "* Mechanik %s zamontowa� nitro o pojemno�ci: 10 w twoim samochodzie",sendername);
                                    SendClientMessage(playa, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string),"* Mechanik %s wyci�ga narz�dzia i montuje nitro w %s.", sendername, VehicleNames[GetVehicleModel(pojazd)-400]);
                                    ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                    AddVehicleComponent(pojazd, 1010);
                                    ZabierzKase(playerid, cost);
                                    format(string, sizeof(string), "~r~-$%d", cost);
                                    GameTextForPlayer(playerid, string, cost, 1);
                                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                                    if(playa != playerid)
                                    {
                                        PlayerInfo[playerid][pMechSkill] ++;
                                        SendClientMessage(playerid, COLOR_GRAD2, "Skill +1");
                                        PlayerPlaySound(playa, 1133, 0.0, 0.0, 0.0);
                                    }
                                    CarData[VehicleUID[pojazd][vUID]][c_Nitro] = 1010;
                                }
                                else
                                {
                                    GetPlayerName(playerid, sendername, sizeof(sendername));
                                    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
                                    format(string, sizeof(string), "* Zamontowa�e� graczowi %s nitro(pojemno��: 2) w jego samochodzie [-%d$](wi�kszy skill-wi�ksza pojemno��)",giveplayer,cost);
                                    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string), "* Mechanik %s zamontowa� nitro o pojemno�ci 2 w twoim samochodzie",sendername);
                                    SendClientMessage(playa, COLOR_LIGHTBLUE, string);
                                    format(string, sizeof(string),"* Mechanik %s wyci�ga narz�dzia i montuje nitro w %s.", sendername, VehicleNames[GetVehicleModel(pojazd)-400]);
                                    ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                                    AddVehicleComponent(pojazd, 1009);
                                    ZabierzKase(playerid, cost);
                                    format(string, sizeof(string), "~r~-$%d", cost);
                                    GameTextForPlayer(playerid, string, cost, 1);
                                    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                                    if(playa != playerid)
                                    {
                                        PlayerInfo[playerid][pMechSkill] ++;
                                        SendClientMessage(playerid, COLOR_GRAD2, "Skill +1");
                                        PlayerPlaySound(playa, 1133, 0.0, 0.0, 0.0);
                                    }
                                    CarData[VehicleUID[pojazd][vUID]][c_Nitro] = 1009;
                                }
                                Log(payLog, INFO, "Gracz %s zamontowa� %s nitro na pojazd %s za %d$",
                                    GetPlayerLogName(playerid), GetPlayerLogName(playa), GetVehicleLogName(pojazd), cost
                                );
                            }
                            else
                            {
                                format(string, sizeof(string), "Nie masz wystarczaj�cej ilo�ci pieni�dzy (%d$)", cost);
                                SendClientMessage(playerid, COLOR_WHITE, string);
                            }
                        }
                        else
                        {
                            SendClientMessage(playerid, COLOR_WHITE, "Gracz nie jest w samochodzie");
                        }
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_WHITE, "Gracz nie jest za daleko");
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_WHITE, "Nie ma takiego gracza");
                }
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_WHITE, "Nie jeste� mechanikiem");
        }
    }
    return 1;
}
