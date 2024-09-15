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
command_winda2_Impl(playerid, params[256])
{
    if(IsPlayerConnected(playerid))
	{
		if(GetPVarInt(playerid, "Lockdown-izolacja") != 0) return sendTipMessageEx(playerid, COLOR_PANICRED, "Nie mo�esz u�ywa� tej komendy w trakcie weryfikacji.");
		if(PlayerInfo[playerid][pLider] == 6 || PlayerInfo[playerid][pMember] == 6 || PlayerInfo[playerid][pAdmin] >= 1000)
		{
			if(PlayerToPoint(10.0, playerid, 2809.38671875, -1088.9912109375, 42.11808013916) || PlayerToPoint(10.0, playerid, 2809.38671875, -1088.9912109375, 93.018135070801))
			{
				if(WindaYKZKratas == 1)
				{
					MoveDynamicObject(WindaYKZKrata, 2809.38671875, -1088.9912109375, 42.11808013916, 2.5);
					SetDynamicObjectRot(WindaYKZKrata, 0, 90, 0);
					WindaYKZKratas = 0;
				}
				else
				{
					MoveDynamicObject(WindaYKZKrata, 2809.38671875, -1088.9912109375, 93.018135070801, 2.5);
					SetDynamicObjectRot(WindaYKZKrata, 0, 90, 0);
					WindaYKZKratas = 1;
				}
			}
		}
	}
	return 1;
}

//end
