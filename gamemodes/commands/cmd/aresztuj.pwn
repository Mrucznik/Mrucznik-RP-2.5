//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ aresztuj ]-----------------------------------------------//
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

YCMD:aresztuj(playerid, params[], help)
{
	new string[135];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
   	{
   	    if(IsAPolicja(playerid))
   	    {
   	        if(PlayerToPoint(10.0, playerid, 222.6395,114.3951,999.0156) //old komi
			|| IsPlayerInRangeOfPoint(playerid, 10.0, 268.3546, 83.0229, 1001.0391)//dillimore
			|| PlayerToPoint(10.0, playerid, -2614.1667,2264.6279,8.2109 ) //bayside
			|| PlayerToPoint(5, playerid, -1681.1091,917.8300,-52.4141)//nowe komi by dywan
			|| PlayerToPoint(20.0,playerid,NG_JAIL_X, NG_JAIL_Y, NG_JAIL_Z)) // stanowe
			{

		   	    new playa;
				if( sscanf(params, "k<fix>", playa))
				{
					sendTipMessage(playerid, "U�yj /aresztuj [playerid/Cz��Nicku]");
					return 1;
				}


				if(IsPlayerConnected(playa))
				{
				    if(playa != INVALID_PLAYER_ID)
				    {
				        if(ProxDetectorS(10.0, playerid, playa))
						{
						    if(playerid != playa)
						    {
								if(PoziomPoszukiwania[playa] == 0)
								{
									sendTipMessageEx(playerid, COLOR_GRAD3, "Ten gracz nie ma WL.");
								}
						        else if(PoziomPoszukiwania[playa] >= 1 && PoziomPoszukiwania[playa] <= 5)
						        {
						            new price = PoziomPoszukiwania[playa]*4000;
						            new price2 = PoziomPoszukiwania[playa]*1000;
						            new bail = PoziomPoszukiwania[playa]*16000;
						            new jt = PoziomPoszukiwania[playa]*200;
						            //DajKase(playerid, price);
								    ZabierzKase(playa, price2);
	                                GetPlayerName(playa, giveplayer, sizeof(giveplayer));
	                                GetPlayerName(playerid, sendername, sizeof(sendername));
                                    new depo2 = floatround(((price/100) * 80), floatround_round);
                                    new depo3 = floatround(((price/100) * 20), floatround_round);
                                    PoziomPoszukiwania[playa] = 0;
									SetPlayerWantedLevel(playa, 0);
                                    DajKase(playerid, depo3);
                                    Sejf_Add(PlayerInfo[playerid][pMember], depo2);
								    format(string, sizeof(string), "Uwi�zi�e� %s, nagroda za przest�pc�: %d. Otrzymujesz $%d", giveplayer, price, depo3);
                                   // format(string, sizeof(string), "* Uwi�zi�e� %s w Wi�zieniu, nagroda za przest�pc�: %d", giveplayer, price);
                                    //DajKase(playerid, price);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									PlayerInfo[playa][pJailed] = 1;
								    PlayerInfo[playa][pJailTime] = jt;
								    format(string, sizeof(string), "* Jeste� w wi�zieniu na %d Sekund i otrzyma�e� grzywn� w wysoko�ci $%d, kaucja to: %d$.", PlayerInfo[playa][pJailTime], price,bail);
								    SendClientMessage(playa, COLOR_LIGHTBLUE, string);
                                    poscig[playa] = 0;
									WantLawyer[playa] = 1;
									PlayerInfo[playa][pArrested] += 1;
									/*kajdanki*/
									Kajdanki_JestemSkuty[playa] = 0;//Kajdany
                                    Kajdanki_Uzyte[playa] = 0;
                                    Kajdanki_PDkuje[playerid] = 0;
                                    Kajdanki_Uzyte[playerid] = 0;
									ClearAnimations(playa);
									SetPlayerSpecialAction(playa,SPECIAL_ACTION_NONE);
									RemovePlayerAttachedObject(playa, 0);
									Kajdanki_PDkuje[playa] = 0;
									Wchodzenie(playa);
									SetPlayerVirtualWorld(playa, 1);
								    new losuj= random(sizeof(Cela));
									SetPlayerPos(playa, Cela[losuj][0], Cela[losuj][1], Cela[losuj][2]);
									TogglePlayerControllable(playa, 0);
                                    Wchodzenie(playa);
									JailPrice[playa] = bail;
                                    SetPVarInt(playa, "kaucja-dlaKogo", PlayerInfo[playerid][pMember]);
									UsunBron(playa);//usun bron
									SetPlayerSpawnWeapon(playa);
									if(PlayerInfo[playerid][pMember]==1||PlayerInfo[playerid][pLider]==1)
									{
										format(string, sizeof(string), "<< Policjant %s aresztowa� podejrzanego %s >>", sendername, giveplayer);
										OOCNews(COLOR_LIGHTRED, string);
									}
									else if(PlayerInfo[playerid][pMember]==2||PlayerInfo[playerid][pLider]==2)
									{
										format(string, sizeof(string), "<< Agent FBI %s aresztowa� podejrzanego %s >>", sendername, giveplayer);
										OOCNews(COLOR_LIGHTRED, string);
									}
								}
								else if(PoziomPoszukiwania[playa] >= 6) //wsadzanie do stanowca
								{
									if(!PlayerToPoint(20.0,playerid,NG_JAIL_X, NG_JAIL_Y, NG_JAIL_Z))
									{
								    	sendTipMessageEx(playerid, COLOR_GRAD3, "Ten gracz ma za du�y WL alby wsadzi� go do zwyk�ej celi. Wsad�cie go do stanowego.");
									}
									else
									{
										new giveplayerid = playa;
										if(ProxDetectorS(10.0, playerid, giveplayerid))
										{
											new pricestan = PoziomPoszukiwania[giveplayerid]*2000;
											GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
											GetPlayerName(playerid, sendername, sizeof(sendername));
											format(string, sizeof(string), "* Uwi�zi�e� %s w Wi�zieniu stanowym.", giveplayer);
											SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
											format(string, sizeof(string), "* %s Uwi�zi� ci� w Wi�zieniu Stanowym i da� grzywn� %d$, kaucji brak", sendername, pricestan/*PoziomPoszukiwania[giveplayerid]*50000*/);
											SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
											Kajdanki_JestemSkuty[playa] = 0;//Kajdany
											Kajdanki_Uzyte[playa] = 0;
											Kajdanki_PDkuje[playerid] = 0;
											Kajdanki_Uzyte[playerid] = 0;
											Kajdanki_SkutyGracz[playa] = 0;
											JailDeMorgan(giveplayerid);
											UsunBron(playa);//usun bron
											SetPlayerSpawnWeapon(playa);
											if(PoziomPoszukiwania[giveplayerid] == 5)
											{
												PlayerInfo[giveplayerid][pJailTime] = 1500;
												DajKase(playerid, 20000);
												SendClientMessage(playerid, COLOR_GRAD1, "Kasa +20000");
											}
											else if(PoziomPoszukiwania[giveplayerid] == 6)
											{
												PlayerInfo[giveplayerid][pJailTime] = 1800;
												DajKase(playerid, 24000);
												SendClientMessage(playerid, COLOR_GRAD1, "Kasa +24000");
											}
											else if(PoziomPoszukiwania[giveplayerid] == 7)
											{
												PlayerInfo[giveplayerid][pJailTime] = 2100;
												DajKase(playerid, 28000);
												SendClientMessage(playerid, COLOR_GRAD1, "Kasa +28000");
											}
											else if(PoziomPoszukiwania[giveplayerid] == 8)
											{
												PlayerInfo[giveplayerid][pJailTime] = 2400;
												DajKase(playerid, 32000);
												SendClientMessage(playerid, COLOR_GRAD1, "Kasa +32000");
											}
											else if(PoziomPoszukiwania[giveplayerid] == 9)
											{
												PlayerInfo[giveplayerid][pJailTime] = 2700;
												DajKase(playerid, 36000);
												SendClientMessage(playerid, COLOR_GRAD1, "Kasa +36000");
											}
											else if(PoziomPoszukiwania[giveplayerid] == 10)
											{
												PlayerInfo[giveplayerid][pJailTime] = 3000;
												DajKase(playerid, 40000);
												SendClientMessage(playerid, COLOR_GRAD1, "Kasa +40000");
											}
											ZabierzKase(giveplayerid, pricestan);
											PoziomPoszukiwania[giveplayerid] = 0;
											SetPlayerWantedLevel(giveplayerid, 0);
											if(PlayerInfo[playerid][pMember]==1||PlayerInfo[playerid][pLider]==1)
											{
												format(string, sizeof(string), "<< Policjant %s aresztowa� podejrzanego %s >>", sendername, giveplayer);
												OOCNews(COLOR_LIGHTRED, string);
											}
											else if(PlayerInfo[playerid][pMember]==2||PlayerInfo[playerid][pLider]==2)
											{
												format(string, sizeof(string), "<< Agent FBI %s aresztowa� podejrzanego %s >>", sendername, giveplayer);
												OOCNews(COLOR_LIGHTRED, string);
											}
										}
										else
										{
											sendTipMessageEx(playerid, COLOR_GRAD3, "Ten gracz nie jest przy tobie.");
										}
									}
								}
							}
							else
							{
								sendTipMessageEx(playerid, COLOR_GRAD3, "Nie mo�esz wsadzi� samego siebie do celi.");
							}
						}
						else
						{
							sendTipMessageEx(playerid, COLOR_GRAD3, "Gracz jest za daleko.");
						}
					}
					else
					{
						sendTipMessageEx(playerid, COLOR_GRAD3, "Nie ma takiego gracza.");
					}
				}
				else
				{
					sendErrorMessage(playerid, "Nie ma takiego gracza.");
				}
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Musisz by� przy celach/stanowym aby kogo� zaaresztowa�!");
			    return 1;
			}
		}
		else
		{
			sendErrorMessage(playerid, "Nie jeste� z Policji.");
		}
	}
	return 1;
}
