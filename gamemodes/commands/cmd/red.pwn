//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ red ]--------------------------------------------------//
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

YCMD:red(playerid, params[], help)
{
    new frac;
    frac = GetPlayerFraction(playerid);
    if(!IsACop(playerid) && frac != FRAC_LSPD)
	{
		return sendErrorMessage(playerid, "Nie jeste� policjantem.");
	}

	if(OnDuty[playerid] != 1 && JobDuty[playerid] != 1)
	{
		return sendErrorMessage(playerid, "Nie jeste� na s�u�bie.");
	}

    if(PlayerInfo[playerid][pBW] > 0)
    {
       return sendErrorMessage(playerid, "Jeste� nieprzytomny!"); 
    }

    new str[144], akcja[144];
    if(frac == FRAC_LSPD)
    {   
        if(GetPVarInt(playerid, "patrol") != 1)
        {
            return sendErrorMessage(playerid, "Nie jeste� na patrolu.");
        }
        else
        {
            new pat = GetPVarInt(playerid, "patrol-id");
            if(PDGPS == playerid)
            {
                PatrolInfo[pat][patstan] = 1;
            }
            else
            {
                PatrolInfo[pat][patstan] = 4; 
            }
        }
    }

    new frakcja[10];
    if(frac == FRAC_LSPD)
    {
        frakcja = "LSPD";
    }
    else if(frac == FRAC_FBI)
    {
        frakcja = "FBI";
    }
    else if(frac == FRAC_NG)
    {
        frakcja = "SASD";
    }

    if(PDGPS == playerid)
    {
        format(str, sizeof(str), "{FFFFFF}��{6A5ACD} CENTRALA %s: {FFFFFF}%s:{FF0000} Odwo�uj� CODE RED", frakcja, GetNick(playerid));
        format(akcja,sizeof(akcja),"* %s wy��czy� alert do wszystkich jednostek.",GetNick(playerid));
        GPSMode(playerid, true);
    }
    else
    {
        format(str, sizeof(str), "{FFFFFF}��{6A5ACD} CENTRALA %s: {FFFFFF}%s:{FF0000} Potrzebne natychmiastowe wsparcie - {FFFFFF}CODE RED", frakcja, GetNick(playerid));
        format(akcja,sizeof(akcja),"* %s uruchomi� alert do wszystkich jednostek.",GetNick(playerid));
        GPSMode(playerid, true);
    }

    ProxDetector(30.0, playerid, akcja, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    SendTeamMessage(1, COLOR_ALLDEPT, str);
    PlayCrimeReportForPlayersTeam(1, playerid, 16); //lub 16
    SendTeamMessage(2, COLOR_ALLDEPT, str);
    PlayCrimeReportForPlayersTeam(2, playerid, 16); //lub 16
	SendTeamMessage(3, COLOR_ALLDEPT, str);
    PlayCrimeReportForPlayersTeam(3, playerid, 16); //lub 16

    return 1;
}
