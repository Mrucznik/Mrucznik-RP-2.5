//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ fskin ]-------------------------------------------------//
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

CMD:mundur(playerid) return cmd_fskin(playerid);
CMD:uniform(playerid) return cmd_fskin(playerid);
CMD:fskin(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie mo�esz tego u�y�  podczas @Duty! Zejd� ze s�u�by u�ywaj�c /adminduty");
			return 1;
		}
		if (IsAtClothShop(playerid) || (GetPlayerOrg(playerid) == FAMILY_RSC && IsPlayerInRangeOfPoint(playerid, 4.0, 1636.9476,-1813.6195,13.5263)) || IsPlayerInRangeOfPoint(playerid, 4.0, GetPVarFloat(playerid,"xposspawn"),GetPVarFloat(playerid,"yposspawn"),GetPVarFloat(playerid,"zposspawn")))
		{
            //W��czenie trybu skin�w
            if(GetPVarInt(playerid, "skin-select") != 0) return DestroySkinSelection(playerid);
            SetPVarInt(playerid, "skin-select", 1);
            new frac = GetPlayerFraction(playerid);
            new fam = GetPlayerOrg(playerid);
            if(frac != 0)
            {
                if(!ProceedSkinSelection(playerid,frac, 1)) return SendClientMessage(playerid, COLOR_GRAD2, "Twoja frakcja nie ma w�asnych skin�w.");
            }
            else if(fam != 0)
            {
                if(!ProceedSkinSelection(playerid,fam, 2)) return SendClientMessage(playerid, COLOR_GRAD2, "Twoja rodzina nie ma w�asnych skin�w.");
            }
            else return SendClientMessage(playerid, COLOR_GRAD2, "Nie mo�esz tego u�y�.");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "Nie jeste� w sklepie z ubraniami lub na miejscu spawnu!");
			return 1;
		}
	}
	return 1;
}

