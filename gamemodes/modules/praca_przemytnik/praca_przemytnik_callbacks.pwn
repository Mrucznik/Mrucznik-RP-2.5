//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                              praca_przemytnik                                             //
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
// Data utworzenia: 31.03.2024
//Opis:
/*
	Praca przemytnika.
*/

//

#include <YSI\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
Przemytnik_OnPlayerText(playerid, text[])
{
	switch(GetPVarInt(playerid, "smuggling"))
	{
		case 0:
		{
			return 0;
		}
		case 1: // pocz�tek rozmowy
		{
			if(strcmp(text, "tak", true) == 0)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): podaj mi jak nazywa si� Tw�j kierowca.");
				SetPVarInt(playerid, "smuggling", 2);
			}
			else
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): w takim razie �egnam.");
				SendClientMessage(playerid, COLOR_GRAD2, "Marcepan_Marks roz��czy� si�.");
			}
		}
		case 2: // podaj kierowc�
		{
			new giveplayerid;
			if(sscanf(text, "r", giveplayerid) || !IsPlayerConnected(giveplayerid))
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): nie znam nikogo takiego, na pewno poda�e� mi prawid�owe Imi�_Nazwisko?");
				return 1;
			}

			if(GetPlayerJob(giveplayerid) != JOB_DRIVER)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): ten go�� nie jest zawodowym kierowc�, nie ufam mu.");
				return 1;
			}

			if(GetPlayerJobSkill(giveplayerid, JOB_DRIVER) >= 5)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): ten go�� ma zbyt ma�e umiej�tno�ci by bra� udzia� w akcji przemytniczej, znajd� kogo� bardziej do�wiadczonego (5 skill).");
				return 1;
			}

			if(IsPlayerSmuggling(giveplayerid))
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): zdaje sie, �e ta osoba jest ju� zaj�ta i bierze udzia� w innej akcji przemytniczej.");
				return 1;
			}

			SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): podaj mi imi� swojego kolejnego wsp�lnika, kt�ry b�dzie podnosi� paczki.");
			SendClientMessage(playerid, COLOR_GRAD2, "Je�li nie masz wi�cej wsp�lnik�w, wpisz: 'to wszyscy'.");
			SetPVarInt(playerid, "smuggling", 3);
			SetPVarInt(playerid, "smuggling-driver-id", giveplayerid);
			SetPVarInt(playerid, "smuggling-driver-uid", PlayerInfo[giveplayerid][pUID]);
		}
		case 3: // podaj wsp�lnik�w
		{
			if(strcmp(text, "to wszyscy", true) == 0)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): ok, w takim razie ustalmy miejsce zebrania kontrabandy. Gdy b�dziesz gotowy, powiedz: 'tutaj' a pobiore Twoje koordynaty.");
				SetPVarInt(playerid, "smuggling", 4);
				return 1;
			}

			new giveplayerid;
			if(sscanf(text, "r", giveplayerid) || !IsPlayerConnected(giveplayerid))
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): nie znam nikogo takiego, na pewno poda�e� mi prawid�owe Imi�_Nazwisko?");
				return 1;
			}

			if(GetPlayerJob(giveplayerid) != JOB_SMUGGLER)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): nie chcemy jako wsp�lnik�w os�b postronnych, tylko do�wiadczeni przemytnicy s� gwarantem udanej akcji.");
				return 1;
			}

			if(IsPlayerSmuggling(giveplayerid))
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): zdaje sie, �e ta osoba jest ju� zaj�ta i bierze udzia� w innej akcji przemytniczej.");
				return 1;
			}

			SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): ok, czy to wszyscy, czy masz jeszcze jakiego� wsp�lnika?");
			SendClientMessage(playerid, COLOR_GRAD2, "Je�li nie masz wi�cej wsp�lnik�w, wpisz: 'to wszyscy'.");
			
			new index = GetPVarInt(playerid, "smuggling-partner-index");
			SetPVarInt(playerid, sprintf("smuggling-partner-%d-id", index), giveplayerid);
			SetPVarInt(playerid, sprintf("smuggling-partner-%d-uid", index), PlayerInfo[giveplayerid][pUID]);
			SetPVarInt(playerid, "smuggling-partner-index", index+1);
		}
		case 4: // podaj pozycj�
		{
			if(strcmp(text, "tutaj", true) == 0)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): ok, pobra�em twoj� pozycj�, przywioz� tam kontener do kt�rego b�dziesz musia� dostarczy� �adunek.");
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): wykup kontrabandy od nas to 1 000 000$, chcesz zap�aci� przelewem czy got�wk�?");
				SetPVarInt(playerid, "smuggling", 5);
				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				SetPVarFloat(playerid, "smuggling-x", x);
				SetPVarFloat(playerid, "smuggling-y", y);
				SetPVarFloat(playerid, "smuggling-z", z);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): nie marnuj mojego czasu, gdy b�dziesz gotowy, powiedz: 'tutaj' a pobiore Twoje koordynaty.");
			}
		}
		case 5: // zap�a�
		{
			if(strcmp(text, "gotowka", true) == 0 || strcmp(text, "got�wk�", true) == 0)
			{
				if(kaska[playerid] < PRZEMYT_COST)
				{
					SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): nie pr�buj mnie oszuka�, jeste� go�odupcem. Wr�� jak zarobisz na kupno kontrabandy.");
					SendClientMessage(playerid, COLOR_GRAD2, "Marcepan_Marks roz��czy� si�.");
					DeletePVar(playerid, "smuggling");
					return 1;
				}
				ZabierzKase(playerid, PRZEMYT_COST);
			}
			else if(strcmp(text, "przelewem", true) == 0 || strcmp(text, "przelew", true) == 0)
			{
				if(PlayerInfo[playerid][pAccount] < PRZEMYT_COST)
				{
					SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): nie pr�buj mnie oszuka�, jeste� go�odupcem. Wr�� jak zarobisz na kupno kontrabandy.");
					SendClientMessage(playerid, COLOR_GRAD2, "Marcepan_Marks roz��czy� si�.");
					DeletePVar(playerid, "smuggling");
					return 1;
				}
				PlayerInfo[playerid][pAccount] -= PRZEMYT_COST;
			}
			else
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): zap�acisz przelewem czy got�wk�?");
				SendClientMessage(playerid, COLOR_GRAD2, "Wpisz 'przelewem' lub 'got�wk�'.");
				return 1;
			}

			Log(payLog, INFO, "%s zorganizowa� przemyt za %d$", GetNick(playerid), PRZEMYT_COST);

			SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): w porz�dku, wysy�am Ci koordynaty naszego statku. Udaj si� tam wodolotem wraz ze swoim kierowc� aby odebra� kontraband�.");
			SendClientMessage(playerid, COLOR_YELLOW, "Telefon (Marcepan_Marks): udanej akcji, le� nisko!");
        	SendClientMessage(playerid, COLOR_GRAD2, "Marcepan_Marks roz��czy� si�.");

			StartSmuggling(playerid);
			DeletePVar(playerid, "smuggling");
		}
		default:
		{
			return 0;
		}
	}
	return 1;
}

Przemytnik_OnPlayerLogin(playerid)
{
	new actionID = GetPlayerSmugglingActionID(playerid);
	if(actionID == -1)
	{
		return 1;
	}

	CreateSmugglingPickupCheckpoint(playerid, actionID);
	return 1;
}

//end