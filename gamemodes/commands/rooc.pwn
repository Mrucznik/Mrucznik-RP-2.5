//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ rooc ]-------------------------------------------------//
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

CMD:radioooc(playerid, params[]) return cmd_rooc(playerid, params);
CMD:ro(playerid, params[]) return cmd_rooc(playerid, params);
CMD:rooc(playerid, params[])
{
	new string[256];


    if(IsPlayerConnected(playerid))
    {
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj (/r)adio [tekst]");
			return 1;
		}
        new member = GetPlayerFraction(playerid);
	    if(0 < member <= 4 || member == 11 || member == 7 || member == 17)
	    {
            format(string, sizeof(string), "** (( %s [%d] %s: %s )) **", FracRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank],GetNick(playerid, true), params);
            SendRadioMessage(member, TEAM_BLUE_COLOR, string);
			SendDiscordFracMessage(member, string);
            printf("%s", string);
        }
        else if(GetPlayerOrg(playerid) == FAMILY_SAD) //SAD i BOR po�aczenie
        {
            member = GetPlayerOrg(playerid);
            format(string, sizeof(string), "** (( %s [%d] %s: %s. )) **", FamRang[member][PlayerInfo[playerid][pRank]],PlayerInfo[playerid][pRank], GetNick(playerid, true), params);
            SendFamilyMessage(FRAC_BOR, TEAM_AZTECAS_COLOR, string);
            SendNewFamilyMessage(FAMILY_SAD, TEAM_BLUE_COLOR, string);
            printf("%s", string);
        }
		else
		{
			noAccessMessage(playerid);
			return 1;
		}
	}
	return 1;
}

