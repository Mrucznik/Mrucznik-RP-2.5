//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ laptop ]------------------------------------------------//
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

CMD:portable(playerid) return cmd_laptop(playerid);
CMD:laptop(playerid)
{
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
	    if(PlayerInfo[playerid][pMember] == 8 || PlayerInfo[playerid][pLider] == 8)
	    {
		    if(ConnectedToPC[playerid] == 255)
		    {
		        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wy��czy�e� sw�j laptop i zerwa�e� po��czenie z agencj�.");
		        ConnectedToPC[playerid] = 0;
		        return 1;
		    }
		    GetPlayerName(playerid, sendername, sizeof(sendername));
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* W��czy�e� sw�j laptop i po��czy�e� si� z agencj�.");
		    SendClientMessage(playerid, COLOR_WHITE, "|___ Hitman Agency ___|");
		    SendClientMessage(playerid, COLOR_YELLOW2, "|");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - News");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Kontrakty");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Givehit");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Order");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Rangi");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Wyloguj");
			SendClientMessage(playerid, COLOR_WHITE, "|______________|00:00|");
			ConnectedToPC[playerid] = 255;
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� pracownikiem Hitman Agency !");
	        return 1;
	    }
	}
    return 1;
}



