//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ raport ]------------------------------------------------//
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

CMD:report(playerid, params[]) return cmd_raport(playerid, params);
CMD:raport(playerid, params[])
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(gPlayerLogged[playerid] == 1)
        {
            if(GetPVarInt(playerid, "wyreportowany") > 1)
            {
                sendTipMessageFormat(playerid, "Odczekaj %d sekund", GetPVarInt(playerid, "wyreportowany"));
                return 1;
            }
	        GetPlayerName(playerid, sendername, sizeof(sendername));
			if(isnull(params))
			{
                SendClientMessage(playerid, 0x008000AA,"** Komenda {ADFF2F}/report{FFFFFF} s�u�y tylko i wy��cznie do zg�aszania spraw dla Administracji... **");
                SendClientMessage(playerid, 0x008000AA,"** ...korzystamy z niego wtedy gdy dany gracz �amie regulamin serwera (LKiZ) **");
                SendClientMessage(playerid, 0x008000AA,"** Forma poprawnego zg�oszenia: {ADFF2F}/report 0 DM LUB /report 0 Cheater{FFFFFF} **");
				return 1;
			}
			format(string, sizeof(string), "� Report od %s [%d]: {FFFFFF}%s", sendername, playerid, params);
			ABroadCast(COLOR_YELLOW,string,1);
            SendClientMessage(playerid, 0x008000AA, "Tw�j report zosta� wys�any do administracji, oczekuj na reakcj� zanim napiszesz kolejny!");//By: Dawid
            SendClientMessage(playerid, COLOR_GRAD2, "Je�eli Administracja nie reaguje na Tw�j report, oznacza to, �e...");//By: Dawid
            SendClientMessage(playerid, COLOR_GRAD2, "...jest on �le sformu�owany i Administracja nie rozpatrzy tego zg�oszenia.");//By: Dawid
			//AntySpam[playerid] = 1;
			//SetTimerEx("AntySpamTimer",15000,0,"d",playerid);
            SetPVarInt(playerid, "wyreportowany", 15);
		}
    }
    return 1;
}

