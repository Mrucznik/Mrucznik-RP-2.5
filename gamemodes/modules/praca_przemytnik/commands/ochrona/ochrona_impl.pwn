//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  ochrona                                                  //
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
// Data utworzenia: 06.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_ochrona_Impl(playerid, giveplayerid, price)
{
    new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(GetPlayerJob(playerid) != JOB_SMUGGLER)
    {
		sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� przemytnikiem!");
		return 1;
    }

	if(price < 5000 || price > 15000) { sendTipMessageEx(playerid, COLOR_GREY, "Cena od 5000 do 15000!"); return 1; }
	if(IsPlayerConnected(giveplayerid))
	{
	    if(giveplayerid != INVALID_PLAYER_ID)
	    {
	        if(ProxDetectorS(8.0, playerid, giveplayerid))
			{
                if(gettime() < GetPVarInt(playerid, "armoryTimeLimit"))
                {
                    return sendErrorMessage(playerid, "Mo�esz oferowa� pancerz co 45 sekundy");
                }
			    if(giveplayerid == playerid)
			    {
			        if(gettime() < GetPVarInt(playerid, "selfArmorLimit")) {
                        return sendErrorMessage(playerid, "Mo�esz oferowa� pancerz samemu sobie co 15 minut");
                    }
                    SetPVarInt(playerid, "selfArmorLimit", gettime() + 900);
                    SetPlayerArmour(playerid, 90);

                    sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Da�e� sobie samemu kamizelk�");
			        return 1;
			    }
			    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "* Oferujesz pancerz %s za $%d.", giveplayer, price);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* Przemtynik %s oferuje ci pancerz za $%d, (wpisz /akceptuj ochrona) aby akceptowa�", sendername, price);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				GuardOffer[giveplayerid] = playerid;
				GuardPrice[giveplayerid] = price;

                SetPVarInt(playerid, "armoryTimeLimit", gettime() + 45);
			}
			else
			{
			    sendTipMessageEx(playerid, COLOR_GREY, "Ten gracz nie jest przy tobie !");
			}
		}
	}
	else
	{
	    sendErrorMessage(playerid, "Nie ma takiego gracza!");
	}
    return 1;
}

command_akceptuj_pancerz(playerid)
{
    new string[MAX_MESSAGE_LENGTH];
    if(GuardOffer[playerid] < 999)
    {
        if(kaska[playerid] > GuardPrice[playerid] && GuardPrice[playerid] > 0)
        {
            if(IsPlayerConnected(GuardOffer[playerid]))
            {
                format(string, sizeof(string), "* Akceptowa�e� pancerz, zap�aci�e� $%d przemytnikowi %s.",GuardPrice[playerid],GetNick(GuardOffer[playerid]));
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                format(string, sizeof(string), "* %s akceptowa� pancerz, $%d zostanie doliczone do twojej wyp�aty.",GetNick(playerid),GuardPrice[playerid]);
                SendClientMessage(GuardOffer[playerid], COLOR_LIGHTBLUE, string);
                PlayerInfo[GuardOffer[playerid]][pPayCheck] += GuardPrice[playerid];
                ZabierzKase(playerid, GuardPrice[playerid]);
                SetPlayerArmour(playerid, 90);
                sendTipMessage(playerid, "Dosta�e� kamizelk� kuloodporn� od przemytnika.");
                Log(payLog, INFO, "%s kupi� pancerz od %s za $%d", GetPlayerLogName(playerid), GetPlayerLogName(GuardOffer[playerid]), GuardPrice[playerid]);
                GuardOffer[playerid] = 999;
                GuardPrice[playerid] = 0;
                return 1;
            }
            return 1;
        }
        else
        {
            SendClientMessage(playerid, COLOR_GREY, "   Nie mo�esz zaakceptowa� pancerza !");
            return 1;
        }
    }
    else
    {
        SendClientMessage(playerid, COLOR_GREY, "   Nikt nie zaoferowa� ci ochrony !");
        return 1;
    }
}

//end