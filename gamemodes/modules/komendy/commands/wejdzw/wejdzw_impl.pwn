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
command_wejdzw_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pInjury] > 0 || PlayerInfo[playerid][pBW] > 0 ) return 1;
        if(GetPVarInt(playerid, "AC-izolacja") != 0) return sendTipMessageEx(playerid, COLOR_PANICRED, "Jeste� odizolowany, nie mo�esz u�ywa� tej komendy.");
		if(GetPVarInt(playerid, "Lockdown-izolacja") != 0) return sendTipMessageEx(playerid, COLOR_PANICRED, "Nie mo�esz u�ywa� tej komendy w trakcie weryfikacji.");
		
		if(WnetrzeWozu[playerid] != 0)
	    {
	        Z_WnetrzaWozu(playerid, WnetrzeWozu[playerid]);
	    }
	    else
	    {
		    for(new v; v < MAX_VEHICLES; v++)
		    {
				new model = GetVehicleModel(v);
				if(IsAInteriorVehicle(model) || IsAWodolotModel(model))
				{
	   				new Float:vehx, Float:vehy, Float:vehz;
	          		GetVehiclePos(v, vehx, vehy, vehz);
	          		if(IsPlayerInRangeOfPoint(playerid, 15.0, vehx, vehy, vehz))
	          		{
						if(IsAWodolotModel(model))
						{
							PutPlayerInVehicleEx(playerid, v, 1);
							return 1;
						}
                        if(PlayerInfo[playerid][pJailed] != 0)
                        {
                            if(PlayerInfo[playerid][pJailed] == 3)
                            {
								Log(punishmentLog, INFO, "%s dosta� bana od antycheata, pow�d: Ucieczka przed AJ");
                                Ban(playerid);
                            }
                            return 1;
                        }
	          		    if(VehicleUID[v][vIntLock] == 1 || GetVehicleModel(v) == 570)
	          		    {
							if(GetVehicleModel(v) == 570 && PlayerInfo[playerid][pBiletpociag] == 1 || GetVehicleModel(v) == 570 && GetPlayerFraction(playerid) == FRAC_KT)
							{
								Do_WnetrzaWozu(playerid, v, model);
							}
							else if(GetVehicleModel(v) == 570 && PlayerInfo[playerid][pBiletpociag] == 0)
							{
								sendErrorMessage(playerid, "Nie posiadasz biletu! Kup go na dworcu za pomoc� /kupbiletpoci�g(/kbpo)");
								return 1;
							}
							else
							{
								Do_WnetrzaWozu(playerid, v, model);
							}
							
							return 1;
						}
						else
						{
						    sendTipMessage(playerid, "Interior jest zamkni�ty! Otw�rz go za pomoc� /lockint");
						    return 1;
						}
	          		}
				}
		    }
		    sendTipMessage(playerid, "Jeste� zbyt daleko od pojazdu do kt�rego mo�na wej�� w ten spos�b");
		    return 1;
	   	}
	}
	return 1;
}

//end
