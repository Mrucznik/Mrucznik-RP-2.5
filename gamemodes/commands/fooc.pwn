//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ fooc ]-------------------------------------------------//
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

CMD:familyooc(playerid, params[]) return cmd_fooc(playerid, params);
CMD:fo(playerid, params[]) return cmd_fooc(playerid, params);
CMD:rodzinnyooc(playerid, params[]) return cmd_fooc(playerid, params);
CMD:fooc(playerid, params[])
{
	new string[256];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
	    /*if(PlayerInfo[playerid][pMuted] == 1)
		{
			sendTipMessageEx(playerid, TEAM_CYAN_COLOR, "Nie mo�esz pisa� poniewa� jeste� wyciszony");
			return 1;
		}*/
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj (/fo)oc [tekst]");
			return 1;
		}
		if (GetPlayerOrg(playerid) != 0 || MozeMowicNaFamily(playerid) || PlayerInfo[playerid][pTajniak] >= 1)
		{
		    new member = GetPlayerFraction(playerid);
            if(member > 0 && PlayerInfo[playerid][pTajniak] == 0)
            {
                format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FracRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
    			SendFamilyMessage(member, TEAM_AZTECAS_COLOR, string);
                //Tajniacy
                if(member == 5) SendTajniakMessage(3, TEAM_AZTECAS_COLOR, string);
                else if(member == 6) SendTajniakMessage(4, TEAM_AZTECAS_COLOR, string);
                else if(member == 12) SendTajniakMessage(1, TEAM_AZTECAS_COLOR, string);
                else if(13 <= member <= 14) SendTajniakMessage(2, TEAM_AZTECAS_COLOR, string);
            }
			else if(PlayerInfo[playerid][pTajniak] == 1)
			{
                format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FracRang[FRAC_GROOVE][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
                SendFamilyMessage(FRAC_GROOVE, TEAM_AZTECAS_COLOR, string);
                SendTajniakMessage(1, TEAM_AZTECAS_COLOR, string);
			}
			else if(PlayerInfo[playerid][pTajniak] == 2)
			{
                format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FracRang[FRAC_BALLAS][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
                SendFamilyMessage(FRAC_BALLAS, TEAM_AZTECAS_COLOR, string);
                SendTajniakMessage(2, TEAM_AZTECAS_COLOR, string);
			}
			else if(PlayerInfo[playerid][pTajniak] == 3)
			{
                format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FracRang[FRAC_LCN][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
                SendFamilyMessage(FRAC_LCN, TEAM_AZTECAS_COLOR, string);
				SendTajniakMessage(3, TEAM_AZTECAS_COLOR, string);
			}
			else if(PlayerInfo[playerid][pTajniak] == 4)
			{
                format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FracRang[FRAC_YKZ][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
                SendFamilyMessage(FRAC_YKZ, TEAM_AZTECAS_COLOR, string);
				SendTajniakMessage(4, TEAM_AZTECAS_COLOR, string);
			}
			else if(PlayerInfo[playerid][pTajniak] == 5)
			{
                format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FracRang[FRAC_VAGOS][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
                SendFamilyMessage(FRAC_VAGOS, TEAM_AZTECAS_COLOR, string);
				SendTajniakMessage(5, TEAM_AZTECAS_COLOR, string);
			}
			else if(GetPlayerOrg(playerid) != 0)
		    {
                member = GetPlayerOrg(playerid);
                //Przypisane rangi
                if(strlen(FamRang[member][PlayerInfo[playerid][pRank]]) > 1) format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FamRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
                //Rangi podstawowe
                else format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FamRang[0][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
                SendNewFamilyMessage(member, TEAM_AZTECAS_COLOR, string);
			}
			printf("%s", string);
			return 1;
		}
        else if(GetPlayerFraction(playerid) == FRAC_GOV || GetPlayerFraction(playerid) == FRAC_BOR|| GetPlayerOrg(playerid) == 1) //DMV i BOR po�aczenie
        {
            new member = GetPlayerFraction(playerid);
            format(string, sizeof(string), "** (( %s [%d] %s: %s )) **", FracRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
    		SendFamilyMessage(FRAC_GOV, TEAM_AZTECAS_COLOR, string);
            SendFamilyMessage(FRAC_BOR, TEAM_AZTECAS_COLOR, string);
			SendNewFamilyMessage(FAMILY_SAD, TEAM_BLUE_COLOR, string);
            printf("%s", string);
        }
       /* else if(GetPlayerFraction(playerid) == FRAC_BOR) //DMV i BOR po�aczenie
        {
            new member = GetPlayerFraction(playerid);
            format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FracRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], sendername, params);
    		SendFamilyMessage(FRAC_GOV, TEAM_AZTECAS_COLOR, string);
            SendFamilyMessage(FRAC_BOR, TEAM_AZTECAS_COLOR, string);
            SendNewFamilyMessage(FAMILY_SAD, TEAM_BLUE_COLOR, string);
            printf("%s", string);
        }*/
		else
		{
			sendTipMessageEx(playerid, COLOR_GRAD2, "Nie jeste� we frakcji!");
			return 1;
		}
	}
	return 1;
}
