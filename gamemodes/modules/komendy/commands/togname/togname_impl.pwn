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
command_togname_Impl(playerid)
{
    if(GetPVarInt(playerid, "tognick") == 1)
    {
        SetPVarInt(playerid, "tognick", 0);

        MSGBOX_Show(playerid, "Imiona ~g~ON", MSGBOX_ICON_TYPE_OK);

        foreach(new i : Player)
        {
            ShowPlayerNameTagForPlayer(playerid, i, 1);
        }
    }
    else
    {
        SetPVarInt(playerid, "tognick", 1);

        MSGBOX_Show(playerid, "Imiona ~r~OFF", MSGBOX_ICON_TYPE_OK);

        foreach(new i : Player)
            ShowPlayerNameTagForPlayer(playerid, i, 0);

    }
    return 1;
}

//end
