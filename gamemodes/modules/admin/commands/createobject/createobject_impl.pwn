//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                createobject                                               //
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
// Data utworzenia: 30.09.2024


//

//------------------<[ Implementacja: ]>-------------------
command_createobject_Impl(playerid, model, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    if(x == -1.0)
    {
        GetPlayerPos(playerid, x, y, z);
        GetXYInFrontOfPlayer(playerid, x, y, GetColSphereRadius(model));
    }
    new obj = CreateDynamicObject(model, x, y, z, rx, ry, rz);
    SendClientMessage(playerid, COLOR_WHITE, sprintf("Stworzono obiekt: %d", obj));
    return 1;
}

//end