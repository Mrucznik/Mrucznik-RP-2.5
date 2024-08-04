//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   fixvc                                                   //
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
// Data utworzenia: 26.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_fixvc_Impl(playerid)
{
    if(GetPVarInt(playerid, "debug-objects") != 1)
    {
        if(!IsPlayerAtViceCity(playerid))
        {
            MruMessageFail(playerid, "Nie jeste� w Vice City.");
            return 1;
        }

        new Float:unused;
        if(!CA_IsPlayerInWater(playerid, unused, unused))
        {
            MruMessageFail(playerid, "Nie wpad�e� do wody!");
            return 1;
        }
    }

    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
      
    new obj = CA_RayCastLine(x, y, 700.0, x, y, -1000.0, x, y, z);
    if(obj == 0)
    {
        MruMessageFail(playerid, "Niestety, nie uda�o si� naprawi� pozycji - nie ma nad Tob� �adnego obiektu.");
        return 1;
    }
    else if(obj == WATER_OBJECT)
    {
        MruMessageFail(playerid, "Niestety, nie uda�o si� naprawi� pozycji - wykryto tylko wod�.");
        return 1;
    }

    SetPlayerPos(playerid, x, y, z + 1.5);
    GameTextForPlayer(playerid, "Naprawiles swoja pozycje!", 5000, 1);
    return 1;
}

//end