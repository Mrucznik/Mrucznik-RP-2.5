//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ bizinfo ]------------------------------------------------//
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

CMD:bizinfo(playerid)
{
    if(IsPlayerConnected(playerid))
    {
	    if(gPlayerLogged[playerid] == 1)
	    {
			new string[256];
			for(new i=0;i<MAX_BIZNES;i++)
		    {
				if(IsPlayerInRangeOfPoint(playerid, 3.0, BizData[i][eBizWejX], BizData[i][eBizWejY], BizData[i][eBizWejZ]))
				{
				    new bizowner[64];
					bizowner = Biz_Owner(i);
					CheckBizLocation(i);
        			if(strfind(bizowner, "mru_konta", true)>=0)
					{
					    format(string, sizeof(string), "{ff704d}NIERUCHOMO�� [0%d]\n{fbfe00}[%s]\n\n{ffffff}W�a�ciciel:\tBrak (biznes na sprzeda�)\nPremia PayDay:\t%d$\nLokalizacja:\t%s", i, BizData[i][eBizName],BizData[i][eBizMoney], bizLocation);
	        			ShowPlayerDialogEx(playerid, 9900, DIALOG_STYLE_MSGBOX, "Informacje o biznesie", string, "Zamknij", "");
					}
					else
					{
					    format(string, sizeof(string), "{ff704d}NIERUCHOMO�� [0%d]\n{fbfe00}[%s]\n\n{ffffff}W�a�ciciel:\t%s\nPremia PayDay:\t%d$\nLokalizacja:\t%s", i, BizData[i][eBizName],bizowner,BizData[i][eBizMoney], bizLocation);
	        			ShowPlayerDialogEx(playerid, 9900, DIALOG_STYLE_MSGBOX, "Informacje o biznesie", string, "Zamknij", "");
	 				}
                }
			}
	    }
	}
	return 1;
}


//-----------------<[ Timery: ]>-------------------


//end