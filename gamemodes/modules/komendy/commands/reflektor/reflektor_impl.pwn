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
command_reflektor_Impl(playerid, params[256])
{
    if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLider] == 9)
    {
        if(reflektor == 0)
        {
            sendTipMessageEx(playerid, COLOR_NEWS, "Reflektor w studiu g��wnym (wej�cie D) w��czony");
            reflektor = 1;
            rexl = CreateDynamicObject(18102,700.74334717,-1359.04516602,-91.23200989,38.57757568,0.00000000,265.10229492);
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_NEWS, "Reflektor  w studiu g��wnym (wej�cie D) wy��czony");
            reflektor = 0;
			DestroyDynamicObject(rexl);
        }
    }
	return 1;
}

//end
