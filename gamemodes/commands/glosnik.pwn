//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ glosnik ]------------------------------------------------//
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

CMD:sanradio(playerid) return cmd_glosnik(playerid);
CMD:glosnik(playerid)
{
    if(PlayerInfo[playerid][pMember] == 9 && PlayerInfo[playerid][pRank] >= 8 ||PlayerInfo[playerid][pLider] == 9 || GetPlayerOrg(playerid) == 19 && IsPlayerInRangeOfPoint(playerid, 75.0 , 578.6193,-2195.7708,1.6288) && PlayerInfo[playerid][pRank] >= 3)
    {
        if(SanDuty[playerid] == 0) return sendErrorMessage(playerid, "Musisz by� na s�u�bie San News");
		if(SANradio == 0)
		{
            new bool:inpos=true;
		    if(inpos)
		    {
		        ShowPlayerDialogEx(playerid, 765, DIALOG_STYLE_LIST, "Wybierz muzyk�", "Mrucznik Radio 1\nMrucznik Radio 2\nDisco polo\nDance100\nPrzeboje\nHip hop\nParty\nW�asna", "Wybierz", "Anuluj");
		    }
		}
		else
		{
		    DestroyDynamicObject(SANradio);
			DestroyDynamic3DTextLabel(SAN3d);
		    SANradio = 0;
		    foreach(Player, i)
	        {
	            if(IsPlayerConnected(i))
	            {
                    if(IsPlayerInRangeOfPoint(playerid, 75.0, SANx, SANy, SANz))
					{
                        if(GetPVarInt(i, "sanaudio") == 1)
                        {
                            StopAudioStreamForPlayer(i);
                            SetPVarInt(i, "sanaudio", 0);
                        }
					}
	            }
	        }
            sendTipMessageEx(playerid, COLOR_GREY, "G�o�nik wy��czony!");
            StopAudioStreamForPlayer(playerid);
	    	return 1;
		}
	}
	else
	{
	    sendErrorMessage(playerid, "Nie jeste� z SAN News!");
	    return 1;
	}
    return 1;
}

