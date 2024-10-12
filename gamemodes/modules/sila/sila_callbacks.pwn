//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                    sila                                                   //
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
// Autor: Simeone
// Data utworzenia: 04.05.2019
//Opis:
/*
	System siły.
*/

//

#include <YSI\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
Sila_OnPlayerEnterCheckpoint(playerid)
{
	if(GetPVarInt(playerid, "RozpoczalBieg") == 1)
	{
		if(GetPVarInt(playerid, "WybralBieg") == 1)
		{
			if(OszukujewBiegu[playerid] == 0)
			{
				if(GetPVarInt(playerid, "ZaliczylBaze") == 0)
				{
					CreateNewRunCheckPoint(playerid, 1709.3523,-1461.3938,13.5469, 3, "Zaliczy�e� pierwszy przystanek, kolejny jest ju� oznaczony!", 0, true);
				}
				if(GetPVarInt(playerid, "ZaliczylBaze") == 1)
				{
					CreateNewRunCheckPoint(playerid, 1707.8762,-1584.3118,13.5453, 3, "Zaliczy�e� drugi przystanek, kolejny jest ju� oznaczony!", 0, true); 
				}
				if(GetPVarInt(playerid, "ZaliczylBaze") == 2)
				{
					CreateNewRunCheckPoint(playerid, 1625.7415,-1608.9004,13.7188, 3, "Zaliczy�e� trzeci przystanek, kolejny jest ju� oznaczony!", 5,true); 
				}
				if(GetPVarInt(playerid, "ZaliczylBaze") == 3)
				{
					CreateNewRunCheckPoint(playerid, 1538.9513,-1724.1267,13.5469, 3, "Zaliczy�e� czwarty przystanek, kolejny jest ju� oznaczony!", 0, true); 
				}
				if(GetPVarInt(playerid, "ZaliczylBaze") == 4)
				{
					CreateNewRunCheckPoint(playerid, 1322.6306,-1724.9469,13.5469, 3, "Zaliczy�e� pi�ty przystanek, kolejny jest ju� oznaczony!", 0, true); 
				}
				if(GetPVarInt(playerid, "ZaliczylBaze") == 5)
				{
					CreateNewRunCheckPoint(playerid, 1318.4052,-1841.7726,13.5469, 3, "Zaliczy�e� sz�sty przystanek, kolejny jest ju� oznaczony!", 0, true); 
				}
				if(GetPVarInt(playerid, "ZaliczylBaze") == 6)
				{
					CreateNewRunCheckPoint(playerid,  1382.2340,-1811.7761,13.5469, 3, "Zaliczy�e� si�dmy (przedostatni) przystanek, kolejny jest ju� oznaczony!", 0, true); 
				}
				if(GetPVarInt(playerid, "ZaliczylBaze") == 7)//Ostatni
				{
					EndRunPlayer(playerid, 10);
				}
			}
			else
			{
				sendTipMessageEx(playerid, COLOR_RED, "WYKRYTO OSZUSTWO! TW�J BIEG ZOSTAJE PRZERWANY"); 
				DisablePlayerCheckpoint(playerid);
				SetPVarInt(playerid, "ZaliczylBaze", 0);
				SetPVarInt(playerid, "WybralBieg", 0);
				SetPVarInt(playerid, "RozpoczalBieg", 0);
			}
		}
		else if(GetPVarInt(playerid, "WybralBieg") == 2)
		{
			if(GetPVarInt(playerid, "ZaliczylBaze") == 0)
			{
				CreateNewRunCheckPoint(playerid,  535.0668,-1364.9790,15.8432, 2, "Zaliczy�e� pierwszy checkpoint! Nast�pny zosta� ju� oznaczony", 0, true); 
			}
			if(GetPVarInt(playerid, "ZaliczylBaze") == 1)
			{
				CreateNewRunCheckPoint(playerid,  339.2540,-1526.9476,33.3757, 2, "Zaliczy�e� drugi checkpoint! Nast�pny zosta� oznaczony", 0, true); 
			}
			if(GetPVarInt(playerid, "ZaliczylBaze") == 2)
			{
				CreateNewRunCheckPoint(playerid,  317.4830,-1632.8326,33.3125, 2, "Zaliczy�e� trzeci checkpoint! Nast�pny zosta� oznaczony, a ty si� nie poddajesz!", 5, true); 
			}
			if(GetPVarInt(playerid, "ZaliczylBaze") == 3)
			{
				CreateNewRunCheckPoint(playerid,  364.1078,-1805.8809,7.8380, 2, "Zaliczy�e� czwarty checkpoint! Pi�ty jest ju� oznaczony!", 0, true); 
			}
			if(GetPVarInt(playerid, "ZaliczylBaze") == 4)
			{
				CreateNewRunCheckPoint(playerid,  664.4612,-1859.3246,5.4609, 2, "Zaliczy�e� Pi�ty checkpoint! Zosta�y jeszcze dwa!", 5, true); 
			}
			if(GetPVarInt(playerid, "ZaliczylBaze") == 5)
			{
				CreateNewRunCheckPoint(playerid,  966.9481,-1834.9043,12.6000, 2, "Sz�sty przystanek zaliczony! Biegnij do kolejnego", 0, true); 

			}
			if(GetPVarInt(playerid, "ZaliczylBaze") == 6)
			{
				CreateNewRunCheckPoint(playerid,  1000.8669,-1857.4419,12.8146, 2, "Zaliczy�e� si�dmy checkpoint! Ju� wida� ostatni", 5, true); 
			}
			if(GetPVarInt(playerid, "ZaliczylBaze") == 7)//Ostatni
			{
				EndRunPlayer(playerid, 5);
			}
		}
		else//Je�li wybra� dialog do pokazania punktu startowego trasy
		{
			DisablePlayerCheckpoint(playerid);
			sendTipMessageEx(playerid, COLOR_P@, "Aby rozpocz�� bieg wpisz w tym miejscu [/biegnij]"); 
			SetPVarInt(playerid, "RozpoczalBieg", 0);
		}
		return 1;
	}
	return 0; // continue
}

//end