//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ uniform2 ]-----------------------------------------------//
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

CMD:uniform2(playerid, params[])
{
    if(IsPlayerConnected(playerid) && IsAtClothShop(playerid) && PlayerInfo[playerid][pMember] != 0)
    {
		if(FRAC_SKINS[PlayerInfo[playerid][pMember]][0] == 0)
		{
			sendErrorMessage(playerid, "Ta frakcja nie ma skin�w");
			return 1;
		}
        ShowPlayerDialogEx(playerid,DIALOGID_UNIFORM,DIALOG_STYLE_PREVMODEL_LIST,"Zmien skin frakcyjny",DialogListaSkinow(PlayerInfo[playerid][pMember]),"Zmien skin","Anuluj"); //zmie� dialogid
    }
    else
    {
        SendClientMessage(playerid, COLOR_GRAD2, "  Nie jeste� w sklepie odzie�owym!");
    }
    return 1;
}

/*CMD:podszyj(playerid, params[]) return cmd_podszyjsie(playerid, params);
