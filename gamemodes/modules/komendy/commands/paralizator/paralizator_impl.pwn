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
command_paralizator_Impl(playerid)
{
    if(gPlayerLogged[playerid] == 1 && IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pInjury] > 0 || PlayerInfo[playerid][pBW] > 0) return 1;
		new playerState = GetPlayerState(playerid);
		if(playerState == 1)
		{
            new weaponid = 0, ammo = 0;
            GetPlayerWeaponData(playerid, 2, weaponid, ammo);
            if(ammo > 0 && weaponid == 24 && (IsAPolicja(playerid) || IsABOR(playerid)) && (OnDuty[playerid] == 1 || OnDutyCD[playerid] == 1))
            {
                PrzedmiotyZmienBron(playerid, 24, 1);
            }
		}
	}
	return 1;
}

//end
