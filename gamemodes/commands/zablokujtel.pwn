//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ zablokujtel ]----------------------------------------------//
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

CMD:togphone(playerid) return cmd_zablokujtel(playerid);
CMD:togtel(playerid) return cmd_zablokujtel(playerid);
CMD:togtelefon(playerid) return cmd_zablokujtel(playerid);
CMD:zablokujtel(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        //if(PlayerInfo[playerid][pDonateRank] > 0 || PlayerInfo[playerid][pLevel] >= 3)
        //{
		if (!PhoneOnline[playerid])
		{
			PhoneOnline[playerid] = 1;
            MSGBOX_Show(playerid, "Telefon ~r~OFF", MSGBOX_ICON_TYPE_OK);
		}
		else if (PhoneOnline[playerid])
		{
			PhoneOnline[playerid] = 0;
            MSGBOX_Show(playerid, "Telefon ~g~ON", MSGBOX_ICON_TYPE_OK);
		}
		//}
		//else
		//{
		//    SendClientMessage(playerid, COLOR_GREY, "   Nie masz 3 levela / Nie posiadasz Konta premium !");
        //   return 1;
		//}
	}
	return 1;
}

