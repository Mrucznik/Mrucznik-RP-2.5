//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                     a                                                     //
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
// Autor: mrucznik
// Data utworzenia: 15.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_ann_Impl(playerid, params[256])
{
    if(PlayerInfo[playerid][pAdmin] > 5)
	{
		new string[128];
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj /ann [cnn textformat ~n~=nowa linia ~r~=czerwony ~g~=zielony ~b~=niebieski ~w~=bia�y ~y~=��ty]");
			return 1;
		}
		else if(GetPlayerAdminDutyStatus(playerid) == 0) return sendErrorMessage(playerid, "Musisz by� na s�u�bie Administratora!"); 
		else if(OnDuty[playerid] == 1 || OnDutyCD[playerid] == 1) return sendErrorMessage(playerid, "Jeste� na s�u�bie IC, graj IC!"); 

		format(string, sizeof(string), "  ~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~                         %s",params);
        if(!issafefortextdraw(string)) return sendErrorMessage(playerid, "Niekompletny tekst (tyldy etc)");
        GameTextForAll(string, 3000, 3);
		format(string, sizeof(string), "AdmCmd: %s [ID: %d] napisal cos na /ann", GetNickEx(playerid), playerid);
		SendMessageToAdmin(string, COLOR_PANICRED);

        Log(adminLog, INFO, "Admin %s u�y� /ann o tre�ci: %s", GetPlayerLogName(playerid), params);
	}
	else
	{
	    noAccessMessage(playerid);
	}
	return 1;
}

//end
