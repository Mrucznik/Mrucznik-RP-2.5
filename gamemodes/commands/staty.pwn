//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ staty ]-------------------------------------------------//
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

CMD:stats(playerid) return cmd_staty(playerid);
CMD:statystyki(playerid) return cmd_staty(playerid);
CMD:staty(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if (gPlayerLogged[playerid] != 0)
		{
			ShowStats(playerid,playerid);
		}
	}
	return 1;
}

/*CMD:fly(playerid)
{
	if (PlayerInfo[playerid][pAdmin] >= 15 || PlayerInfo[playerid][pAdmin] == 7)
	{
		new Float:px, Float:py, Float:pz, Float:pa;
		GetPlayerFacingAngle(playerid,pa);
		if(pa >= 0.0 && pa <= 22.5) //n1
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px, py+30, pz+5);
		}
		if(pa >= 332.5 && pa < 0.0) //n2
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px, py+30, pz+5);
		}
		if(pa >= 22.5 && pa <= 67.5) //nw
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px-15, py+15, pz+5);
		}
		if(pa >= 67.5 && pa <= 112.5) //w
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px-30, py, pz+5);
		}
		if(pa >= 112.5 && pa <= 157.5) //sw
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px-15, py-15, pz+5);
		}
		if(pa >= 157.5 && pa <= 202.5) //s
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px, py-30, pz+5);
		}
		if(pa >= 202.5 && pa <= 247.5)//se
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px+15, py-15, pz+5);
		}
		if(pa >= 247.5 && pa <= 292.5)//e
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px+30, py, pz+5);
		}
		if(pa >= 292.5 && pa <= 332.5)//e
		{
			GetPlayerPos(playerid, px, py, pz);
			SetPlayerPosEx(playerid, px+15, py+15, pz+5);
		}
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}
*/ 



