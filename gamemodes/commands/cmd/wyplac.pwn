//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wyplac ]------------------------------------------------//
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

YCMD:wyplac(playerid, params[], help)
{
	new string[128];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pLocal] == 103 || GraczBankomat(playerid))
        {
			new cashdeposit;
			if( sscanf(params, "s[32]", string))
			{
				sendTipMessage(playerid, "U�yj /wyplac [kwota]");
				format(string, sizeof(string), "Masz teraz $%d na swoim koncie.", PlayerInfo[playerid][BankMoney]);
				sendTipMessage(playerid, string);
				return 1;
			}
			cashdeposit = FunkcjaK(string);

			if (cashdeposit > PlayerInfo[playerid][BankMoney] || cashdeposit < 1)
			{
				sendTipMessage(playerid, "Nie masz tyle !");
				return 1;
			}
			DajKase(playerid,cashdeposit);
			PlayerInfo[playerid][BankMoney]=PlayerInfo[playerid][BankMoney]-cashdeposit;
			format(string, sizeof(string), "Wyp�aci�e� $%d ze swojego konta, obecny stan to: $%d ", cashdeposit,PlayerInfo[playerid][BankMoney]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			Log(payLog, INFO, "%s wyp�aci� ze swojego konta %d$. Nowu stan: %d$", GetPlayerLogName(playerid), cashdeposit, PlayerInfo[playerid][BankMoney]);
			return 1;
		}
		else
		{
			sendTipMessage(playerid, "Nie jeste� w Banku ani przy bankomacie !");
            return 1;
        }
	}
	return 1;
}
