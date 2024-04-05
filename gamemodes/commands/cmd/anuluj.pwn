//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ anuluj ]------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:anuluj(playerid, params[], help)
{
	new x_job[16];
	if( sscanf(params, "s[16]", x_job))
	{
		SendClientMessage(playerid, COLOR_WHITE, "|__________________ Cancel __________________|");
		SendClientMessage(playerid, COLOR_WHITE, "U�YJ: /anuluj [nazwa]");
		SendClientMessage(playerid, COLOR_GREY, "Dost�pne nazwy: Sex, Dragi, Naprawa, Prawnik, Pancerz, Wywiad, Tankowanie, Auto, Boks, Kontrakt");
		SendClientMessage(playerid, COLOR_GREY, "Dost�pne nazwy: Taxi, Bus, Medyk, Mechanik, Mandat, Swiadek, Slub, Rozwod, taxicall");
		SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________|");
		return 1;
	}
	if(strcmp(x_job,"sex",true) == 0) {	SexOffer[playerid] = 999; SexPrice[playerid] = 0; }
	else if(strcmp(x_job,"dragi",true) == 0) { DrugOffer[playerid] = 999; DrugPrice[playerid] = 0; DrugGram[playerid] = 0; }
	else if(strcmp(x_job,"naprawa",true) == 0) {	RepairOffer[playerid] = 999; RepairPrice[playerid] = 0; RepairCar[playerid] = 0; }
	else if(strcmp(x_job,"prawnik",true) == 0) { WantLawyer[playerid] = 0; CallLawyer[playerid] = 0; }
	else if(strcmp(x_job,"ochrona",true) == 0 || strcmp(x_job,"pancerz",true) == 0) { GuardOffer[playerid] = 999; GuardPrice[playerid] = 0; }
	else if(strcmp(x_job,"wywiad",true) == 0) { LiveOffer[playerid] = 999; }
	else if(strcmp(x_job,"tankowanie",true) == 0) { RefillOffer[playerid] = 999; RefillPrice[playerid] = 0; }
	else if(strcmp(x_job,"auto",true) == 0) { CarOffer[playerid] = 999; CarPrice[playerid] = 0; CarID[playerid] = 0; }
	else if(strcmp(x_job,"boks",true) == 0) { BoxOffer[playerid] = 999; }
	else if(strcmp(x_job,"swiadek",true) == 0) { MarryWitnessOffer[playerid] = 999; }
	else if(strcmp(x_job,"slub",true) == 0) { ProposeOffer[playerid] = 999; }
	else if(strcmp(x_job,"rozwod",true) == 0) { DivorceOffer[playerid] = 999; }
	else if(strcmp(x_job,"mandat",true) == 0) { SendClientMessage(TicketOffer[playerid], COLOR_PANICRED, "Podejrzany nie zgodzi� si� zap�aci� mandatu, jed� z nim na komisariat" ); TicketOffer[playerid] = 999; TicketMoney[playerid] = 0; }
	else if(strcmp(x_job,"medyk",true) == 0) { if(IsPlayerConnected(MedicCall)) { if(MedicCall == playerid) { MedicCall = 999; } else { SendClientMessage(playerid, COLOR_GREY, "   Nie zamawia�e� medyka !"); return 1; } } }
	else if(strcmp(x_job,"mechanik",true) == 0) { if(IsPlayerConnected(MechanicCall)) { if(MechanicCall == playerid) { MechanicCall = 999; } else { SendClientMessage(playerid, COLOR_GREY, "   Nie zamawia�e�  mechanika !"); return 1; } } }
	else if(strcmp(x_job,"taxi",true) == 0)
	{
	    anuluj_taxi(playerid);
	}
	else if(strcmp(x_job,"taxicall",true) == 0)
	{
		anuluj_taxicall(playerid);
   	}
	else if(strcmp(x_job,"kontrakt",true) == 0)
	{
		if(PlayerInfo[playerid][pMember]==8 || PlayerInfo[playerid][pLider]==8)
 		{
   			if(GoChase[playerid] < 999)
      		{
				SendFamilyMessage(8, COLOR_YELLOW, sprintf("Kontrakt na %s, nagroda za wykonanie $%d.", GetNickEx(GoChase[playerid]), PlayerInfo[GoChase[playerid]][pHeadValue]));
				GotHit[playerid] = 0;
				GetChased[GoChase[playerid]] = 999;
				GoChase[playerid] = 999;
				GameTextForPlayer(playerid, "~w~Anulowano~n~~r~kontrakt", 5000, 1);
   			}
   			else
   			{
	           sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� z HA !");
   			}
   		}
   	}
	else if(strcmp(x_job,"bus",true) == 0)
	{
	    anuluj_bus(playerid);
	}
	else
	{ return 1; }
	new string[32];
	format(string, sizeof(string), "* Anulowa�e�: %s.", x_job);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}
