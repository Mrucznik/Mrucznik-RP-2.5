//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   orgbiz                                                  //
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
// Data utworzenia: 08.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_orgbiz_Impl(playerid, action[16], params[128])
{
    new org = GetPlayerOrg(playerid);
    if(org == 0)
    {
        noAccessMessage(playerid);
        return 1;
    }

    if(strcmp(action, "lista", true) == 0 || strcmp(action, "list", true) == 0)
    {
        SendClientMessage(playerid, COLOR_GREEN, "|_______________ Biznesy organizacji _______________|");
        for(new i=1; i<sizeof(FrontBusiness); i++)
        {
            if(FrontBusiness[i][Owner] == org)
            {
                SendClientMessage(playerid, COLOR_WHITE, sprintf("- [%d] %s | Godzina przej�cia: %02d:%02d", 
                    i, FrontBusiness[i][Name], FrontBusiness[i][TakeoverHour], FrontBusiness[i][TakeoverMinute]));
            }
        }
    }
    else if(strcmp(action, "zmienczas", true) == 0)
    {
        if(IsPlayerOrgLeader(playerid))
        {
            MruMessageFail(playerid, "Ta opcja jest tylko dla lidera organizacji.");
            return 1;
        }

		new bizId, hour, minute;
		if( sscanf(params, "ddd", bizId, hour, minute))
		{
			sendTipMessage(playerid, "U�yj /orgbiz zmienczas [id biznesu] [godzina (w przedziale "#MIN_TAKEOVER_HOUR" - "#MAX_TAKEOVER_HOUR")] [minuta]");
			sendTipMessage(playerid, "Koszt komendy: "#CHANGE_TAKEOVER_TIME_COST" kontrabandy.");
			return 1;
		}

        if(GetContraband(playerid) < CHANGE_TAKEOVER_TIME_COST)
        {
            MruMessageFail(playerid, "Koszt zmiany czasu przej�cia biznesu to "#CHANGE_TAKEOVER_TIME_COST", a Ty tyle nie masz.");
            return 1;
        }

        if(bizId < 0 || bizId >= sizeof(FrontBusiness))
        {
            MruMessageFailF(playerid, "ID biznesu od 0 do %d.", sizeof(FrontBusiness));
            return 1;
        }
        
        if(!IsFrontBusinnesOwnedByOrg(bizId, org))
        {
            MruMessageFailF(playerid, "Biznes %d (%s) nie jest posiadany przez Twoj� organizacj�.", bizId, FrontBusiness[bizId][Name]);
            return 1;
        }

        TakeContraband(playerid, CHANGE_TAKEOVER_TIME_COST);
        Redis_SetInt(RedisClient, RedisFrontBizKey(bizId, "takeoverHour"), hour);
        Redis_SetInt(RedisClient, RedisFrontBizKey(bizId, "takeoverMinute"), minute);
        FrontBusiness[bizId][TakeoverHour] = hour;
        FrontBusiness[bizId][TakeoverMinute] = minute;
    }
    return 1;
}

//end