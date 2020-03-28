//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ kuplicencje ]-----------------------------------------------//
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
// Autor: Sandal
// Data utworzenia: 24.01.2020

// Opis:
/*
    Kupno licencji prawniczej u NPC
*/


// Notatki skryptera:
/*
	
*/
YCMD:kuppozwolenie(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pJob] == 2)
        {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, -1677.7097,893.5458,-48.9141) && (GetPlayerVirtualWorld(playerid)==1)) 
            {
                if(ApprovedLawyer[playerid] == 0)
                {
                    if(PozwolenieBot == 0)
                    {
                        sendTipMessage(playerid, "Wy��czono mo�liwo�� automatycznego kupna pozwole�.");
                        return 1;
                    }
                    if(kaska[playerid] >= CENA_POZWOLENIE)
                    {
                        ZabierzKase(playerid, CENA_POZWOLENIE);
                        Sejf_Add(FRAC_LSPD, CENA_POZWOLENIE);
                        ApprovedLawyer[playerid] = 1;
                        Log(payLog, INFO, "%s zakupi� pozwolenie od aktora za "#CENA_POZWOLENIE"$", GetPlayerLogName(playerid));
                        sendTipMessage(playerid, "Zakupi�e� pozwolenie za "#CENA_POZWOLENIE"$");
                        return 1; 
                    }
                    else
                    {
                        sendTipMessage(playerid, "Nie sta� cie!");
                        return 1;
                    }
                }
                else
                {
                    sendTipMessage(playerid, "Posiadasz ju� pozwolenie.");
                    return 1;
                }
            }
            else
            {
                sendTipMessage(playerid, "Nie jeste� przy osobie wydaj�cej pozwolenia!");
                return 1; 
            }
        }
        else
        {
            sendTipMessage(playerid, "Komenda dost�pna tylko dla prawnik�w.");
            return 1;
        }
    }
    return 1;
}
