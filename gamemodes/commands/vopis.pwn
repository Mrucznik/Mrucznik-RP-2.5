//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ vopis ]-------------------------------------------------//
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

CMD:vopis(playerid, params[])
{
    //SendClientMessage(playerid, COLOR_RED, "Komenda wy��czona na czas naprawy. Przepraszamy za utrudnienia.");
    if(PlayerInfo[playerid][pConnectTime] < 4) return sendErrorMessage(playerid, "Opis dost�pny od 4 godzin online!");

    new var[8], id=-1;
    if(sscanf(params, "s[8]D(-1)", var, id) && PlayerInfo[playerid][pAdmin] > 0)
	{
		sendTipMessage(playerid, "U�yj /vopis (usu�) (id pojazdu)");
	}
	
    if(strlen(var) == 4 && (strcmp(var, "usu�", true) == 0 || strcmp(var, "usun", true) == 0))
    {
        if(id != -1 && PlayerInfo[playerid][pAdmin] >= 1)
        {
            if(Car_GetOwnerType(id) != CAR_OWNER_PLAYER && !Uprawnienia(playerid, ACCESS_EDITCAR)) 
			{
				return SendClientMessage(playerid, COLOR_GRAD2, "Nie mo�na usun�� opisu pojazdu systemowego.");
			}
            if(!CarOpis_Usun(playerid, id)) 
			{
				return SendClientMessage(playerid, -1, "Opis: Pojazd nie posiada opisu.");
			}
			
			new str[64];
			format(str, sizeof(str), "(OPIS) - Usun��e� opis pojazdu ustawiony przez gracza %s.", CarOpisCaller[id]);
			SendClientMessage(playerid, COLOR_PURPLE, str);
			format(str, sizeof(str), "%s usun�� opis ustawiony przez gracza %s - pojazd %d", GetNick(playerid), CarOpisCaller[id], id);
			StatsLog(str);
			return 1;
        }
        else
        {
            new vehicleid = GetPlayerVehicleID(playerid);
            if(vehicleid == 0) return 1;
            if(!IsCarOwner(playerid, vehicleid)) return SendClientMessage(playerid, COLOR_GRAD2, " Ten pojazd nie nale�y do Ciebie.");
            if(!CarOpis_Usun(playerid, vehicleid, true)) return SendClientMessage(playerid, -1, "Opis: Pojazd nie posiada opisu.");
        }
        return 1;
    }

    if(PlayerInfo[playerid][pBP] == 0)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid == 0) return 1;
        if(!IsCarOwner(playerid, vehicleid)) return SendClientMessage(playerid, COLOR_GRAD2, " Ten pojazd nie nale�y do Ciebie.");

        new lStr[256];
        strunpack(lStr, CarDesc[vehicleid]);
        format(lStr, 256, "%s\n� Ustaw opis\n� Zmie� opis\n� {FF0000}Usu�", lStr);
        ShowPlayerDialogEx(playerid, D_VEHOPIS, DIALOG_STYLE_LIST, "Opis pojazdu", lStr, "Wybierz", "Wyjd�");
    }
    else
    {
        SendClientMessage(playerid, COLOR_GRAD1, "Posiadasz blokad� pisania na czatach globalnych, nie mo�esz utworzy� opisu.");
    }
    return 1;
}

