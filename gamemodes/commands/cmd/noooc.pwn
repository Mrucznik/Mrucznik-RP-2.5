//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ noooc ]-------------------------------------------------//
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

YCMD:noooc(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        new string[128];
		if (PlayerInfo[playerid][Admin] >= 20)
		{
			if(!noooc)
			{
				noooc = 1;
				BroadCast(COLOR_GRAD2, "�� Czat OOC Zosta� zablokowany przez Administratora !");
			}
			else
			{
				noooc = 0;
				BroadCast(COLOR_GRAD2, "�� Czat OOC Zosta� odblokowany przez Administratora !");
			}

            format(string, 128, "CMD_Info: /noooc u�yte przez %s [%d]", GetNickEx(playerid), playerid);
            SendCommandLogMessage(string);
			Log(adminLog, INFO, "Admin %s u�y� /noooc", GetPlayerLogName(playerid));
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
