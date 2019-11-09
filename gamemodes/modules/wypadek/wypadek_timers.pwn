//-----------------------------------------------<< Timers >>------------------------------------------------//
//                                                  wypadek                                                  //
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
// Autor: Mrucznik
// Data utworzenia: 11.06.2019
//Opis:
/*
	System wypadk�w. Dawny filterscript scanhp.
*/

//

//-----------------<[ Timery: ]>-------------------
public scanhp(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
    new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInConvoyCar(playerid)) return 1;
	GetVehicleHealth(vehicleid,newhealth[playerid]);
	if(oldhealth[playerid] > (newhealth[playerid] + SCAN_HP_VALUE))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 7.0, 2064.0703,-1831.3167,13.3853) || IsPlayerInRangeOfPoint(playerid, 7.0, 1024.8514,-1022.2302,31.9395) || IsPlayerInRangeOfPoint(playerid, 7.0, 486.9398,-1742.4130,10.9594) || IsPlayerInRangeOfPoint(playerid, 7.0, -1904.2325,285.3743,40.8843)  || IsPlayerInRangeOfPoint(playerid, 7.0, 720.0876,-458.3574,16.3359))
	    {
	        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Pojazd naprawiony!");
	    }
	    else
		{
		    if(pasy[playerid] == 1)
		    {
		        if(WszedlDoPojazdu[playerid] == 0)
		        {
			        if(oldhealth[playerid] > (newhealth[playerid] + 120))
					{
					    new nick[MAX_PLAYER_NAME];
				    	new string[256];
				    	new Float:zyciewypadku;
						GetPlayerName(playerid, nick, sizeof(nick));
						GetPlayerHealth(playerid, zyciewypadku);
						SetPlayerHealth(playerid, zyciewypadku-7);
					    format(string, sizeof(string), "* %s uderzy� g�ow� w kierownice mimo zapi�tych pas�w", nick);
						ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ale przywali�e�, szcz�cie �e mia�e� zapi�te pasy!");
					}
			        else if(oldhealth[playerid] > (newhealth[playerid] + SCAN_HP_VALUE))
					{
				 		new nick[MAX_PLAYER_NAME];
				    	new string[256];
						GetPlayerName(playerid, nick, sizeof(nick));
					    format(string, sizeof(string), "* Pasy zadzia�a�y i %s nie dozna� powa�nych obra�e� (( %s ))", nick, nick);
						ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolejna st�uczka, mia�e� zapi�te pasy i nic ci si� nie sta�o!");
					}
				}
			}
			else if(kask[playerid] == 1)
		    {
		        if(WszedlDoPojazdu[playerid] == 0 && IsABike(vehicleid))
		        {
			        if(oldhealth[playerid] > (newhealth[playerid] + 120))
					{
					    new nick[MAX_PLAYER_NAME];
				    	new string[256];
				    	new Float:zyciewypadku;
						GetPlayerName(playerid, nick, sizeof(nick));
						GetPlayerHealth(playerid, zyciewypadku);
						SetPlayerHealth(playerid, zyciewypadku-7);
					    format(string, sizeof(string), "* %s uderzy� kaskiem w kierownic�.", nick);
						ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ale przywali�e�, szcz�cie �e mia�e� kask na g�owie!");
					}
			        else if(oldhealth[playerid] > (newhealth[playerid] + SCAN_HP_VALUE))
					{
				 		new nick[MAX_PLAYER_NAME];
				    	new string[256];
						GetPlayerName(playerid, nick, sizeof(nick));
					    format(string, sizeof(string), "* Kask uratowa� %s i nie dozna� powa�nych obra�e�. (( %s ))", nick, nick);
						ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolejna st�uczka, mia�e� kask na g�owie i nic ci si� nie sta�o!");
					}
				}
			}
			else
			{
			    if(WszedlDoPojazdu[playerid] == 0)
			    {
		  			if(oldhealth[playerid] > (newhealth[playerid] + 120))
					{
					    new nick[MAX_PLAYER_NAME];
				    	new string[256];
				    	new Float:zyciewypadku;
						GetPlayerName(playerid, nick, sizeof(nick));
						GetPlayerHealth(playerid, zyciewypadku);
						TogglePlayerControllable(playerid, 0);
						SetPlayerHealth(playerid, zyciewypadku-20);
					    format(string, sizeof(string), "* %s z powodu wypadku wylecia� z pojazdu.", nick);
						ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
						if(IsABike(GetPlayerVehicleID(playerid)))
	    				{
					    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wypad�e� z pojazdu, aby unikn�� wypadania z pojazdu wpisz /kask!");
						}
						else
						{
						    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Wypad�e� z pojazdu, aby unikn�� wypadania z pojazdu wpisz /zp!");
						}
					    new Float:px, Float:py, Float:pz, Float:pa;
						GetPlayerFacingAngle(playerid,pa);
						if(pa >= 0.0 && pa <= 22.5) //n1
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px, py+2, pz+2);
						}
						if(pa >= 332.5 && pa < 0.0) //n2
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px, py+2, pz+2);
						}
						if(pa >= 22.5 && pa <= 67.5) //nw
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px-1.0, py+1.0, pz+3);
						}
						if(pa >= 67.5 && pa <= 112.5) //w
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px-2, py, pz+2);
						}
						if(pa >= 112.5 && pa <= 157.5) //sw
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px-1.0, py-1.0, pz+3);
						}
						if(pa >= 157.5 && pa <= 202.5) //s
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px, py-2, pz+3);
						}
						if(pa >= 202.5 && pa <= 247.5)//se
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px+1.0, py-1.0, pz+3);
						}
						if(pa >= 247.5 && pa <= 292.5)//e
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px+2, py, pz+3);
						}
						if(pa >= 292.5 && pa <= 332.5)//e
						{
							GetPlayerPos(playerid, px, py, pz);
							SetPlayerPos(playerid, px+1.0, py+1.0, pz+3);
						}
						TogglePlayerControllable(playerid, 1);
					}
				    else if(oldhealth[playerid] > (newhealth[playerid] + SCAN_HP_VALUE))
					{
					    new nick[MAX_PLAYER_NAME];
				    	new string[256];
				    	new Float:zyciewypadku;
						GetPlayerName(playerid, nick, sizeof(nick));
						GetPlayerHealth(playerid, zyciewypadku);
						SetPlayerHealth(playerid, zyciewypadku-7);
					    format(string, sizeof(string), "* %s uderzy� g�ow� w kierownic�. (( %s ))", nick, nick);
						ProxDetector(30.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
						if(IsABike(GetPlayerVehicleID(playerid)))
	    				{
					    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolejna st�uczka, aby unikn�� obra�e� wpisz /kask!");
						}
						else
						{
						    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kolejna st�uczka, aby unikn�� obra�e� wpisz /zp!");
						}
					}
				}
			}
		}
	}
	GetVehicleHealth(vehicleid,oldhealth[playerid]);
	return 1;
}

public EnterCar(playerid)
{
	WszedlDoPojazdu[playerid] = 0;
}

//end