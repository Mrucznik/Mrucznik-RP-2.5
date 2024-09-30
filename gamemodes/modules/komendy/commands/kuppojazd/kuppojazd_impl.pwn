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
command_kuppojazd_Impl(playerid)
{
    if(IsPlayerInAnyVehicle(playerid))
	{
		sendErrorMessage(playerid, "Aby tego u�y� musisz wyj�� z pojazdu"); 
		return 1;
	}
    if(PlayerToPoint(10.0, playerid, 2132.0371,-1149.7332,24.2372) || 
		PlayerToPoint(10.0, playerid, -5234.5198, 1403.6206, 7.5452)) // Vice City Sunshine Autos
    {
        ShowPlayerDialogEx(playerid, 440, DIALOG_STYLE_LIST, "Wybierz kategori� kupowanego pojazdu", "Samochody sportowe\nSamochody osobowe\nSamochody luksusowe\nSamochody terenowe\nPick-up`y\nKabriolety\nLowridery\nNa ka�d� kiesze�\nMotory\nInne pojazdy", "Wybierz", "Wyjd�");
	}
	else if(PlayerToPoint(10.0, playerid, -4802.0796, 2921.8924, 5.5407)) // Vice City
	{
		SetPVarInt(playerid, "kupuje-motor", 1);
		ShowPlayerDialogEx(playerid, 458, DIALOG_STYLE_LIST, 
			"Jedno�lady", 
			"NRG-500 11,5mln\nFCR-900 8mln\nBF-400 4,5mln\nFreeway 900tys\nWayfarer 750tys\nSanchez 1,5mln\nQuad 600tys\nFaggio 17tys", 
			"Wybierz", "Wyjd�"
		);
	}
	else
	{
	    sendTipMessage(playerid, "Nie jeste� przy salonie aut.");
	}
	return 1;
}

//end
