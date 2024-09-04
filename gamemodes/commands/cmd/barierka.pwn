//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ barierka ]-----------------------------------------------//
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

YCMD:barierka(playerid, params[], help)
{
    if(!(IsAPolicja(playerid) || GetPlayerFraction(playerid) == FRAC_BOR || GetPlayerFraction(playerid) == FRAC_ERS))
	{
		sendErrorMessage(playerid, "Nie masz uprawnie� do u�ycia tej komendy.");
		return 1;
	}
	
	if(PlayerInfo[playerid][pJailed] != 0)
	{
		sendErrorMessage(playerid, "Nie mo�esz stawia� barierek w wi�zieniu.");
		return 1;
	}

    if(isnull(params))
    {
        DestroySelectionMenu(playerid);
    	SetPVarInt(playerid, "gatechose_active", 1);
    	CreateSelectionMenu(playerid);
    	SelectTextDraw(playerid, 0xACCBF1FF);
        sendTipMessage(playerid, "U�yj /barierka usu� [ID] aby usun��!");
    }
    else
    {
        new var[32], id;
        if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
        if(sscanf(params, "s[32]d", var, id)) return sendTipMessage(playerid, "U�yj /barierka usu� [ID]");
        if(strcmp(var, "usu�", true) == 0 ||  strcmp(var, "usun", true) == 0)
        {
            if(GetPVarInt(playerid, "gatechose_active") == 1)//Zabezpieczenie przed edycj� obiekt�w mapy
            {
                DestroySelectionMenu(playerid);
                SetPVarInt(playerid, "gatechose_active", 0);
                return 1;
            }
            if(id < 0 || id > 9) return 1;
            new frac = GetPlayerFraction(playerid);
            if(!BarierState[frac][id]) return 1;

            BARIERKA_Remove(frac, id);

            SendClientMessage(playerid, -1, "Usuni�to barierk�");
        }
    }
    return 1;
}
