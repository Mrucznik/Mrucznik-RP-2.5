//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ kupneony ]-----------------------------------------------//
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

CMD:kupneon(playerid) return cmd_kupneony(playerid);
CMD:kupneony(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(GUIExit[playerid] == 0)
    	{
    	    if(IsPlayerInRangeOfPoint(playerid, 5.0, 1788.2085,-1694.2456,13.1814) || IsPlayerInRangeOfPoint(playerid, 5.0, 1779.0632,-1693.1831,13.1608) || IsPlayerInRangeOfPoint(playerid, 5.0, 1805.4418,-1713.5634,13.5176))
    	    {
      			if(kaska[playerid] >= 3500000)
    	        {
	                if(IsPlayerInAnyVehicle(playerid))
	                {
	                    new veh = GetPlayerVehicleID(playerid);
	                    if(IsABoat(veh) || IsAPlane(veh) || IsABike(veh))
	                    {
	                        sendErrorMessage(playerid, "W helikoptrze/samolocie/�odzi/motorze nie mo�na zamontowa� neon�w.");
	                        return  1;
	                    }
	                    if(IsCarOwner(playerid, veh))
						{
                            IloscAut[playerid] = VehicleUID[veh][vUID];
						    if(PlayerInfo[playerid][pDonateRank] > 0)
						    {
						        ShowPlayerDialogEx(playerid, 1401, DIALOG_STYLE_LIST, "Wybierz kolor neonu", "{FFFFFF}Bia�y\n{DAA520}��ty\n{9ACD32}Zielony\n{0000FF}Niebieski\n{FF0000}Czerwony\n{C2A2DA}R�owy", "Kup", "Anuluj");
						    }
						    else
						    {
						        ShowPlayerDialogEx(playerid, 1401, DIALOG_STYLE_LIST, "Wybierz kolor neonu", "{FFFFFF}Bia�y", "Kup", "Anuluj");
						    }
						}
						else
						{
						    sendErrorMessage(playerid, "Ten pojazd nie jest tw�j");
						    return 1;
						}
	                }
	                else
	                {
	                    sendErrorMessage(playerid, "Nie jeste� w poje�dzie");
	                }
	            }
	            else
	            {
	                sendErrorMessage(playerid, "Nie masz wystarczaj�cej ilo�ci pieni�dzy (3 500 000$)!");
	            }
    	    }
    	    else
    	    {
   				sendErrorMessage(playerid, "Nie jeste� w warsztacie obok Alhambry!");
    	    }
    	}
    }
	return 1;
}


