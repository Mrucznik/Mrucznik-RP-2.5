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

CMD:withdraw(playerid, params[]) return cmd_wyplac(playerid, params);
CMD:wyplac(playerid, params[])
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
				format(string, sizeof(string), "Masz teraz $%d na swoim koncie.", PlayerInfo[playerid][pAccount]);
				sendTipMessage(playerid, string);
				return 1;
			}
			cashdeposit = FunkcjaK(string);

			if (cashdeposit > PlayerInfo[playerid][pAccount] || cashdeposit < 1)
			{
				sendTipMessage(playerid, "Nie masz tyle !");
				return 1;
			}
			DajKase(playerid,cashdeposit);
			PlayerInfo[playerid][pAccount]=PlayerInfo[playerid][pAccount]-cashdeposit;
			format(string, sizeof(string), "Wyp�aci�e� $%d ze swojego konta, obecny stan to: $%d ", cashdeposit,PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			format(string, sizeof(string), "[BANK/BANKOMAT] %s wyp�aci� ze swojego konta %d$. Nowy stan: %d$", GetNick(playerid), cashdeposit, PlayerInfo[playerid][pAccount]);
			BankomatLog(string);
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


