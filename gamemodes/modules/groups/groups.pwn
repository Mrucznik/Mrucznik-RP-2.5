//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  groups                                                   //
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
// Autor: Creative
// Data utworzenia: 22.03.2020
//Opis:
/*
	System grup.
*/

//

//-----------------<[ Funkcje: ]>-------------------
stock ShowGroupsForPlayer(playerid)
{
	if(PlayerInfo[playerid][GroupsShow] == 0)
	{
		if(PlayerInfo[playerid][Group])
		{
			PlayerTextDrawShow(playerid, Textdraw0[playerid]);
			SelectTextDraw(playerid, 0xD4C598AA);

			new str[64];
			format(str, sizeof(str), "1  %s", GroupInfo[PlayerInfo[playerid][Group]][Name]);
			PlayerTextDrawSetString(playerid, Textdraw1[playerid], str);
			PlayerTextDrawShow(playerid, Textdraw1[playerid]);
			PlayerTextDrawShow(playerid, Textdraw4[playerid]);
			PlayerTextDrawShow(playerid, Textdraw7[playerid]);
			PlayerTextDrawShow(playerid, Textdraw10[playerid]);
			PlayerTextDrawShow(playerid, Textdraw13[playerid]);
			PlayerInfo[playerid][GroupsShow] = 1;
		}
		else
		{
  			GameTextForPlayer(playerid, "~w~Nie posiadasz przynaleznosci do ~r~zadnej ~w~grupy!", 3000, 4);
		}
	}
	else
	{
		PlayerInfo[playerid][GroupsShow] = 0;
		CancelSelectTextDraw(playerid);
		PlayerTextDrawHide(playerid, Textdraw0[playerid]);
		PlayerTextDrawHide(playerid, Textdraw1[playerid]);
		PlayerTextDrawHide(playerid, Textdraw4[playerid]);
		PlayerTextDrawHide(playerid, Textdraw7[playerid]);
		PlayerTextDrawHide(playerid, Textdraw10[playerid]);
		PlayerTextDrawHide(playerid, Textdraw13[playerid]);
	}
	return 1;
}

//end