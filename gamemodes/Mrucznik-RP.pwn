//-----------------------------------------[Mapa Mrucznik Role Play]-----------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//---------------------------------(Stworzona na podstawie mapy The Godfather)-------------------------------//
//-------------------------------------------------(v2.6)----------------------------------------------------//
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
/*

Mrucznik� Role Play ----> stworzy� Mrucznik
	Inni developerzy:
		Kubi - zwyk�y skurwysyn
		Akil - chyba nic nie zrobi� koniec ko�c�w
		Niceczlowiek - okry� si� ha�b� publikuj�c map�
		PECET - dobry skrypter

*/
//----------------------------------------------------*------------------------------------------------------//

#pragma compress 0

//const correctness off - how to fix: https://github.com/pawn-lang/YSI-Includes/commit/ab75ea38987e6a7935aa3100eba5284cb3d706e1
#pragma warning disable 239
#pragma warning disable 214

//-------------------------------------------<[ Includy ]>---------------------------------------------------//
//-                                                                                                         -//
#include <a_samp>
#include <fixes>
#include <callbacks>
#include <a_http>
#include <utils>
#include <foreach>
#include <zcmd>
#include <md5>
#include <double-o-files2>
#include <dialogs>
#include <fadescreen>
#include <ACSBM>
#include <timestamp>
#define AC_MAX_CONNECTS_FROM_IP		2
#include <nex-ac>    		// By NexiusTailer, v1.9.10	r1	https://github.com/NexiusTailer/Nex-AC
#include <systempozarow>   //System Po�ar�w v0.1 by PECET

//-------<[ Pluginy ]>-------
#include <crashdetect>                  // By Zeex, 4.18.1              https://github.com/Zeex/samp-plugin-crashdetect/releases
#include <sscanf2>						// By Y_Less, 2.8.2:			http://forum.sa-mp.com/showthread.php?t=570927
#define REGEX_ON
#if defined REGEX_ON
#include <libRegEx>						// By Koala818 v0.2				https://github.com/FF-Koala/Regular-Expressions-Plugin
#endif
#include <streamer>						// By Incognito, 2.9.2			http://forum.sa-mp.com/showthread.php?t=102865
#include <mysql_R5>						// By BlueG, R41-4				https://github.com/pBlueG/SA-MP-MySQL
#include <timestamptodate>

//-------<[ Natives ]>-------
native WP_Hash(buffer[], len, const str[]);

//--------------------------------------<[ G��wne ustawienia ]>----------------------------------------------//
//-                                                                                                         -//
#include "VERSION.pwn"
#define DEBUG 2 //1- DEBUG ON | 2- DEBUG OFF | 0- UNDEFINED BEHAVIOUR xD


//-----------------------------------------<[ Modu�y mapy ]>-------------------------------------------------//
//-                                                                                                         -//
#include "modules/definicje.pwn"
#include "modules/new/niceczlowiek/definicje.pwn"
#include "modules/kolory.pwn"
#include "modules/forward.pwn"
#include "modules/textdraw.pwn"
#include "modules/enum.pwn"
#include "modules/zmienne.pwn"
#include "modules/new/niceczlowiek/general.pwn"
#include "modules/new/niceczlowiek/dynamicgui.pwn"
#include "modules/mru_mysql.pwn"

//Nowe modu�y .def:
#include "modules/new/bramy/bramy.def"
#include "modules/new/wejscia/wejscia.def"
#include "modules/new/budki/budki.def"
#include "modules/new/premium/premium.def"

//Nowe modu�y .hwn:
#include "modules/new/bramy/bramy.hwn"
#include "modules/new/wejscia/wejscia.hwn"
#include "modules/new/budki/budki.hwn"
#include "modules/new/premium/premium.hwn"

//Nowe modu�y .pwn:
#include "modules/new/bramy/bramy.pwn"
#include "modules/new/wejscia/wejscia.pwn"
#include "modules/new/budki/budki.pwn"
#include "modules/new/premium/premium.pwn"
#include "modules/new/premium/premium_dialogs.pwn"

//Inne:
#include "modules/Inne/ibiza.inc"
#include "modules/Inne/system_aut.pwn"
#include "modules/Inne/system_kp.pwn"
#include "modules/Inne/external.pwn"

//Modu�y mapy c.d.
#include "modules/funkcje.pwn"
#include "modules/timery.pwn"

//Obiekty:
#include "modules/obiekty/stare_obiekty.pwn"
#include "modules/obiekty/nowe_obiekty.pwn"
#include "modules/obiekty/pickupy.pwn"
#include "modules/obiekty/3dtexty.pwn"
#include "modules/obiekty/ikony.pwn"

//Modu�y mapy c.d.
#include "modules/komendy.pwn"
#include "modules/new/niceczlowiek/cmd.pwn"
#include "modules/new/niceczlowiek/noysi.pwn"
#include "modules/new/niceczlowiek/wybieralka.pwn"

//------------------------------------------------------------------------------------------------------
main()
{
	print("\n----------------------------------");
	print("M | --- Mrucznik Role Play --- | M");
	print("R | ---        ****        --- | R");
	print("U | ---        v2.5        --- | U");
	print("C | ---        ****        --- | C");
	print("Z | ---    by Mrucznik     --- | Z");
	print("N | ---                    --- | N");
	print("I | ---       /\\_/\\      --- | I");
	print("K | ---   ===( *.* )===    --- | K");
	print("  | ---       \\_^_/       --- |  ");
	print("R | ---         |          --- | R");
	print("P | ---         O          --- | P");
	print("----------------------------------\n");
	//exit;
	AntiDeAMX();
	WasteDeAMXersTime();
}
//------------------------------------------------------------------------------------------------------

//---------------------------<[  Callbacks   ]>--------------------------------------------------

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	#if DEBUG == 1
		printf("%s wykonal komende %s", GetNick(playerid), cmdtext);
	#endif
	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
	#if DEBUG == 1
		printf("%s wpisal komende %s", GetNick(playerid), cmdtext);
	#endif
	if(GUIExit[playerid] != 0 || gPlayerLogged[playerid] == 0)
	{
		SendClientMessage(playerid, COLOR_WHITE, "SERWER: "SZARY"Nie jeste� zalogowany/Masz otwarte okno dialogowe!");
		return 0;
	}
    /*if(GetTickDiff(GetTickCount(), StaryCzas[playerid]) < 100)//antyspam
	{
		SendClientMessage(playerid, COLOR_WHITE, "SERWER: "SZARY"Odczekaj chwil� zanim wpiszesz nast�pn� komende!");
		return 0;
	}*/
    if(IsCommandBlocked(cmdtext))
    {
        SendClientMessage(playerid, COLOR_WHITE, "SERWER: "SZARY"Komenda jest wy��czona.");
        return 0;
    }
	StaryCzas[playerid] = GetTickCount();
	return 1;
}

//public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
#include "modules/OnDialogResponse.pwn"

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	//return 0; = strza� nie zabiera hp

    if(MaTazer[playerid] == 1 && (GetPlayerWeapon(playerid) == 23 || GetPlayerWeapon(playerid) == 24 || GetPlayerWeapon(playerid) == 22) && hittype != 1)
    {
    	GameTextForPlayer(playerid, "~r~NIE TRAFILES W GRACZA!~n~~w~TAZER DEZAKTYWOWANY! PRZELADUJ TAZER!", 3000, 5);
		MaTazer[playerid] = 0;
        return 0;
	}
    if(MaTazer[playerid] == 1 && (GetPlayerWeapon(playerid) == 23 || GetPlayerWeapon(playerid) == 24) && TazerAktywny[hitid] == 0 && GetDistanceBetweenPlayers(playerid,hitid) < 11 && hittype == 1)
    {
        new giveplayer[MAX_PLAYER_NAME];
        new sendername[MAX_PLAYER_NAME];
        GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
        GetPlayerName(hitid, sendername, sizeof(sendername));
        TazerAktywny[hitid] = 1;
        SetTimerEx("DostalTazerem", 30000, false, "i", hitid);
        new string[128];
        GameTextForPlayer(hitid, "DOSTALES TAZEREM! ODCZEKAJ CHWILE!", 3000, 5);
        GameTextForPlayer(playerid, "~g~TRAFILES W GRACZA!~n~~w~TAZER DEZAKTYWOWANY! PRZELADUJ TAZER!", 3000, 5);
        SetPVarInt(playerid, "wytazerowany", 15);
        format(string, sizeof(string), "* %s strzela tazerem w %s.", giveplayer, sendername);
        ProxDetector(30.0, hitid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
        MaTazer[playerid] = 0;
        PlayerPlaySound(playerid, 6300, 0.0, 0.0, 0.0);
        PlayerPlaySound(hitid, 6300, 0.0, 0.0, 0.0);
        ApplyAnimation(hitid, "CRACK","crckdeth2",4.1,0,1,1,1,1,1);
        ClearAnimations(hitid);
        ApplyAnimation(hitid, "CRACK","crckdeth2",4.1,0,1,1,1,1,1);
        TogglePlayerControllable(hitid, 0);
        return 0;
    }
    else if(MaTazer[playerid] == 1 && (GetPlayerWeapon(playerid) == 23 || GetPlayerWeapon(playerid) == 24) && TazerAktywny[hitid] == 0 && GetDistanceBetweenPlayers(playerid,hitid) > 10 && hittype == 1)
    {
        GameTextForPlayer(playerid, "~r~GRACZ BYL ZA DALEKO!~n~~w~TAZER DEZAKTYWOWANY! PRZELADUJ TAZER!", 3000, 5);
        MaTazer[playerid] = 0;
        return 0;
    }
    return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerClickTextDraw - begin", GetNick(playerid), playerid);
	#endif

    NowaWybieralka::ClickedTxd(playerid, clickedid);

    new str[128];
    if(clickedid == Text:INVALID_TEXT_DRAW)
    {
        if(GetPVarInt(playerid, "gatechose_active") == 1)  //Barierki
        {
            DestroySelectionMenu(playerid);
			SetPVarInt(playerid, "gatechose_active", 0);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
        }
        if(GetPVarInt(playerid, "ng-gatekey") == 1) //NG keypad
        {
            SetPVarInt(playerid, "ng-gatekey", 0);
            TextDrawHideForPlayer(playerid,NG_GateTD[0]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[1]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[2]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[3]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[4]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[5]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[6]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[7]);
            VAR_NGKeypad = false;
        }
        if(GetPVarInt(playerid, "skin-select") == 1) // skin selector
        {
            SetPVarInt(playerid, "skin-select", 0);
            CancelSelectTextDraw(playerid);
            DestroySkinSelection(playerid);
            TogglePlayerControllable(playerid, 1);
        }
    }
    if(GetPVarInt(playerid, "ng-gatekey") == 1)
    {
        new ngkey[6];

        GetPVarString(playerid, "ng-key", ngkey, 6);
        if(strlen(ngkey) < 4)
        {
            new num[2];
            format(num, 2, "%d", _:clickedid - _:NG_GateTD[1] + 1);
            strcat(ngkey, num);
            TextDrawSetString(NG_GateTD[7], ngkey);
            SetPVarString(playerid, "ng-key", ngkey);

            if(strlen(ngkey) == 4) NG_OpenGateWithKey(playerid); //apply key
        }
		#if DEBUG == 1
			printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
		#endif
        return 1;
    }

    //IBIZA
    if(clickedid==Text:INVALID_TEXT_DRAW && GetPVarInt(playerid, "IbizaKamery")) //ESC
	{
		for(new i=0; i<3; i++)
			TextDrawHideForPlayer(playerid, TDIbiza[i]);
		PlayerTextDrawHide(playerid, PlayerText:GetPVarInt(playerid, "IbizaCam"));
		new Float:x, Float:y, Float:z;
		x = GetPVarFloat(playerid, "IbizaKameraX");
		y = GetPVarFloat(playerid, "IbizaKameraY");
		z = GetPVarFloat(playerid, "IbizaKameraZ");
		SetPlayerPosEx(playerid, x, y, z);
		SetPlayerVirtualWorld(playerid, 1);
		SetCameraBehindPlayer(playerid);
        Wchodzenie(playerid);
		DeletePVar(playerid, "IbizaKamery");
		PlayerTextDrawDestroy(playerid, PlayerText:GetPVarInt(playerid, "IbizaCam"));
		DeletePVar(playerid, "IbizaCam");
		#if DEBUG == 1
			printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
		#endif
		return 1;
	}
	else
	{
		new kam = GetPVarInt(playerid, "IbizaKamery");
		if(clickedid==TDIbiza[1]) //w prawo
		{
			kam = (kam==12 ? 1 : kam+1);
			SetPVarInt(playerid, "IbizaKamery", kam);
			IbizaUstawKamere(playerid, kam-1);
		}
		if(clickedid==TDIbiza[2]) //w lewo
		{
			kam = (kam==1 ? 12 : kam-1);
			SetPVarInt(playerid, "IbizaKamery", kam);
			IbizaUstawKamere(playerid, kam-1);
		}

	}
    if(GetPVarInt(playerid, "skin-select") == 1) // skin selector
    {
        if(clickedid == SkinSelectionAccept)//zatiwerdz
        {
            if(!GetPVarInt(playerid, "skin-done"))
            {
                GameTextForPlayer(playerid, "~r~Wybierz ubranie", 1000, 5);
				#if DEBUG == 1
					printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
				#endif
                return 1;
            }
            SetPVarInt(playerid, "skin-select", 0);
            CancelSelectTextDraw(playerid);
            DestroySkinSelection(playerid);
            TogglePlayerControllable(playerid, 1);

            if(GetPVarInt(playerid, "skin-choosen") != 0)
            {
                SetPlayerSkin(playerid, GetPVarInt(playerid, "skin-choosen"));
                PlayerInfo[playerid][pSkin] = GetPVarInt(playerid, "skin-choosen");
            }
        }
        else if(clickedid == SkinSelectionDenied)//anuluj
        {
            SetPVarInt(playerid, "skin-select", 0);
            CancelSelectTextDraw(playerid);
            DestroySkinSelection(playerid);
            TogglePlayerControllable(playerid, 1);
        }
        else if(clickedid == SkinSelectionMy)//moj cywil
        {
            SetPVarInt(playerid, "skin-select", 0);
            CancelSelectTextDraw(playerid);
            DestroySkinSelection(playerid);
            TogglePlayerControllable(playerid, 1);

            PlayerInfo[playerid][pSkin] = PlayerInfo[playerid][pModel];
            SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
        }
    }
    //Strefy
    if(clickedid == ZoneTXD[3])
    {
        cmd_atakuj(playerid, "");
    }

    if(GetPVarInt(playerid, "patrol-map") == 1 && GetPVarInt(playerid, "patrolmap") == 1)
    {
        if(_:clickedid == INVALID_TEXT_DRAW)
        {
            SendClientMessage(playerid, COLOR_PAPAYAWHIP, "Wybierz region.");
            SelectTextDraw(playerid, 0xD2691E55);
			#if DEBUG == 1
				printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
			#endif
            return 1;
        }
        else
        {
            new pat = GetPVarInt(playerid, "patrol-id"), fnick[2][MAX_PLAYER_NAME+1];
            if((clickedid == PatrolAlfa[0] || clickedid == PatrolAlfa[1]) && Patrolujacych[0] < 4)
            {
                PatrolInfo[pat][patstrefa] = 1;
                SendClientMessage(playerid, COLOR_LIGHTBLUE, "Strefa patrolu to ALFA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                if(GetPVarInt(playerid, "patrol-duo") == 1) SendClientMessage(PatrolInfo[pat][patroluje][1], COLOR_LIGHTBLUE, "Strefa patrolu to ALFA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                Patrolujacych[0]++;
                GetPlayerName(playerid, fnick[0], MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[pat][patroluje][1], fnick[1], MAX_PLAYER_NAME);
                format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s{6A5ACD} 10-30 na stref� Alfa, sk�ad %s %s", PatrolInfo[pat][patname], fnick[0], fnick[1]);
            }
            else if((clickedid == PatrolBeta[0] || clickedid == PatrolBeta[1]) && Patrolujacych[1] < 4)
            {
                PatrolInfo[pat][patstrefa] = 2;
                SendClientMessage(playerid, COLOR_GREEN, "Strefa patrolu to BETA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                if(GetPVarInt(playerid, "patrol-duo") == 1) SendClientMessage(PatrolInfo[pat][patroluje][1], COLOR_GREEN, "Strefa patrolu to BETA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                Patrolujacych[1]++;
                GetPlayerName(playerid, fnick[0], MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[pat][patroluje][1], fnick[1], MAX_PLAYER_NAME);
                format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s{6A5ACD} 10-30 na stref� Beta, sk�ad %s %s", PatrolInfo[pat][patname], fnick[0], fnick[1]);
            }
            else if((clickedid == PatrolGamma[0] || clickedid == PatrolGamma[1]) && Patrolujacych[2] < 6)
            {
                PatrolInfo[pat][patstrefa] = 3;
                SendClientMessage(playerid, COLOR_RED, "Strefa patrolu to GAMMA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                if(GetPVarInt(playerid, "patrol-duo") == 1) SendClientMessage(PatrolInfo[pat][patroluje][1], COLOR_RED, "Strefa patrolu to GAMMA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                Patrolujacych[2]++;
                GetPlayerName(playerid, fnick[0], MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[pat][patroluje][1], fnick[1], MAX_PLAYER_NAME);
                format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s{6A5ACD} 10-30 na stref� Gamma, sk�ad %s %s", PatrolInfo[pat][patname], fnick[0], fnick[1]);
            }
            else if((clickedid == PatrolDelta[0] || clickedid == PatrolDelta[1]) && Patrolujacych[3] < 6)
            {
                PatrolInfo[pat][patstrefa] = 4;
                SendClientMessage(playerid, COLOR_YELLOW, "Strefa patrolu to DELTA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                if(GetPVarInt(playerid, "patrol-duo") == 1) SendClientMessage(PatrolInfo[pat][patroluje][1], COLOR_YELLOW, "Strefa patrolu to DELTA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                Patrolujacych[3]++;
                GetPlayerName(playerid, fnick[0], MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[pat][patroluje][1], fnick[1], MAX_PLAYER_NAME);
                format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} 10-30 na stref� Delta, sk�ad %s %s", PatrolInfo[pat][patname], fnick[0], fnick[1]);
            }
            else SendClientMessage(playerid, COLOR_YELLOW, "Brak wolnego miejsca w tej strefie, spr�buj inn�.");
            if(PatrolInfo[pat][patstrefa] != 0)
            {
                PatrolInfo[pat][pataktywny] = 1;
                Patrol_HideMap(playerid);
                CancelSelectTextDraw(playerid);
                SetPVarInt(playerid, "patrol-map", 0);
                SendTeamMessage(1, COLOR_ALLDEPT, str);

                Patrol_DisplayZones(playerid);
                if(GetPVarInt(playerid, "patrol-duo") == 1) Patrol_DisplayZones(PatrolInfo[pat][patroluje][1]);
            }
        }
    }
    else if(GetPVarInt(playerid, "patrolmap") == 1)
    {
        if(_:clickedid == INVALID_TEXT_DRAW)
        {
            CancelSelectTextDraw(playerid);
            Patrol_HideMap(playerid);
			#if DEBUG == 1
				printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
			#endif
            return 1;
        }
        new stanp[32], pnick1[24], pnick2[MAX_PLAYER_NAME+1];
        for(new i=0;i<MAX_PATROLS;i++)
        {
            if(clickedid == PatrolMarker[i] && PatrolInfo[i][pataktywny] == 1)
            {
                GetPlayerName(PatrolInfo[i][patroluje][0], pnick1, MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[i][patroluje][1], pnick2, MAX_PLAYER_NAME);
                switch(PatrolInfo[i][patstan])
                {
                    case 1: stanp="Sytuacja pod kontrol�";
                    case 2: stanp="Potrzebne wsparcie";
                    case 3: stanp="Po�cig za podejrzanym";
                    case 4: stanp="Ranny funkcjonariusz";
                }
                format(str, 128, "Patrol %s - Funkcjonariusze: %s %s. Stan: %s", PatrolInfo[i][patname], pnick1, pnick2, stanp);
                SendClientMessage(playerid, COLOR_LIGHTGREEN, str);
                break;
            }
        }
    }
    if(clickedid == TXD_Info) //Display server info
    {
        if(strlen(ServerInfo) > 1) ShowPlayerDialogEx(playerid, D_SERVERINFO, DIALOG_STYLE_MSGBOX, "Mrucznik-RP � Informacja", ServerInfo, "Schowaj", "Zamknij");
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
	#endif
   	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterDynamicArea - begin", GetNick(playerid), playerid);
	#endif
    if(IsPlayerInAnyVehicle(playerid))
    {
        new kolid=-1;
        for(new i=0;i<MAX_OILS;i++)
        {
            if(OilData[i][oilArea] == areaid && areaid != 0)
            {
                kolid = i;
                break;
            }
        }
        if(kolid != -1 && OilData[kolid][oilHP] > 0)
        {
            OnPlayerEnterOilSpot(playerid);
			#if DEBUG == 1
				printf("%s[%d] OnPlayerEnterDynamicArea - end", GetNick(playerid), playerid);
			#endif
            return;
        }
        kolid = -1;
        for(new i=0;i<MAX_KOLCZATEK;i++)
        {
            if(KolArea[i] == areaid && areaid != 0)
            {
                kolid = i;
                break;
            }
        }
        if(kolid != -1)
        {
            OnPlayerEnterSpikes(playerid);
			#if DEBUG == 1
				printf("%s[%d] OnPlayerEnterDynamicArea - end", GetNick(playerid), playerid);
			#endif
            return;
        }
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterDynamicArea - end", GetNick(playerid), playerid);
	#endif
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerClickPlayerTextDraw - begin", GetNick(playerid), playerid);
	#endif
	if(GetPVarInt(playerid, "gatechose_active") == 1)   //Barierki
    {
    	new curpage = GetPVarInt(playerid, "gatechose_page");

    	if(playertextid == gNextButtonTextDrawId[playerid]) {
    	    if(curpage < (GetNumberOfPages() - 1)) {
    	        SetPVarInt(playerid, "gatechose_page", curpage + 1);
    	        ShowPlayerModelPreviews(playerid);
             	UpdatePageTextDraw(playerid);
             	PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
    		} else {
    		    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
    		}
			#if DEBUG == 1
				printf("%s[%d] OnPlayerClickPlayerTextDraw - end", GetNick(playerid), playerid);
			#endif
    		return 1;
    	}
    	if(playertextid == gPrevButtonTextDrawId[playerid]) {
    	    if(curpage > 0) {
    	    	SetPVarInt(playerid, "gatechose_page", curpage - 1);
    	    	ShowPlayerModelPreviews(playerid);
    	    	UpdatePageTextDraw(playerid);
    	    	PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
    		} else {
    		    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
    		}
			#if DEBUG == 1
				printf("%s[%d] OnPlayerClickPlayerTextDraw - end", GetNick(playerid), playerid);
			#endif
    		return 1;
    	}
    	new x=0;
    	while(x != SELECTION_ITEMS) {
    	    if(playertextid == gSelectionItems[playerid][x]) {
    	        HandlePlayerItemSelection(playerid, x);
    	        PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
    	        DestroySelectionMenu(playerid);
    	        CancelSelectTextDraw(playerid);
            	SetPVarInt(playerid, "gatechose_active", 0);
				#if DEBUG == 1
					printf("%s[%d] OnPlayerClickPlayerTextDraw - end", GetNick(playerid), playerid);
				#endif
            	return 1;
    		}
    		x++;
    	}
    }
    if(SkinSelection[playerid][0] <= _:playertextid < SkinSelection[playerid][MAX_SKIN_SELECT])
    {
        new idx = _:playertextid-_:SkinSelection[playerid][0];
        if(0 <= idx <= MAX_SKIN_SELECT)
        {
            new typ = GetPVarInt(playerid, "skin-typ");
            new frac = GetPlayerFraction(playerid);
            if(frac == 0) frac = GetPlayerOrg(playerid);
            switch(typ) //switch na tablice ze skinami
            {
                case 1: PlayerTextDrawSetPreviewModel(playerid, PlayerText:SkinSelection[playerid][MAX_SKIN_SELECT], FRAC_SKINS[frac][idx]), SetPVarInt(playerid, "skin-choosen", FRAC_SKINS[frac][idx]);
                case 2: PlayerTextDrawSetPreviewModel(playerid, PlayerText:SkinSelection[playerid][MAX_SKIN_SELECT], FAM_SKINS[frac][idx]), SetPVarInt(playerid, "skin-choosen", FAM_SKINS[frac][idx]);
            }
            PlayerTextDrawShow(playerid, PlayerText:SkinSelection[playerid][MAX_SKIN_SELECT]);
            SetPVarInt(playerid, "skin-index", idx);
            SetPVarInt(playerid, "skin-done", 1);
        }
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerClickPlayerTextDraw - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	#if DEBUG == 1
		printf("%s[%d] OnEnterExitModShop - begin", GetNick(playerid), playerid);
	#endif
    if(enterexit == 0)
    {
        if(GetPlayerVehicleID(playerid) != 0)
            CarData[VehicleUID[GetPlayerVehicleID(playerid)][vUID]][c_HP] = 1000.0;
    }
	#if DEBUG == 1
		printf("%s[%d] OnEnterExitModShop - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterVehicle - begin", GetNick(playerid), playerid);
	#endif
    if(vehicleid > MAX_VEHICLES || vehicleid < 0)
    {
        SendClientMessage(playerid, 0xA9C4E4FF, "Warning: Exceed vehicle limit");
		#if DEBUG == 1
			printf("%s[%d] OnPlayerEnterVehicle - end", GetNick(playerid), playerid);
		#endif
        return 0;
    }
    new validseat = GetVehicleMaxPassengers(GetVehicleModel(vehicleid));
    if(validseat == 0xF)
    {
        SendClientMessage(playerid, 0xA9C4E4FF, "Warning: Invalid seat");
		#if DEBUG == 1
			printf("%s[%d] OnPlayerEnterVehicle - end", GetNick(playerid), playerid);
		#endif
        return 0;
    }
    if(gPlayerLogged[playerid] == 0)
	{
        if(!IsPlayerNPC(playerid)) // znow tylko funkcja dla botow
		{
	    	SendClientMessage(playerid, COLOR_LIGHTRED, "** Musisz si� zalogowa� zanim wybierzesz skin (Zosta�e� wyrzucony) **");
	        SetTimerEx("KickTimer",500,0,"d",playerid);
	    }
		#if DEBUG == 1
			printf("%s[%d] OnPlayerEnterVehicle - end", GetNick(playerid), playerid);
		#endif
        return 0;
 	}

	//PA�DZIOCH
	if(IsAHeliModel(GetVehicleModel(vehicleid)) && ispassenger)
 	{
  		SetPVarInt(playerid,"chop_id",GetPlayerVehicleID(playerid));
    	SetPVarInt(playerid,"roped",0);
    }
    else SetPVarInt(playerid,"chop_id",0);

    new engine, lights, alarm, doors, bonnet, boot, objective;
 	GetVehicleParamsEx(vehicleid, engine, lights ,alarm, doors, bonnet, boot, objective);
    //AT400
    if(GetVehicleModel(vehicleid) == 577 && !IsPlayerInFraction(playerid, FRAC_KT, 5000))
    {
        new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPosEx(playerid, slx, sly, slz+0.1);
		ClearAnimations(playerid);
    }

    if(!ispassenger)
	{
        if(!Player::CanUseCar(playerid, vehicleid))
        	return Player::RemoveFromVeh(playerid);
    }
	if(IsARower(vehicleid))
	{
	    SetVehicleParamsEx(vehicleid, 1, lights, alarm, doors, bonnet, boot, objective);
	}
	else
	{
        if(!ispassenger && !engine) MSGBOX_Show(playerid, "~k~~CONVERSATION_YES~ - odpala pojazd", MSGBOX_ICON_TYPE_OK);
    }

	if (IsACopCar(vehicleid) && !ispassenger)
	{
		if(IsACop(playerid))
		{
			sendTipMessageEx(playerid, COLOR_BLUE, "Po��czy�e� si� z komputerem policyjnym, wpisz /mdc aby zobaczy� kartotek� policyjn�");
		}
		else
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPosEx(playerid, slx, sly, slz+1);
			ClearAnimations(playerid);
		}
	}

	if (IsAnAmbulance(vehicleid) && !ispassenger)
	{
		if(IsAMedyk(playerid) && JobDuty[playerid] == 0 )
		{
			sendTipMessageEx(playerid, COLOR_GRAD1, "Nie jeste� medykiem na s�u�bie!");
            Player::RemoveFromVeh(playerid);
		}
		else if(!IsAMedyk(playerid))
		{
			sendTipMessageEx(playerid, COLOR_GRAD1, "Nie jeste� medykiem!");
            Player::RemoveFromVeh(playerid);
		}
	}
	if (GetVehicleModel(vehicleid) == 525)
	{
		sendTipMessageEx(playerid, COLOR_BROWN, "Wsiad�e� do holownika, naci�nij CTRL alby podholowa� w�z.");
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterVehicle - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerConnect(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerConnect - begin", GetNick(playerid), playerid);
	#endif

	Ac_OnPlayerConnect(playerid);
	SetPlayerVirtualWorld(playerid, 1488);//AC przed omijaniem logowania

	ZerujZmienne(playerid);
	ZerujKontakty(playerid);

    ClearChat(playerid);

    // Wy��czone na testy
    Usun_Obiekty(playerid); //stare obiekty
    obiekty_OnPlayerConnect(playerid);//nowe obiekty

	LoadTextDraws(playerid);
    LoadingShow(playerid);
    LoadingHide(playerid);

	//Poprawny nick:
	new nick[MAX_PLAYER_NAME];
	GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
    if(!IsNickCorrect(nick))
    {
        SendClientMessage(playerid, COLOR_NEWS, "SERWER: Tw�j nick jest niepoprawny! Nick musi posiada� form�: Imi�_Nazwisko!");
		KickEx(playerid);
		#if DEBUG == 1
			printf("%s[%d] OnPlayerConnect - end", GetNick(playerid), playerid);
		#endif
		return 1;
    }
	SetRPName(playerid);

	//Pocz�tkowe ustawienia:
    saveMyAccountTimer[playerid] = SetTimerEx("SaveMyAccountTimer", 15*60*1000, 1, "i", playerid);

    //Ikony
    SetPlayerMapIcon(playerid, 1, 1172.0771, -1323.3496, 15.4030, 22, 0); //Szpital
    SetPlayerMapIcon(playerid, 2, 1024.7610, -1025.5515, 38.2944, 63, 0); //Paint & Spray (Temple)
    SetPlayerMapIcon(playerid, 3, 544.3761, -1276.2046, 17.2482, 55, 0); //Grotti (wypo�yczalnia aut)
    SetPlayerMapIcon(playerid, 4, 501.9365, -1358.5668, 16.1252, 45, 0); //Prolaps (za San News)
    SetPlayerMapIcon(playerid, 5, 328.9384, -1512.9458, 36.0391, 56, 0); //Mrucznik Tower
    SetPlayerMapIcon(playerid, 6, 459.0327, -1502.2711, 31.0314, 45, 0); //Victim (Rodeo)
    SetPlayerMapIcon(playerid, 7, 487.6090, -1739.3744, 10.8613, 63, 0); //Paint & Spray (Idlewood)
    SetPlayerMapIcon(playerid, 8, 606.5818, -1458.5319, 14.3820, 30, 0); //FBI
    SetPlayerMapIcon(playerid, 9, 648.0233, -1357.3239, 13.5716, 60, 0); //San News
    SetPlayerMapIcon(playerid, 10, 725.6099, -1439.8906, 13.5318, 50, 0); //Jetty Lounge
    SetPlayerMapIcon(playerid, 11, 816.2141, -1386.5956, 13.6068, 48, 0); //Vinyl Club
    SetPlayerMapIcon(playerid, 12, 815.2556, -1616.2010, 13.7077, 14, 0); //Kurczak Marina
    SetPlayerMapIcon(playerid, 13, 925.6270, -1353.1003, 13.3768, 14, 0); //Kurczak Market
    SetPlayerMapIcon(playerid, 14, 1038.1844, -1339.7595, 13.7266, 17, 0); //P�czkarnia Allen
    SetPlayerMapIcon(playerid, 15, 1100.9039, -1235.4445, 15.5474, 27, 0); //FDU
    SetPlayerMapIcon(playerid, 16, 1022.4534, -1122.0057, 23.8715, 25, 0); //Kasyno
    SetPlayerMapIcon(playerid, 17, 1459.2233, -1140.6903, 24.0593, 45, 0); //ZIP
    SetPlayerMapIcon(playerid, 18, 1462.3813, -1012.1696, 26.8438, 52, 0); //Bank
    SetPlayerMapIcon(playerid, 19, 1763.3892, -1130.4873, 24.0859, 20, 0); //Remiza
    SetPlayerMapIcon(playerid, 20, 2130.8472, -1144.4091, 24.5245, 55, 0); //Salon Aut
    SetPlayerMapIcon(playerid, 21, 2255.2629, -1333.2920, 23.9816, 12, 0); //Ko�ci�
    SetPlayerMapIcon(playerid, 22, 2245.2217, -1662.6310, 15.4690, 45, 0); //Binco
    SetPlayerMapIcon(playerid, 23, 2068.5596, -1831.6167, 13.2740, 63, 0); //Paint & Spray Idlewood
    SetPlayerMapIcon(playerid, 24, 2102.2976, -1806.5530, 13.5547, 29, 0); //Pizzeria Idlewood
    SetPlayerMapIcon(playerid, 25, 53.2336, -1531.4541, 5.2757, 57, 0); //Granica LS - SF
    SetPlayerMapIcon(playerid, 26, 630.3970, -571.7601, 16.3359, 30, 0); //Komisariat w Dillimore
    SetPlayerMapIcon(playerid, 27, 655.9221, -564.6913, 16.0630, 42, 0); //Stacja Benzynowa w Dillimore
    SetPlayerMapIcon(playerid, 28, 720.0000, -459.2647, 16.0630, 63, 0); //Paint & Spray Dillimore
    SetPlayerMapIcon(playerid, 29, 713.9889, -498.1104, 16.0630, 18, 0); //AmmuNation Dillimore
    SetPlayerMapIcon(playerid, 30, 1006.5273, -936.9426, 41.8934, 42, 0); //Stacja Benzynowa na Temple
    SetPlayerMapIcon(playerid, 31, 997.5923, -921.3640, 41.9068, 36, 0); //24/7 na Temple
    SetPlayerMapIcon(playerid, 32, 997.2347, -917.5255, 41.9068, 52, 0); //Bankomat na Temple
    SetPlayerMapIcon(playerid, 33, 1199.9893, -923.6624, 42.7465, 14, 0); //Kurczak Temple
    SetPlayerMapIcon(playerid, 34, 1315.3838, -904.4830, 38.6174, 36, 0); //24/7 na Temple (2)
    SetPlayerMapIcon(playerid, 35, 1310.2568, -1370.4567, 13.3031, 34, 0); //S�d
    SetPlayerMapIcon(playerid, 36, 1481.2053, -1768.3350, 18.5228, 34, 0); //Urz�d
    SetPlayerMapIcon(playerid, 37, 1551.8835, -1676.2306, 15.5495, 30, 0); //Komisariat G��wny
    SetPlayerMapIcon(playerid, 38, 1939.0436, -1773.6844, 13.1137, 42, 0); //Stacja Benzynowa na Idlewood
    SetPlayerMapIcon(playerid, 39, 2073.7549, -1827.9742, 13.2739, 52, 0); //Bankomat (1)
    SetPlayerMapIcon(playerid, 40, 2227.1052, -1723.2871, 13.2840, 54, 0); //Si�ownia
    SetPlayerMapIcon(playerid, 41, 2844.5139, -1562.8854, 10.8208, 52, 0); //Bankomat (2)
    SetPlayerMapIcon(playerid, 42, 1699.7645, 411.4212, 30.6384, 57, 0); //Granica LS - LV
    SetPlayerMapIcon(playerid, 43, 2269.7112, -74.8501, 26.7724, 34, 0); //Urz�d w PC
    SetPlayerMapIcon(playerid, 44, 2302.0964, -16.2240, 26.4844, 52, 0); //Bank w PC
    SetPlayerMapIcon(playerid, 45, 2112.7124, -1213.1012, 23.6923, 45, 0); //Suburban obok Salonu Aut
    SetPlayerMapIcon(playerid, 46, 2421.2805, -1223.2761, 24.9988, 21, 0); //Pig Pen
    SetPlayerMapIcon(playerid, 47, 2770.6140, -1610.7180, 10.6489, 56, 0); //Mechanik (Praca)
    SetPlayerMapIcon(playerid, 48, 1961.5001, -2194.4309, 13.2740, 5, 0); //Lotnisko
    SetPlayerMapIcon(playerid, 49, 1941.3965, -2116.1799, 13.3525, 21, 0); //Dziki Tygrys
    SetPlayerMapIcon(playerid, 50, 1765.1974, -2063.2681, 13.3357, 56, 0); //Praca na Las Colinas (nie pami�tam nazwy)
    SetPlayerMapIcon(playerid, 51, 1352.4242, -1758.4613, 13.5078, 36, 0); //24/7 obok Urz�du
    SetPlayerMapIcon(playerid, 52, 1109.1722, -1796.2472, 16.5938, 56, 0); //Z�odziej Aut
    SetPlayerMapIcon(playerid, 53, 1154.2104, -1770.6967, 16.5938, 56, 0); //Busiarz
    SetPlayerMapIcon(playerid, 54, 900.8502, -1101.3074, 23.5000, 12, 0); //Cmentarz
    SetPlayerMapIcon(playerid, 55, 1365.9257, -1275.1326, 13.5469, 56, 0); //Diler Broni
    SetPlayerMapIcon(playerid, 56, 1790.5382,-1164.7021,23.8281, 18, 0); //GunShop obok Remizy
    SetPlayerMapIcon(playerid, 57, 2166.2034, -1675.3135, 15.0859, 56, 0); //Diler Drag�w
    SetPlayerMapIcon(playerid, 58, 1787.4432, -1866.6737, 13.5711, 52, 0); //Bankomat obok Dworca G��wnego
    SetPlayerMapIcon(playerid, 59, 1833.0537, -1842.6494, 13.5781, 36, 0); //24/7 na Idlewood
    SetPlayerMapIcon(playerid, 60, 2226.0696, -1718.3290, 13.5182, 56, 0); //Ochroniarz (Praca)
    SetPlayerMapIcon(playerid, 61, 2103.4141, -1798.7494, 13.6504, 56, 0); //Pizzerman (Praca)
    SetPlayerMapIcon(playerid, 62, 382.8541, -2079.4890, 7.5630, 9, 0); //Miejsce do w�dkowania
    SetPlayerMapIcon(playerid, 63, 342.0005, -1518.7524, 33.2482, 52, 0); //Bankomat obok Mrucznik Tower
    SetPlayerMapIcon(playerid, 64, 660.0374, -575.8544, 16.3359, 52, 0); //Bankomat obok stacji w Dillimore
    SetPlayerMapIcon(playerid, 65, 2273.1931, -77.6219, 26.5704, 52, 0); //Bankomat obok Urz�du w PC
    SetPlayerMapIcon(playerid, 66, 2115.5796, 920.2349, 10.5474, 42, 0); //Stacja benzynowa w LV
    SetPlayerMapIcon(playerid, 67, 1973.2526, 2162.1948, 10.8001, 63, 0); //Paint & Spray w LV
    SetPlayerMapIcon(playerid, 68, -1675.5817, 414.0347, 6.9068, 42, 0); //Stacja benzynowa w SF
    SetPlayerMapIcon(playerid, 69, -1904.4862, 281.9908, 40.774, 63, 0); //Paint & Spray w SF
    SetPlayerMapIcon(playerid, 70, -1932.1078, 274.0641, 40.7720, 56, 0); //Mechanik SF (Praca)
    SetPlayerMapIcon(playerid, 71, -2029.1031, 157.1051, 28.5630, 42, 0); //Stacja benzynowa w SF V2
    SetPlayerMapIcon(playerid, 72, -2405.7351, 975.3979, 45.0239, 42, 0); //Stacja benzynowa w SF V3
    SetPlayerMapIcon(playerid, 73, -2425.5703, 1023.0456, 50.1247, 63, 0); //Paint & Spray w SF V2 (Juniper Hollow)
    SetPlayerMapIcon(playerid, 74, -100.5483, 1114.7805, 19.4688, 63, 0); //Paint & Spray w Fort Carson
    SetPlayerMapIcon(playerid, 75, 70.4944, 1219.0317, 18.5391, 42, 0); //Stacja benzynowa w Fort Carson
    SetPlayerMapIcon(playerid, 76, 611.6107, 1694.4340, 6.7193, 42, 0); //Stacja benzynowa w Bone County
    SetPlayerMapIcon(playerid, 77, 2582.2329, 61.6251, 26.2817, 42, 0); //Stacja benzynowa w PC
    SetPlayerMapIcon(playerid, 78, 1383.4578, 461.5694, 19.8450, 42, 0); //Stacja benzynowa w Montgomery
    SetPlayerMapIcon(playerid, 79, 2202.3503, 2474.2419, 10.5474, 42, 0); //Stacja w LV V2

	//system barierek by Kubi
	gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;

    for(new x=0; x < SELECTION_ITEMS; x++) {
        gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
	}

	gItemAt[playerid] = 0;
	printf("Poprawnie Connect ID: %d", playerid);
	#if DEBUG == 1
		printf("%s[%d] OnPlayerConnect - end", GetNick(playerid), playerid);
	#endif
	return 1;
}
public OnPlayerPause(playerid)
{
	if(afk_timer[playerid] == -1)
	{
		afk_timer[playerid] = SetTimerEx("PlayerAFK", 1000, false, "iii", playerid, 1, 0);
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(playerid == INVALID_PLAYER_ID || playerid > MAX_PLAYERS)
		return 0;

	//Pobieranie starej pozycji:

	#if DEBUG == 1
		printf("%s[%d] OnPlayerDisconnect - begin", GetNick(playerid), playerid);
	#endif

	GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
	PlayerInfo[playerid][pInt] = GetPlayerInterior(playerid);
	PlayerInfo[playerid][pLocal] = GetPlayerVirtualWorld(playerid); //local u�yty do przechowania virtual worldu

	new reString[128];
    new DisconnectReason[3][] =
    {
        "Timeout/Crash",
        "/q",
        "Kick/Ban"
    };
    if(Spectate[playerid] == INVALID_PLAYER_ID)
    {
    	format(reString, sizeof(reString), "SERWER: Gracz znajduj�cy si� w pobli�u wyszed� z serwera (%s, pow�d: %s).", GetNick(playerid), DisconnectReason[reason]);
		ProxDetector(20.0, playerid, reString, COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY,COLOR_GREY);
	}
	if(GetPVarInt(playerid, "OKupMats") == 1)
    {
        new giveplayerid = GetPVarInt(playerid, "Mats-id");
        SetPVarInt(playerid, "OKupMats", 0);
		SetPVarInt(giveplayerid, "OSprzedajMats", 0);
        SetPVarInt(playerid, "Mats-id", 0);
        SetPVarInt(playerid, "Mats-kasa", 0);
        SetPVarInt(playerid, "Mats-mats", 0);
        sendErrorMessage(giveplayerid, "Sprzeda� zosta�a anulowana!");
    }

    if(GetPVarInt(playerid, "kolejka") == 1)
    {
        PlayerInfo[playerid][pPos_x] = GetPVarFloat(playerid, "kolejka-x");
        PlayerInfo[playerid][pPos_y] = GetPVarFloat(playerid, "kolejka-y");
        PlayerInfo[playerid][pPos_z] = GetPVarFloat(playerid, "kolejka-z");
        PlayerInfo[playerid][pInt] = GetPVarInt(playerid, "kolejka-int");
    }

    Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, "");

	//AFK timer
	if(afk_timer[playerid] != -1)
	{
		KillTimer(afk_timer[playerid]);
		afk_timer[playerid] = -1;
	}
    if(GetPVarInt(playerid, "finding") == 1) {
        GangZoneDestroy(pFindZone[playerid]);
    }
	if(saveMyAccountTimer[playerid] != -1)
	{
		KillTimer(saveMyAccountTimer[playerid]);
	}

	//PA�DZIOCH - lina SWAT
	if(GetPVarInt(playerid,"roped") == 1)
 	{
  		for(new i=0;i<=ROPELENGTH;i++)
  		{
    		DestroyDynamicObject(r0pes[playerid][i]);
      	}
	}

    //budki telefoniczne
    if(GetPVarInt(playerid, "budka-Mobile") != 999) {
        new caller = GetPVarInt(playerid, "budka-Mobile");
        if(GetPVarInt(caller, "budka-Mobile") == playerid) {
            sendTipMessage(caller, "**biiip biiip** po��czenie zosta�o przerwane ((Wyj�cie z gry))", COLOR_PAPAYAWHIP);
            budki[GetPVarInt(playerid, "budka-used")][isCurrentlyUsed] = 0;
            budki[GetPVarInt(caller, "budka-used")][isCurrentlyUsed] = 0;
            SetPVarInt(caller, "budka-Mobile", 999);
            SetPVarInt(caller, "budka-used", 999);
        }
    }

    if(TalkingLive[playerid] != INVALID_PLAYER_ID)
    {
		SendPlayerMessageToAll(COLOR_NEWS, "(( Wywiad zako�czony - gracz wyszed� z gry ))");
        new talker = TalkingLive[playerid];
        TalkingLive[playerid] = INVALID_PLAYER_ID;
        TalkingLive[talker] = INVALID_PLAYER_ID;
    }
	//koniec rozmowy telefonicznej
	if(Mobile[playerid] != INVALID_PLAYER_ID)
	{
		if(Mobile[playerid] >= 0)
		{
			SendClientMessage(Mobile[playerid], COLOR_YELLOW, "Gracz, z kt�rym prowadzi�e� rozmow� telefoniczn�, wyszed� z gry.");
		}
		StopACall(playerid);
	}

	//kajdanki
	if(PDkuje[playerid] > 0 || uzytekajdanki[playerid] != 0)
	{
		OdkujKajdanki(playerid);
	}

    if(GetPVarInt(playerid, "kostka"))
    {
        new id = GetPVarInt(playerid, "kostka-player");
        Kostka_Wygrana(id, playerid, GetPVarInt(id, "kostka-cash"), true);
        SendClientMessage(id, COLOR_RED, "Wsp�zawodnik opu�ci� serwer, otrzymujesz zwrot wp�aconej kwoty wraz z podatkiem.");
        SetPVarInt(playerid, "kostka",0);
        SetPVarInt(playerid, "kostka-throw", 0);
        SetPVarInt(playerid, "kostka-suma", 0);
        SetPVarInt(playerid, "kostka-cash", 0);
        SetPVarInt(playerid, "kostka-first", 0);
        SetPVarInt(playerid, "kostka-rzut", 0);
        SetPVarInt(playerid, "kostka-wait", 0);
        SetPVarInt(playerid, "kostka-player", 0);
    }
    //if(PlayerTied[playerid] >= 1 || PlayerCuffed[playerid] >= 1 || zakuty[playerid] >= 1 || poscig[playerid] == 1)
    if(PlayerTied[playerid] >= 1 || (PlayerCuffed[playerid] >= 1 && pobity[playerid] == 0 && PlayerCuffed[playerid] < 3) || zakuty[playerid] >= 1 || poscig[playerid] == 1)
	{
        PlayerInfo[playerid][pJailed] = 10;
        new string[130];
        new powod[36];
        if(PlayerTied[playerid] >= 1)
        {
            strcat(powod, "bycie zwiazanym, ");
        }
        if(PlayerCuffed[playerid] >= 1)
        {
            strcat(powod, "kajdanki w aucie, ");
        }
        if(zakuty[playerid] >= 1)
        {
            strcat(powod, "kajdanki pieszo, ");
        }
        if(poscig[playerid] >= 1)
        {
            strcat(powod, "po�cig, ");
        }
        new codal[16];
        switch(reason)
        {
            case 0: codal = "timeout";
            case 1: codal = "/q";
            case 2: codal = "kick/ban";
        }
        format(string, 130, "%s dostanie Marcepana za mo�liwe: %s (%s)", GetNick(playerid, true), powod, codal);
        SendAdminMessage(COLOR_P@, string);
	}

	if(PoziomPoszukiwania[playerid] >= 1)
	{
		new wl = PoziomPoszukiwania[playerid];
		PlayerInfo[playerid][pWL] = wl;
	}

    if(TransportDist[playerid] > 0.0 && TransportDriver[playerid] < 999)
	{
        Taxi_Pay(playerid);
	}

    //System aut
    Car_UnloadForPlayer(playerid);
    // zapisanie PK
    new karne = GetPVarInt(playerid, "mandat_punkty");
    if(karne>0) {
        PlayerInfo[playerid][pPK] += karne;
    }
    //
	//Zapis statystyk:
    MruMySQL_SaveAccount(playerid, false, true);

    if(GetPVarInt(playerid, "active_ticket") != 0)
        Support_ClearTicket(GetPVarInt(playerid, "active_ticket")-1);

    if(GetPVarInt(playerid, "oil_clear") == 1)
    {
        Oil_UnloadPTXD(playerid);
        TextDrawShowForPlayer(playerid, OilTXD_BG[0]);
        TextDrawShowForPlayer(playerid, OilTXD_BG[1]);
    }

    if(GetPVarInt(playerid, "patrol") != 0) {
        new patrol = GetPVarInt(playerid, "patrol-id");
        cmd_patrol(PatrolInfo[patrol][patroluje][0], "stop");
        cmd_patrol(PatrolInfo[patrol][patroluje][1], "stop");
        sendTipMessageEx(PatrolInfo[patrol][patroluje][1], COLOR_PAPAYAWHIP, "Partner opu�ci� patrol. 10-33!");
        sendTipMessageEx(PatrolInfo[patrol][patroluje][0], COLOR_PAPAYAWHIP, "Partner opu�ci� patrol. 10-33!");
    }
    //SetPVarInt(playerid, "patrol-id", pat);
    //SetPVarInt(playerid, "patrol", 1);
    if(GetPVarInt(playerid, "rentTimer") != 0)
    {
        UnhireRentCar(playerid, GetPVarInt(playerid, "rentCar"));
        KillTimer(GetPVarInt(playerid, "rentTimer"));
    }

    //12.06.2014  opis
    //Opis_Usun(playerid);

    if(noclipdata[playerid][fireobject] != 0)
    {
        DestroyDynamicObject(noclipdata[playerid][fireobject]);
        noclipdata[playerid][fireobject] = 0;
    }

    if(GetPVarInt(playerid, "skin-select") != 0)
        DestroySkinSelection(playerid);

    //strefy
    if(ZonePlayerTimer[playerid] != 0) KillTimer(ZonePlayerTimer[playerid]);

	UnLoadTextDraws(playerid);

    INT_AirTowerLS_Exit(playerid, true, true);

    //09.06.2014 wylaczenie ng pad
    if(GetPVarInt(playerid, "ng-gatekey") == 1)
    {
        SetPVarInt(playerid, "ng-gatekey", 0);
        VAR_NGKeypad = false;
    }

    if(PDGPS == playerid)
    {
        foreach(Player, i)
        {
            if(IsACop(i) || IsAMedyk(i) || GetPlayerFraction(i) == FRAC_LSFD || (PlayerInfo[i][pMember] == 9 && SanDuty[i] == 1) || (PlayerInfo[i][pLider] == 9 && SanDuty[i] == 1))
            {
                DisablePlayerCheckpoint(i);
            }
        }
    }

    if(ScigaSie[playerid] != 666 && IloscCH[playerid] != 0)
	{
	    new string[64];
	    new sendername[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, sendername, sizeof(sendername));
	    format(string, sizeof(string), "Wy�cig: {FFFFFF}%s wyszed� z gry", sendername);
    	foreach(Player, i)
    	{
	    	if(ScigaSie[i] == Scigamy)
 	    	{
    			SendClientMessage(i, COLOR_YELLOW, string);
   			}
	    }
	    IloscZawodnikow --;
	    if(IloscZawodnikow <= Ukonczyl)
	    {
	        KoniecWyscigu(-1);
	    }
    }

    if(SkutyGracz[playerid] != 0)
	{
	    PDkuje[SkutyGracz[playerid]] = 0;
	    zakuty[SkutyGracz[playerid]] = 0;
	    SkutyGracz[playerid] = 0;
	}

    if(HireCar[playerid] != 0)
    {
        CarData[VehicleUID[HireCar[playerid]][vUID]][c_Rang] = 0;
    }

    new bbxid = GetPVarInt(playerid, "boomboxid");
    if(BoomBoxData[bbxid][BBD_Carried]-1 == playerid)
    {
        BoomBoxData[bbxid][BBD_Standby] = false;
        BBD_Putdown(playerid, bbxid);
    }

    TextDrawHideForPlayer(playerid, TXD_Info);

	//Komunikaty dla graczy na serwerze:
	foreach(Player, i)
	{
	    if(IsPlayerConnected(i) && i != playerid)
	    {
	        if(TaxiAccepted[i] < 500)
	        {
		        if(TaxiAccepted[i] == playerid)
		        {
		            TaxiAccepted[i] = 999;
		            GameTextForPlayer(i, "~w~Klient Taxi~n~~r~Wyszedl z gry", 5000, 1);
		            TaxiCallTime[i] = 0;
		            DisablePlayerCheckpoint(i);
		        }
	        }
	        else if(BusAccepted[i] < 500)
	        {
		        if(BusAccepted[i] == playerid)
		        {
		            BusAccepted[i] = 999;
		            GameTextForPlayer(i, "~w~Klient autobusu~n~~r~Wyszedl z gry", 5000, 1);
		            BusCallTime[i] = 0;
		            DisablePlayerCheckpoint(i);
		        }
	        }
	    }
	}
	if(GotHit[playerid] > 0)
	{
	    if(GetChased[playerid] < 500)
	    {
	        if(IsPlayerConnected(GetChased[playerid]))
	        {
	        	SendClientMessage(GetChased[playerid], COLOR_YELLOW, "Tw�j cel opu�ci� serwer.");
	            GoChase[GetChased[playerid]] = 999;
			}
	    }
	}
	if(PlayerPaintballing[playerid] != 0)
	{
	    PaintballPlayers --;
	}
	if(PlayerKarting[playerid] > 0 && PlayerInKart[playerid] > 0)
	{
	    KartingPlayers --;
	}
	if(PlayersChannel[playerid] < 500)
	{
		IRCInfo[PlayersChannel[playerid]][iPlayers] --;
	}
	if(PlayerBoxing[playerid] > 0)
	{
	    if(Boxer1 == playerid)
	    {
	        if(IsPlayerConnected(Boxer2))
	        {
	        	PlayerBoxing[Boxer2] = 0;
	        	SetPlayerPosEx(Boxer2, 765.8433,3.2924,1000.7186);
	        	SetPlayerInterior(Boxer2, 5);
	        	GameTextForPlayer(Boxer2, "~r~Walka przerwana", 5000, 1);
			}
	    }
	    else if(Boxer2 == playerid)
	    {
	        if(IsPlayerConnected(Boxer1))
	        {
	        	PlayerBoxing[Boxer1] = 0;
	        	SetPlayerPosEx(Boxer1, 765.8433,3.2924,1000.7186);
	        	SetPlayerInterior(Boxer1, 5);
	        	GameTextForPlayer(Boxer1, "~r~Walka przerwana", 5000, 1);
			}
	    }
	    InRing = 0;
     	RoundStarted = 0;
		Boxer1 = 255;
		Boxer2 = 255;
		TBoxer = 255;
	}
    if(TransportDuty[playerid] == 1)
	{
		TaxiDrivers -= 1;
	}
    else if(TransportDuty[playerid] == 2)
	{
		BusDrivers -= 1;
	}
	if(PlayerInfo[playerid][pJob] == 11)
	{
	    if(JobDuty[playerid] == 1) { Medics -= 1; }
	}
	else if(PlayerInfo[playerid][pJob] == 7)
	{
	    if(JobDuty[playerid] == 1) { Mechanics -= 1; }
	}

	TransportDuty[playerid] = 0;
	JobDuty[playerid] = 0;
    gPlayerLogged[playerid] = 0; //wylogowany
    MRP_PremiumHours[playerid] = 0;
	#if DEBUG == 1
		printf("%s[%d] OnPlayerDisconnect - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if(issuerid < 0 || issuerid > MAX_PLAYERS)
	{
		return 1;
	}

    SetTimerEx("OnPlayerTakeDamageWeaponHack", 500, false, "iii", issuerid, weaponid, playerid);

	if(gPlayerLogged[issuerid] != 1)
	{
		new Float:health, Float:armour;
		GetPlayerHealth(playerid, health);
		SetPlayerHealth(playerid, health);
		GetPlayerArmour(playerid, armour);
		SetPlayerArmour(playerid, armour);
	}

    if(weaponid == WEAPON_GRENADE || weaponid == 51)
	{
		new Float:health;
		GetPlayerHealth(playerid,health);
		SetPlayerHealth(playerid, (health)-5);
	    ShowPlayerFadeScreenToBlank(playerid, 20, 255, 255, 255, 255);
		SetPlayerDrunkLevel(playerid, 3000);
	}

	new Float:armour;
	GetPlayerArmour(playerid, armour);
	if(armour <= 1.0)
	{
		switch(bodypart)
		{
			case BODY_PART_LEFT_LEG:
			{
				if(random(100) < 30)
					ApplyAnimation(playerid, "ped", "DAM_LegL_frmLT", 4.1, 0, 0, 0, 0, 0, 1);
			}
			case BODY_PART_RIGHT_LEG:
			{
				if(random(100) < 30)
					ApplyAnimation(playerid, "ped", "DAM_LegR_frmBK", 4.1, 0, 0, 0, 0, 0, 1);
			}
			case BODY_PART_LEFT_ARM:
			{
				if(random(100) < 10)
					ApplyAnimation(playerid, "ped", "DAM_armL_frmBK", 4.1, 0, 0, 0, 0, 0, 1);
			}
			case BODY_PART_RIGHT_ARM:
			{
				if(random(100) < 10)
					ApplyAnimation(playerid, "ped", "DAM_armR_frmBK", 4.1, 0, 0, 0, 0, 0, 1);
			}
			case BODY_PART_HEAD:
			{
				if(random(100) < 60)
					ApplyAnimation(playerid,"PED","SHOT_partial", 4.1, 0, 0, 0, 0, 0, 1);
			}
		}
	}
	return 1;
}

public StandUp(playerid)
{
    SetPVarInt(playerid, "optd-hs", 0);
    ApplyAnimation(playerid, "ped", "getup", 4.1, 0, 0, 0, 0, 0, 1);
}

public OnPlayerDeath(playerid, killerid, reason)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerDeath - begin", GetNick(playerid), playerid);
	#endif
	new playername[MAX_PLAYER_NAME];
	new killername[MAX_PLAYER_NAME];
	new string[128];

	if(gPlayerLogged[playerid] != 1 || gPlayerLogged[killerid] != 1) //nie przetwarzaj dla niezalogowanych os�b
	{
		return 1;
	}

    GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);

    new bbxid = GetPVarInt(playerid, "boomboxid");
    if(BoomBoxData[bbxid][BBD_Carried]-1 == playerid)
    {
        BoomBoxData[bbxid][BBD_Standby] = false;
        BBD_Putdown(playerid, bbxid);
    }
    if(reason == 38 && PlayerInfo[killerid][pGun7] != reason && PlayerInfo[killerid][pAdmin] < 1 && IsPlayerConnected(playerid))
    {
	    //MruDialog(killerid, "ACv2: Kod #2003", "Zosta�e� wyrzucony za weapon hack.");
		//format(string, sizeof string, "ACv2 [#2003]: %s zosta� wyrzucony za weapon hack.", GetNick(killerid, true));
        //SendCommandLogMessage(string);
        //KickEx(killerid);
        format(string, sizeof string, "ACv2 [#2003]: Sprawdzanie kodu - rzekomy fakekillid %s (%d).", GetNick(playerid, true), playerid);
        SendCommandLogMessage(string);
        SetTimerEx("CheckCode2003", 250, false, "ii", killerid, playerid);
    }

    if(ZoneAttacker[playerid])
    {
        OnPlayerLeaveGangZone(playerid, GetPVarInt(playerid, "zoneid"));
    }
    else if(ZoneDefender[playerid])
    {
        OnPlayerLeaveGangZone(playerid, GetPVarInt(playerid, "zoneid"));
    }

	//PA�DZIOCH - lina SWAT
	if(GetPVarInt(playerid,"roped") == 1)
 	{
  		for(new i=0;i<=ROPELENGTH;i++)
    	{
     		DestroyDynamicObject(r0pes[playerid][i]);
       	}
        SetPVarInt(playerid,"roped",0);
        DisablePlayerCheckpoint(playerid);
	}

    //IBIZA
    if(GetPVarInt(playerid, "IbizaWejdz") || GetPVarInt(playerid, "IbizaBilet") )
	{
		DeletePVar(playerid, "IbizaWejdz");
		DeletePVar(playerid, "IbizaBilet");
		StopAudioStreamForPlayer(playerid); //POWT�RKA
	}

    //Strefy
    if(killerid != INVALID_PLAYER_ID)
    {
        new frac = GetPlayerFraction(killerid);

        if((IsACop(killerid) && OnDuty[killerid] == 1) || FRAC_GROOVE <= frac <= FRAC_VAGOS || frac == FRAC_WPS || frac == FRAC_BOR || frac == 5 || frac == 6 || frac == 8 || frac == 15 || GetPlayerOrgType(killerid) == ORG_TYPE_GANG || GetPlayerOrgType(killerid) == ORG_TYPE_MAFIA)
        {
            new bool:inzone=false;
            for(new i=0;i<MAX_ZONES;i++)
            {
                if(bInZone[playerid][i])
                {
                    if(bInZone[killerid][i])
                    {
                        inzone=true;
                        break;
                    }
                }
            }
            if(inzone || GetSVarInt("BW_OnlyGangZones") == 1)
            {
                new Float:x, Float:y, Float:z;
                GetPlayerPos(playerid, x, y, z);
                PlayerInfo[playerid][pBW] = GetSVarInt("BW_Time");
                SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), x, y, z, 0.0, 0, 0, 0, 0, 0, 0);
                SetPVarInt(playerid, "bw-skin",  GetPlayerSkin(playerid));
                SetPVarInt(playerid, "bw-vw", GetPlayerVirtualWorld(playerid));
                SetPVarInt(playerid, "bw-int", GetPlayerInterior(playerid));
            }
        }
    }

	if(IsPlayerConnected(playerid) && playerid != INVALID_PLAYER_ID)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerName(killerid, killername, sizeof(killername));

		//-------<[    Zmienne    ]>---------
		StopAudioStreamForPlayer(playerid);
		gPlayerSpawned[playerid] = 0;
		PlayerInfo[playerid][pLocal] = 255;
		PlayerInfo[playerid][pDeaths] ++;

		//-------<[  Antyczity  ]>---------
		if(reason <= 54 && reason > 0)
		{
			if(IsPlayerConnected(killerid))
            {
                if(reason == 38 && GetVehicleModel(GetPlayerVehicleID(killerid)) == 425) format(string, sizeof(string), "{FF66CC}DeathWarning: {FFFFFF}%s [%d] zabi� %s [%d] z Huntera", killername, killerid, playername, playerid);
				else format(string, sizeof(string), "{FF66CC}DeathWarning: {FFFFFF}%s [%d] zabi� %s [%d] z %s", killername, killerid, playername, playerid, (reason <= 46) ? GunNames[reason] : NiggaNames[reason-46]);
            }
            else
				format(string, sizeof(string), "{FF66CC}DeathWarning: %s [%d] umar� (%s)", playername, playerid, (reason <= 46) ? GunNames[reason] : NiggaNames[reason-46]);
			DeWu(string, 1);
		}
		if(IsPlayerConnected(killerid) && killerid != INVALID_PLAYER_ID)
		{
			PlayerInfo[killerid][pKills] ++;
			if(gPlayerLogged[killerid] == 0)
			{
				KickEx(killerid);
				#if DEBUG == 1
					printf("%s[%d] OnPlayerDeath - end", GetNick(playerid), playerid);
				#endif
				return 1;
			}
			if(GetPlayerState(killerid) == 2)
			{
				SendClientMessage(killerid, COLOR_YELLOW, "DriveBy Jest zakazane, Robi�c DriveBy mo�esz zosta� ukarany przez admina!");
				if(PlayerInfo[killerid][pLevel] > 1)
				{
					format(string, 128, "AdmWarning: %s[%d] zabi� %s[%d] b�d� w aucie (mo�liwe DB/CK2) [Gun %d]!", killername, killerid, playername, playerid, reason);
					ABroadCast(COLOR_YELLOW,string,1);
					WarningLog(string);
				}
				else
				{
					format(string, 128, "AdmWarning: %s[%d] zabi� %s[%d] z DB, dosta� kicka !", killername, killerid, playername, playerid);
					ABroadCast(COLOR_YELLOW,string,1);
					WarningLog(string);
					SendClientMessage(killerid, COLOR_PANICRED, "Dosta�e� kicka za Drive-By do ludzi.");
					KickEx(killerid);
					#if DEBUG == 1
						printf("%s[%d] OnPlayerDeath - end", GetNick(playerid), playerid);
					#endif
					return 1;
				}
			}
			if(reason == 38 && GetVehicleModel(GetPlayerVehicleID(killerid)) != 425)
			{
				format(string, 128, "AdmWarning: [%d]%s zabi� gracza %s z miniguna, podejrzane !", killerid, killername, playername);
				ABroadCast(COLOR_YELLOW,string,1);
				CzitLog(string);
			}
			if(reason == 41)
			{
				format(string, 128, "AdmWarning: [%d]%s zabi� gracza %s ze spreya !", killerid, killername, playername);
				ABroadCast(COLOR_YELLOW,string,1);
				WarningLog(string);
			}
			if(lowcaz[killerid] == playerid && lowcap[playerid] != killerid && poddaje[playerid] != 1)
			{
                format(string, 128, "AdmWarning: �owca Nagr�d [%d]%s zabi� gracza %s bez oferty /poddajsie !", killerid, killername, playername);
				ABroadCast(COLOR_YELLOW,string,1);
				WarningLog(string);
			}
			//-------<[    Inne    ]>---------
			if(PlayerPaintballing[playerid] != 0)
			{
				PlayerPaintballKills[killerid] ++;
				if(PlayerPaintballKills[killerid] > PaintballWinnerKills)
				{
					PaintballWinner = killerid;
					PaintballWinnerKills = PlayerPaintballKills[killerid];
					foreach(Player, i)
					{
						if(IsPlayerConnected(i))
						{
							if(PlayerPaintballing[i] != 0)
							{
								format(string, sizeof(string), "* %s jest na prowadzeniu z %d trafieniami.",killername,PaintballWinnerKills);
								SendClientMessage(i, COLOR_WHITE, string);
							}
						}
					}
				}
				#if DEBUG == 1
					printf("%s[%d] OnPlayerDeath - end", GetNick(playerid), playerid);
				#endif
				return 1;
			}
			if(PlayerInfo[playerid][pHeadValue] > 0)
			{
				if(IsPlayerConnected(killerid))
				{
					if(PlayerInfo[killerid][pMember] == 8 || PlayerInfo[killerid][pLider] == 8)
					{
						if(GoChase[killerid] == playerid)
						{
							DajKase(killerid, PlayerInfo[playerid][pHeadValue]);
							format(string,128,"<< Hitman %s wype�ni� kontrakt na: %s i zarobi� $%d >>",killername,playername,PlayerInfo[playerid][pHeadValue]);
							SendFamilyMessage(8, COLOR_YELLOW, string);
							PayLog(string);
							format(string,128,"NR Marcepan_Marks: Szok! Zamach na �ycie %s. Zosta� on ci�ko ranny i przewieziony do szpitala.",playername);
							SendClientMessageToAll(COLOR_NEWS, string);
							PlayerInfo[playerid][pHeadValue] = 0;
							GotHit[playerid] = 0;
							GetChased[playerid] = 999;
							GoChase[killerid] = 999;
						}
					}
				}
			}
		}//koniec killerid connected
		if (gPlayerCheckpointStatus[playerid] > 4 && gPlayerCheckpointStatus[playerid] < 11)
		{
			DisablePlayerCheckpoint(playerid);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		}
		if(TalkingLive[playerid] != INVALID_PLAYER_ID)
		{
			SendPlayerMessageToAll(COLOR_NEWS, "NEWS: Wywiad zako�czony - nasz rozm�wca umar�.");
			new talker = TalkingLive[playerid];
			TalkingLive[playerid] = INVALID_PLAYER_ID;
			TalkingLive[talker] = INVALID_PLAYER_ID;
		}
		//koniec rozmowy telefonicznej
		if(Mobile[playerid] != INVALID_PLAYER_ID)
		{
			SendClientMessage(playerid, COLOR_YELLOW, "Umar�e� - po��czenie zako�czone.");
			if(Mobile[playerid] >= 0)
			{
				SendClientMessage(Mobile[playerid], COLOR_YELLOW, "S�ycha� nag�y trzask i po��czenie zostaje zako�czone.");
			}
			StopACall(playerid);
		}
		//kajdanki
		if(PDkuje[playerid] > 0 || uzytekajdanki[playerid] != 0)
		{
			OdkujKajdanki(playerid);
		}
		if(SkutyGracz[playerid] != 0)
		{
			PDkuje[SkutyGracz[playerid]] = 0;
			zakuty[SkutyGracz[playerid]] = 0;
			SkutyGracz[playerid] = 0;
		}
		if(ScigaSie[playerid] != 666 && IloscCH[playerid] != 0)
		{
			format(string, sizeof(string), "Wy�cig: {FFFFFF}%s zgin�� jak prawdziwy �cigant [*]", playername);
			WyscigMessage(COLOR_YELLOW, string);
			IloscZawodnikow --;
			if(IloscZawodnikow <= Ukonczyl)
			{
				KoniecWyscigu(-1);
			}
		}
		if(lowcaz[playerid] == killerid)
		{
			lowcaz[playerid] = 501;
			SendClientMessage(playerid, COLOR_YELLOW, "Zlecenie zosta�o anulowane - nie mo�esz wzi�� teraz zlecenia na tego samego gracza!");
		}


		//-------<[     WL      ]>---------
		if(IsPlayerConnected(killerid) && killerid != INVALID_PLAYER_ID && gPlayerLogged[playerid])
		{
			if(!IsACop(killerid) && lowcaz[killerid] != playerid )
			{
				format(string, sizeof(string), "Morderstwo");
				if(IsACop(playerid))
				{
					PoziomPoszukiwania[killerid] += 2;
					strcat(string, " Policjanta");
				}
				if(lowcaz[killerid] == playerid)
					strcat(string, " �owcy Nagr�d");
				if(GetPlayerState(killerid) == PLAYER_STATE_DRIVER || GetPlayerState(killerid) == PLAYER_STATE_PASSENGER)
					strcat(string, " z okna pojazdu");

				PlayerPlaySound(killerid, 1083, 0.0, 0.0, 0.0);
				PoziomPoszukiwania[killerid] ++;
				SetPlayerCriminal(killerid, INVALID_PLAYER_ID, string);
			}
		}
	}
	SetPlayerColor(playerid,COLOR_GRAD2);
	#if DEBUG == 1
		printf("%s[%d] OnPlayerDeath - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

forward OnCheatDetected(playerid, ip_address[], type, code);
public OnCheatDetected(playerid, ip_address[], type, code)
{
	new string[144];
	new plrIP[16];
    GetPlayerIp(playerid, plrIP, sizeof(plrIP));
	if(type == 0) //Type of cheating (when 0 it returns the ID, when 1 - IP)
	{
		printf("Cheats detected (code: %d) for player: %s[%d] ip: %s", code, GetNick(playerid), playerid, ip_address);

		if(PlayerInfo[playerid][pNewAP] > 0 || PlayerInfo[playerid][pAdmin] > 0)
		{
			//disable all codes for admins
			return 1;
		}

		if(IsProblematicCode(code) && PlayerInfo[playerid][pLevel] > 1)
		{
			//disable problematic codes for trusted players
			return 1;
		}
		
		if(GetPVarInt(playerid, "CheatDetected") == 1)
		{
			//kod wy��czony, je�li wykryto (zapobiega dublowaniu komunikat�w o wykryciu kodu nim gracz zostanie skickowany).
			return 1;
		}

		format(string, sizeof(string), "Anti-Cheat: %s [ID: %d] [IP: %s] dosta� kicka. | Kod: %d.", GetNick(playerid), playerid, plrIP, code);
		ABroadCast(0x9ACD32AA, string, 1);
		format(string, sizeof(string), "Anti-Cheat: Dosta�e� kicka. | Kod: %d.", code);
		SendClientMessage(playerid, 0x9ACD32AA, string);
		SendClientMessage(playerid, 0x9ACD32AA, "Je�eli uwa�asz, �e antycheat zadzia�a� nieprawid�owo, zg�o� to administracji, podaj�c kod z jakim otrzyma�e� kicka.");
        AntiCheatLog(string);
		
		if(code == 50 || code == 28 || code == 27 || code == 5)
		{
			Kick(playerid);
			SetPVarInt(playerid, "CheatDetected", 1);
		}
		else
		{
			KickEx(playerid);
			SetPVarInt(playerid, "CheatDetected", 1);
		}
	}
	else //type with ip
	{
		printf("Cheats detected (code: %d) ip: %s", code, ip_address);
		new ac_strtmp[32];
		format(ac_strtmp, sizeof ac_strtmp, "banip %s", ip_address);
		SendRconCommand(ac_strtmp);
	}
	return 1;

}

public OnPlayerSpawn(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerSpawn - begin", GetNick(playerid), playerid);
	#endif
	//Czyszczenie zmiennych
	if(gPlayerLogged[playerid] != 1)
	{
		sendErrorMessage(playerid, "Zespawnowa�e� si�, a nie jeste� zalogowany! Zosta�e� wyrzucony z serwera.");
		KickEx(playerid);
		return 0;
	}
	else
	{
		SetPlayerVirtualWorld(playerid, 0);
	}

	DeletePVar(playerid, "Vinyl-bilet");
    DeletePVar(playerid, "Vinyl-VIP");
    PlayerInfo[playerid][pMuted] = 0;
	WnetrzeWozu[playerid] = 0;
	spamwl[playerid] = 0;

	if(GetPlayerInterior(playerid) == 0 && GetPlayerVirtualWorld(playerid) == 0)
	{
    	SetPlayerWeatherEx(playerid, ServerWeather);//Pogoda
	}
	if(GetPlayerInterior(playerid) != 0 || GetPlayerVirtualWorld(playerid) != 0)
	{
    	SetPlayerWeatherEx(playerid, 3);//Pogoda
	}
	//Diler Broni
	if(PlayerInfo[playerid][pJob] == 9 && !IsADilerBroni(playerid))
	{
	    PlayerInfo[playerid][pJob] = 0;
	    SendClientMessage(playerid, COLOR_WHITE, "Zosta�e� wyrzucony z pracy!");
	}
    // usuwanie
    if(PlayerInfo[playerid][pRank] == 99 && PlayerInfo[playerid][pMember] == 99) {
        PlayerInfo[playerid][pRank] = 0;
        PlayerInfo[playerid][pMember] = 0;
        gTeam[playerid] = 3;
        PlayerInfo[playerid][pTeam] = 3;
        PlayerInfo[playerid][pMember] = 0;
        PlayerInfo[playerid][pRank] = 0;
        PlayerInfo[playerid][pSkin] = 0;
        PlayerInfo[playerid][pTajniak] = 0;
        MruMySQL_SetAccInt("Rank", GetNick(playerid), 0);
        MruMySQL_SetAccInt("Member", GetNick(playerid), 0);
        UsunBron(playerid);
        sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Zosta�e� wyrzucony z pracy przez lidera, gdy by�e� offline!");
    }
    SetPVarInt(playerid, "mozeUsunacBronie", 0);
    // zabieranie prawka //
    new string[128];
    if(PlayerInfo[playerid][pPK] > 24) {
        format(string, sizeof(string), "* Przekroczy�e� limit 24 PK. Tracisz prawo jazdy na 1 DZIE�");
        SendClientMessage(playerid, COLOR_RED, string);
                                        //86400
        PlayerInfo[playerid][pPK] = 0;
        PlayerInfo[playerid][pCarLic] = gettime()+86400;
    }
	//Skills'y broni
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, 1000);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 500);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, 1);

    //Style walki
    if(PlayerInfo[playerid][pStylWalki] == 1) SetPlayerFightingStyle(playerid, FIGHT_STYLE_BOXING);
	else if(PlayerInfo[playerid][pStylWalki] == 2) SetPlayerFightingStyle(playerid, FIGHT_STYLE_KUNGFU);
	else if(PlayerInfo[playerid][pStylWalki] == 3) SetPlayerFightingStyle(playerid, FIGHT_STYLE_KNEEHEAD);

	//D�wi�ki
	StopAudioStreamForPlayer(playerid);
	PlayerFixRadio(playerid);

	//Kubi
	INT_AirTowerLS_Exit(playerid, false, true);

	//Inne
	if(PlayerInfo[playerid][pDom] != 0)
 		Dom[PlayerInfo[playerid][pDom]][hData_DD] = 0; //Zerowanie dni do usuni�cia domu
	SetPlayerToTeamColor(playerid);

	//SetPlayerSpawn:
	SetPlayerSpawn(playerid);

    if(PlayerInfo[playerid][pLider] == FRAC_SN)
    {
        SetPVarInt(playerid, "scena-allow", 1);
    }
    //Spawn Pos
	SetTimerEx("SpawnPosInfo", 1000, false, "i", playerid);
	#if DEBUG == 1
		printf("%s[%d] OnPlayerSpawn - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

SetPlayerSpawn(playerid)
{
	SetPlayerSpawnPos(playerid);
	SetPlayerSpawnSkin(playerid);
	SetPlayerSpawnWeapon(playerid);
	return 1;
}

SetPlayerSpawnPos(playerid)
{
	//Po /spec off
    if(Unspec[playerid][Coords][0] != 0.0 && Unspec[playerid][Coords][1] != 0.0 && Unspec[playerid][Coords][2] != 0.0)
    {
		if(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pZG] > 0 || PlayerInfo[playerid][pNewAP] >= 1)
		{
			SetPlayerPosEx(playerid, Unspec[playerid][Coords][0], Unspec[playerid][Coords][1], Unspec[playerid][Coords][2]);
			SetPlayerInterior(playerid, Unspec[playerid][sPint]);
			SetPlayerVirtualWorld(playerid, Unspec[playerid][sPvw]);
			Unspec[playerid][Coords][0] = 0.0, Unspec[playerid][Coords][1] = 0.0, Unspec[playerid][Coords][2] = 0.0;
			Spectate[playerid] = INVALID_PLAYER_ID;
			PhoneOnline[playerid] = 0;
		}
    }
    //Wi�zienie:
	else if(PlayerInfo[playerid][pJailed] == 1)
	{
		SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 1);
	    new losuj= random(sizeof(Cela));
		SetPlayerPosEx(playerid, Cela[losuj][0], Cela[losuj][1], Cela[losuj][2]);
		SendClientMessage(playerid, COLOR_LIGHTRED, "Tw�j wyrok nie dobieg� ko�ca, wracasz do wi�zienia.");
		TogglePlayerControllable(playerid, 0);
		Wchodzenie(playerid);
	}
	else if(PlayerInfo[playerid][pJailed] == 2)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "Tw�j wyrok nie dobieg� ko�ca, wracasz do wi�zienia stanowego");
		JailDeMorgan(playerid);
		return 1;
	}
	else if(PlayerInfo[playerid][pJailed] == 3)
	{
	    SetPlayerInterior(playerid, 0);
		SetPlayerPosEx(playerid,1481.1666259766,-1790.2204589844,156.7875213623);
		PlayerInfo[playerid][pMuted] = 1;
		SetPlayerVirtualWorld(playerid, 1000+playerid);
		PlayerPlaySound(playerid, 141, 0.0, 0.0, 0.0);
		SendClientMessage(playerid, COLOR_LIGHTRED, "Gra�e� NON-RP. Wracasz do Admin Jaila.");
	}
	else if(PlayerInfo[playerid][pJailed] == 10)
	{
	    new string[256];
	    new kaseczka = (kaska[playerid] > 0) ? (kaska[playerid]/2) : 1;
	    new sendername[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "* Zosta�e� uwieziony w Admin Jailu przez Admina Marcepan_Marks. Powod: /q podczas akcji");
		SendClientMessage(playerid, COLOR_LIGHTRED, string);
		ResetPlayerWeapons(playerid);
		UsunBron(playerid);
		PlayerInfo[playerid][pJailed] = 3;
		PlayerInfo[playerid][pJailTime] = 15*60;
        SetPlayerVirtualWorld(playerid, 1000+playerid);
		PlayerInfo[playerid][pMuted] = 1;
		SetPlayerPosEx(playerid, 1481.1666259766,-1790.2204589844,156.7875213623);
		format(string, sizeof(string), "Zosta�e� ukarany na 15 minut. Powod: /q podczas akcji");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "AdmCmd: %s zostal uwieziony w 'AJ' przez Admina Marcepan_Marks. Powod: /q podczas akcji + zabieram po�ow� kasy i bro�", sendername);
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "Dodatkowo zabrano z twojego portfela %d$ i wyzerowano twoje bronie oraz zabrano po�ow� mats�w", kaseczka);
        SendClientMessage(playerid, COLOR_LIGHTRED, string);
        format(string, sizeof(string),"%s dal /q podczas akcji i zabrano mu %d$ i %d mats oraz bronie", sendername, kaseczka, PlayerInfo[playerid][pMats]/2);
        PayLog(string);
        ZabierzKase(playerid, kaseczka);
        PlayerInfo[playerid][pMats] = PlayerInfo[playerid][pMats]/2;
	}
	//Paintball
    else if(PlayerPaintballing[playerid] != 0)
	{
	    ResetPlayerWeapons(playerid);
  		GivePlayerWeapon(playerid, 29, 999);
	    new rand = random(sizeof(PaintballSpawns));
		SetPlayerPosEx(playerid, PaintballSpawns[rand][0], PaintballSpawns[rand][1], PaintballSpawns[rand][2]);
		SetCameraBehindPlayer(playerid);
	}
	//BW:
	else if(PlayerInfo[playerid][pBW] >= 1)
	{
		MedicBill[playerid] = 0;
		MedicTime[playerid] = 0;
		NeedMedicTime[playerid] = 0;
		SetPlayerHealth(playerid, 10.0);
		SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "bw-vw"));
        SetPlayerInterior(playerid, GetPVarInt(playerid, "bw-int"));
        SetPlayerPosEx(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
        TogglePlayerControllable(playerid, 0);
        ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.1, 0, 0, 0, 0, 0, 1);
        GameTextForPlayer(playerid, "Zostales brutalnie pobity!", 15000, 5);
        PlayerInfo[playerid][pMuted] = 1;
        if(GetPVarInt(playerid, "bw-skin") != 0) SetPlayerSkin(playerid, GetPVarInt(playerid, "bw-skin"));

	}
    else
    {
	    //-----------------------------------[ Normalny spawn ]-----------------------------------
	    //Przywracanie do poprzedniego spawnu
		if(GetPVarInt(playerid, "spawn") == 2)
		{
			SetPlayerPosEx(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
			SetPlayerInterior(playerid, PlayerInfo[playerid][pInt]);
			SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pLocal]);
			Wchodzenie(playerid);
		}
		else
		{
		    if(PlayerInfo[playerid][pSpawn] == 0) //Normalny spawn
		    {
		        SetPlayerInteriorEx(playerid, 0);
		        PlayerInfo[playerid][pLocal] = 255;
				if(GetPlayerFraction(playerid) > 0) //Spawn Frakcji
				{
				    switch(GetPlayerFraction(playerid))
				    {
						case FRAC_LSPD: //1
						{
						    new rand = random(sizeof(gCopPlayerSpawns));
							SetPlayerPosEx(playerid, gCopPlayerSpawns[rand][0], gCopPlayerSpawns[rand][1], gCopPlayerSpawns[rand][2]);
							SetPlayerFacingAngle(playerid, 90.0);
						}
						case FRAC_FBI: //2
						{
						    if(PlayerInfo[playerid][pTajniak] == 0)
						    {
                                SetPlayerPosEx(playerid, 598.2130,-1491.1135,15.1351);
								SetPlayerFacingAngle(playerid, 270.0);
		  					}
		  					else if(PlayerInfo[playerid][pTajniak] == 1)
		  					{
		  					    SetPlayerPosEx(playerid, 2495.2163,-1687.2322,13.5150);
		  					}
		  					else if(PlayerInfo[playerid][pTajniak] == 2)
		  					{
		  					    SetPlayerPosEx(playerid, 1939.1940,-1116.3353,27.0151);
		  					}
		  					else if(PlayerInfo[playerid][pTajniak] == 3)
		  					{
                                SetPlayerPosEx(playerid, 738.8827,-1429.9484,13.5234);
		  					}
         					else if(PlayerInfo[playerid][pTajniak] == 4)
		  					{
                                SetPlayerPosEx(playerid, 2801.0273,-1089.4576,30.7188);
		  					}
		  					else if(PlayerInfo[playerid][pTajniak] == 5)
		  					{
		  					    SetPlayerPosEx(playerid, 2467.5117,-1278.2054,29.9264);
							}
		  					else if(PlayerInfo[playerid][pTajniak] == 6)
		  					{
								new rand = random(sizeof(gTajniakSpawn));
								SetPlayerPosEx(playerid, gTajniakSpawn[rand][0], gTajniakSpawn[rand][1], gTajniakSpawn[rand][2]); // Warp the player
								SetPlayerFacingAngle(playerid, 270.0);
		  					}
		  					else
		  					{
                                SetPlayerPosEx(playerid, 2467.5117,-1278.2054,29.9264);
		  					}

						}
						case FRAC_NG: //3
						{
						    SetPlayerPosEx(playerid, 261.8342, 71.2429, 1003.2422);// stara: 2515.0200, -2459.5896, 13.8187
							SetPlayerInterior(playerid, 6);
							SetPlayerVirtualWorld(playerid, 88);
							Wchodzenie(playerid);
						}
						case FRAC_LSMC:  //4
						{
						    SetPlayerPosEx(playerid, 1148.4323,-1315.4225,13.9841);
		    				SetPlayerFacingAngle(playerid,358.0);
						}
						case FRAC_LCN: //5
						{
						    SetPlayerPosEx(playerid, 738.8827,-1429.9484,13.5234);
						}
						case FRAC_YKZ: //6
						{
                            SetPlayerPosEx(playerid, 2794.8042,-1087.1310,30.7188);
						}
						case FRAC_BOR: //7
						{
						    SetPlayerPosEx(playerid, 1799.4161,-1577.8551,14.0733);
						}
						case FRAC_HA: //8
						{
						    SetPlayerPosEx(playerid, -50.400001525879,-279.20001220703,6.0999999046326);
						}
						case FRAC_SN: //9
						{
						    SetPlayerPosEx(playerid, 735.2266,-1336.5826,13.5358);
						}
						case FRAC_KT: //10
						{
						    SetPlayerPosEx(playerid, 2482.7566, -2105.6033, 32.2773);
							SetPlayerVirtualWorld(playerid,3);
							Wchodzenie(playerid);
						}
						case FRAC_GOV: //11
						{
							if(PlayerInfo[playerid][pLider] == 11)
							{
							    SetPlayerPosEx(playerid, 1460.4297,-1853.9827,81.9475);
							    SetPlayerVirtualWorld(playerid, 50);
							    SetPlayerInterior(playerid, 0);
								PlayerInfo[playerid][pLocal] = 108;
			                    Wchodzenie(playerid);
							}
							else
							{
							    if(SchoolSpawn[playerid] == 0)
								{
								    SetPlayerPosEx(playerid, 1407.7435,-1788.1862,13.5469);
									SetPlayerFacingAngle(playerid, 0.0);
								}
								else
								{
								    SetPlayerPosEx(playerid, 414.4144,2531.9580,19.1565);
									SetPlayerFacingAngle(playerid, 4.6505);
								}
	   						}
						}
						case FRAC_GROOVE: //12
						{
          					SetPlayerPosEx(playerid, 2495.2163,-1687.2322,13.5150);
						}
						case FRAC_BALLAS: //13
						{
						    SetPlayerPosEx(playerid,2502.7222,-1244.7454,35.4519);
                            SetPlayerFacingAngle(playerid, 181.7818);
						}
						case FRAC_VAGOS: //14
						{
						    SetPlayerPosEx(playerid, 2177.1636,-984.1085,64.4688);
							SetPlayerFacingAngle(playerid, 165.360);
						}
						case FRAC_NOA: //15
						{
						    SetPlayerPosEx(playerid, 1104.4066,-1224.0862,15.8435);
		    				SetPlayerFacingAngle(playerid, 181.0);
						}
						case FRAC_WPS: //16
						{
						    SetPlayerPosEx(playerid, 2508.0671,-2019.8987,13.9482);
						}
						case FRAC_LSFD: //17
						{
						    SetPlayerPosEx(playerid, 1757.6122,-1123.4604,227.8059);
				            SetPlayerVirtualWorld(playerid, 22);
						    SetPlayerFacingAngle(playerid,180.0);
						    Wchodzenie(playerid);
						}
				    }
				}
				else if(GetPlayerOrg(playerid) > 0) //Spawn Organizacji
				{
                    new org = gPlayerOrg[playerid];
		            if(OrgInfo[org][o_Spawn][0] != 0.0)
		            {
		                SetPlayerVirtualWorld(playerid, OrgInfo[org][o_VW]);
		    		    SetPlayerInteriorEx(playerid, OrgInfo[org][o_Int]);
		    		    SetPlayerPosEx(playerid, OrgInfo[org][o_Spawn][0], OrgInfo[org][o_Spawn][1], OrgInfo[org][o_Spawn][2]);
		    		    SetPlayerFacingAngle(playerid, OrgInfo[org][o_Spawn][3]);
		            }
		            else
		            {
						SendClientMessage(playerid, COLOR_YELLOW, "Twoja rodzina nie ma jeszcza spawnu - spawnujesz si� jako cywil");
                        new rand = random(sizeof(gRandomPlayerSpawns));
			    		SetPlayerPosEx(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]);
			    		SetPlayerFacingAngle(playerid, gRandomPlayerSpawns[rand][3]);
					}
				}
				else if(PlayerInfo[playerid][pJob] > 0) //Spawn Prac
				{
				    switch(PlayerInfo[playerid][pJob])
				    {
						case JOB_MECHANIC:
						{
						    SetPlayerPosEx(playerid,2794.5515,-1619.3689,10.9219);
		    				SetPlayerFacingAngle(playerid, 80.0);
						}
						case JOB_LAWYER:
						{
						    SetPlayerPosEx(playerid,319.72470092773, -1548.3374023438, 13.845289230347);
		    				SetPlayerFacingAngle(playerid, 230.0);
						}
						case JOB_LOWCA:
						{
						    SetPlayerPosEx(playerid,322.0553894043, 303.41961669922, 999.1484375);
		    				SetPlayerInterior(playerid,5);
						}
						case JOB_BOXER:
						{
						    SetPlayerPosEx(playerid,766.0804,14.5133,1000.7004);
		    				SetPlayerInterior(playerid, 5);
						}
						case JOB_TRUCKER:
						{
						    SetPlayerPosEx(playerid, 1751.4445, -2054.9761, 13.0593);
		    				SetPlayerFacingAngle(playerid, 180.0);
						}
						case JOB_BUSDRIVER:
						{
						    SetPlayerPosEx(playerid, 1143.0999755859,-1754.0999755859,13.60000038147);
						}
						case JOB_BODYGUARD:
						{
						    SetPlayerPosEx(playerid, 2207.4038,-1725.1147,13.4060);
						}
						default:
						{
							new rand = random(sizeof(gRandomPlayerSpawns));
							SetPlayerPosEx(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]);
							SetPlayerFacingAngle(playerid, gRandomPlayerSpawns[rand][3]);
						}
				    }
				}
				else //Spawn cywila
				{
				    new rand = random(sizeof(gRandomPlayerSpawns));
		    		SetPlayerPosEx(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]);
		    		SetPlayerFacingAngle(playerid, gRandomPlayerSpawns[rand][3]);
				}
		    }
		    else if(PlayerInfo[playerid][pSpawn] == 1) //Spawn przed domem
		    {
		        new i;
                if(PlayerInfo[playerid][pDom] != 0)
           	 		i = PlayerInfo[playerid][pDom];
				else if(PlayerInfo[playerid][pWynajem] != 0)
             		i = PlayerInfo[playerid][pWynajem];
				else
				{
				    PlayerInfo[playerid][pSpawn] = 0;
					SetPlayerSpawnPos(playerid);
				    return 1;
				}
                SetPlayerPosEx(playerid, Dom[i][hWej_X], Dom[i][hWej_Y], Dom[i][hWej_Z]);
	  		}
	  		else if(PlayerInfo[playerid][pSpawn] == 2) //Spawn w �rodku domu
	  		{
	  		    new i, h, m;
                if(PlayerInfo[playerid][pDom] != 0)
           	 		i = PlayerInfo[playerid][pDom];
				else if(PlayerInfo[playerid][pWynajem] != 0)
             		i = PlayerInfo[playerid][pWynajem];
				else
				{
				    PlayerInfo[playerid][pSpawn] = 0;
					SetPlayerSpawnPos(playerid);
				    return 1;
				}
				GetPlayerTime(playerid, h, m);
   				SetPlayerTime(playerid, Dom[i][hSwiatlo], 0);
     			PlayerInfo[playerid][pDomT] = h;
                PlayerInfo[playerid][pDomWKJ] = PlayerInfo[playerid][pDom];
                SetPlayerPosEx(playerid, Dom[i][hInt_X], Dom[i][hInt_Y], Dom[i][hInt_Z]);
                SetPlayerInteriorEx(playerid, Dom[i][hInterior]);
                SetPlayerVirtualWorld(playerid, Dom[i][hVW]);
                GameTextForPlayer(playerid, "~g~Witamy w domu", 5000, 1);
	  		}
		}
	}

    //Ustawienie kamery:
    if(GetPVarInt(playerid, "spawn"))
		DeletePVar(playerid, "spawn");
    SetCameraBehindPlayer(playerid);
	return 1;
}

SetPlayerSpawnWeapon(playerid)
{
	//Resetowanie broni
    ResetPlayerWeapons(playerid);

    //Dawanie spawnowych broni
	if(GetPlayerFraction(playerid))
    	DajBronieFrakcyjne(playerid);
	if(GetPlayerOrg(playerid))
		DajBronieOganizacji(playerid);
	if(PlayerInfo[playerid][pJob])
	    DajBroniePracy(playerid);
    if(MaZapisanaBron(playerid))
		PrzywrocBron(playerid);

    //HP:
    if(IsACop(playerid) && OnDuty[playerid] == 1 && PlayerInfo[playerid][pTajniak] != 6)
    {
        SetPlayerHealth(playerid, 90);
        //f(PlayerInfo[playerid][pMember] != 1 || PlayerInfo[playerid][pLider] != 1)
	       //SetPlayerArmour(playerid, 15);
    }
    else if(IsAPrzestepca(playerid))
	{
	    SetPlayerHealth(playerid, 90);
        //SetPlayerArmour(playerid, 15);
	}
	else
	{
	    SetPlayerHealth(playerid, 90);
	}
	return 1;
}

SetPlayerSpawnSkin(playerid)
{
    if(PlayerInfo[playerid][pChar] > 0)
		PlayerInfo[playerid][pSkin] = PlayerInfo[playerid][pChar], PlayerInfo[playerid][pChar] = 0;

    if(GetPlayerFraction(playerid) == FRAC_FBI && PlayerInfo[playerid][pTajniak] != 0)
    {
        if(PlayerInfo[playerid][pRank] < 4)
            PlayerInfo[playerid][pTajniak] =0;
		else
		{
		    switch(PlayerInfo[playerid][pTajniak])
		    {
				case 1:
				{
                    SetPlayerSkin(playerid, 107);
				}
				case 2:
				{
                    SetPlayerSkin(playerid, 104);
				}
				case 3:
				{
                    SetPlayerSkin(playerid, 124);
				}
				case 4:
				{
                    SetPlayerSkin(playerid, 123);
				}
				case 5:
				{
                    SetPlayerSkin(playerid, 108);
				}
				case 6:
				{
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				}
			}
			return 1;
		}
    }

	if(PlayerInfo[playerid][pSkin] != 0)
	{
		if(GetPlayerFraction(playerid) != 0)
		{
			if(IsACop(playerid) || GetPlayerFraction(playerid) == FRAC_LSFD || GetPlayerFraction(playerid) == FRAC_LSMC)
			{
				if(OnDuty[playerid] == 1 && OnDutyCD[playerid] == 0)
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				else
					SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			}
			else if(GetPlayerFraction(playerid) == FRAC_SN)
			{
				if(SanDuty[playerid] == 1)
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				else
					SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			}
			else
            {
				SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
                SetPVarInt(playerid, "skinF", 1);
            }
		}
		else if(GetPlayerOrg(playerid) != 0)
		{
 			SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		}
		else if(JobDuty[playerid] == 1)
		{
			SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		}
	}
    else
	{
		SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
        SetPVarInt(playerid, "skinF", 0);
	}

	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterCheckpoint - begin", GetNick(playerid), playerid);
	#endif
	new string[128];
	new name[MAX_PLAYER_NAME];
    DisablePlayerCheckpoint(playerid);

	//PA�DZIOCH
	if(PizzaJob[playerid] != 0)
	{
	    SetTimerEx("PizzaJobTimer01", 4000, false, "i", playerid);
	    GameTextForPlayer(playerid, "KLIENT ZABIERA PIZZE", 4000, 3);
	    TogglePlayerControllable(playerid,0);
	}
	if(GetPVarInt(playerid,"roped") == 1)
    {
   		SetPVarInt(playerid,"roped",0);
        SetPVarInt(playerid,"chop_id",0);
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid,0);
        TogglePlayerControllable(playerid,1);
        for(new i=0;i<=ROPELENGTH;i++)
        {
        	DestroyDynamicObject(r0pes[playerid][i]);
        }
	}

    TJD_CallCheckpoint(playerid, GetPlayerVehicleID(playerid));

	if(TaxiCallTime[playerid] > 0 && TaxiAccepted[playerid] < 999)
	{
	    TaxiAccepted[playerid] = 999;
		GameTextForPlayer(playerid, "~w~Dotarles do celu", 5000, 1);
		TaxiCallTime[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	else if(BusCallTime[playerid] > 0 && BusAccepted[playerid] < 999)
	{
	    BusAccepted[playerid] = 999;
		GameTextForPlayer(playerid, "~w~Dotarles do celu", 5000, 1);
		BusCallTime[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	if(CP[playerid]>=550 && CP[playerid]<=999)//Wywo�uje otwieranie drzwi gdy jest w CP od 550 do 999
	{
		Otwieramdrzwibusa(playerid);
	}
	if(CP[playerid]==1200)
	{
	    SendClientMessage(playerid, COLOR_GREY, "Dojecha�e� do zajezdni i zako�czy�e� prac�.");
		Przystanek(playerid, COLOR_GREEN, "Korporacja Transportowa\n Wydzia� Komunikacji Autbusowej");
		DisablePlayerCheckpoint(playerid);
		CP[playerid] = 0;
	}
	if(CP[playerid]==1201)
	{
	    SendClientMessage(playerid, COLOR_GREY, "Dojecha�e� do zajezdni i zako�czy�e� prac�.");
		Przystanek(playerid, COLOR_YELLOW, "Los Santos Bus Department\n Komunikacja Miejska");
		DisablePlayerCheckpoint(playerid);
		CP[playerid] = 0;
	}
	//Linia numer 55 autobusa SYSTEM AUTOBUS�W
	if(PlayerInfo[playerid][pLinia55]==1)
	{
		if(CP[playerid]==551) //Sprawdza czy dojecha� do nastepnego
		{

			DisablePlayerCheckpoint(playerid); //usuwa cp i...
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Przypomnienie_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Nie zapomnij rozpocz�� s�u�by!!!");
			SendClientMessage(playerid, COLOR_GREEN, "Wpisz {FFFF00}/fare [cena]");
			SendClientMessage(playerid, COLOR_GREEN, "Jezeli chcesz ruszy� po wjechaniu w przystanek wpisz /zd");
			SendClientMessage(playerid, COLOR_GREEN, "Je�eli b�dziesz chcia� przerwa� tras� wcze�niej wpisz /zakoncztrase");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>/fare<<_____________|");
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Jefferson - Glen Park - Idlewood - El Corona - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Motel Jefferson");
			ProxDetector(10.0, playerid, "Linia numer: {3333FF}55 (niebieska) {FFFF00} Kierunek ==> {3333FF}MRUCZNIK TOWER", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 2248.4707,-1139.6617,25.7001, 4); //... ustawia nastepnego
			CP[playerid]=552; //przypisuje id dla cp
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);

		}
		else if(CP[playerid]==552)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Jefferson � Motel Jefferson", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1967.2327,-1198.9353,25.2217, 4);
			CP[playerid]=553;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Glen Park - Idlewood - El Corona - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Glen Park");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
		}
		else if(CP[playerid]==553)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Glen Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1844.0139,-1361.4354,12.9694, 4);
			CP[playerid]=554;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Idlewood - El Corona - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Skate Park");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
		}
		else if(CP[playerid]==554)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Idlewood � Skate Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1742.6479,-1816.3966,12.9351, 4);
			CP[playerid]=555;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: El Corona - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Unity Station");
		}
		else if(CP[playerid]==555)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}El Corona � Unity Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1532.3134,-1648.4254,12.9485, 4); //Przystanek Komisariat
			CP[playerid]=556;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Komisariat / Urz�d Miasta");
		}
		else if(CP[playerid]==556)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1452.3877,-1031.1976,23.2277, 4);
			CP[playerid]=557;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Verte Bank ");
		}
		else if(CP[playerid]==557)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Downtown � Bank", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1008.5986,-1140.0272,23.2408, 4);
			CP[playerid]=558;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Market - Rodeo\n{808080}Nast�pny przystanek: Bymber Casino ");
		}
		else if(CP[playerid]==558)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Market � Bymber Casino", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 836.6970,-1318.8370,12.9458, 4);
			CP[playerid]=559;
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Komunikat_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Na najbli�szym skrzy�owaniu W LEWO");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Market - Rodeo\n{808080}Nast�pny przystanek: Market Station");
		}
		else if(CP[playerid]==559)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Market Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 708.8574,-1391.8915,13.0002, 4);
			CP[playerid]=560;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Centrala SAN");
		}
		else if(CP[playerid]==560)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo- Centrala SAN", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 625.2355,-1470.5664,13.9573, 4);
			CP[playerid]=1008;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: G��wna siedziba FBI (N/�)");
		}
		else if(CP[playerid]==1008)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo � G��wna siedziba FBI (N/�)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 354.7779,-1643.9617,32.4429, 4);
			CP[playerid]=562;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Molo W�dkarskie ");
		}
		else if(CP[playerid]==562)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo � Molo W�dkarskie", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 378.3281,-1424.5344,34.2901, 4); //nawrotka CP
			CP[playerid]=1001;
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Komunikat_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Przygotuj si� do wykonania NAWROTU");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			Przystanek(playerid, COLOR_BLUE, "Linia numer 55 \nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: MRUCZNIK TOWER ");
		}
		else if(CP[playerid]==1001)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek ko�cowy {EE82EE}Rodeo � Biurowiec 'Mrucznik Tower'", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 341.5396,-1531.1141,32.8992, 4); //CP mrucznik tower
			TogglePlayerControllable(playerid, 1);
			CP[playerid]=563;
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Komunikat_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Za chwil� zbli�ysz si� do ko�ca trasy! (1/2 zadania).");
			SendClientMessage(playerid, COLOR_GREEN, "Mo�esz odpocz�� nie wje�d�aj�c w kolejny checkpoint lub ruszy� dalej.");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \nKierunek: Ko�ci�\n{778899}Trasa: Rodeo - Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Odjazd nast�pi po sygnale");
		}
		else if(CP[playerid]==563)
		{
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 359.0248,-1647.8008,32.3386, 4); //molo w�dkarskie
			CP[playerid]=564;
			ProxDetector(10.0, playerid, "Linia numer: {3333FF}55 (niebieska) {FFFF00} Kierunek ==> {3333FF}KO�CIӣ", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Rodeo - Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Molo W�dkarskie");
		}
		else if(CP[playerid]==564)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo � Molo W�dkarskie", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 639.6337,-1452.6040,13.7631, 4);
			CP[playerid]=1007;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Rodeo - Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: G��wna siedziba FBI (N/�) ");
		}
		else if(CP[playerid]==1007)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo � G��wna siedziba FBI (N/�)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 723.2538,-1407.2189,12.9320, 4);
			CP[playerid]=566;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Rodeo - Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Centrala SAN ");
		}
		else if(CP[playerid]==566)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo- Centrala SAN", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 830.8025,-1330.0034,13.5437, 4);
			CP[playerid]=567;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Market Station ");
		}
		else if(CP[playerid]==567)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Market Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1034.3179,-1150.8452,23.2292, 4); //Bymber Kasyno
			CP[playerid]=568;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Bymber Casino ");
		}
		else if(CP[playerid]==568)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Market � Bymber Casino", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1449.7135,-1037.4396,23.2312, 4); //Bank
			CP[playerid]=569;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Verte Bank ");
		}
		else if(CP[playerid]==569)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Downtown � Bank", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1527.9624,-1695.4071,12.9535, 4); //Komisariat LS
			CP[playerid]=570;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Komisariat / Urz�d Miasta ");
		}
		else if(CP[playerid]==570)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1791.1583,-1833.9706,12.9519, 4);
			CP[playerid]=571;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Unity Station ");
		}
		else if(CP[playerid]==571)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}El Corona � Unity Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1853.2744,-1393.1622,12.9655, 4);
			CP[playerid]=572;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Skate Park ");
		}
		else if(CP[playerid]==572)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Idlewood � Skate Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1972.9082,-1198.7592,25.2214, 4);
			CP[playerid]=573;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Glen Park - Jefferson\n{808080}Nast�pny przystanek: Glen Park ");
		}
		else if(CP[playerid]==573)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Glen Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2255.2795,-1145.6331,26.0940, 4);
			CP[playerid]=574;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Jefferson\n{808080}Nast�pny przystanek: Motel Jefferson ");
		}
		else if(CP[playerid]==574)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2210.0313,-1440.1292,23.3929, 4); //Ko�cowy CP po drugiej stronie
			CP[playerid]=575;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Jefferson � Motel Jefferson", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+230$");
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Jefferson\n{808080}Nast�pny przystanek: KO�CIӣ ");
		}
		else if(CP[playerid]==575)
		{
			if(BusCzit[playerid] == 1)
			{
				KickEx(playerid);
			}
			else
			{
				ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Jefferson � Ko�ci�", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				DisablePlayerCheckpoint(playerid);
				//TogglePlayerControllable(playerid, 0);//Zamra�amy do p�ki nie odpowie co robi dalej
				//ShowPlayerDialogEx(playerid, 8888, DIALOG_STYLE_MSGBOX, "Trasa", "Zrobi�e� pe�n� tras�. Co zamierzasz teraz zrobi�?\n\nWci�nij Pon�w aby wczyta� tras� jeszcze raz.\nWci�nij Inn� aby wybra� inn� tras�.", "Pon�w", "Inn�");
				SendClientMessage(playerid, COLOR_YELLOW, "|_____________Trasa linii 55 zako�czona!_____________|");
				SendClientMessage(playerid, COLOR_GREEN, "Otrzymujesz 5980$ premii za dwukrotne przejechanie trasy! (26 przystank�w)");
				SendClientMessage(playerid, COLOR_GREEN, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				SendClientMessage(playerid, COLOR_GREEN, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez GPS).");
				SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>Los Santos Bus Department<<_____________|");
				SendClientMessage(playerid, COLOR_GRAD1, "Skill +2");
				PlayerInfo[playerid][pCarSkill] += 2;
				if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 5980);
				else DajKase(playerid, 5980);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia55] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 -niebieska (230$/p , 9min, 21p, +2)\nLinia 72- pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
				Przystanek(playerid, COLOR_BLUE, "Linia ZAJ\nLinia 55 do zajezdni Ocean Docks\n{778899}Trasa: Idlewood - Willowfield\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
				CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
				Przystanek(playerid, COLOR_BLUE, "Linia ZAJ\nLinia 55 do zajezdni Commerce\n{778899}Trasa: Idlewood - Pershing Square - Commerce\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
				CP[playerid]=1201;
				}

			}
		}
	}
	// KONIEC LINII 55 AUTOBUS�W

	//Linia numer 72 autobusa SYSTEM AUTOBUS�W
	if(PlayerInfo[playerid][pLinia72]==1)
	{
		if(CP[playerid]==721) //Sprawdza czy dojecha� do nastepnego
		{
			DisablePlayerCheckpoint(playerid); //usuwa cp i...
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Przypomnienie_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Nie zapomnij rozpocz�� s�u�by!!!");
			SendClientMessage(playerid, COLOR_GREEN, "Wpisz {FFFF00}/fare [cena]");
			SendClientMessage(playerid, COLOR_GREEN, "Jezeli chcesz ruszy� po wjechaniu w przystanek wpisz /zd");
			SendClientMessage(playerid, COLOR_GREEN, "Je�eli b�dziesz chcia� przerwa� tras� wcze�niej wpisz /zakoncztrase");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>/fare<<_____________|");
			ProxDetector(10.0, playerid, "Linia numer: {FFA500}72 (pomara�czowa)  {FFFF00}Kierunek ==> {FFA500}MRUCZNIK TOWER", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 2572.6025,-1728.8365,13.3093, 4);
			CP[playerid]=740; //przypisuje id dla cp up
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Ganton - Idlewood - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Grove Street");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);//
		}
		//nowe ganton GS lewo 2471,-1735.9000244141,13.39999961853
		//nowe ganton GS prawy 2590.6999511719,-1728.8000488281,13.39999961853
		else if(CP[playerid]==740)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2297.6785,-1655.4948,14.3767, 4);
			CP[playerid]=1009;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Ganton � Grove Street", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+100$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Ganton - Idlewood - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Bar Ten Green Bottles (N/�)");
		}
		else if(CP[playerid]==1009)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2182.5671,-1708.4637,13.4766, 4); //
			CP[playerid]=722;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Ganton � Bar Ten Green Bottles (N/�)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+50$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Idlewood - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Si�ownia");
		}
		else if(CP[playerid]==722)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid,  1890.3834,-1749.6218,12.9520, 4);//
			CP[playerid]=723;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Idlewood � Si�ownia", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Idlewood - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Stacja Benzynowa");
		}
		else if(CP[playerid]==723)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1532.3134,-1648.4254,12.9485, 4);
			CP[playerid]=724;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Idlewood � Stacja Benzynowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Komisariat / Urz�d Miasta ");
		}
		else if(CP[playerid]==724)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1452.3877,-1031.1976,23.2277, 4);
			CP[playerid]=725;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Verte Bank (jedn.) ");
		}
		else if(CP[playerid]==725)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1340.7183,-1346.4941,12.9510, 4); //stacja benz prawa
			CP[playerid]=726;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Downtown � Bank (jednokierunkowy)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Ammu-Nation (jedn.)");
		}
		else if(CP[playerid]==726)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1208.1235,-1314.7834,12.9645, 4);
			CP[playerid]=727;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Downtown - Ammu-Nation(jednokierunkowy)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Market - Rodeo\n{808080}Nast�pny przystanek: Szpital");
		}
		else if(CP[playerid]==727)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 836.6970,-1318.8370,12.9458, 4);
			CP[playerid]=728;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Market � Szpital", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Market - Rodeo\n{808080}Nast�pny przystanek: Market Station ");
		}
		else if(CP[playerid]==728)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 341.5396,-1531.1141,32.8992, 4); //mrucznik tower
			CP[playerid]=729;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Market Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Mrucznik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: MRUCZNIK TOWER ");
		}
		else if(CP[playerid]==729)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 260.5440,-1531.3761,32.1662, 4); //nawrotka przy mrucznik tower
			CP[playerid]=1003;
			ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Rodeo � Biurowiec 'Mrucznik Tower'", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Komunikat_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Gratulacje! Uko�czy�e� tras� do Mrucznik Tower! (1/2 zadania). Mo�esz tu odpocz��.");
			SendClientMessage(playerid, COLOR_GREEN, "Je�eli chcesz jecha� dalej wykonaj nawr�t kieruj�c si� do kolejnego checkpointu!");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Market - Downtown - Urz�d Miasta - Idlewood - Ganton - East Los Santos\n{808080}Odjazd nast�pi po sygnale!");
		}
		else if(CP[playerid]==1003)
		{
			TogglePlayerControllable(playerid, 1);
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 830.8025,-1330.0034,13.5437, 4);
			CP[playerid]=730;
			ProxDetector(10.0, playerid, "Linia numer: {FFA500}72 (pomara�czowa)  {FFFF00}Kierunek ==> {FFA500}BAZA MECHANIK�W", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Market - Downtown - Urz�d Miasta - Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Market Station ");
		}
		else if(CP[playerid]==730)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1193.7321,-1358.3251,12.9416, 4);
			CP[playerid]=731;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Market Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa:  Market - Downtown - Urz�d Miasta - Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Szpital ");

		}
		else if(CP[playerid]==731)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1527.9624,-1695.4071,12.9535, 4);//komi LS
			CP[playerid]=734;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Market - Szpital", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Downtown - Urz�d Miasta - Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Urz�d Miasta/Komisariat ");
		}
		else if(CP[playerid]==734)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1924.6978,-1754.4702,12.9486, 4);
			CP[playerid]=735;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Stacja Benzynowa ");
		}
		else if(CP[playerid]==735)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2162.4690,-1754.0964,12.9439, 4);
			CP[playerid]=736;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Idlewood � Stacja Benzynowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Si�ownia");
		}
		else if(CP[playerid]==736)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2314.7969,-1661.7714,13.8587  , 4);
			CP[playerid]=1010;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Idlewood - Szamboa Gym", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Ganton - East Los Santos\n{808080}Nast�pny przystanek: Bar Ten Green Bottles (N/�) ");
		}
		else if(CP[playerid]==1010)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2489.3118,-1735.8690,13.3172 , 4);
			CP[playerid]=742;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Ganton - Bar Ten Green Bottles (N/�)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+50$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Ganton - East Los Santos\n{808080}Nast�pny przystanek: Grove Street ");
		}
		else if(CP[playerid]==742)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2818.4243,-1576.9399,10.9287, 4);
			CP[playerid]=737;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Ganton - Grove Street", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+100$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Ganton - East Los Santos\n{808080}Nast�pny przystanek: BAZA MECHANIK�W (p�tla) ");
		}
		else if(CP[playerid]==737)
		{
			if(BusCzit[playerid] == 1)
			{
				KickEx(playerid);
			}
			else
			{
				ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}East Los Santos - Baza Mechanik�w (p�tla)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				DisablePlayerCheckpoint(playerid);
				TogglePlayerControllable(playerid, 0);//Zamra�amy do p�ki nie odpowie co robi dalej
				//ShowPlayerDialogEx(playerid, 8888, DIALOG_STYLE_MSGBOX, "Trasa", "Zrobi�e� pe�n� tras�. Co zamierzasz teraz zrobi�?\n\nWci�nij Pon�w aby wczyta� tras� jeszcze raz.\nWci�nij Inn� aby wybra� inn� tras�.", "Pon�w", "Inn�");
				SendClientMessage(playerid, COLOR_YELLOW, "|_____________Trasa linii 72 zako�czona!_____________|");
				SendClientMessage(playerid, COLOR_GREEN, "Otrzymujesz 3300$ premii za dwukrotne przejechanie trasy! (19 przystank�w)");
				SendClientMessage(playerid, COLOR_GREEN, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				SendClientMessage(playerid, COLOR_GREEN, "Chc�c powt�rzy� t� tras� zawr�� wykorzystuj�c parking znajduj�cy si� na skrzy�owaniu w w lewo.");
				SendClientMessage(playerid, COLOR_GREEN, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez GPS).");
				SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>Los Santos Bus Department<<_____________|");
				SendClientMessage(playerid, COLOR_GRAD1, "Skill +1");
				PlayerInfo[playerid][pCarSkill] ++;
				if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 3300);
				else DajKase(playerid, 3300);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia72] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 -niebieska (230$/p , 9min, 21p, +2)\nLinia 72- pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
				Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia ZAJ\nLinia 72 do zajezdni Ocean Docks\n{778899}Trasa: Idlewood - Willowfield\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
				CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
				Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia ZAJ\nLinia 72 do zajezdni Commerce\n{778899}Trasa: Idlewood - Pershing Square - Commerce\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
				CP[playerid]=1201;
				}
			}
		}
	}
	// KONIEC LINII 72 AUTOBUS�W
	//Linia numer 82 autobusa SYSTEM AUTOBUS�W
	if(PlayerInfo[playerid][pLinia82]==1)
	{
		if(CP[playerid]==821) //Sprawdza czy dojecha� do nastepnego
		{
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Przypomnienie_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Nie zapomnij rozpocz�� s�u�by!!!");
			SendClientMessage(playerid, COLOR_GREEN, "Wpisz {FFFF00}/fare [cena]");
			SendClientMessage(playerid, COLOR_GREEN, "Jezeli chcesz ruszy� po wjechaniu w przystanek wpisz /zd");
			SendClientMessage(playerid, COLOR_GREEN, "Je�eli b�dziesz chcia� przerwa� tras� wcze�niej wpisz /zakoncztrase");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>/fare<<_____________|");
			ProxDetector(10.0, playerid, "Linia numer: {DAA520}82 (��ta) {FFFF00}Kierunek ==> {DAA520}BAY SIDE", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 1532.3134,-1648.4254,12.9485, 4); //... ustawia nastepnego KOMi (jedn)
			CP[playerid]=822; //przypisuje id dla cp up
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);//
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Urz�d Miasta - East Los Santos - Palomino Creek - Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: Komisariat / Urz�d Miasta ");
		}
		else if(CP[playerid]==822)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2864.6250,-1539.0991,10.4947, 4);
			CP[playerid]=823;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Droga do Mechanik�w_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Kieruj si� do Alhambry, potem w LEWO.");
			SendClientMessage(playerid, COLOR_GREEN, "Wjed� na autostrad�, nast�pnie prosto do bazy mechanik�w.");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: East Los Santos - Palomino Creek - Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: Baza Mechanik�w ");

		}
		else if(CP[playerid]==823)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2839.9409,-1098.3546,23.5453, 4);
			CP[playerid]=824;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}East Los Santos � Baza Mechanik�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: East Los Santos - Palomino Creek - Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: Agencja Ochrony ");
		}
		else if(CP[playerid]==824)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2339.9377,39.4851,26.3359, 4);
			CP[playerid]=825;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}East Los Santos � Agencja Ochrony", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Droga do PC_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Jed� ci�gle prosto zwyk�� drog�. Nie zje�d�aj na autostrad�.");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Palomino Creek - Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: miasteczko Palomino Creek ");
		}
		else if(CP[playerid]==825)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1051.7797,-444.1544,51.0848, 4); //Przystanek PC
			CP[playerid]=826;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Palomino Creek", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Droga do Dillimore_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Gdy przejedziesz po mo�cie za 400m SKR�� W LEWO na most.");
			SendClientMessage(playerid, COLOR_GREEN, "P�neij kieruj si� do tunelu. Ca�y czas prosto");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: Hilltop Farm ");
		}
		else if(CP[playerid]==826)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 661.4372,-597.9591,15.7536, 4);
			CP[playerid]=827;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Dillimore � Hilltop Farm", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: miasteczko Dillimore ");
		}
		else if(CP[playerid]==827)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 235.2872,-54.7197,1.5620, 4);
			CP[playerid]=828;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Dillimore", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Droga do Bluberry_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Gdy miniesz komisariat SKR�� W LEWO.");
			SendClientMessage(playerid, COLOR_GREEN, "Jed� prosto drog� do i SKR�� W LEWO do wyjazdu przy Cowboy Bar. Potem prosto.");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Bluberry - Las Venturas\n{808080}Nast�pny przystanek: miasteczko Bluberry ");
		}
		else if(CP[playerid]==828)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2494.9761,2333.7603,4.9693, 4);//bay side ko�cowy
			CP[playerid]=829;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Bluberry", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Droga do Bay Side_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Po wyje�dzie z Bluberry SKR�� W LEWO");
			SendClientMessage(playerid, COLOR_GREEN, "Po przejechaniu 800m SKR�� W PRAWO na most");
			SendClientMessage(playerid, COLOR_GREEN, "Nast�pnie za 300m SKR�� W LEWO na autostrade. Dalej ca�y czas prosto.");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Las Venturas\n{808080}Nast�pny przystanek: miasteczko Bay Side ");
		}
		else if(CP[playerid]==829)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2538.2993,2333.5835,4.8281, 4);
			CP[playerid]=1000;
			ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Bay Side", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Komunikat_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Gratulacje! Uko�czy�e� tras� do Bay Side! (1/2 zadania)");
			SendClientMessage(playerid, COLOR_GREEN, "Mo�esz chwilk� odpocz��, wjed� w kolejny checkpoint aby ruszy� dalej!");
			SendClientMessage(playerid, COLOR_GREEN, "Dodatkowo otrzymujesz premi� paliwow� z uwagi na utrudniony dost�p do mechanik�w.");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Gas[GetPlayerVehicleID(playerid)] = 100;
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Commerce\n{778899}Trasa: Bluberry - Dillimore - Palomino Creek - East Los Santos - Commerce\n{808080}Odjazd nast�pi po sygnale ");
		}
		else if(CP[playerid]==1000)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 229.9310,-170.9327,1.0001, 4);
			CP[playerid]=830;
			ProxDetector(10.0, playerid, "Linia numer: {DAA520}82 (��ta) {FFFF00}Kierunek ==> {DAA520}DWORZEC AUTOBUSOWY COMMERCE", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			TogglePlayerControllable(playerid, 1);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Autobusowy\n{778899}Trasa: Bluberry - Dillimore - Palomino Creek - East Los Santos - Commerce\n{808080}Nast�pny przystanek: miasteczko Bluberry");
		}
		else if(CP[playerid]==830)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 684.2634,-569.5635,16.3208, 4);
			CP[playerid]=831;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Bluberry", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek:Dworzec Autobusowy\n{778899}Trasa: Dillimore - Palomino Creek - East Los Santos - Commerce\n{808080}Nast�pny przystanek: miasteczko Dillimore");
		}
		else if(CP[playerid]==831)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1014.1871,-466.1351,50.5591, 4);
			CP[playerid]=832;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Dillimore", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Autobusowy\n{778899}Trasa: Dillimore - Palomino Creek - East Los Santos - Commerce\n{808080}Nast�pny przystanek: Hilltop Farm");
		}
		else if(CP[playerid]==832)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2577.4602,39.4546,26.3359, 4); //PC prawa
			CP[playerid]=833;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Dillimore � Hilltop Farm", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Autobusowy\n{778899}Trasa: Palomino Creek - East Los Santos - Commerce\n{808080}Nast�pny przystanek: miasteczko Palomino Creek");
		}
		else if(CP[playerid]==833)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2835.9119,-1100.0378,23.6009, 4); //nakijima prawa
			CP[playerid]=834;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Palomino Creek", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Autobusowy\n{778899}Trasa: East Los Santos - Commerce\n{808080}Nast�pny przystanek: Agencja Ochrony");
		}
		else if(CP[playerid]==834)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2852.0789,-1563.2421,10.4871, 4);
			CP[playerid]=835;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}East Los Santos � Agencja Ochrony", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: East Los Santos  - Commerce\n{808080}Nast�pny przystanek: Baza Mechanik�w");
		}
		else if(CP[playerid]==835)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1181.8771,-1748.0386,12.9679, 4);
			CP[playerid]=836;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}East Los Santos � Baza Mechanik�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Droga do Dworca_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Jed� ci�gle autostrad�.");
			SendClientMessage(playerid, COLOR_GREEN, "Wyjed� na Idlewoo i kieruj si� ca�y czas prosto.");
			SendClientMessage(playerid, COLOR_GREEN, "Po przejechaniu spowalniacza, SKR�� w LEWO i kieruj si� na dworzec.");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Commerce\n{808080}Nast�pny przystanek: Dworzec Autobusowy / Basen");
		}
		else if(CP[playerid]==836)
		{
			if(BusCzit[playerid] == 1)
			{
				KickEx(playerid);
			}
			else
			{
				ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Commerce � Dworzec Autobusowy / Basen", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				DisablePlayerCheckpoint(playerid);
				TogglePlayerControllable(playerid, 0);//Zamra�amy do p�ki nie odpowie co robi dalej
				//ShowPlayerDialogEx(playerid, 8888, DIALOG_STYLE_MSGBOX, "Trasa", "Zrobi�e� pe�n� tras�. Co zamierzasz teraz zrobi�?\n\nWci�nij Pon�w aby wczyta� tras� jeszcze raz.\nWci�nij Inn� aby wybra� inn� tras�.", "Pon�w", "Inn�");
				SendClientMessage(playerid, COLOR_YELLOW, "|_____________Trasa linii 82 zako�czona!_____________|");
				SendClientMessage(playerid, COLOR_GREEN, "Otrzymujesz 8670$ premii za dwukrotne przejechanie trasy! (17 przystank�w)");
				SendClientMessage(playerid, COLOR_GREEN, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				SendClientMessage(playerid, COLOR_GREEN, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez GPS).");
				SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>Los Santos Bus Department<<_____________|");
				SendClientMessage(playerid, COLOR_GRAD1, "Skill +3");
				PlayerInfo[playerid][pCarSkill] += 3;
				if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 8670);
				else DajKase(playerid, 8670);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia82] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 -niebieska (230$/p , 9min, 21p, +2)\nLinia 72- pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
				Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia ZAJ\nLinia 82 do zajezdni Ocean Docks\n{778899}Trasa: Pershing Square - Idlewood - Willowfield\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
				CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
				Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia ZAJ\nLinia 82 do zajezdni Commerce\n{778899}Trasa: Commerce\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
				CP[playerid]=1201;
				}
			}
		}
 	}
	// KONIEC LINII 82 AUTOBUS�W system autobus�w
    if(PlayerInfo[playerid][pLinia96]==1)
	{
		if(CP[playerid]==961) //Sprawdza czy dojecha� do nastepnego
		{
	        DisablePlayerCheckpoint(playerid);
			/*GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "%s rozpocz�� tras�  na linii autobusowej numer {ADFF2F}96 Biurowiec <==> Baza Wojskowa{00D900C8}. Szczeg�owe informacje o trasach na /businfo", sendername);
			OOCNews(TEAM_GROVE_COLOR,string);*/
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Ocean Docks - Lotnisko - El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Baza Wojskowa");
			ProxDetector(10.0, playerid, "Linia numer: {ADFF2F}96 (zielona) {FFFF00}Kierunek ==> {ADFF2F}MRUCZNIK TOWER", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 2512.0193,-2434.2727,13.7151, 4); //... ustawia nastepnego
			CP[playerid]=985; //przypisuje id dla cp up
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);//
		}
		else if(CP[playerid]==985)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2228.8030,-2198.2109,12.9153, 4);//uszkodzony
			CP[playerid]=962;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Lotnisko - El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Fabryka");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocean Docks � Baza Wosjkowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==962)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1992.8591,-2163.2961,13.3828, 4);//uszkodzony
			CP[playerid]=963;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Lotnisko - El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Pas Startowy");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocean Docks � Fabryka", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==963)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1895.3,-1935.31,13.399, 4);
			CP[playerid]=964;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Wiadukt");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Lotnisko � Pas Startowy", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==964)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1742.6479,-1816.3966,12.9351, 4);
			CP[playerid]=965;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Unity Station");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}El Corona � Wiadukt", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==965)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1463.1995,-1868.8994,13.3999, 4); //Przystanek commerce VB prawa
			CP[playerid]=966;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Verdant Bluffs / Urz�d Miasta");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}El Corona � Unity Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==966)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1181.8771,-1748.0386,12.9679, 4);
			CP[playerid]=967;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Zajezdnia Autobusowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Commerce � Verdant Bluffs / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==967)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1084.2205,-1569.8024,12.9443, 4);
			CP[playerid]=968;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Galerie Handlowe");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Commerce � Basen �Tsunami� / Zajezdnia Autobusowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==968)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 824.0928,-1624.2281,12.9477, 4);
			CP[playerid]=969;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Marina - Rodeo\n{808080}Nast�pny przystanek: Burger Shot");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Market � Galerie handlowe", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==969)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 639.6337,-1452.6040,13.7631, 4);
			CP[playerid]=970;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: G��wna Siedziba FBI");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Marina � Burger Shot", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==970)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 535.0409,-1243.6492,16.0884, 4);// wypozyczalnia prawa
			CP[playerid]=971;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Wypo�yczalnia Aut");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Rodeo � G��wna siedziba FBI", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==971)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 341.5396,-1531.1141,32.8992, 4);
			CP[playerid]=972;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Mrucznik Tower\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: MRUCZNIK TOWER");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Rodeo � Wypo�yczalnia Pojazd�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==972)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 276.5778,-1575.9937,32.8686, 4); //Ko�cowy CP
			CP[playerid]=1004;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Rodeo - Marina - Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Odjazd nast�pi po sygnale");
			ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Rodeo - Mrucznik Tower", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Komunikat_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Gratulacje! Uko�czy�e� tras� do Mrucznik Tower! (1/2 zadania). Mo�esz odpocz��.");
			SendClientMessage(playerid, COLOR_GREEN, "Je�eli chcesz jecha� dalej wykonaj nawr�t kieruj�c si� do kolejnego checkpointu!");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==1004)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 577.4726,-1236.8068,17.0600, 4); //Druga strona ulicy CP
			CP[playerid]=973;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Rodeo - Marina - Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Wypo�yczalnia Aut");
			ProxDetector(10.0, playerid, "Linia numer: {ADFF2F}96 (zielona) {FFFF00}Kierunek ==> {ADFF2F}WI�ZIENIE STANOWE", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	        TogglePlayerControllable(playerid, 1);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==973)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 625.2355,-1470.5664,13.9573, 4); //Druga strona ulicy CP
			CP[playerid]=974;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Rodeo - Marina - Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: G��wna Siedziba FBI");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Rodeo � Wypo�yczalnia Pojazd�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==974)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 840.9546,-1614.0339,12.9483, 4);
			CP[playerid]=975;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Marina - Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Burger Shot");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Rodeo � G��wna siedziba FBI", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==975)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1105.6156,-1574.0813,12.9401, 4);
			CP[playerid]=976;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Galerie Handlowe");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Marina � Burger Shot", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==976)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1173.1520,-1825.2843,13.1789, 4);
			CP[playerid]=977;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Zajezdnia Autobusowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Market � Galerie handlowe", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==977)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1492,-1875.8005,13.9999, 4);
			CP[playerid]=978;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Verdant Bluffs / Urz�d Miasta");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Commerce � Basen �Tsunami� / Zajezdnia Autobusowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==978)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1791.1583,-1833.9706,12.9519, 4); //wiadukt lewy
			CP[playerid]=979;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Unity Station");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Commerce � Verdant Bluffs", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==979)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1895.3,-1935.31,13.399, 4);
			CP[playerid]=980;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Wiadukt");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}El Corona � Unity Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==980)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1977.1256,-2168.7412,12.9419, 4);
			CP[playerid]=981;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Pas Startowy");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}El Corona � Wiadukt", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==981)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2228.8030,-2198.2109,12.9153, 4);
			CP[playerid]=982;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Ocean Docks\n{808080}Nast�pny przystanek: Fabryka");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Lotnisko � Pas Startowy", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==982)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2335.9858,-2355.0427,13.3828, 4);
			CP[playerid]=1202;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Ocean Docks\n{808080}Nast�pny przystanek: Baza Wosjkowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocen Docks � Fabryka", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==982)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2495.6113,-2408.0415,13.5445, 4);
			CP[playerid]=983;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Ocean Docks\n{808080}Nast�pny przystanek: Baza Wosjkowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocen Docks � Baza Wosjkowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==983)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2687.6597,-2406.9775,13.6017, 4);
			CP[playerid]=984;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Ocean Docks\n{808080}Nast�pny przystanek: WI�ZIENIE STANOWE");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocen Docks � Baza Wosjkowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+310$");
		}
		else if(CP[playerid]==984)
		{
		    if(BusCzit[playerid] == 1)
			{
			    KickEx(playerid);
			}
			else
			{
			    ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Ocean Docks � Wi�zienie Stanowe", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	   			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Trasa linii 96 zako�czona!_____________|");
				SendClientMessage(playerid, COLOR_GREEN, "Otrzymujesz 7440$ premii za dwukrotne przejechanie trasy! (24 przystanki)");
				SendClientMessage(playerid, COLOR_GREEN, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				SendClientMessage(playerid, COLOR_GREEN, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez sygan� GPS).");
				SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>Los Santos Bus Department<<_____________|");
				SendClientMessage(playerid, COLOR_GRAD1, "Skill +1");
				PlayerInfo[playerid][pCarSkill] ++;
                if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 7440);
                else DajKase(playerid, 7440);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia96] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 - niebieska (230$/p , 9min, 21p, +2)\nLinia 72 - pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
					Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia ZAJ\nLinia 96 do zajezdni Ocean Docks\n{778899}Trasa: Ocean Docks\n{808080}Zatrzymuje si� na przystankach");
					SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
					CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
					Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia ZAJ\nLinia 96 do zajezdni Commerce\n{778899}Trasa: Ocean Docks - Lotnisko - El Corona - Pershing Square - Commerce\n{808080}Zatrzymuje si� na przystankach");
					SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
					CP[playerid]=1201;
    			}
			}
		}
	}
	if(PlayerInfo[playerid][pLinia85]==1)//linia 85 system autobus�w
	{
		if(CP[playerid]==501) //Sprawdza czy dojecha� do nastepnego
		{
		    DisablePlayerCheckpoint(playerid);
			/*GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "%s rozpocz�� tras�  na linii autobusowej numer {FF00FF}85 Wysypisko <==> Szpital{00D900C8}. Szczeg�owe informacje o trasach na /businfo", sendername);
			OOCNews(TEAM_GROVE_COLOR,string);*/
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Willowfield - East Los Santos - Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Cluckin Bell");
			ProxDetector(10.0, playerid, "Linia numer: {FF00FF}85 (r�owa) {FFFF00}Kierunek ==> {FF00FF}SZPITAL", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 2415.8232,-1912.1696,12.9518, 4); //... ustawia nastepnego
			CP[playerid]=502; //przypisuje id dla cp up
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);//
		}
		else if(CP[playerid]==502)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2488.0164,-1506.9924,23.3944, 4);//uszkodzony
			CP[playerid]=503;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: East Los Santos - Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Myjnia Samochodowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Willowfield � Cluck'in Bell", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==503)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2852.0789,-1563.2421,10.4871, 4);
			CP[playerid]=504;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: East Los Santos - Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Baza Mechanik�w");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Willowfield � Myjnia Samochodowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==504)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2835.9119,-1100.0378,23.6009, 4);
			CP[playerid]=505;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: East Los Santos - Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Agencja Ochrony");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}East Los Santos � Baza Mechanik�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==505)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2541.5476,-1050.6461,68.9680, 4); //Przystanek commerce VB prawa
			CP[playerid]=506;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Las Colinas 13");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}East Los Santos � Agencja Ochrony", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==506)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2202.1843,-1011.6302,61.2425, 4);
			CP[playerid]=507;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Las Colinas 32");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Las Colinas 13", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==507)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2248.4707,-1139.6617,25.7001, 4);
			CP[playerid]=508;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Motel Jefferson");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Las Colinas 34", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==508)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1967.2327,-1198.9353,25.2217, 4);
			CP[playerid]=509;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Glen Park");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Jefferson � Motel Jefferson", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==509)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1810.9371,-1181.5383,23.2077, 4);
			CP[playerid]=510;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Downtown - Market\n{808080}Nast�pny przystanek: Mrucznikowy Gun Shop");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Glen Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==510)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1449.7135,-1037.4396,23.2312, 4);// wypozyczalnia prawa
			CP[playerid]=511;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Downtown - Market\n{808080}Nast�pny przystanek: Verte Bank");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Downtown � Mrucznikowy Gun Shop", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==511)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1193.7321,-1358.3251,12.9416, 4);
			CP[playerid]=512;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Market\n{808080}Nast�pny przystanek: SZPITAL");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Downtown � Bank", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==512)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1203.7321,-1358.3251,12.9416, 4); //Ko�cowy CP
			CP[playerid]=1005;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Market - Downtown - Glen Park - Jefferson - Las Colinas - East LS - Willowfield\n{808080}Odjazd nast�pi po sygnale");
			ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Market � Szpital", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Komunikat_____________|");
			SendClientMessage(playerid, COLOR_GREEN, "Gratulacje! Uko�czy�e� tras� do Mrucznik Tower! (1/2 zadania). Mo�esz odpocz��.");
			SendClientMessage(playerid, COLOR_GREEN, "Je�eli chcesz jecha� dalej wykonaj nawr�t kieruj�c si� do kolejnego checkpointu!");
			SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==1005)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1452.3877,-1031.1976,23.2277, 4); //Druga strona ulicy CP
			CP[playerid]=513;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Downtown - Glen Park - Jefferson - Las Colinas - East LS - Willowfield\n{808080}Nast�pny przystanek: Verte Bank");
			ProxDetector(10.0, playerid, "Linia numer: {FF00FF}85 (r�owa) {FF00FF}Kierunek ==> {ADFF2F}WYSYPISKO", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	        TogglePlayerControllable(playerid, 1);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==513)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1781.2218,-1167.9779,23.2261, 4); //Druga strona ulicy CP
			CP[playerid]=514;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Downtown - Glen Park - Jefferson - Las Colinas - East LS - Willowfield\n{808080}Nast�pny przystanek: Mrucznikowy Gun Shop");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Downtown � Bank", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==514)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1972.9082,-1198.7592,25.2214, 4);
			CP[playerid]=515;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Glen Park - Jefferson - Las Colinas - East LS - Willowfield\n{808080}Nast�pny przystanek: Glen Park");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Downtown � Mrucznikowy Gun Shop", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==515)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2255.2795,-1145.6331,26.0940, 4);
			CP[playerid]=516;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Jefferson - Las Colinas - East Los Santos - Willowfield\n{808080}Nast�pny przystanek: Motel Jefferson");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Glen Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==516)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2193.2642,-1012.3875,61.8830, 4);
			CP[playerid]=517;
		    Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Las Colinas - East Lost Santos - Willowfield\n{808080}Nast�pny przystanek: Las Colinas 34");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Jefferson � Motel Jefferson", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==517)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2520.0220,-1044.3973,68.9851, 4);
			CP[playerid]=518;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Las Colinas - East Lost Santos - Willowfield\n{808080}Nast�pny przystanek: Las Colinas 13");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Las Colinas 34", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==518)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2839.9409,-1098.3546,23.5453, 4); //wiadukt lewy
			CP[playerid]=519;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: East Lost Santos - Willowfield\n{808080}Nast�pny przystanek: Agencja Ochrony");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Las Colinas 13", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==519)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2864.6250,-1539.0991,10.4947, 4);
			CP[playerid]=520;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: East Lost Santos - Willowfield\n{808080}Nast�pny przystanek: Baza Mechanik�w");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}East Los Santos � Agencja Ochrony", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==520)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2514.7009,-1501.5859,23.8281, 4);
			CP[playerid]=521;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Willowfield\n{808080}Nast�pny przystanek: Myjnia Samochodowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}East Los Santos � Baza Mechanik�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==521)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2411.1692,-1908.5591,12.9485, 4);
			CP[playerid]=522;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Willowfield\n{808080}Nast�pny przystanek: Cluckin Bell");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Willowfield � Myjnia", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==522)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2118.5024,-1891.6978,12.9058, 4);
			CP[playerid]=523;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Willowfield\n{808080}Nast�pny przystanek: WYSYPISKO");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Willowfield � Clukin Bell", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GREEN, "+270$");
		}
		else if(CP[playerid]==523)
		{
		    if(BusCzit[playerid] == 1)
			{
			    KickEx(playerid);
			}
			else
			{
			    Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia ZAJ\nLinia 85 do zajezdni Ocead Docks\n{778899}Trasa: Willowfield\n{808080}Zatrzymuje si� na przystankach");
			    ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Willowfield � Wysypisko", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	   			SendClientMessage(playerid, COLOR_YELLOW, "|_____________Trasa linii 85 zako�czona!_____________|");
				SendClientMessage(playerid, COLOR_GREEN, "Otrzymujesz 6480$ premii za dwukrotne przejechanie trasy! (24 przystanki)");
				SendClientMessage(playerid, COLOR_GREEN, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				SendClientMessage(playerid, COLOR_GREEN, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez GPS).");
				SendClientMessage(playerid, COLOR_YELLOW, "|_____________>>Los Santos Bus Department<<_____________|");
				SendClientMessage(playerid, COLOR_GRAD1, "Skill +2");
				PlayerInfo[playerid][pCarSkill] += 2;
                if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 6480);
                else DajKase(playerid, 6480);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia96] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 -niebieska (230$/p , 9min, 21p, +2)\nLinia 72- pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
					Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia ZAJ\nLinia 85 do zajezdni Ocean Docks\n{778899}Trasa: Willowfield - Ocean Docks\n{808080}Zatrzymuje si� na przystankach");
					SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
					CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
					Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia ZAJ\nLinia 85 do zajezdni Commerce\n{778899}Trasa: Willowfield - Idlewood - Pershing Square - Commerce\n{808080}Zatrzymuje si� na przystankach");
					SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
					CP[playerid]=1201;
    			}
			}
		}
	}
//koniec linii 85 i system autobus�w
	else if(CP[playerid]==1)
	{
	    if(IsPlayerInAnyVehicle(playerid))
	    {
		    PlayerInfo[playerid][pJackSkill] ++;
			if(PlayerInfo[playerid][pJackSkill] == 50)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Tw�j skill z�odzieja samochod�w wynosi teraz 2, b�dziesz wi�cej zarabia� oraz szybciej ukra�� nowe auto."); }
			else if(PlayerInfo[playerid][pJackSkill] == 100)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Tw�j skill z�odzieja samochod�w wynosi teraz 3, b�dziesz wi�cej zarabia� oraz szybciej ukra�� nowe auto."); }
			else if(PlayerInfo[playerid][pJackSkill] == 200)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Tw�j skill z�odzieja samochod�w wynosi teraz 4, b�dziesz wi�cej zarabia� oraz szybciej ukra�� nowe auto."); }
			else if(PlayerInfo[playerid][pJackSkill] == 400)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Tw�j skill z�odzieja samochod�w wynosi teraz 5, b�dziesz najwi�cej zarabia� oraz najszybciej kra�� auta."); }
			new level = PlayerInfo[playerid][pJackSkill];
			if(level >= 0 && level <= 50)
			{
			    new rand = random(sizeof(SELLCAR1));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, nast�pny pojazd mo�esz ukra�� za 20 minut.", SELLCAR1[rand]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	  			DajKase(playerid, SELLCAR1[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 600;
			}
			else if(level >= 51 && level <= 100)
			{
			    new rand = random(sizeof(SELLCAR2));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, nast�pny pojazd mo�esz ukra�� za 18 minut.", SELLCAR2[rand]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	  			DajKase(playerid, SELLCAR2[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 540;
			}
			else if(level >= 101 && level <= 200)
			{
			    new rand = random(sizeof(SELLCAR3));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, nast�pny pojazd mo�esz ukra�� za 16 minut.", SELLCAR3[rand]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	  			DajKase(playerid, SELLCAR3[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 480;
			}
			else if(level >= 201 && level <= 400)
			{
			    new rand = random(sizeof(SELLCAR4));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, nast�pny pojazd mo�esz ukra�� za 14 minut.", SELLCAR4[rand]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	  			DajKase(playerid, SELLCAR4[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 420;
			}
			else if(level >= 401)
			{
			    new money = 6000;
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, nast�pny pojazd mo�esz ukra�� za 12 minut.", money);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	  			DajKase(playerid, money);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 360;
			}
			GameTextForPlayer(playerid, "~y~Sprzedales pojazd", 2500, 1);
			CP[playerid] = 0;
		    DisablePlayerCheckpoint(playerid);
		    SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		}
		else
		{
		    GameTextForPlayer(playerid, "Nie jestes w wozie", 5000, 1);
		}
	}
	else if(CP[playerid] == 5)
	{
	    GameTextForPlayer(playerid, "~y~W punkcie misji", 2500, 1);
		CP[playerid] = 0;
	    DisablePlayerCheckpoint(playerid);
	}
	else if(CP[playerid] == 9)//Karting
	{
		GameTextForPlayer(playerid, "~r~Czekaj tutaj na wiecej gokardow", 4000, 3);
		DisablePlayerCheckpoint(playerid);
	}
	else if(CP[playerid] == 10) { CP[playerid] = 11; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2258.7874,-2402.9712,12.7035,8.0); }
	else if(CP[playerid] == 11) { CP[playerid] = 12; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2225.8755,-2461.3875,12.7190,8.0); }
	else if(CP[playerid] == 12) { CP[playerid] = 13; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2276.9983,-2662.8328,12.8580,8.0); }
	else if(CP[playerid] == 13) { CP[playerid] = 14; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2449.1399,-2663.0562,12.8138,8.0); }
	else if(CP[playerid] == 14) { CP[playerid] = 15; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2566.9814,-2504.5686,12.7692,8.0); }
	else if(CP[playerid] == 15) { CP[playerid] = 16; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2719.0520,-2503.5962,12.7706,8.0); }
	else if(CP[playerid] == 16) { CP[playerid] = 17; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2720.7881,-2405.6589,12.7441,8.0); }
	else if(CP[playerid] == 17) { CP[playerid] = 18; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2571.5195,-2401.1531,12.7528,8.0); }
	else if(CP[playerid] == 18) { CP[playerid] = 19; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2406.6995,-2423.1182,12.6641,8.0); }
	else if(CP[playerid] == 19) { CP[playerid] = 20; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2322.9194,-2341.5715,12.6664,8.0); }
	else if(CP[playerid] == 20)//End of Karting
	{
	    CP[playerid] = 0;
	    DisablePlayerCheckpoint(playerid);
	    GetPlayerName(playerid, name, sizeof(name));
	    if(FirstKartWinner == 999)
	    {
	        FirstKartWinner = playerid;
	        foreach(Player, i)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s uko�czy�e� wy�cig jako pierwszy !",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		            }
				}
			}
	    }
	    else if(SecondKartWinner == 999)
	    {
	        SecondKartWinner = playerid;
	        foreach(Player, i)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s uko�czy�e� wy�cig jako drugi !",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		            }
				}
			}
	    }
	    else if(ThirdKartWinner == 999)
	    {
	        ThirdKartWinner = playerid;
	        foreach(Player, i)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s uko�czy�e� wy�cig jako trzeci.",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		                SendClientMessage(i, COLOR_WHITE, "** Koniec wy�cigu **");
		                CP[i] = 0;
		                DisablePlayerCheckpoint(i);
		            }
				}
	        }
	    }
	}
	else if(MissionCheckpoint[playerid] > 0 && PlayMission[kToggle] == 1)//Missions + Checkpoint on toggle
	{
		    switch(MissionCheckpoint[playerid])
		    {
	        	case 1:
		        {
					format(string, sizeof(string), "%s", PlayMission[kGText1]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText4]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText5]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText6]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP2][0], PlayMission[kCP2][1], PlayMission[kCP2][2], 8);
					MissionCheckpoint[playerid] = 2;
		        }
		        case 2:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText2]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText7]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText8]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText9]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP3][0], PlayMission[kCP3][1], PlayMission[kCP3][2], 8);
					MissionCheckpoint[playerid] = 3;
		        }
		        case 3:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText3]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText10]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText11]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText12]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP4][0], PlayMission[kCP4][1], PlayMission[kCP4][2], 8);
					MissionCheckpoint[playerid] = 4;
		        }
		        case 4:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText4]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText13]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText14]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText15]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP5][0], PlayMission[kCP5][1], PlayMission[kCP5][2], 8);
					MissionCheckpoint[playerid] = 5;
		        }
		        case 5:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText5]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText16]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText17]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText18]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP6][0], PlayMission[kCP6][1], PlayMission[kCP6][2], 8);
					MissionCheckpoint[playerid] = 6;
		        }
		        case 6:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText6]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "..:: Uko�czona Misje: %s | Zap�ata: $%d ::..", PlayMission[kTitle], PlayMission[kReward]);
					SendClientMessage(playerid, COLOR_GREEN, string);
					DisablePlayerCheckpoint(playerid);
		  			DajKase(playerid, PlayMission[kReward]);//moneycheat
					PlayerInfo[playerid][pMissionNr] = PlayerOnMission[playerid];
					MissionCheckpoint[playerid] = 0;
					PlayerOnMission[playerid] = 0;
		        }
		    }
	}
	else if(zawodnik[playerid] == 1)
	{
		if(okregi[playerid] == 5)
		{
		    if(iloscwygranych == 0)
		    {
			    new sendername[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "Wygra� %s - uko�czy� wy�cig zajmuj�c 1 miejsce !!!.", sendername);
				ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
				DisablePlayerCheckpoint(playerid);
		        DisablePlayerCheckpoint(playerid);
		        zawodnik[playerid] = 0;
		        okrazenia[playerid] = 0;
	   			okregi[playerid] = 0;
				iloscwygranych ++;
				SetTimerEx("TablicaWynikow",1000,0,"d",playerid);
			}
			else if(iloscwygranych == 1)
			{
			    new sendername[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s uko�czy� wy�cig zajmuj�c 2 miejsce !!.", sendername);
				ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
				DisablePlayerCheckpoint(playerid);
		        DisablePlayerCheckpoint(playerid);
		        zawodnik[playerid] = 0;
		        okrazenia[playerid] = 0;
	   			okregi[playerid] = 0;
				iloscwygranych ++;
				SetTimerEx("TablicaWynikow",1000,0,"d",playerid);
			}
			else if(iloscwygranych == 2)
			{
			    new sendername[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s uko�czy� wy�cig zajmuj�c 3 miejsce !.", sendername);
				ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
				DisablePlayerCheckpoint(playerid);
		        DisablePlayerCheckpoint(playerid);
		        zawodnik[playerid] = 0;
		        okrazenia[playerid] = 0;
	   			okregi[playerid] = 0;
				iloscwygranych ++;
				SetTimerEx("TablicaWynikow",1000,0,"d",playerid);
			}
			else
			{
			    iloscwygranych ++;
			    new sendername[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s uko�czy� wy�cig zajmuj�c %d miejsce !.", sendername, iloscwygranych);
				ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
				DisablePlayerCheckpoint(playerid);
		        DisablePlayerCheckpoint(playerid);
		        zawodnik[playerid] = 0;
		        okrazenia[playerid] = 0;
	   			okregi[playerid] = 0;
	   			SetTimerEx("TablicaWynikow",1000,0,"d",playerid);
			}
	   	}
  		else if(okrazenia[playerid] == 0)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1057.6370,-994.5727,128.8853, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] ++;
	    }
	    else if(okrazenia[playerid] == 1)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1083.9596,-975.8777,128.8853, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] ++;
	    }
	    else if(okrazenia[playerid] == 2)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1114.9780,-985.8290,128.8878, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] ++;
	    }
	    else if(okrazenia[playerid] == 3)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1115.5585,-987.0826,128.8878, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] ++;
	    }
	    else if(okrazenia[playerid] == 4)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1083.2609,-1006.3092,128.9274, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] = 0;
	        okregi[playerid] ++;
	    }
	}
	else
	{
		switch (gPlayerCheckpointStatus[playerid])
		{
			case CHECKPOINT_HOME:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				GameTextForPlayer(playerid, "~w~Tu jest twoj~n~~y~Dom", 5000, 1);
		    }
		}
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterCheckpoint - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterRaceCheckpoint - begin", GetNick(playerid), playerid);
	#endif
    TJD_CallRaceCheckpoint(playerid);
	if(ScigaSie[playerid] != 666 && IloscCH[playerid] != 0 && Scigamy != 666)
	{
	    if(!IsPlayerInAnyVehicle(playerid))
		{
			#if DEBUG == 1
				printf("%s[%d] OnPlayerEnterRaceCheckpoint - end", GetNick(playerid), playerid);
			#endif
			return 1;
	    }
	    //
	    if(IloscCH[playerid] == (Wyscig[Scigamy][wCheckpointy]-1))
	    {
            PlayerPlaySound(playerid, 1138, 0, 0, 0);
	        IloscCH[playerid] ++;
	        new ch = IloscCH[playerid];
	        if(Wyscig[Scigamy][wTypCH] == 0)
	        {
	       	 	SetPlayerRaceCheckpoint(playerid,1,wCheckpoint[Scigamy][ch][0], wCheckpoint[Scigamy][ch][1], wCheckpoint[Scigamy][ch][2],0,0,0, Wyscig[Scigamy][wRozmiarCH]);
			}
			else
			{
				SetPlayerRaceCheckpoint(playerid,4,wCheckpoint[Scigamy][ch][0], wCheckpoint[Scigamy][ch][1], wCheckpoint[Scigamy][ch][2],0,0,0, Wyscig[Scigamy][wRozmiarCH]);
			}
	    }
	    else if(IloscCH[playerid] == Wyscig[Scigamy][wCheckpointy])
	    {
	        DisablePlayerRaceCheckpoint(playerid);
	        PlayerPlaySound(playerid, 1139, 0, 0, 0);
	        new string[128];
	        //
	        if(Ukonczyl == 1)
	        {
	            SendClientMessage(playerid, COLOR_YELLOW, "|_________ GRATULACJE!!!! _________|");
        		SendClientMessage(playerid, COLOR_LIGHTGREEN, "| Uko�czy�e� wy�cig jako pierwszy! |");
				format(string, sizeof(string), "|   Otrzymujesz %d$ nagrody!   |", Wyscig[Scigamy][wNagroda]); SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
	        	SendClientMessage(playerid, COLOR_LIGHTGREEN, "|__________________________________|");
	        	DajKase(playerid, Wyscig[Scigamy][wNagroda]);
	        	if(Ukonczyl >= IloscZawodnikow)
		        {
		            KoniecWyscigu(-2);
		        }
		        else
		        {
		        	format(string, sizeof(string), "Komunikat wy�cigu: {FFFFFF}%s wygra� wy�cig %s", GetNick(playerid, true), Wyscig[Scigamy][wNazwa]);
		        	foreach(Player, i)
		        	{
		        	    if(ScigaSie[i] == Scigamy && i != playerid)
		        	    {
							SendClientMessage(i, COLOR_YELLOW, "|_________ UWAGA!!!! _________|");
		        			SendClientMessage(i, COLOR_YELLOW, string);
		        		}
				    }
				    Ukonczyl++;
				}
	        }
	        else
	        {
	            if(Ukonczyl >= IloscZawodnikow)
		        {
		            SendClientMessage(playerid, COLOR_LIGHTGREEN, "Uko�czy�e� wy�cig jako ostatni - cienias!");
					format(string, sizeof(string), "Komunikat wy�cigu: {FFFFFF}%s uko�czy� wy�cig jako ostatni !", GetNick(playerid, true));
					WyscigMessage(COLOR_YELLOW, string);
		            KoniecWyscigu(-2);
		        }
		        else
		        {
		            format(string, sizeof(string), "Uko�czy�e� wy�cig jako %d !", Ukonczyl);
					SendClientMessage(playerid, COLOR_LIGHTGREEN, string);
					format(string, sizeof(string), "Komunikat wy�cigu: {FFFFFF}%s uko�czy� wy�cig jako %d !", GetNick(playerid, true), Ukonczyl);
					WyscigMessage(COLOR_YELLOW, string);
	            	Ukonczyl++;
		        }
	        }
	        IloscCH[playerid] = 0;
	    }
	    else
	    {
			PlayerPlaySound(playerid, 1138, 0, 0, 0);
	        IloscCH[playerid] ++;
	        new ch = IloscCH[playerid];
	        SetPlayerRaceCheckpoint(playerid,Wyscig[Scigamy][wTypCH],wCheckpoint[Scigamy][ch][0], wCheckpoint[Scigamy][ch][1], wCheckpoint[Scigamy][ch][2],wCheckpoint[Scigamy][ch+1][0], wCheckpoint[Scigamy][ch+1][1], wCheckpoint[Scigamy][ch+1][2], Wyscig[Scigamy][wRozmiarCH]);
	    }
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterRaceCheckpoint - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
    return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEditObject - begin", GetNick(playerid), playerid);
	#endif


	#if DEBUG == 1
		printf("%s[%d] OnPlayerEditObject - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEditDynamicObject - begin", GetNick(playerid), playerid);
	#endif
    if(IsValidDynamicObject(objectid))
	{
		if(GetPVarInt(playerid, "Allow-edit"))
		{
			MoveDynamicObject(objectid, x, y, z, 10.0, rx, ry, rz);
		}

        if(response < EDIT_RESPONSE_UPDATE && GetPVarInt(playerid, "Barier-id") != 0)
        {
            new str[128];
            new frac = GetPlayerFraction(playerid);
            format(str, 128, "[%d]\n%s\n%s", GetPVarInt(playerid, "Barier-id")-1, FractionNames[frac],GetNick(playerid));

            if(!IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z))
            {
                new Float:X, Float:Y, Float:Z, Float:rox, Float:roy, Float:roz;
                GetDynamicObjectRot(objectid, rox, roy, roz);
                GetDynamicObjectPos(objectid, X, Y, Z);
                SendClientMessage(playerid, -1, "Jeste� za daleko.");
                BarText[frac][GetPVarInt(playerid, "Barier-id")-1] = CreateDynamic3DTextLabel(str, 0x1E90FFFF, X, Y, Z+0.3, 4.0);
                SetDynamicObjectPos(objectid, X, Y, Z);
                SetDynamicObjectRot(objectid, rox, roy, roz);
            }
            else
            {
                BarText[frac][GetPVarInt(playerid, "Barier-id")-1] = CreateDynamic3DTextLabel(str, 0x1E90FFFF, x, y, z+0.3, 4.0);
                GetDynamicObjectPos(objectid, x, y, z);
                GetDynamicObjectRot(objectid, rx, ry, rz);
            }
            SetPVarInt(playerid, "Barier-id", 0);
        }
        else if(response == EDIT_RESPONSE_UPDATE && GetPVarInt(playerid, "Barier-id") != 0)
        {
            new Float:X, Float:Y, Float:Z, Float:rox, Float:roy, Float:roz;
            GetDynamicObjectRot(objectid, rox, roy, roz);
            GetDynamicObjectPos(objectid, X, Y, Z);
            for(new i=0;i<MAX_PLAYERS;i++)
            {
                if(GetPlayerSurfingObjectID(i) == objectid)
                {
                    SendClientMessage(i, 0xFF0000FF, "Zejdz z obiektu!!");
                    GetPlayerPos(i, rox, roy, roz);
                    SetPlayerPosEx(i, rox+0.3,roy+0.3,roz+0.2);
                    SetPlayerVelocity(i, 0.15, 0.12, 0.1);
                }
            }
            if(!IsPlayerInRangeOfPoint(playerid, 5.0, x,y,z))
            {
                SendClientMessage(playerid, 0xFF0000FF, "Podejdz do obiektu!");
                SetDynamicObjectPos(objectid, X, Y, Z);
            }
            else
            {
                new Float:speed = VectorSize(X-x, Y-y, Z-z);
                MoveDynamicObject(objectid, x, y, z, speed, rx, ry, rz);
            }
        }
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEditDynamicObject - end", GetNick(playerid), playerid);
	#endif
}

public OnRconLoginAttempt(ip[], password[], success)
{
	#if DEBUG == 1
		printf("OnRconLoginAttempt - begin");
	#endif
    new player=-1;
    new pip[16];
    for(new i=0; i<MAX_PLAYERS; i++)
    {
        GetPlayerIp(i, pip, sizeof(pip));
        if(strcmp(ip, pip, true)==0)
        {
            player=i;
            break;
        }
    }
    if(!success)
    {
        if(player != -1)
        {
            SendClientMessage(player, COLOR_PANICRED, "Otrzymujesz kicka z powodu nieautoryzowanej pr�by logowania przez RCON!");
            KickEx(player);
        }
    }
    else
    {
        if(player != -1)
        {
			new name[32]; format(name, sizeof(name), "rcon/%s", GetNick(player));
			if(!dini_Exists(name))
			{
				new str[128];
				format(str, 128, "RCON: U�ytkownik %s (%d) pr�bowa� si� zalogowa� na rcona bez wymaganych uprawnie�!", GetNick(player, true), player);
				SendAdminMessage(COLOR_PANICRED, str);
				KickEx(player);
				print(str);
				#if DEBUG == 1
					printf("OnRconLoginAttempt - end");
				#endif
				return 0;
			}
			else
			{
				SendClientMessage(player, COLOR_LIGHTBLUE, "Witaj, Rkornisto");
			}
        }
    }
	#if DEBUG == 1
		printf("OnRconLoginAttempt - end");
	#endif
    return 1;
}

public OnRconCommand(cmd[])
{
    print(cmd);
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
    if(pickupid == PickupSklep01)
    {
        SendClientMessage(playerid,COLOR_LIGHTBLUE,"|_______________Wyb�r skina - dost�pne komendy_______________|");
        SendClientMessage(playerid,COLOR_WHITE,"{3CB371}/ubranie{FFFFFF}- zabija i przenosi do zwyk�ego menu wyboru skin�w (wybiera�ka). Tylko dla cywili.");
        SendClientMessage(playerid,COLOR_WHITE,"{CD5C5C}/wybierzskin{FFFFFF}- pozwala wybra� skin przydzielany po s�u�bie. Tylko dla frakcji z dzia�aj�cym /duty");
        SendClientMessage(playerid,COLOR_WHITE,"{ADFF2F}/uniform{FFFFFF}- pozwala na zmian� uniformu s�u�bowego. Tylko dla cz�onk�w frakcji z pomini�ciem lider�w.");
        SendClientMessage(playerid,COLOR_LIGHTBLUE,"|___________________________________________________________|");
    }
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new string[256];
    //---------------------------------------------- Anti Cheat ------------------------------------//
   /* if(newstate == PLAYER_STATE_DRIVER) {
        if(GetPVarInt(playerid, "iLastDrive") != 0 && (gettime() - GetPVarInt(playerid, "iLastDrive")) <= 1) {
            SetPVarInt(playerid, "iFlags", GetPVarInt(playerid, "iLastDrive")+1);
            if(GetPVarInt(playerid, "iLastDrive") >= 2) {
                format(string, 256, "%s podejrzany o tepanie aut. Dostal kicka. LVL: %d (%dh online)", GetNick(playerid), PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pConnectTime]);
                SendAdminMessage(COLOR_LIGHTRED, string);
                Kick(playerid);
                return true;
            }
        }

        SetPVarInt(playerid, "iLastDrive", gettime());
    } */
	if(gPlayerLogged[playerid] == 0)
	{
		if(newstate == PLAYER_STATE_SPAWNED || newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
		{
			format(string, sizeof(string), "%s zostal skickowany za bycie niezalogowanym (OPST)", GetNick(playerid));
			KickLog(string);
			SendClientMessage(playerid, COLOR_PANICRED, "Zosta�e� zkickowany za spawn jako niezalogowany");
			KickEx(playerid);
			return 1;
		}
	}

	if(newstate == PLAYER_STATE_DRIVER)
    {
        if(newstate == PLAYER_STATE_DRIVER)
        {
        	new vehicleid = GetPlayerVehicleID(playerid);
        	new lcarid = VehicleUID[vehicleid][vUID];
        	if(CarData[lcarid][c_OwnerType] == CAR_OWNER_SPECIAL)
        	{
 				if(CarData[lcarid][c_Owner] == RENT_CAR)
    			{
					if (CarData[lcarid][c_Rang]-1 != playerid)
					{
		    			TogglePlayerControllable(playerid, 0);
						HireCar[playerid] = vehicleid;
						ShowPlayerDialogEx(playerid, 7079, DIALOG_STYLE_MSGBOX, "Wypo�yczalnia pojazd�w", "Mo�esz wypo�yczy� ten pojazd!\nCena: 5000$ za 15 minut.", "Wynajmij", "Wyjd�");
					}
				}
			}
		}
        if(!ToggleSpeedo[playerid])
        {
            //Speedo
            //Licznik 2.5
            new Float:carhp;
            new vehicleid = GetPlayerVehicleID(playerid);
            GetVehicleHealth(vehicleid, carhp);
            new Float:vel[3];
            GetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);
            new Float:vSpeed = VectorSize(vel[0], vel[1], vel[2]) * 166.666666;
            new pZone[MAX_ZONE_NAME];
            GetPlayer2DZone(playerid, pZone, MAX_ZONE_NAME);//Dzielnica
            format(string, 128,"Speed: %dkm/h~n~Paliwo: %d~n~Stan: %d%~n~GPS: %s~n~%s" ,floatround(vSpeed), floatround(Gas[vehicleid]), floatround(carhp/10), pZone, VehicleNames[GetVehicleModel(vehicleid)-400]);
            PlayerTextDrawSetString(playerid, Licznik[playerid], string);
            PlayerTextDrawShow(playerid, Licznik[playerid]);
        }
        //

        //ACv2: Kicking players that are trying to drive the car without permission
        if(newstate == PLAYER_STATE_DRIVER)
        {
            new vehicleid = GetPlayerVehicleID(playerid);
            if(!Player::CanUseCar(playerid, vehicleid) && PlayerCuffed[playerid] < 1 && PlayerInfo[playerid][pAdmin] < 1)
            {
                // Skurwysyn kieruje bez prawka lub autem frakcji xD

                MruDialog(playerid, "ACv2: Kod #2001", "Zosta�e� wyrzucony za kierowanie samochodem bez wymaganych uprawnie�");
                format(string, sizeof string, "ACv2 [#2001]: %s zosta� wyrzucony za jazd� bez uprawnie� [Veh: %d]", GetNick(playerid, true), GetPlayerVehicleID(playerid));
                SendCommandLogMessage(string);

                SetPlayerVirtualWorld(playerid, playerid+AC_WORLD);

                KickEx(playerid);
            }
        }
        //AT400
        if(Car_GetOwnerType(GetPlayerVehicleID(playerid)) == CAR_OWNER_FRACTION && GetVehicleModel(GetPlayerVehicleID(playerid)) == 577 && !IsPlayerInFraction(playerid, FRAC_KT, 5000))
        {
            new Float:slx, Float:sly, Float:slz;
    		GetPlayerPos(playerid, slx, sly, slz);
    		SetPlayerPosEx(playerid, slx, sly, slz+0.2);
    		ClearAnimations(playerid);
        }

        TJD_CallEnterVeh(playerid, GetPlayerVehicleID(playerid));
    }
    else if(oldstate == PLAYER_STATE_DRIVER)
    {
        DisableCarBlinking(GetPVarInt(playerid, "blink-car"));
        new vehicleid = GetPVarInt(playerid, "car-id");
        if(VehicleUID[vehicleid][vSiren] != 0)
    	{
    	    new sendername[MAX_PLAYER_NAME], komunikat[128];
    	    DestroyDynamicObject(VehicleUID[vehicleid][vSiren]);
     		VehicleUID[vehicleid][vSiren] = 0;
      		GetPlayerName(playerid, sendername, sizeof(sendername));
    		format(komunikat, sizeof(komunikat), "* %s zdejmuje kogut z dachu i chowa.", sendername);
    		ProxDetector(30.0, playerid, komunikat, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    	}
        if(TransportDuty[playerid] > 0) //Taxi duty
		{
            Taxi_FareEnd(playerid);
		}
        TJD_CallExitVeh(playerid);

        if(NieSpamujKradnij[playerid] == 1 || HireCar[playerid] != 0)
        {
            TogglePlayerControllable(playerid, 1);
        }
        //Speedo
        PlayerTextDrawHide(playerid, Licznik[playerid]);
        //

        #if BLINK_DISABLE_ON_EXIT_VEHICLE == 0
        #else
        if(BlinkSide[GetPVarInt(playerid, "blink-car")] != 2) DisableCarBlinking(GetPVarInt(playerid, "blink-car"));
        #endif
    }
    if(oldstate == PLAYER_STATE_PASSENGER)
    {
		if(TransportDist[playerid] > 0.0 && TransportDriver[playerid] < 999) //Taxi client pay
		{
            Taxi_Pay(playerid);
		}
    }
	if(newstate == PLAYER_STATE_ONFOOT)
	{
	    if(PlayerKarting[playerid] > 0 && PlayerInKart[playerid] > 0)
		{
		    PlayerInKart[playerid] = 0;
		    KartingPlayers --;
		}
	}
	if(newstate == PLAYER_STATE_PASSENGER) // TAXI & BUSSES
	{
	    if(GetPlayerWeapon(playerid) == 24 || GetPlayerWeapon(playerid) == 27 || GetPlayerWeapon(playerid) == 23)
	    {
	        SetPlayerArmedWeapon(playerid,0);
	    }
	    if(GetPVarInt(playerid, "sanlisten") == 1)
        {
            if(RadioSANUno[0] != EOF)
 				PlayAudioStreamForPlayer(playerid, RadioSANUno);
        }
        else if(GetPVarInt(playerid, "sanlisten") == 2)
        {
            if(RadioSANDos[0] != EOF)
				PlayAudioStreamForPlayer(playerid, RadioSANDos);
        }
	    new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    new vehicleid = GetPlayerVehicleID(playerid);
	    foreach(Player, i)
	    {
			if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == 2 && TransportDuty[i] > 0)
			{
				if(kaska[playerid] < TransportValue[i])
				{
					format(string, sizeof(string), "* Potrzebujesz $%d aby wej��.", TransportValue[i]);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					RemovePlayerFromVehicleEx(playerid);
				}
				else
				{
					if(TransportDuty[i] == 1)
					{
						format(string, sizeof(string), "* Stawka wynosi $%d za kilometr.", TransportValue[i]);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Klient %s wszed� do Twojej taryfy.", name);
						SendClientMessage(i, COLOR_LIGHTBLUE, string);
                        if(PlayerInfo[playerid][pLevel] < 3)
                        {
                            ZabierzKase(playerid, floatround(TransportValue[i]/2));//moneycheat
                            sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Jeste� nowym graczem, obowi�zuje Cie rabat 50 procent na taks�wk�.");
                        }
                        else
                        {
                            ZabierzKase(playerid, floatround(TransportValue[i]));//moneycheat
                        }
                        TransportMoney[i] += TransportValue[i];
                        SetPVarInt(playerid, "taxi-slot", GetPlayerVehicleSeat(playerid)-1);
						TransportDist[i] = 0.0;
						TransportDist[playerid] = 0.0;
						TransportDriver[playerid] = i;
                        TransportClient[i][GetPVarInt(playerid, "taxi-slot")] = playerid;
                        Taxi_ShowHUD(playerid);
                        Taxi_ShowHUD(i);
					}
					else if(TransportDuty[i] == 2)
					{
						format(string, sizeof(string), "* Zap�aci�e� $%d Za bilet.", TransportValue[i]);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Klient %s wszed� do autobusu i skasowa� bilet.", name);
						SendClientMessage(i, COLOR_LIGHTBLUE, string);
                        ZabierzKase(playerid, TransportValue[i]);//moneycheat
					    TransportMoney[i] += TransportValue[i];
					}
				}
			}
	    }
	}
	if(newstate == PLAYER_STATE_WASTED)
	{
		if(PoziomPoszukiwania[playerid] >= 1)
		{
		    new price = PoziomPoszukiwania[playerid] * 500;
		    new price2 = PoziomPoszukiwania[playerid] * 1000;
			new count;
			foreach(Player, i)
			{
				if(IsPlayerConnected(i))
				{
				    if(IsACop(playerid) && OnDuty[playerid] == 1)
				    {
				        PoziomPoszukiwania[playerid] = 0;
				        return 1;
				    }
				    if(IsACop(i) && OnDuty[i] == 1 && CrimInRange(15.0, playerid,i))
				    {
				        if(PoziomPoszukiwania[playerid] >= 6)
				        {
                            if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
                            {
                                count = 2;
                            }
						}
						else if(PoziomPoszukiwania[playerid] >= 2)
						{
							if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
                            {
                                count = 1;
                            }
						}
						if(PoziomPoszukiwania[playerid] >= 2)
						{
							format(string, sizeof(string), "~w~Niebezpieczny przestepca~r~Zabity~n~Nagroda~g~$%d", price);
							SendClientMessage(i, COLOR_LIGHTBLUE, "Je�li chcesz wi�cej zarobi� za z�apanego bandziora musisz go doprowadzi� �ywego do celi.");
							GameTextForPlayer(i, string, 5000, 1);
							DajKase(i, price);//moneycheat
							PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
						}
					}
					else if(PlayerInfo[i][pJob] == 1 && CrimInRange(10.0, playerid,i))
					{
					    if(PlayerInfo[i][pDetSkill] <= 50)
					    {
					        if(PoziomPoszukiwania[playerid] == 2 || PoziomPoszukiwania[playerid] == 10)
					        {
					            if(lowcaz[i] == playerid)
					            {
						        	count = 11;
						        	lowcaz[i] = 501;
						        	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
									GameTextForPlayer(i, string, 5000, 1);
									PoziomPoszukiwania[i] = 0;
									ClearCrime(i);
									DajKase(i, price2);//moneycheat
									PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
									PlayerInfo[i][pDetSkill] ++;
									PlayerInfo[i][pDetSkill] ++;
				 				    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			 				    }
					        }
					    }
					    else if(PlayerInfo[i][pDetSkill] >= 51 && PlayerInfo[i][pDetSkill] < 100)
					    {
					        if(PoziomPoszukiwania[playerid] >= 2 || PoziomPoszukiwania[playerid] <= 3 || PoziomPoszukiwania[playerid] == 10)
					        {
					            if(lowcaz[i] == playerid)
					            {
						        	count = 22;
                                    lowcaz[i] = 501;
						        	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
									GameTextForPlayer(i, string, 5000, 1);
									PoziomPoszukiwania[i] = 0;
									ClearCrime(i);
									DajKase(i, price2);//moneycheat
									PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
									PlayerInfo[i][pDetSkill] ++;
									PlayerInfo[i][pDetSkill] ++;
				 				    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			 				    }
					        }
					    }
					    else if(PlayerInfo[i][pDetSkill] >= 101 && PlayerInfo[i][pDetSkill] < 200)
					    {
					        if(PoziomPoszukiwania[playerid] >= 2 || PoziomPoszukiwania[playerid] <= 4 || PoziomPoszukiwania[playerid] == 10)
					        {
					            if(lowcaz[i] == playerid)
					            {
						        	count = 33;
                                    lowcaz[i] = 501;
						        	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
									GameTextForPlayer(i, string, 5000, 1);
									PoziomPoszukiwania[i] = 0;
									ClearCrime(i);
									DajKase(i, price2);//moneycheat
									PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
									PlayerInfo[i][pDetSkill] ++;
									PlayerInfo[i][pDetSkill] ++;
				 				    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			 				    }
					        }
					    }
					    else if(PlayerInfo[i][pDetSkill] >= 201 && PlayerInfo[i][pDetSkill] < 400)
					    {
					        if(PoziomPoszukiwania[playerid] >= 2 || PoziomPoszukiwania[playerid] <= 5 || PoziomPoszukiwania[playerid] == 10)
					        {
					            if(lowcaz[i] == playerid)
					            {
						        	count = 44;
                                    lowcaz[i] = 501;
						        	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
									GameTextForPlayer(i, string, 5000, 1);
									PoziomPoszukiwania[i] = 0;
									ClearCrime(i);
									DajKase(i, price2);//moneycheat
									PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
									PlayerInfo[i][pDetSkill] ++;
									PlayerInfo[i][pDetSkill] ++;
				 				    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
				 				}
					        }
					    }
					    else if(PlayerInfo[i][pDetSkill] >= 400)
					    {
					        if(PoziomPoszukiwania[playerid] >= 2 || PoziomPoszukiwania[playerid] <= 7 || PoziomPoszukiwania[playerid] == 10)
					        {
					            if(lowcaz[i] == playerid)
					            {
						        	count = 55;
                                    lowcaz[i] = 501;
						        	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
									GameTextForPlayer(i, string, 5000, 1);
									PoziomPoszukiwania[i] = 0;
									ClearCrime(i);
									DajKase(i, price2);//moneycheat
									PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
									PlayerInfo[i][pDetSkill] ++;
									PlayerInfo[i][pDetSkill] ++;
				 				    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			 				    }
					        }
					    }
					}
				}
			}
			if(poscig[playerid] == 1)
			{
			    if(PoziomPoszukiwania[playerid] >= 6)
			    {
			        count = 2;
			    }
			    else
			    {
			        count = 1;
			    }
			}
			if(count == 1 || count == 11 || count == 22 || count == 33 || count == 44 || count == 55)
			{
			    if(!(IsACop(playerid) && OnDuty[playerid] == 1))
			    {
			        new CenaZabicia = (4000)*(PoziomPoszukiwania[playerid]);
					ZabierzKase(playerid, CenaZabicia);//moneycheat
					PlayerInfo[playerid][pWantedDeaths] += 1;
					PlayerInfo[playerid][pJailed] = 1;
				    PlayerInfo[playerid][pJailTime] = (PoziomPoszukiwania[playerid])*(400);
				    format(string, sizeof(string), "* Jeste� w wi�zieniu na %d Sekund i straci�e� $%d gdy� ucieka�e� lub strzela�e� do funkcjonariusza policji.", PlayerInfo[playerid][pJailTime], CenaZabicia);
				    SendClientMessage(playerid, COLOR_LIGHTRED, string);
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Je�eli nie chcesz aby taka sytuacja powt�rzy�a si� w przysz�o�ci, skorzystaj z us�ug prawnika kt�ry zbije tw�j WL.");
					PoziomPoszukiwania[playerid] = 0;
                    poscig[playerid] = 0;
					WantLawyer[playerid] = 1;
					UsunBron(playerid);
				}
			}
			else if(count == 2)
			{
			    if(!(IsACop(playerid) && OnDuty[playerid] == 1))
			    {
     				new CenaZabicia = (4000)*(PoziomPoszukiwania[playerid]);
					ZabierzKase(playerid, CenaZabicia);//moneycheat
					PlayerInfo[playerid][pWantedDeaths] += 1;
					PlayerInfo[playerid][pJailed] = 2;
				    PlayerInfo[playerid][pJailTime] = (PoziomPoszukiwania[playerid])*(400);
				    format(string, sizeof(string), "* Jeste� w DeMorgan na %d Sekund i straci�e� $%d gdy� ucieka�e� lub strzela�e� do funkcjonariusza policji", PlayerInfo[playerid][pJailTime], CenaZabicia);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "Je�eli nie chcesz aby taka sytuacja powt�rzy�a si� w przysz�o�ci, skorzystaj z us�ug prawnika kt�ry zbije tw�j WL.");
					PoziomPoszukiwania[playerid] = 0;
                    poscig[playerid] = 0;
					UsunBron(playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER) //buggy dont finnish
	{// 38 / 49 / 56 = SS
		new newcar = GetPlayerVehicleID(playerid);
        //NOWY SYSTEM AUT FRAKCYJNYCH I PUBLICZNYCH
        if(newcar <= CAR_End) //do kradziezy
        {
            if(KradniecieWozu[playerid] != newcar)
		    {
				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Mo�esz ukra�� ten w�z, wpisz /kradnij spr�bowa� to zrobi� lub /wyjdz aby wyj��.");
                if(PlayerInfo[playerid][pCarLic] == 1) TogglePlayerControllable(playerid, 0);
                KradniecieWozu[playerid] = 1;
			}
        }
		gLastCar[playerid] = newcar;
	}
	if(newstate == PLAYER_STATE_SPAWNED)
	{
		if(PlayerInfo[playerid][pDonateRank] > 0) { SetPlayerHealth(playerid, 100.0); }
		else { SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]); }
		MedicBill[playerid] = 1;
		gPlayerSpawned[playerid] = 1;
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerStateChange - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerExitVehicle - begin", GetNick(playerid), playerid);
	#endif
    if(vehicleid > MAX_VEHICLES || vehicleid < 0)
	{
		#if DEBUG == 1
			printf("%s[%d] OnPlayerExitVehicle - end", GetNick(playerid), playerid);
		#endif
		SendClientMessage(playerid, 0xA9C4E4FF, "Warning: Exceed vehicle limit");
		return 1;
	}
    new validseat = GetVehicleMaxPassengers(GetVehicleModel(vehicleid));
    if(validseat == 0xF)
    {
        SendClientMessage(playerid, 0xA9C4E4FF, "Warning: Invalid seat");
		#if DEBUG == 1
			printf("%s[%d] OnPlayerExitVehicle - end", GetNick(playerid), playerid);
		#endif
        return 0;
    }

    //AT400
    if(Car_GetOwnerType(vehicleid) == CAR_OWNER_FRACTION && GetVehicleModel(vehicleid) == 577 && IsPlayerInFraction(playerid, FRAC_KT, 5000))
    {
        GameTextForPlayer(playerid, "Wracaj szybko!", 5000, 5);
        SetPlayerPosEx(playerid, 0.1389+KTAir_Offsets[0],33.2975+KTAir_Offsets[1],0.5391+100+KTAir_Offsets[2]);
        SetPlayerVirtualWorld(playerid, 2);
        Wchodzenie(playerid);
        SetCameraBehindPlayer(playerid);
    }

    if(GetPVarInt(playerid, "sanlisten") != 0)
    {
        StopAudioStreamForPlayer(playerid);
    }
	if (GetPlayerState(playerid) == 1)
	{
		#if DEBUG == 1
			printf("%s[%d] OnPlayerExitVehicle - end", GetNick(playerid), playerid);
		#endif
		return 1;
	}
	if(gGas[playerid] == 1)
	{
	    GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~Opuscil pojazd", 500, 3);
	}
	if(naprawiony[playerid] == 1)
	{
	    naprawiony[playerid] = 0;
	}
	if(IDWymienianegoAuta[playerid] != 0)
	{
	    IDWymienianegoAuta[playerid] = 0;
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerExitVehicle - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    //Zwr�cenie 0 uniemo�liwi spawn.
	if(gPlayerLogged[playerid] != 1)
	{

	}
	else
	{

	}
    return 0;
}

public OnPlayerRequestClass(playerid, classid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerRequestClass - begin", GetNick(playerid), playerid);
		SendClientMessage(playerid, -1, "OnPlayerRequestClass");
	#endif

	if(PlayerInfo[playerid][pModel] == 0)
		PlayerInfo[playerid][pModel] = 252;

	SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 0.0, -1, -1, -1, -1, -1, -1);

	if(gPlayerLogged[playerid] != 1)
	{
		TogglePlayerSpectating(playerid, true);
		SetTimerEx("OPCLogin", 100, 0, "i", playerid);

		//Dla graczy kt�rzy nie maj� najnowszej wersji samp'a
		PlayerPlaySound(playerid, 1187, 0.0, 0.0, 0.0);

		new rand = random(5);
		switch(rand)
		{
			case 0:
			{
				PlayerPlaySound(playerid, 171, 0.0, 0.0, 0.0);
			}
			case 1:
			{
				PlayerPlaySound(playerid, 176, 0.0, 0.0, 0.0);
			}
			case 2:
			{
				PlayerPlaySound(playerid, 1076, 0.0, 0.0, 0.0);
			}
			case 3:
			{
				PlayerPlaySound(playerid, 1187, 0.0, 0.0, 0.0);
			}
			case 4:
			{
				new rand2 = random(8);
				switch(rand2)
				{
					case 0:
					{
						PlayerPlaySound(playerid, 157, 0.0, 0.0, 0.0);
					}
					case 1:
					{
						PlayerPlaySound(playerid, 162, 0.0, 0.0, 0.0);
					}
					case 2:
					{
						PlayerPlaySound(playerid, 169, 0.0, 0.0, 0.0);
					}
					case 3:
					{
						PlayerPlaySound(playerid, 178, 0.0, 0.0, 0.0);
					}
					case 4:
					{
						PlayerPlaySound(playerid, 180, 0.0, 0.0, 0.0);
					}
					case 5:
					{
						PlayerPlaySound(playerid, 181, 0.0, 0.0, 0.0);
					}
					case 6:
					{
						PlayerPlaySound(playerid, 147, 0.0, 0.0, 0.0);
					}
					case 7:
					{
						PlayerPlaySound(playerid, 140, 0.0, 0.0, 0.0);
					}
				}
			}
		}
	}
	else
	{
		TogglePlayerSpectating(playerid, true);
		TogglePlayerSpectating(playerid, false);
	}

	#if DEBUG == 1
		printf("%s[%d] OnPlayerRequestClass - end", GetNick(playerid), playerid);
	#endif
	return 0;
}

public OnGameModeInit()
{
	#if DEBUG == 1
		printf("OnGameModeInit - begin");
	#endif
	AntiDeAMX(); // Can't touch this
	WasteDeAMXersTime(); //Hammer Time
	#if defined REGEX_ON
	regex_syntax(SYNTAX_PERL); //regex
	regexURL = regex_exbuild("^(http(?:s)?\\:\\/\\/[a-zA-Z0-9]+(?:(?:\\.|\\-)[a-zA-Z0-9]+)+(?:\\:\\d+)?(?:\\/[\\w\\-]+)*(?:\\/?|\\/\\w+\\.[a-zA-Z]{2,4}(?:\\?[\\w]+\\=[\\w\\-]+)?)?(?:\\&[\\w]+\\=[\\w\\-]+)*)$");
	#endif

	#if DEBUG == 1
	if(dini_Exists("production.info"))
	{
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		print("Wersja debug na produkcji!! Wylaczam serwer.");
		SendRconCommand("exit");
		return 0;
	}
	#endif
	SSCANF_Option(OLD_DEFAULT_NAME, 1);
    Streamer_SetVisibleItems(0, 900);
    Streamer_SetTickRate(50);

    FabrykaMats::LoadLogic();
    NowaWybieralka::Init();

    //Streamer_SetTickRate(40);

    PaniJanina = CreateActor(88, 570.63, -2031.03, 16.2, 180.0);//basen
	SetActorVirtualWorld(PaniJanina, 30);
	//AFK timer
	for(new i; i<MAX_PLAYERS; i++)
	{
		afk_timer[i] = -1;
	}
	//Wybory:
	if(dini_Exists("wybory.ini"))
	{
		for(new i; i<2; i++)
		{
			new string[12];
			format(string,sizeof(string), "kandydat%d", i);
			wybory[i] = dini_Int("wybory.ini", string);
		}
	}
	else
	{
		dini_Create("wybory.ini");
		for(new i; i<2; i++)
		{
			new string[12];
			format(string,sizeof(string), "kandydat%d", i);
			wybory[i] = dini_IntSet("wybory.ini", string, 0);
		}
	}
    //Ustawienia BW
    if(dini_Exists("Settings.ini"))
    {
        new ust = dini_Int("Settings.ini", "OnlyGangZones");
        SetSVarInt("BW_OnlyGangZones", ust);
        ust = dini_Int("Settings.ini", "Time");
        SetSVarInt("BW_Time", ust);
        //dini_Get("Settings.ini", "muzyka_bonehead");
        SetSVarString("muzyka_bonehead", dini_Get("Settings.ini", "muzyka_bonehead"));
    }
    else
    {
        dini_Create("Settings.ini");
        dini_IntSet("Settings.ini", "OnlyGangZones", 0);
        dini_IntSet("Settings.ini", "Time", 180);
        //dini_S("Settings.ini", "muzyka_bonehead");
        dini_Set("Settings.ini", "muzyka_bonehead", "http://cp.eu4.fastcast4u.com:2199/tunein/nikoud00.pls");
        SetSVarInt("BW_OnlyGangZones", 0);
        SetSVarInt("BW_Time", 180);
    }

    systempozarow_init();//System Po�ar�w v0.1
	//Mrucznik:
	Ac_OnGameModeInit();//Antyczit
	MruMySQL_Connect();//mysql

    //22.06
    LoadConfig();
    WczytajRangi();
    WczytajSkiny();
    //Konfiguracja ID skryptu dla rodzin  - daj -1 w bazie aby wy��czy� korzystanie ze skryptu dla slotu
    Config_FamilyScript();
    //
    BARIERKA_Init(); //Przed limitem obiekt�w

    Stworz_Obiekty();//obiekty
	obiekty_OnGameModeInit();//nowe obiekty

    ZaladujDomy();//System Dom�w
    ZaladujBiznesy();
    orgLoad();
    Zone_Load();

    ZaladujTrasy();//System wy�cig�w
	ZaladujPickupy();
	ZaladujSamochody(); //Auta do kradziezy
	Zaladuj3DTexty();
	ZaladujIkony();

	//GF:
	LoadBoxer();
	LoadStuff();
	LoadIRC();
	LadujInteriory();

    //Sejfy mysql
    Sejf_Load();

    //Ibiza
    IBIZA_Reszta();

    //Patrol Data
    Patrol_Init();
    LoadServerInfo(); //Informacja dla graczy np. o wylaczeniu czegos
    LoadDisallowedCommands();

	SetGameModeText("Mrucznik-RP "VERSION);

    //13.06
    LoadTXD();
    //30.10
    TJD_Load();
    Car_Load(); //Wszystkie pojazdy MySQL

    //noYsi
    LoadPrzewinienia();

    new string[MAX_PLAYER_NAME];
    new string1[MAX_PLAYER_NAME];
	for(new c=0;c<CAR_AMOUNT;c++)
	{
		Gas[c] = GasMax;
        SetVehicleParamsEx(c, 0, 0, 0, 0, 0, 0, 0);
	}
	IRCInfo[0][iPlayers] = 0; IRCInfo[1][iPlayers] = 0; IRCInfo[2][iPlayers] = 0;
	IRCInfo[3][iPlayers] = 0; IRCInfo[4][iPlayers] = 0; IRCInfo[5][iPlayers] = 0;
	IRCInfo[6][iPlayers] = 0; IRCInfo[7][iPlayers] = 0; IRCInfo[8][iPlayers] = 0;
	IRCInfo[9][iPlayers] = 0;
	News[hTaken1] = 0; News[hTaken2] = 0; News[hTaken3] = 0; News[hTaken4] = 0; News[hTaken5] = 0;
	format(string, sizeof(string), "Nothing");
	strmid(News[hAdd1], string, 0, strlen(string), 255);
	strmid(News[hAdd2], string, 0, strlen(string), 255);
	strmid(News[hAdd3], string, 0, strlen(string), 255);
	strmid(News[hAdd4], string, 0, strlen(string), 255);
	strmid(News[hAdd5], string, 0, strlen(string), 255);
	format(string1, sizeof(string1), "Nie Ma");
	strmid(News[hContact1], string1, 0, strlen(string1), 255);
	strmid(News[hContact2], string1, 0, strlen(string1), 255);
	strmid(News[hContact3], string1, 0, strlen(string1), 255);
	strmid(News[hContact4], string1, 0, strlen(string1), 255);
	strmid(News[hContact5], string1, 0, strlen(string1), 255);
	PlayerHaul[78][pCapasity] = 100;
	PlayerHaul[79][pCapasity] = 100;
	PlayerHaul[80][pCapasity] = 50;
	PlayerHaul[81][pCapasity] = 50;
	PlayerHaul[128][pCapasity] = 300;
	PlayerHaul[129][pCapasity] = 300;
	PlayerHaul[130][pCapasity] = 300;

	format(motd, sizeof(motd), "Witaj na serwerze Mrucznik Role Play.");
	gettime(ghour, gminute, gsecond);
    GLOB_LastHour=ghour;
	FixHour(ghour);
	ghour = shifthour;
	if(!realtime)
	{
		SetWorldTime(wtime);
		ServerTime = wtime;
	}
    SetWeatherEx(3);
	AllowInteriorWeapons(1);
	ShowPlayerMarkers(0);
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	ManualVehicleEngineAndLights();
	// CreatedCars check
	for(new i = 0; i < sizeof(CreatedCars); i++)
	{
	    CreatedCars[i] = 0;
	}

	// Skiny graczy (wybieralka)
	for(new i = 0; i <= sizeof(Peds)-1; i++)
	{
		AddPlayerClass(Peds[i][0],1958.3783,1343.1572,1100.3746,269.1425,-1,-1,-1,-1,-1,-1);
	}

	if (realtime)
	{
		new tmphour, tmpminute, tmpsecond;
		gettime(tmphour, tmpminute, tmpsecond);
		SetWorldTime(tmphour);
		ServerTime = tmphour;
	}
	//timery
	SetTimer("AktywujPozar", 10800000, true);//System Po�ar�w v0.1
    SetTimer("MainTimer", 1000, true);
    SetTimer("RPGTimer", 100, true);

    for(new i=0;i<MAX_VEHICLES;i++)
    {
        Blink[i][0] = -1;
        Blink[i][1] = -1;
        Blink[i][2] = -1;
        Blink[i][3] = -1;
    }
    SetTimer("B_TrailerCheck", 1000, 1);

    for(new v = 0; v < CAR_End+1; v++)
	{
		VehicleUID[v][vDist] = 500.000;
		VehicleUID[v][vUID] = 0;
		SetVehicleNumberPlate(v, "{1F9F06}M-RP");
	}


    //LEGAL
    /*
    CREATE TABLE mru_legal (
        pID integer,
        weapon1 integer not null,
        weapon2 integer not null,
        weapon3 integer not null,
        weapon4 integer not null,
        weapon5 integer not null,
        weapon6 integer not null,
        weapon7 integer not null,
        weapon8 integer not null,
        weapon9 integer not null,
        weapon10 integer not null,
        weapon11 integer not null,
        weapon12 integer not null,
        weapon13 integer not null,
        unique (pID)
    );
    */

    if((db_handle = db_open("mru.db")) == DB:0)
    {
        // Error
        print("Failed to open a connection to \"mru.db\".");
        print("Wylaczam serwer.... Powod: brak mru.db");
        SendRconCommand("exit");
    }
    else
    {
        // Success
        print("Successfully created a connection to \"mru.db\".");
    }

    db_free_result(db_query(db_handle, "CREATE TABLE IF NOT EXISTS mru_legal (pID integer,weapon1 integer not null,weapon2 integer not null,weapon3 integer not null,weapon4 integer not null,weapon5 integer not null,weapon6 integer not null,weapon7 integer not null,weapon8 integer not null,weapon9 integer not null,weapon10 integer not null,weapon11 integer not null,weapon12 integer not null,weapon13 integer not null,unique (pID));"));

    db_free_result(db_query(db_handle, "CREATE TABLE IF NOT EXISTS mru_opisy(uid INTEGER PRIMARY KEY AUTOINCREMENT, text VARCHAR, owner INT, last_used INT);"));

    db_free_result(db_query(db_handle, "CREATE TABLE IF NOT EXISTS mru_kevlar(pID integer, offsetX FLOAT, offsetY FLOAT, offsetZ FLOAT, rotX FLOAT, rotY FLOAT, rotZ FLOAT, scaleX FLOAT, scaleY FLOAT, scaleZ FLOAT);"));

    for(new i;i<MAX_PLAYERS;i++)
    {
        PlayerInfo[i][pDescLabel] = Create3DTextLabel("", 0xBBACCFFF, 0.0, 0.0, 0.0, 4.0, 0, 1);
    }

    pusteZgloszenia();
    print("GameMode init - done!");
    //SendRconCommand("reloadfs MRP/mrpshop");
    //SendRconCommand("reloadfs MRP/mrpattach");
	#if DEBUG == 1
		printf("OnGameModeInit - end");
	#endif
	return 1;
}

public OnGameModeExit()
{
	#if DEBUG == 1
		printf("OnGameModeExit - begin");
	#endif
	//AFK timer
	for(new i; i<MAX_PLAYERS; i++)
	{
		if(afk_timer[i] != -1)
			KillTimer(afk_timer[i]);
	}
    for(new i=0;i<MAX_ORG;i++)
    {
        orgSave(i, ORG_SAVE_TYPE_BASIC);
        orgSave(i, ORG_SAVE_TYPE_DESC);
    }
    for(new i=0;i<MAX_FRAC;i++)
    {
        Sejf_Save(i);
        if(RANG_ApplyChanges[0][i]) EDIT_SaveRangs(0, i);
    }
    for(new i=0;i<MAX_ORG;i++)
    {
        SejfR_Save(i);
        if(RANG_ApplyChanges[1][i]) EDIT_SaveRangs(1, i);
    }
    UnloadTXD();
    Patrol_Unload();
    TJD_Exit();
    for(new i=Zone_Points[0];i<=Zone_Points[1];i++)
    {
        GangZoneDestroy(i);
    }
    for(new i=0;i<MAX_VEHICLES;i++) DisableCarBlinking(i);
	for(new i = 0; i < MAX_PLAYERS; i++)
    {
        PlayerTextDrawDestroy(i, gCurrentPageTextDrawId[i]);
        PlayerTextDrawDestroy(i, gHeaderTextDrawId[i]);
        PlayerTextDrawDestroy(i, gBackgroundTextDrawId[i]);
        PlayerTextDrawDestroy(i, gNextButtonTextDrawId[i]);
        PlayerTextDrawDestroy(i, gPrevButtonTextDrawId[i]);

        INT_AirTowerLS_Exit(i, true, true);
    }
    foreach(Player, i)
    {
        if(noclipdata[i][cameramode] == CAMERA_MODE_FLY) CancelFlyMode(i);
        MruMySQL_SaveAccount(i, true, true);
    }

	DOF2_Exit();

    GLOBAL_EXIT = true;
    print("Serwer zostaje wy��czony.");
	#if DEBUG == 1
		printf("OnGameModeExit - end");
	#endif
	return 1;
}

PayDay()
{
	new string[128], account,interest,playername2[MAX_PLAYER_NAME],
        tmpintrate, checks, ebill;

	foreach(Player, i)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pLevel] > 0)
		    {
			    if(MoneyMessage[i]==1)
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "Nie sp�aci�e� d�ugu, wierzyciele nas�ali na ciebie Policj� !");
					PoziomPoszukiwania[i] += 2;
					SetPlayerCriminal(i,INVALID_PLAYER_ID, "Niesp�acanie d�ugu");
				}
				GetPlayerName(i, playername2, sizeof(playername2));
				account = PlayerInfo[i][pAccount];

				if (PlayerInfo[i][pDom] != 0)
				{
				    if(PlayerInfo[i][pDonateRank] > 0) { tmpintrate = intrate+4; }
					else { tmpintrate = intrate+2; }//HouseInfo[key][hLevel]
				}
				else
				{
				    if(PlayerInfo[i][pDonateRank] > 0) { tmpintrate = 3; }
					else { tmpintrate = 1; }
				}
				if(PlayerInfo[i][pPayDay] >= 5)
				{
				    if(PlayerInfo[i][pAdmin] >= 1)
				    {
				        format(string, sizeof(string), "Admini/%s.ini", playername2);
				        dini_IntSet(string, "Godziny_Online", dini_Int(string, "Godziny_Online")+1 );
				    }
				    else if (PlayerInfo[i][pZG] >= 1)
				    {
				        format(string, sizeof(string), "Zaufani/%s.ini", playername2);
				        dini_IntSet(string, "Godziny_Online", dini_Int(string, "Godziny_Online")+1 );
				    }
				    Tax += TaxValue;//Should work for every player online
				    PlayerInfo[i][pAccount] -= TaxValue;
					checks = PlayerInfo[i][pPayCheck];
				    ebill = (PlayerInfo[i][pAccount]/10000)*(PlayerInfo[i][pLevel]);
				    DajKase(i, checks);
				    if(PlayerInfo[i][pAccount] > 0)
				    {
				    	PlayerInfo[i][pAccount] -= ebill;
					}
					else
					{
					    ebill = 0;
					}
					interest = (PlayerInfo[i][pAccount]/1000)*(tmpintrate);
					PlayerInfo[i][pExp]++;
					PlayerPlayMusic(i);
					if(PlayerInfo[i][pAccount] <= 100000000)
					{
						PlayerInfo[i][pAccount] = account+interest;
					}
					SendClientMessage(i, COLOR_WHITE, "|___ STAN KONTA ___|");
					format(string, sizeof(string), "  Wyp�ata: $%d   Podatek: -$%d", checks, TaxValue);
					SendClientMessage(i, COLOR_GRAD1, string);
					if(PlayerInfo[i][pDom] != 0 || PlayerInfo[i][pPbiskey] != 255)
					{
					    format(string, sizeof(string), "  Rachunek za pr�d: -$%d", ebill);
						SendClientMessage(i, COLOR_GRAD1, string);
					}
					format(string, sizeof(string), "  Stan konta: $%d", account);
					SendClientMessage(i, COLOR_GRAD1, string);
					if(PlayerInfo[i][pAccount] <= 100000000)
					{
						format(string, sizeof(string), "  Odestki: 0.%d procent",tmpintrate);
						SendClientMessage(i, COLOR_GRAD2, string);
						format(string, sizeof(string), "  Zysk z odsetek $%d", interest);
						SendClientMessage(i, COLOR_GRAD3, string);
					}
					else
					{
					    format(string, sizeof(string), "  Podatek dochodowy: 0.0 procent");
						SendClientMessage(i, COLOR_GRAD2, string);
						format(string, sizeof(string), "  Strata z podatku $0");
						SendClientMessage(i, COLOR_GRAD3, string);
					}
					SendClientMessage(i, COLOR_GRAD4, "|--------------------------------------|");
					format(string, sizeof(string), "  Nowy Stan Konta: $%d", PlayerInfo[i][pAccount]);
					SendClientMessage(i, COLOR_GRAD5, string);
					format(string, sizeof(string), "  Wynajem: -$%d", Dom[PlayerInfo[i][pWynajem]][hCenaWynajmu]);
					SendClientMessage(i, COLOR_GRAD5, string);
					if(PlayerInfo[i][pPbiskey] >= 0 && PlayerInfo[i][pPbiskey] <= MAX_BIZNES)
					{
					    new bizid = PlayerInfo[i][pPbiskey];
					    SendClientMessage(i, COLOR_LIGHTBLUE, "|___ DOCH�D Z BIZNESU ___|");
					    format(string, sizeof(string), "  Doch�d z biznesu: $%d", BizData[bizid][eBizMoney]);
						SendClientMessage(i, COLOR_WHITE, string);
						SendClientMessage(i, COLOR_LIGHTBLUE, "|_________________________|");
						DajKase(i, BizData[bizid][eBizMoney]);
					}
					format(string, sizeof(string), "~y~Wyplata");
					GameTextForPlayer(i, string, 5000, 1);
					PlayerInfo[i][pPayDay] = 0;
					PlayerInfo[i][pPayCheck] = 0;
					PlayerInfo[i][pConnectTime] += 1;
                    MRP_PremiumHours[i]++;
					if(PlayerInfo[i][pBP] >= 1)
					{
					    PlayerInfo[i][pBP]--;
					}
					if(kaska[i] >= 10000000 && PlayerInfo[i][pLevel] <= 2 || PlayerInfo[i][pAccount] >= 10000000 && PlayerInfo[i][pLevel] <= 2)
					{
						MruMySQL_Banuj(i, "10MLN i 1 lvl");
						format(string, sizeof(string), "%s zostal zbanowany za 10mln i 1 lvl", playername2);
						BanLog(string);
						KickEx(i);
					}
					if(PlayerInfo[i][pDonateRank] > 0)
					{
					    PlayerInfo[i][pPayDayHad] += 1;
					    if(PlayerInfo[i][pPayDayHad] >= 5)
					    {
					        PlayerInfo[i][pExp]++;
					        PlayerInfo[i][pPayDayHad] = 0;
					    }
					}
     				if(PoziomPoszukiwania[i] >= 10)
					{
						PoziomPoszukiwania[i] = 9;
					}
					else if(PoziomPoszukiwania[i] == 0)
					{
                    	PoziomPoszukiwania[i] = 0;
                    }
                    else
					{
						PoziomPoszukiwania[i] -= 1;
						format(string, sizeof(string), "  Aktualny poziom poszukiwania to %d", PoziomPoszukiwania[i]);
						SendClientMessage(i, COLOR_WHITE, string);
					}

				}
				else
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "* Nie grasz wystarczaj�co d�ugo, aby dosta� wyp�at�.");
				}
			}
		}
	}
    printf("-> Updating GangZones");
    Zone_GangUpdate(true);
    printf("-> Removing Houses MapIcons");

	for(new i; i<=dini_Int("Domy/NRD.ini", "NrDomow"); i++)
	{
		DestroyDynamicMapIcon(Dom[i][hIkonka]);
	}
	new hour,minuite,second;
	new rand = random(80);
	gettime(hour,minuite,second);
    FixHour(hour);
	if(10 <= shifthour <= 22)
	{
	 	if(rand == 0) rand = 1;
        printf("-> Starting lotto");
	  	Lotto(rand);
	}
	SetWeatherEx(2+random(19));
  	SendClientMessageToAll(COLOR_YELLOW, "Odliczanie do respawnu rozpocz�te");
	BroadCast(COLOR_PANICRED, "Uwaga! Za 20 sekund nast�pi respawn nieu�ywanych pojazd�w !");
    printf("-> Doing respawn");
	CountDown();
	SendRconCommand("reloadlog");
	SendRconCommand("reloadbans");
	if(shifthour == 3)
	{
	    SendClientMessageToAll(COLOR_YELLOW, "Trwa aktualizacja systemu dom�w, czas na laga");
	    for(new h; h <= dini_Int("Domy/NRD.ini", "NrDomow"); h++)
	    {
			Dom[h][hData_DD] ++;
			if(Dom[h][hData_DD] >= 30)
			{
			    new domex[128];
			    ZlomowanieDomu(9999, h);
				format(domex, sizeof(domex), "Dom nr %d zostal zezlomowany z powodu uplywu czasu");
			    PayLog(domex);
			}
	    }
		ZapiszDomy();
	}
	else if(shifthour == 4)
	{
	    foreach(Player, i)
		{
			Kick(i);
		}
	    ZapiszDomy();
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
        SendClientMessageToAll(COLOR_YELLOW, "RESET");
        SendRconCommand("gmx");
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	/*#if DEBUG == 1
		printf("%s[%d] OnPlayerUpdate - begin", GetNick(playerid), playerid);
	#endif*/

	if(gPlayerLogged[playerid] == 0)
	{
		if(GetPlayerVirtualWorld(playerid) != 1488)
		{
			SetPlayerVirtualWorld(playerid, 1488);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_SPAWNED || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER || GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new string[128];
			format(string, sizeof(string), "%s zostal skickowany za bycie niezalogowanym", GetNick(playerid));
			KickLog(string);
			SendClientMessage(playerid, COLOR_PANICRED, "Zosta�e� zkickowany za spawn jako niezalogowany");
			KickEx(playerid);
			return 0;
		}
	}

    systempozarow_OnPlayerUpdate(playerid);//System Po�ar�w v0.1

	//Anty BH PA�DZIOCH
	if(GetPVarInt(playerid, "Jumping") == 1)
	{
		new Float:x, Float:y, Float:z;
		GetPlayerVelocity(playerid, x, y, z);
		if(z > 0.05)
		{
			SetPlayerVelocity(playerid, x*0.4, y*0.4, z);
			SetPVarInt(playerid, "Jumping", -1);
		}
	}

    new veh = GetPlayerVehicleID(playerid);
    if(veh != 0)
    {
        new model = GetVehicleModel(veh);
        if(model == 425 || model == 432)
        {
            new keys, ud, lr;
            GetPlayerKeys(playerid, keys, ud, lr);
            if((keys & KEY_FIRE))
			{
				#if DEBUG == 1
					printf("%s[%d] OnPlayerUpdate - end", GetNick(playerid), playerid);
				#endif
				return 0; //desycn missile
			}
        }
        else if(model == 520)
        {
            new keys, ud, lr;
            GetPlayerKeys(playerid, keys, ud, lr);
            if((keys & KEY_ACTION))
			{
				#if DEBUG == 1
					printf("%s[%d] OnPlayerUpdate - end", GetNick(playerid), playerid);
				#endif
				return 0; //desycn hydra missile
			}
        }
    }
    new vid = GetPlayerVehicleID(playerid);
    if(vid > 0)
    {
        if(vid != LastVehicleID[playerid])
        {
            if(GetTickDiff(GetTickCount(), VehicleIDChangeTime[playerid]) < 2000)
            {
                VehicleIDChanges[playerid]++;
                if(VehicleIDChanges[playerid] > MAX_VEHICLE_ID_CHANGES)
                {
                    GetPlayerPos(playerid, czitX, czitY, czitZ);
                    if(GetPVarInt(playerid, "ACmessaged") == 0)
                    {
                        format(acstr, 128, "%s mo�e lagowa� autami i dosta� kicka U�yj /gotoczit aby to sprawdzi�!", GetNick(playerid, true));
                        SendAdminMessage(COLOR_P@, acstr);
                        SetPVarInt(playerid, "ACmessaged", 1);
                    }
                    Kick(playerid);
                    return 0;
                }
            }
            else VehicleIDChanges[playerid] = 1;
        }
        LastVehicleID[playerid] = vid;
        VehicleIDChangeTime[playerid] = GetTickCount();
    }
    //
    if(noclipdata[playerid][cameramode] == CAMERA_MODE_FLY)
	{
		new keys,ud,lr;
		GetPlayerKeys(playerid,keys,ud,lr);

		if(noclipdata[playerid][mode] && (GetTickDiff(GetTickCount(), noclipdata[playerid][lastmove]) > 100))
		{
		    // If the last move was > 100ms ago, process moving the object the players camera is attached to
		    MoveCamera(playerid);
		}

		// Is the players current key state different than their last keystate?
		if(noclipdata[playerid][udold] != ud || noclipdata[playerid][lrold] != lr)
		{
			if((noclipdata[playerid][udold] != 0 || noclipdata[playerid][lrold] != 0) && ud == 0 && lr == 0)
			{   // All keys have been released, stop the object the camera is attached to and reset the acceleration multiplier
				StopPlayerObject(playerid, noclipdata[playerid][flyobject]);
                if(noclipdata[playerid][fireobject] != 0) StopDynamicObject(noclipdata[playerid][fireobject]);
				noclipdata[playerid][mode]      = 0;
				noclipdata[playerid][accelmul]  = 0.0;
			}
			else
			{   // Indicates a new key has been pressed

			    // Get the direction the player wants to move as indicated by the keys
				noclipdata[playerid][mode] = GetMoveDirectionFromKeys(ud, lr);

				// Process moving the object the players camera is attached to
				MoveCamera(playerid);
			}
		}
		noclipdata[playerid][udold] = ud; noclipdata[playerid][lrold] = lr; // Store current keys pressed for comparison next update
		#if DEBUG == 1
			printf("%s[%d] OnPlayerUpdate - end", GetNick(playerid), playerid);
		#endif
		return 0;
	}
    if(GetPVarInt(playerid, "oil_clear") == 1)
    {
        new keys, ud,lr;
        GetPlayerKeys(playerid, keys, ud, lr);
        if(ud == KEY_DOWN) Oil_OnPlayerPress(playerid, KEY_DOWN);
        else if(ud == KEY_UP) Oil_OnPlayerPress(playerid, KEY_UP);
        if(lr == KEY_RIGHT) Oil_OnPlayerPress(playerid, KEY_RIGHT*2);
        else if(lr == KEY_LEFT) Oil_OnPlayerPress(playerid, KEY_LEFT*2);
    }
	/*#if DEBUG == 1
		printf("%s[%d] OnPlayerUpdate - end", GetNick(playerid), playerid);
	#endif*/
	return 1;
}

OnPlayerRegister(playerid, password[])
{
	if(IsPlayerConnected(playerid))
	{
		MruMySQL_CreateAccount(playerid, password);
		OnPlayerLogin(playerid, password);
	}
	return 1;
}

OnPlayerLogin(playerid, password[])
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerLogin - begin", GetNick(playerid), playerid);
	#endif
    new nick[MAX_PLAYER_NAME], string[256], accountPass[129], hashedPassword[129];
	GetPlayerName(playerid, nick, sizeof(nick));
    format(accountPass, sizeof(accountPass), "%s", MruMySQL_ReturnPassword(nick));

	WP_Hash(hashedPassword, sizeof(hashedPassword), password);
	if(strlen(accountPass) == 32)
	{
		//konwersja hase� MD5 na Whirlpool
		if(strcmp(accountPass, MD5_Hash(password), true ) == 0)
		{
			format(string, sizeof(string), "UPDATE `mru_konta` SET `Key` = '%s' WHERE `Nick` = '%s'", hashedPassword, GetNick(playerid));
			mysql_query(string);
			format(accountPass, sizeof(accountPass), hashedPassword);
			printf("Konwersja hasla konta %s na hash whirlpool", nick);
		}
	}

	if(strcmp(accountPass, hashedPassword, true ) == 0)
	{//poprawne has�o
        MruMySQL_KonwertujBana(playerid);
        if(MruMySQL_SprawdzBany(playerid)) return KickEx(playerid);

        format(PlayerInfo[playerid][pKey], 129, hashedPassword);

		//----------------------------
		//�adowanie konta i zmiennych:
		//----------------------------

		if( !MruMySQL_LoadAcocount(playerid) )
		{
			SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {FF0000}Krytyczny b��d konta. Zg�o� zaistnia�� sytuacj� na forum.");
			printf("Nick %s posiada blad krytyczny konta (pusty rekord?)", nick);
			KickEx(playerid);
			return 1;
		}

		//Sprawdzanie block�w:
		if(PlayerInfo[playerid][pBlock] == 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {FF0000}To konto jest zablokowane, nie mo�esz na nim gra�.");
			SendClientMessage(playerid, COLOR_WHITE, "[SERVER] Je�li uwa�asz, �e konto zosta�o zablokowane nies�usznie napisz apelacje na: {33CCFF}www.Mrucznik-RP.pl");
			KickEx(playerid);
			return 1;
		}
        else if(PlayerInfo[playerid][pBlock] == 2 || PlayerInfo[playerid][pCK] == 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {FF0000}Ta posta� jest u�miercona, nie mo�esz na niej gra�.");
			KickEx(playerid);
			return 1;
		}

		//Nadawanie pieni�dzy:
		ResetujKase(playerid);
		if(PlayerInfo[playerid][pCash] > 0)
			DajKase(playerid, PlayerInfo[playerid][pCash]);
		else
			ZabierzKase(playerid, PlayerInfo[playerid][pCash]);

		//Ustawianie na zalogowany:
		gPlayerLogged[playerid] = 1;

        Car_LoadForPlayer(playerid); //System aut
		MruMySQL_LoadPhoneContacts(playerid); //Kontakty telefonu

		//Powitanie:
		format(string, sizeof(string), "Witaj, %s!",nick);
		SendClientMessage(playerid, COLOR_WHITE,string);
		printf("%s has logged in.",nick);
		if (PlayerInfo[playerid][pDonateRank] > 0)
		{
			SendClientMessage(playerid, COLOR_WHITE,"Jeste� posiadaczem {E2BA1B}Konta Premium.");
		}
	}
	else
	{//z�e has�o
		SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {33CCFF}Z�e has�o.");

		format(string, sizeof(string), "Nick %s jest zarejestrowany.\nZaloguj si� wpisuj�c w okienko poni�ej has�o.\nJe�li nie znasz has�a do tego konta, wejd� pod innym nickiem", nick);
		ShowPlayerDialogEx(playerid, 230, DIALOG_STYLE_PASSWORD, "Logowanie", string, "Zaloguj", "Wyjd�");
		gPlayerLogTries[playerid] += 1;
		if(gPlayerLogTries[playerid] == 3)
		{
			SendClientMessage(playerid, COLOR_WHITE, "[SERVER] {33CCFF}Z�e has�o. Zostajesz zkickowany.");
			ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "{FF0000}Dosta�e� kicka za wpisanie z�ego has�a 3 razy pod rz�d!", "Wyjd�", "");
			KickEx(playerid);
		}
		return 1;
	}

	//Nadawanie pocz�tkowych item�w po rejestracji:
	if(PlayerInfo[playerid][pReg] == 0)
	{
		PlayerInfo[playerid][pLevel] = 1;
		PlayerInfo[playerid][pSHealth] = 0.0;
		PlayerInfo[playerid][pHealth] = 50.0;
		PlayerInfo[playerid][pPos_x] = 2246.6;
		PlayerInfo[playerid][pPos_y] = -1161.9;
		PlayerInfo[playerid][pPos_z] = 1029.7;
		PlayerInfo[playerid][pInt] = 0;
		PlayerInfo[playerid][pLocal] = 255;
		PlayerInfo[playerid][pTeam] = 3;
		PlayerInfo[playerid][pModel] = 136;
		PlayerInfo[playerid][pPnumber] = 0;
		PlayerInfo[playerid][pDom] = 0;
		PlayerInfo[playerid][pPbiskey] = 255;
		PlayerInfo[playerid][pAccount] = 5000;
		PlayerInfo[playerid][pReg] = 1;
		PlayerInfo[playerid][pDowod] = 0;
		DajKase(playerid, 5000);
	}

	//Filtry na konto:
	/*if(dini_Exists("Filtry.ini"))
	{
		new filtr;
		new filtr_ip[64];
		new filtr_nick[64];
		new ip[16];
		GetPlayerIp(playerid, ip, sizeof(ip));
		for(new i = 0; i < dini_Int("Filtry.ini", "Liczba"); i++)
		{
			format(filtr_ip, sizeof(filtr_ip), "IP_%d", i);
			if(strcmp(ip, dini_Get("Filtry.ini", filtr_ip), true) == 0)
			{
				format(filtr_nick, sizeof(filtr_nick), "Nick_%d", i);
				if(strcmp(nick, dini_Get("Filtry.ini", filtr_nick), true) == 0)
				{
					SendClientMessage(playerid, COLOR_WHITE,"SERVER: Jeste� posiadaczem filtru na konto.");
					filtr = 0;
					break;
				}
				else
				{
					filtr++;
				}
			}
		}
		if(filtr != 0)
		{
			SendClientMessage(playerid, COLOR_WHITE,"SERVER: Zosta�e� zkickowany, pow�d: Filtr na konto.");
			SendClientMessage(playerid, COLOR_WHITE,"SERVER: Aby go zdj�� napisz na forum www.Mrucznik-RP.pl");
			KickEx(playerid);
			return 1;
		}
	}
	else
	{
		dini_Create("Filtry.ini");
		dini_IntSet("Filtry.ini", "Liczba", 0);
	}*/

    if(PlayerInfo[playerid][pBW] == 60 || PlayerInfo[playerid][pBW] == 122 || PlayerInfo[playerid][pBW] == 123 || PlayerInfo[playerid][pBW] > 600)
    {
        PlayerInfo[playerid][pBW] = 0;
    }

	//Przywracanie Poziomu Poszukiwania
        //Punkty karne
    if (PlayerInfo[playerid][pWL] >= 10000)
    {
        string="\0";
        new lPunkty[8];
        PlayerInfo[playerid][pWL]-=10000;
        valstr(string, PlayerInfo[playerid][pWL]);
        if(strlen(string) == 3) strmid(lPunkty, string, 0, 1);
        else if(strlen(string) == 4) strmid(lPunkty, string, 0, 2);
        PlayerInfo[playerid][pPK] = strval(lPunkty);
        if(strlen(string) == 3) strmid(lPunkty, string, 1, 3);
        else if(strlen(string) == 4) strmid(lPunkty, string, 2, 4);
        PlayerInfo[playerid][pWL] = strval(lPunkty);
    }

	if (PlayerInfo[playerid][pWL] >= 1)
	{
        if(PlayerInfo[playerid][pWL] > 100) PlayerInfo[playerid][pWL] = 0;
        else
        {
    		PoziomPoszukiwania[playerid] = clamp(PlayerInfo[playerid][pWL], 0, 10);
    		format(string, sizeof(string), "Tw�j poziom poszukiwania zosta� przywr�cony do %d.",PlayerInfo[playerid][pWL]);
    		SendClientMessage(playerid, COLOR_WHITE,string);
        }
	}

	//Niwelacje hajsu i mats�w w zale�no�ci od lvl:
	Niwelacje(playerid);
    if(PlayerInfo[playerid][pWarns] >= 3)
    {
        MruMySQL_Banuj(playerid, "Limit warn�w (3)");
        KickEx(playerid);
        return 1;
    }
    else if(PlayerInfo[playerid][pWarns] < 0) PlayerInfo[playerid][pWarns] = 0;


	//TODO: new premium
    MRP_LoadPremium(playerid);

    //premium_loadForPlayer(playerid);

	//Odbugowywanie dom�w:
    if(PlayerInfo[playerid][pDom] != 0)
    {
    	NaprawSpojnoscWlascicielaDomu(playerid);
		Dom[PlayerInfo[playerid][pDom]][hData_DD] = 0;
    	if(Dom[PlayerInfo[playerid][pDom]][hPDW] < 0) Dom[PlayerInfo[playerid][pDom]][hPDW] = 0;//naprawa wynajmu
    	if(Dom[PlayerInfo[playerid][pDom]][hPW] < 0) Dom[PlayerInfo[playerid][pDom]][hPW] = 0;
	}

	//Spawnowanie gracza:
	SetTimerEx("AntySB", 5000, 0, "d", playerid); //by nie kickowa�o timer broni
	AntySpawnBroni[playerid] = 5;
	GUIExit[playerid] = 0;
	SetPlayerVirtualWorld(playerid, 0);

    Zone_Sync(playerid);
    if(strlen(ServerInfo) > 1) TextDrawShowForPlayer(playerid, TXD_Info); //Show info

    //Sync org
    if(GetPlayerOrg(playerid) == 255) PlayerInfo[playerid][pOrg] = 0;

    //Info o rodzinie:
	if(GetPlayerOrg(playerid) != 0)
	{
        gPlayerOrg[playerid] = orgID(PlayerInfo[playerid][pOrg]);
        if(PlayerInfo[playerid][pRank] >= 1000) gPlayerOrgLeader[playerid] = true, PlayerInfo[playerid][pRank]-=1000;

        if(gPlayerOrg[playerid] == 0xFFFF) SendClientMessage(playerid, COLOR_PANICRED, "B��D PRZYPISANIA TWOJEJ RODZINY!!!");
        else if(strlen(OrgInfo[gPlayerOrg[playerid]][o_Motd]) > 3)
        {
    		format(string, sizeof(string), "Rodzina MOTD: %s.", OrgInfo[gPlayerOrg[playerid]][o_Motd]);
    		SendClientMessage(playerid, COLOR_YELLOW, string);
        }
        if(PlayerInfo[playerid][pRank] < 0 || PlayerInfo[playerid][pRank] > 9) PlayerInfo[playerid][pRank] = 9;
	}

    //Konwersja pojazd�w:
    CONVERT_PlayerCar(playerid);

    MRP_PlayerLog(playerid);

	//Teleportacja do poprzedniej pozycji:
	if (PlayerInfo[playerid][pTut] == 1)
	{
        if(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pNewAP] > 0 || PlayerInfo[playerid][pZG] > 0)
        {
            if(PlayerInfo[playerid][pZG] > 0 || PlayerInfo[playerid][pNewAP] > 0)
            {
                SetPVarInt(playerid, "support_duty", 1);
                SendClientMessage(playerid, COLOR_GREEN, "SUPPORT: {FFFFFF}Stawiasz si� na s�u�bie nowym graczom. Aby sprawdzi� zg�oszenia wpisz {00FF00}/tickets");
            }
            ShowPlayerDialogEx(playerid, 235, DIALOG_STYLE_INPUT, "Weryfikacja", "Logujesz si� jako cz�onek administracji. Zostajesz poproszony o wpisanie w\nponi�sze pole has�a weryfikacyjnego. Pami�taj, aby nie podawa� go nikomu!", "Weryfikuj", "Wyjd�");
        }
        else if(PlayerInfo[playerid][pJailed] == 0)
        {
    		lowcap[playerid] = 1;
    		ShowPlayerDialogEx(playerid, 1, DIALOG_STYLE_MSGBOX, "Serwer", "Czy chcesz si� teleportowa� do poprzedniej pozycji?", "TAK", "NIE");
        }
        else
        {
            SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
            TogglePlayerSpectating(playerid, false);
			SpawnPlayer(playerid);
        }
	}
    else
    {
        SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
		gOoc[playerid] = 1; gNews[playerid] = 1; gFam[playerid] = 1;
		PlayerInfo[playerid][pMuted] = 1;
		SendClientMessage(playerid, COLOR_YELLOW, "Witaj na Mrucznik Role Play!");
		SendClientMessage(playerid, COLOR_WHITE, "Aby zacz�� gr� musisz przej�� procedury rejestracji.");
		ShowPlayerDialogEx(playerid, 70, DIALOG_STYLE_MSGBOX, "Witaj na Mrucznik Role Play", "Witaj na serwerze Mrucznik Role Play\nJe�li jeste� tu nowy, to przygotowali�my dla ciebie poradnik\nZa chwil� b�dziesz m�g� go obejrze�, lecz najpierw b�dziesz musia� opisa� posta� kt�r� b�dziesz sterowa�\nAby przej�� dalej wci�nij przycisk 'dalej'", "Dalej", "");
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerLogin - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerKeyStateChange(playerid,newkeys,oldkeys)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerKeyStateChange - begin", GetNick(playerid), playerid);
	#endif
    //09.06.2014
    if(Teleturniejstart == 1)
	{
	    if(IsPlayerInRangeOfPoint(playerid,2,679.1998, -1336.1652, 30.3864) || IsPlayerInRangeOfPoint(playerid,2,679.9750, -1339.5018, 30.3864) || IsPlayerInRangeOfPoint(playerid,2,678.9643, -1342.8322, 30.3864))
	    {
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        if(GetPlayerVirtualWorld(playerid) == 21)
		        {
		            if(newkeys & KEY_SPRINT)
		            {
						if(grajacy[playerid] == 1)
						{
			                new ImieGracza[MAX_PLAYER_NAME],string[64];
							GetPlayerName(playerid, ImieGracza, sizeof(ImieGracza));
							format(string, sizeof(string), "* %s naciska przycisk na stoliku",ImieGracza);
							ProxDetector(20.0, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							Teleturniejstart = 0;
							grajacy[playerid] = 0;
							#if DEBUG == 1
								printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
							#endif
                            return 0;
						}
		            }
		        }
		    }
		}
	}

    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPVarInt(playerid, "obezwladniony")-15 > gettime())
    {
        if(HOLDING(KEY_SPRINT))
        {
			ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.0, 0, 1, 1, 1, -1);
        }
    }

    //11.06.2014
   	if(PRESSED(KEY_JUMP) && Spectate[playerid] != INVALID_PLAYER_ID)
    {
		PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
		PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
		SetPlayerToTeamColor(playerid);
		MedicBill[playerid] = 0;
		SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], Unspec[playerid][Coords][0], Unspec[playerid][Coords][1], Unspec[playerid][Coords][2], 10.0, -1, -1, -1, -1, -1, -1);
        Spectate[playerid] = INVALID_PLAYER_ID;
        TogglePlayerSpectating(playerid, 0);
        return 0;
    }
    //30.10
    if(HOLDING(KEY_ANALOG_UP))
    {
        new veh = GetPlayerVehicleID(playerid);
        if(veh != 0)
        {
            if(CarData[VehicleUID[veh][vUID]][c_Owner] == JOB_TRUCKER && CarData[VehicleUID[veh][vUID]][c_OwnerType] == CAR_OWNER_JOB)
            {
                if(GetVehicleModel(veh) == 530) TJD_TryPickup(playerid, veh);
            }
        }
    }
    //12.07 TRAIN HORN
    if(PRESSED(KEY_CROUCH))
    {
        if(GetPVarInt(playerid, "horn") == 0)
        {
            new veh;
            if((veh = GetPlayerVehicleID(playerid)) != 0)
            {
                if(GetVehicleModel(veh) == 538 || GetVehicleModel(veh) == 537)
                {
                    if(GetPlayerVehicleSeat(playerid) == 0)
                    {
                        SetPVarInt(playerid, "horn", 1);
                        if(TRAIN_HornTimer == 0)
                        {
                            TRAIN_HornTimer = SetTimerEx("TRAIN_DoHorn", 500, 1, "i", veh);
                            TRAIN_DoHorn(veh);
							#if DEBUG == 1
								printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
							#endif
                            return 0;
                        }
                    }
                }
            }
        }
    }
    else if(RELEASED(KEY_CROUCH))
    {
        if(GetPVarInt(playerid, "horn") == 1)
        {
            if(TRAIN_HornTimer != 0) KillTimer(TRAIN_HornTimer);
            TRAIN_HornTimer=0;
            SetPVarInt(playerid, "horn", 0);

			foreach(Player, i)
            {
                if(GetPVarInt(i, "train-horn") == 1)
                {
                    PlayerPlaySound(i, 8199, 0.0, 0.0, 0.0);
                    SetPVarInt(i, "train-horn", 0);
                }
            }
			#if DEBUG == 1
				printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
			#endif
            return 0;
        }
    }
    //BLINK
    new veh = GetPlayerVehicleID(playerid);
    if(veh != 0)
    {
        if(GetPlayerVehicleSeat(playerid) == 0)
        {
            #if BLINK_ALLOW_EMERGENCY == 1
            if(PRESSED(KEY_LOOK_BEHIND))
            {
                if(!IsCarBlinking(veh)) SetCarBlinking(veh, 2), SetPVarInt(playerid, "blink-car", veh);
    		    else DisableCarBlinking(veh);
            }
            #endif
        	if(PRESSED(KEY_LOOK_LEFT))
            {
    			if(!IsCarBlinking(veh)) SetCarBlinking(veh, 0), SetPVarInt(playerid, "blink-car", veh);
    		    else DisableCarBlinking(veh);
        	}
        	else if(PRESSED(KEY_LOOK_RIGHT))
            {
    		    if(!IsCarBlinking(veh)) SetCarBlinking(veh, 1), SetPVarInt(playerid, "blink-car", veh);
    		    else DisableCarBlinking(veh);
        	}

            if(IsCarBlinking(veh))
            {
                new Float:a, Float:b = BlinkR[veh];
                GetVehicleZAngle(veh, a);

                if(BlinkSide[veh] == 0)
                {
                    b+=BLINK_TURN_ANGLE;
                    if(b > 360.0) b -=360.0;
                    if(a < b-180) a = a+360;
                	if(b < a-180) b = b+360;

                    if(a > b) DisableCarBlinking(veh);
                }
                else if(BlinkSide[veh] == 1)
                {
                    b-=BLINK_TURN_ANGLE;
                    if(b < 0.0) b = 360.0 + b;
                    if(a < b-180) a = a+360;
                	if(b < a-180) b = b+360;

                    if(a < b) DisableCarBlinking(veh);
                }
            }
        }
    }
    //Kolczatki
    if(IsPlayerInAnyVehicle(playerid))
    {
        if(IsACop(playerid) && !KolDelay[veh])
        {
            if(IsACopCar(veh) && !IsABike(veh) && !IsAPlane(veh) && !IsABoat(veh))
            {
                if(PRESSED(KEY_ANALOG_DOWN)) //2
                {
                    new id = Kolczatka_GetID();
                    if(id != -1)
                    {
                        new Float:h, Float:a, Float:b, Float:x, Float:y, Float:z, vehid = GetPlayerVehicleID(playerid), Float:rot;
                        GetVehiclePos(vehid, x, y, z);
                        GetVehicleZAngle(vehid, rot);
                        x-=2.0*floatsin(-rot, degrees);
                        y-=2.0*floatcos(-rot, degrees);
                        GetVehicleRotation(vehid, h, a, b);
                        if(floatabs(b) > 15.0)
						{
							#if DEBUG == 1
								printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
							#endif
							return 1;
						}
                        //z -= 0.5;
                        z = (b > 0) ? (z - floatcos(b, degrees)) : (z + floatsin(b, degrees));
                        if(-10.0 <= b <= 10.0) z = (b>0) ? (z+ floatabs((b-10)/20)) : (z- ((b+10)/20));
                        KolID[id] = CreateDynamicObject(2899, x, y, z, a, b, rot-90);
                        KolTime[id] = gettime()+KOLCZATKA_CZAS;
                        KolArea[id] = CreateDynamicCylinder(x, y, z-10, z+10, 4.0);
                        KolDelay[veh] = true;
                        KolVehicle[id] = veh;
						#if DEBUG == 1
							printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
						#endif
                        return 0;
                    }
                }
            }
        }
    }

    //
	if ((newkeys==KEY_ACTION)&&(IsPlayerInAnyVehicle(playerid))&&(GetPlayerState(playerid)==PLAYER_STATE_DRIVER))
	{
		if (GetVehicleModel(GetPlayerVehicleID(playerid)) == 525)
		{
			SendClientMessage(playerid,0x00FFFFFF, "Pr�bujesz podczepi� pojazd");
			new Float:pX, Float:pY, Float:pZ;
			GetPlayerPos(playerid,pX,pY,pZ);
			new Float:vX,Float:vY,Float:vZ;
			new Found=0;
			new vid=0;
			while((vid<MAX_VEHICLES)&&(!Found))
			{
				vid++;
				GetVehiclePos(vid,vX,vY,vZ);
                if(vid == 1) continue;
				if ((floatabs(pX-vX)<7.0)&&(floatabs(pY-vY)<7.0)&&(floatabs(pZ-vZ)<7.0)&&(vid!=GetPlayerVehicleID(playerid)))
				{
					Found=1;
					if (IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
						SendClientMessage(playerid,COLOR_BROWN, "Pojazd odczepiony");
                        break;
					}
					AttachTrailerToVehicle(vid,GetPlayerVehicleID(playerid));
					SendClientMessage(playerid,COLOR_BROWN, "Pojazd podczepiony");
				}
			}
			if (!Found)
			{
				SendClientMessage(playerid,COLOR_BROWN, "Nie ma w pobli�u �adnych samochod�w.");
			}
			#if DEBUG == 1
				printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
			#endif
            return 0;
		}
	}
	if(newkeys & KEY_YES && (GetPlayerState(playerid)==PLAYER_STATE_DRIVER))//id 131072
	{
		new engine, unused;
		GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine , unused , unused, unused, unused, unused, unused);
		if(engine == 1)
			cmd_zgas(playerid);
		else
			cmd_odpal(playerid);
	}
    if(newkeys & KEY_YES && (GetPlayerState(playerid)==PLAYER_STATE_ONFOOT))
    {
        FabrykaMats::ActorTalk(playerid);
    }
	if(PRESSED(KEY_JUMP))//AntyBH
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
		    if(AntyBH == 1)
		    {
				SetPVarInt(playerid, "Jumping", 1);
			}
		}
	}
	if(newkeys - oldkeys == 40)
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    if(WnetrzeWozu[playerid] != 0)
		    {
		        Z_WnetrzaWozu(playerid, WnetrzeWozu[playerid]);
		    }
		    else
		    {
			    for(new v; v < MAX_VEHICLES; v++)
			    {
					new model = GetVehicleModel(v);
					if(IsAInteriorVehicle(playerid))
					{
		   				new Float:vehx, Float:vehy, Float:vehz;
		          		GetVehiclePos(v, vehx, vehy, vehz);
		          		if(IsVehicleStreamedIn(v, playerid) && IsPlayerInRangeOfPoint(playerid, 10.0, vehx, vehy, vehz))
		          		{
							if(VehicleUID[v][vIntLock] == 1)
			          	    {
								Do_WnetrzaWozu(playerid, v, model);
								#if DEBUG == 1
									printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
								#endif
								return 0;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "Interior jest zamkni�ty!");
								#if DEBUG == 1
									printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
								#endif
							    return 0;
							}
		          		}
					}
			    }
		   	}
		}
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
		    if (newkeys & KEY_ACTION || newkeys & KEY_FIRE)
			{
			    new Vehid = GetPlayerVehicleID(playerid);
			    new ModelID[MAX_VEHICLES];
			    ModelID[Vehid] = GetVehicleModel(Vehid);
			    if( ModelID[Vehid] == 520 || ModelID[Vehid] == 432 || ModelID[Vehid] == 425)
			    {
	    			ApplyAnimation(playerid,"PED","car_hookertalk ",4.1,1,1,1,1,1,1);
	    			TogglePlayerControllable(playerid,0);
					TogglePlayerControllable(playerid,1);
				}
			}
		}
	}
    if(PRESSED(KEY_SECONDARY_ATTACK))
    {
        if(GetPlayerAnimationIndex(playerid)!=1660) SetTimerEx("VendCheck", 500, false, "d", playerid);
		#if DEBUG == 1
			printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
		#endif
        return 0;
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnVehicleDeath pojazd %d - begin", GetNick(killerid), killerid, vehicleid);
	#endif
	if(GetVehicleModel(vehicleid) == 577)
	{
        foreach(Player, i)
		{
			if(PlayerInfo[i][pWsamolocieLS]==1)
			{
				SendClientMessage(i, COLOR_GREY, " Samolot rozbi� si�!");
				SetPlayerHealth(i, 0);
				PlayerInfo[i][pWsamolocieLS]=0;
				PlayerInfo[i][pWlociej]=0;
				PlayerInfo[i][pMozeskakacAT]=0;
			}
		}
		if(osoby>1)
		{
            new str[64];
            format(str, 64, "Szok! Samolot KT rozbi� si� i zgin�o %d os�b!", osoby);
			OOCNews(COLOR_LIGHTGREEN, str);
		}
	}

	//PA�DZIOCH
	if(IsAHeliModel(GetVehicleModel(vehicleid)))
	{
  		for(new i=0;i<=MAX_PLAYERS;i++)
    	{
     		if(GetPVarInt(i,"chop_id") == vehicleid && GetPVarInt(i,"roped") == 1)
       		{
         		DisablePlayerCheckpoint(i);
          		SetPVarInt(i,"roped",0);
            	DisablePlayerCheckpoint(i);
             	ClearAnimations(i);
              	TogglePlayerControllable(i,1);
               	for(new j=0;j<=ROPELENGTH;j++)
                {
                	DestroyDynamicObject(r0pes[i][j]);
                }
			}
		}
	}

    if(B_IsTrailer(vehicleid))
    {
        new veh;
        if((veh = TrailerVehicle[vehicleid]) != 0)
        {
            if(IsCarBlinking(veh))
            {
                DestroyDynamicObject(Blink[veh][1]);
                DestroyDynamicObject(Blink[veh][3]);
                Blink[veh][1] = -1;
                Blink[veh][3] = -1;
            }
        }
    }
    else DisableCarBlinking(vehicleid);

	#if DEBUG == 1
		printf("%s[%d] OnVehicleDeath pojazd %d - end", GetNick(killerid), killerid, vehicleid);
	#endif
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	#if DEBUG == 1
		printf("%d OnVehicleSpawn - begin", vehicleid);
	#endif
    if(B_IsTrailer(vehicleid))
    {
        new veh;
        if((veh = TrailerVehicle[vehicleid]) != 0)
        {
            if(IsCarBlinking(veh))
            {
                DestroyDynamicObject(Blink[veh][1]);
                DestroyDynamicObject(Blink[veh][3]);
                Blink[veh][1] = -1;
                Blink[veh][3] = -1;
            }
        }
    }
    else DisableCarBlinking(vehicleid);

    TJD_CheckForUsedBox(vehicleid);

	if(VehicleUID[vehicleid][vUID] != 0)
	{
        Car_AddTune(vehicleid);
    	SetVehicleHealth(vehicleid, CarData[VehicleUID[vehicleid][vUID]][c_HP]);
    	UpdateVehicleDamageStatus(vehicleid, 0, 0, 0, CarData[VehicleUID[vehicleid][vUID]][c_Tires]);
	}
    if(VehicleUID[vehicleid][vSiren] != 0)
	{
	    DestroyDynamicObject(VehicleUID[vehicleid][vSiren]);
	    VehicleUID[vehicleid][vSiren] = 0;
	}
    if(Car_GetOwnerType(vehicleid) == CAR_OWNER_FRACTION || Car_GetOwnerType(vehicleid) == CAR_OWNER_FAMILY || Car_GetOwnerType(vehicleid) == CAR_OWNER_JOB) {
        RepairVehicle(vehicleid); //

    }
	#if DEBUG == 1
		printf("%d OnVehicleSpawn - end", vehicleid);
	#endif
    return 1;
}

public OnPlayerText(playerid, text[])
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerText - begin", GetNick(playerid), playerid);
	#endif
    if(text[0] == '@') //animacja
    {
        if(strlen(text) > 31) return 0;
        new lVal = CallRemoteFunction("MRP_DoAnimation", "is[32]", playerid, text);
        if(lVal != 1) SendClientMessage(playerid, COLOR_GRAD2, "@: Nie znaleziono animacji.");
        return 0;
    }

	new giver[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new tmp[256];
	new string[256];
	new giveplayerid;
	if(PlayerInfo[playerid][pMuted] == 1)
	{
		sendTipMessageEx(playerid, TEAM_CYAN_COLOR, "Nie mo�esz m�wi� gdy� jeste� uciszony");
		return 0;
	}
	if(MarriageCeremoney[playerid] > 0)
	{
	    if (strcmp("tak", text, true) == 0)
		{
		    if(GotProposedBy[playerid] < 999)
		    {
			    if(IsPlayerConnected(GotProposedBy[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(GotProposedBy[playerid], giveplayer, sizeof(giveplayer));
				    format(string, sizeof(string), "Ksi�dz: %s czy chcesz wzi�� %s na swoj� �one? (wpisz 'tak', cokolwiek innego anuluje �lub).", giveplayer,sendername);
					SendClientMessage(GotProposedBy[playerid], COLOR_WHITE, string);
					MarriageCeremoney[GotProposedBy[playerid]] = 1;
					MarriageCeremoney[playerid] = 0;
					GotProposedBy[playerid] = 999;
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        GotProposedBy[playerid] = 999;
			        return 0;
			    }
			}
			else if(ProposedTo[playerid] < 999)
			{
			    if(IsPlayerConnected(ProposedTo[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(ProposedTo[playerid], giveplayer, sizeof(giveplayer));
					if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
						format(string, sizeof(string), "Ksi�dz: %s i %s zostali�cie m�em i �on�, mo�ecie si� poca�owa�.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Ksi�dz: %s i %s zostali�cie m�em i �on�, mo�ecie si� poca�owa�.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Ko�ci�: Mamy now� pare, %s & %s zostali zar�czeni.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 1)
					{
					    format(string, sizeof(string), "Ksi�dz: %s i %s Zostali�cie m�em i m�em, mo�ecie si� poca�owa�.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Ksi�dz: %s i %s Zostali�cie m�em i m�em, mo�ecie si� poca�owa�.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Ko�ci�: Mamy now� gejowsk� pare, %s & %s zostali zar�czeni.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 2 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
					    format(string, sizeof(string), "Ksi�dz: %s i %s Zostali�cie �on� i �on�, mo�ecie si� poca�owa�.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Ksi�dz: %s i %s Zostali�cie �on� i �on�, mo�ecie si� poca�owa�.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Ko�ci�: Mamy now� lesbijsk� pare, %s & %s zostali zar�czeni.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					//MarriageCeremoney[ProposedTo[playerid]] = 1;
					MarriageCeremoney[ProposedTo[playerid]] = 0;
					MarriageCeremoney[playerid] = 0;
					format(PlayerInfo[ProposedTo[playerid]][pMarriedTo], 32, "%s", sendername);
                    format(PlayerInfo[playerid][pMarriedTo], 32, "%s", giveplayer);
					ZabierzKase(playerid, 100000);
					PlayerInfo[playerid][pMarried] = 1;
					PlayerInfo[ProposedTo[playerid]][pMarried] = 1;
					PlayerInfo[ProposedTo[playerid]][pPbiskey] = PlayerInfo[playerid][pPbiskey];
					ProposedTo[playerid] = 999;
					MarriageCeremoney[playerid] = 0;
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        ProposedTo[playerid] = 999;
			        return 0;
			    }
			}
		}
		else
		{
		    if(GotProposedBy[playerid] < 999)
		    {
				if(IsPlayerConnected(GotProposedBy[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(GotProposedBy[playerid], giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "* Nie chcesz po�lubi� %s, nie powiedzia�e� 'tak'.",giveplayer);
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    format(string, sizeof(string), "* %s nie chce ci� po�lubi� gdy� nie powiedzia� 'tak'.",sendername);
				    SendClientMessage(GotProposedBy[playerid], COLOR_YELLOW, string);

                    MarriageCeremoney[GotProposedBy[playerid]] = 0;
				    return 0;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        GotProposedBy[playerid] = 999;
			        return 0;
			    }
		    }
		    else if(ProposedTo[playerid] < 999)
			{
			    if(IsPlayerConnected(ProposedTo[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(ProposedTo[playerid], giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "* Nie chcesz po�lubi� %s, nie powiedzia�e� 'tak'.",giveplayer);
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    format(string, sizeof(string), "* %s nie chce ci� po�lubi� gdy� nie powiedzia� 'tak'.",sendername);
				    SendClientMessage(ProposedTo[playerid], COLOR_YELLOW, string);

                    GotProposedBy[ProposedTo[playerid]] = 0;
				    return 0;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        ProposedTo[playerid] = 999;
			        return 0;
			    }
			}
		}
	    return 0;
	}

	if(ConnectedToPC[playerid] == 255)
	{
		new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("Contracts", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Contracts")) || (strcmp("Kontrakty", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Kontrakty")))
		{
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Tylko Hitmani z 4 rang� mog� sprawdza� list� kontrakt�w !");
		        return 0;
		    }
		    SearchingHit(playerid);
			return 0;
		}
		else if ((strcmp("News", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("News")))
		{
		    	new x_nr[128];
				x_nr = strtok(text, idx);

				if(!strlen(x_nr)) {
					SendClientMessage(playerid, COLOR_WHITE, "|__________________ Hitman Agency News __________________|");
					SendClientMessage(playerid, COLOR_WHITE, "U�YJ: News [numer] aby skasowac 'News Delate [numer]' lub 'News delete all'");
					format(string, sizeof(string), "1: %s :: Hitman: %s", News[hAdd1], News[hContact1]);
					SendClientMessage(playerid, COLOR_GREY, string);
					format(string, sizeof(string), "2: %s :: Hitman: %s", News[hAdd2], News[hContact2]);
					SendClientMessage(playerid, COLOR_GREY, string);
					format(string, sizeof(string), "3: %s :: Hitman: %s", News[hAdd3], News[hContact3]);
					SendClientMessage(playerid, COLOR_GREY, string);
					format(string, sizeof(string), "4: %s :: Hitman: %s", News[hAdd4], News[hContact4]);
					SendClientMessage(playerid, COLOR_GREY, string);
					format(string, sizeof(string), "5: %s :: Hitman: %s", News[hAdd5], News[hContact5]);
					SendClientMessage(playerid, COLOR_GREY, string);
					SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________________|");
					return 0;
				}//lets start
				if(strcmp(x_nr,"1",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "Musisz miec 3 rang� aby pisa� newsy Hitman Agency !"); return 0; }
				    if(News[hTaken1] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "Za kr�tki tekst newsa !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd1], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact1], string, 0, strlen(string));
						News[hTaken1] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Ten numer jest zajety !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"2",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "Musisz mie� 3 rang� aby pisa� newsy na kanale Hitman Agency !"); return 0; }
				    if(News[hTaken2] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "News jest za kr�tki !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd2], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact2], string, 0, strlen(string));
						News[hTaken2] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Ten numer jest aktualnie w u�yciu !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"3",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "Musisz mie� 3 rang� aby pisa� newsy na kanale Hitman Agency !"); return 0; }
				    if(News[hTaken3] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "News jest za kr�tki !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd3], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact3], string, 0, strlen(string));
						News[hTaken3] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Ten numer jest aktualnie w u�yciu !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"4",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "Musisz mie� 3 rang� aby pisa� newsy na kanale Hitman Agency !"); return 0; }
				    if(News[hTaken4] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "News jest za kr�tki !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd4], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact4], string, 0, strlen(string));
						News[hTaken4] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Ten numer jest aktualnie w u�yciu !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"5",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "Musisz mie� 3 rang� aby pisa� newsy na kanale Hitman Agency !"); return 0; }
				    if(News[hTaken5] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "News jest za kr�tki !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd5], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact5], string, 0, strlen(string));
						News[hTaken5] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Ten numer jest aktualnie w u�yciu !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"delete",true) == 0)
				{
				    if(PlayerInfo[playerid][pRank] < 4)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Musisz mie� 4 rang� aby usuwa� newsy z kana�u Hitman Agency !");
				        return 0;
				    }
				    new string1[MAX_PLAYER_NAME];
				    new x_tel[128];
					x_tel = strtok(text, idx);
					if(!strlen(x_tel)) {
					    SendClientMessage(playerid, COLOR_WHITE, "U�YJ: News delete [numer] lub News delete all.");
					    return 0;
					}
                    if(strcmp(x_tel,"1",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd1], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact1], string1, 0, strlen(string1));
						News[hTaken1] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Skasowa�e� newsa numer (1) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"2",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd2], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact2], string1, 0, strlen(string1));
						News[hTaken2] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Skasowa�e� newsa numer (2) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"3",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd3], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact3], string1, 0, strlen(string1));
						News[hTaken3] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Skasowa�e� newsa numer (3) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"4",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd4], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact4], string1, 0, strlen(string1));
						News[hTaken4] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Skasowa�e� newsa numer (4) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"5",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd5], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact5], string1, 0, strlen(string1));
						News[hTaken5] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Skasowa�e� newsa numer (5) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"all",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd1], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact1], string1, 0, strlen(string1));
						News[hTaken1] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd2], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact2], string1, 0, strlen(string1));
						News[hTaken2] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd3], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact3], string1, 0, strlen(string1));
						News[hTaken3] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd4], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact4], string1, 0, strlen(string1));
						News[hTaken4] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd5], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact5], string1, 0, strlen(string1));
						News[hTaken5] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Skasowa�e� wszystkie newsy z kana�u Hitman Agency.");
						return 0;
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_WHITE, "U�YJ: News delete [numer] lub News delete all.");
					    return 0;
                    }
				}
				else { return 0; }
		}
		else if ((strcmp("Givehit", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Givehit")))
		{
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Musisz mie� 4 rang� aby dawa� kontrakty Hitmanom !");
		        return 0;
		    }
		    if(hitfound == 0)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Nie sprawdzi�e� jeszcze kontrakt�w, zr�b to w laptopie (wpisz 'kontrakty') !");
		        return 0;
		    }
		    tmp = strtok(text, idx);
		    if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "U�YJ: Givehit [playerid/Cz��Nicku]");
				return 0;
			}
			//giveplayerid = strval(tmp);
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
				    if(!IsAHA(giveplayerid))
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Ten gracz nie jest Hitmanem !");
						return 0;
				    }
				    if(GoChase[giveplayerid] < 999)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Ten Hitman wykonuje ju� jakie� zlecenie !");
						return 0;
				    }
				    if(IsPlayerConnected(hitmanid))
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        GetPlayerName(giveplayerid, giver, sizeof(giver));
				        GetPlayerName(hitmanid, giveplayer, sizeof(giveplayer));

		    			format(string, sizeof(string), "* Hitman %s, da� zlecenie %s na zabicie: %s(ID:%d), nagroda: $%d.", sendername, giver, giveplayer, hitmanid, PlayerInfo[hitmanid][pHeadValue]);
		    			SendFamilyMessage(8, COLOR_YELLOW, string);
		    			GoChase[giveplayerid] = hitmanid;
		    			GetChased[hitmanid] = giveplayerid;
		    			GotHit[hitmanid] = 1;
		    			hitmanid = 0;
		    			hitfound = 0;
				        return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "Osoby, na kt�r� jest zlecenie, nie ma na serwerze. Spr�buj p�niej !");
				        return 0;
				    }
				}
				return 0;
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "Tego gracza nie ma na serwerze lub nie jest Hitmanem !");
			    return 0;
			}
		}
		else if ((strcmp("Ranks", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Ranks")) || (strcmp("Rangi", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Rangi")))
		{
			SendClientMessage(playerid, COLOR_WHITE, "|__________________ Rangi Hitman�w __________________|");
		    foreach(Player, i)
			{
				if(IsPlayerConnected(i))
				{
				    if(PlayerInfo[i][pMember] == 8||PlayerInfo[i][pLider] == 8)
				    {
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
				        format(string, sizeof(string), "* %s: Ranga %d", giveplayer,PlayerInfo[i][pRank]);
						SendClientMessage(playerid, COLOR_GREY, string);
					}
				}
			}
		}
		else if ((strcmp("Order", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Order")))
		{
		    if(OrderReady[playerid] > 0)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Zam�wi�e� ju� paczki z broni�, id� do swojej bazy aby je odebra� !");
		        return 0;
		    }
		    tmp = strtok(text, idx);
		    if ((strcmp("1", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("1")))
			{
			    //if(PlayerInfo[playerid][pRank] < 0) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 2499)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczk� numer 1 ($2500), zostanie dostarczona do drzwi Agencji.");
			        OrderReady[playerid] = 1;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
		    else if ((strcmp("2", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("2")))
			{
			    if(PlayerInfo[playerid][pRank] < 1) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 4999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczk� numer 2 ($5000), zostanie dostarczona do drzwi Agencji.");
			        OrderReady[playerid] = 2;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("3", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("3")))
			{
			    if(PlayerInfo[playerid][pRank] < 2) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 5999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczke numer 3 ($6000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 3;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("4", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("4")))
			{
			    if(PlayerInfo[playerid][pRank] < 2) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 5999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczke numer 4 ($6000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 4;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("5", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("5")))
			{
			    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 7999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczke numer 5 ($8000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 5;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("6", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("6")))
			{
			    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 7999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczke numer 6 ($8000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 6;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("7", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("7")))
			{
			    if(PlayerInfo[playerid][pRank] < 4) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 8499)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczke numer 7 ($8500), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 7;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("8", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("8")))
			{
			    if(PlayerInfo[playerid][pRank] < 4) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 8499)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczke numer 8 ($8500), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 8;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("9", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("9")))
			{
			    if(PlayerInfo[playerid][pRank] < 5) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 9999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczke numer 9 ($10000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 9;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("10", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("10")))
			{
			    if(PlayerInfo[playerid][pRank] < 5) { SendClientMessage(playerid, COLOR_GREY, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 9999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Zam�wi�e� paczke numer 10 ($10000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 10;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE, "|__________________ Dost�pne paczki __________________|");
			    if(PlayerInfo[playerid][pRank] >= 0) { SendClientMessage(playerid, COLOR_GREY, "|(1) ($2500) Ranga 0: N�, Desert Eagle, Shotgun, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 1) { SendClientMessage(playerid, COLOR_GREY, "|(2) ($5000) Ranga 1: N�, Desert Eagle, MP5, Shotgun, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 2) { SendClientMessage(playerid, COLOR_GREY, "|(3) ($6000) Ranga 2: N�, Desert Eagle, M4, MP5, Shotgun, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 2) { SendClientMessage(playerid, COLOR_GREY, "|(4) ($6000) Ranga 2: N�, Desert Eagle, AK47, MP5, Shotgun, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 3) { SendClientMessage(playerid, COLOR_GREY, "|(5) ($8000) Ranga 3: N�, Desert Eagle, M4, MP5, Shotgun, Snajperka, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 3) { SendClientMessage(playerid, COLOR_GREY, "|(6) ($8000) Ranga 3: N�, Desert Eagle, AK47, MP5, Shotgun, Snajperka, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 4) { SendClientMessage(playerid, COLOR_GREY, "|(7) ($8500) Ranga 4: N�, Desert Eagle, M4, MP5, Spas12, Snajperka, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 4) { SendClientMessage(playerid, COLOR_GREY, "|(8) ($8500) Ranga 4: N�, Desert Eagle, AK47, MP5, Spas12, Snajperka, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 5) { SendClientMessage(playerid, COLOR_GREY, "|(9) ($10000) Ranga 5-9: N�, Desert Eagle, M4, UZI, Spas12, Snajperka, Pancerz"); }
                if(PlayerInfo[playerid][pRank] >= 5) { SendClientMessage(playerid, COLOR_GREY, "|(10) ($10000) Ranga 5-9: N�, Desert Eagle, AK47, UZI, Spas12, Snajperka, Pancerz"); }
				SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________________|");
			    return 0;
			}
		}
		else if ((strcmp("Logout", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Logout")) || (strcmp("Wyloguj", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Wyloguj")))
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Wy��czy�e� sw�j laptop i zerwa�e� po��czenie z agencj�.");
      		ConnectedToPC[playerid] = 0;
		    return 0;
		}
		else
		{
		    SendClientMessage(playerid, COLOR_WHITE, "|___ Hitman Agency ___|");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - News");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Kontrakty");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Givehit");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Backup");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Order");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Rangi");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Wyloguj");
		    SendClientMessage(playerid, COLOR_YELLOW2, "|");
			SendClientMessage(playerid, COLOR_WHITE, "|______________|00:00|");
		    return 0;
		}
	    return 0;
	}
	if(CallLawyer[playerid] == 111)
	{
	    new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("tak", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("tak")))
		{
		    GetPlayerName(playerid, sendername, sizeof(sendername));
		    format(string, sizeof(string), "** %s jest w wi�zieniu i potrzebuje prawnika, jed� na komisariat.", sendername);
	    	SendJobMessage(2, TEAM_AZTECAS_COLOR, string);
	    	SendJobMessage(2, TEAM_AZTECAS_COLOR, "* Kiedy b�dziesz juz na komisariacie, spytaj si� policjanta o /akceptuj prawnik.");
	    	SendClientMessage(playerid, COLOR_LIGHTRED, "Je�li policjant si� zgodzi, prawnik b�dzie m�g� uwolni� ci� za op�at�.");
	    	WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
	    	return 0;
		}
		else
		{
		    SendClientMessage(playerid, COLOR_LIGHTRED, "Nie ma �adnych prawnik�w na serwerze, czas odsiadki rozpocz�ty.");
		    WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
		    return 0;
		}
	}
	if(TalkingLive[playerid] != INVALID_PLAYER_ID)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLider] == 9)
		{
		    format(string, sizeof(string), "Reporter %s: %s", sendername, text);
			OOCNews(COLOR_LIGHTGREEN, string);
		}
		else
		{
		    format(string, sizeof(string), "Go�� wywiadu %s: %s", sendername, text);
			OOCNews(COLOR_LIGHTGREEN, string);
		}
		return 0;
	}
	if(Mobile[playerid] != INVALID_PLAYER_ID && Callin[playerid] != CALL_NONE)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s m�wi (telefon): %s", sendername, text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);

		if(Mobile[playerid] < EMERGENCY_NUMBERS)
		{
			new org = (Mobile[playerid] - EMERGENCY_NUMBERS) * -1; //wz�r na wy�uskanie organizacji z numeru
			if(Mobile[playerid] == POLICE_NUMBER || Mobile[playerid] == SHERIFF_NUMBER)
			{
				if(strlen(text) > 82)
				{
					SendClientMessage(playerid, COLOR_ALLDEPT, "Centrala: Niestety, nie rozumiem. Prosz� powt�rzy� ((max 75 znak�w))");
					return 0;
				}
				new id, message[128];
				mysql_real_escape_string(text, message);
				new Hour, Minute;
				gettime(Hour, Minute);
				new datapowod[160];
				format(datapowod, sizeof(datapowod), "%02d:%02d",  Hour, Minute);
				new pZone[MAX_ZONE_NAME];
				GetPlayer2DZone(giveplayerid, pZone, MAX_ZONE_NAME);

				if(Mobile[playerid] == POLICE_NUMBER)
				{
					id = getWolneZgloszenie();
				}
				else //SHERIFF_NUMBER
				{
					id = getWolneZgloszenieSasp();
				}

				strmid(Zgloszenie[id][zgloszenie_kiedy], datapowod, 0, sizeof(datapowod), 36);
				format(Zgloszenie[id][zgloszenie_nadal], MAX_PLAYER_NAME, "%s", GetNick(playerid, true));
				format(Zgloszenie[id][zgloszenie_lokacja], MAX_ZONE_NAME, "%s", pZone);
				strmid(Zgloszenie[id][zgloszenie_tresc], message, 0, strlen(message) + 9, 128);
				Zgloszenie[id][zgloszenie_status] = 0;
			}

			new turner[MAX_PLAYER_NAME];
			new wanted[128];
			GetPlayerName(playerid, turner, sizeof(turner));
			SendClientMessage(playerid, TEAM_CYAN_COLOR, "Centrala: Zg�osimy to wszystkim jednostkom w danym obszarze.");
			SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dzi�kujemy za zg�oszenie");
			format(wanted, sizeof(wanted), "Centrala: Do wszystkich jednostek! Nadawca: %s", turner);
			SendFamilyMessage(org, COLOR_ALLDEPT, wanted);
			format(wanted, sizeof(wanted), "Centrala: Otrzymano zg�oszenie: %s", text);
			SendFamilyMessage(org, COLOR_ALLDEPT, wanted);

			SendClientMessage(playerid, COLOR_GRAD2, "Rozmowa zako�czona...");
			StopACall(playerid);
		}
		else
		{
			new reciverid = Mobile[playerid];
			if(RingTone[reciverid] != 0)
			{
				sendErrorMessage(playerid, "Gracz jeszcze nie odebra� telefonu!");
			}
			else if(IsPlayerConnected(Mobile[playerid]))
			{
				new slotKontaktu = PobierzSlotKontaktuPoNumerze(Mobile[playerid], PlayerInfo[playerid][pPnumber]);
				if(slotKontaktu >= 0)
				{
					format(string, sizeof(string), "%s (nr %d): %s", Kontakty[Mobile[playerid]][slotKontaktu][eNazwa], PlayerInfo[playerid][pPnumber], text);
				}
				else
				{
					format(string, sizeof(string), "Telefon (nr %d): %s", PlayerInfo[playerid][pPnumber], text);
				}
				SendClientMessage(Mobile[playerid], COLOR_YELLOW, string);
			}
			else
			{
				SendClientMessage(playerid, COLOR_YELLOW, "Nikt si� nie odzywa.");
			}
		}
		return 0;
	}
	if (realchat)
	{
	    if(gPlayerLogged[playerid] == 0)
	    {
	        return 0;
      	}
        if(strlen(text) < 78)
        {
            format(string, sizeof(string), "%s m�wi: %s", GetNick(playerid, true), text);
            ProxDetector(10.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
            SetPlayerChatBubble(playerid,text,COLOR_FADE1,10.0,8000);
        }
        else
        {
            new pos = strfind(text, " ", true, strlen(text) / 2);
            if(pos != -1)
            {
                new text2[64];

                strmid(text2, text, pos + 1, strlen(text));
                strdel(text, pos, strlen(text));

                format(string, sizeof(string), "%s m�wi: %s [.]", GetNick(playerid, true), text);
                ProxDetector(13.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);

                format(string, sizeof(string), "[.] %s", text2);
                ProxDetector(13.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
            }
        }
		return 0;
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerText - end", GetNick(playerid), playerid);
	#endif
	return 1;
}//OnPlayerText

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerSelectDynamicObject - begin", GetNick(playerid), playerid);
	#endif
    if(GetPVarInt(playerid, "Allow-edit"))
    {
        EditDynamicObject(playerid, objectid);
        new lStr[32];
        format(lStr, 32, "OBJID: %d", objectid);
        SendClientMessage(playerid, -1, lStr);
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerSelectDynamicObject - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerEnterGangZone(playerid, zoneid)
{
    if(ZONE_DISABLED == 0) {
        new frac=GetPlayerFraction(playerid), org = GetPlayerOrg(playerid);
        if(FRAC_GROOVE <= frac <= FRAC_VAGOS || frac == FRAC_WPS || GetPlayerOrgType(playerid) == ORG_TYPE_GANG)
        {
            ZoneTXD_Show(playerid, zoneid);
            if(ZonePlayerTimer[playerid] == 0) ZonePlayerTimer[playerid] = SetTimerEx("Zone_HideInfo", 30000, 0, "i", playerid);
        }
        //Attack sync
        if(ZoneAttack[zoneid] && PlayerInfo[playerid][pBW] == 0)
        {
            if(frac == ZoneAttackData[zoneid][2] || org == ZoneAttackData[zoneid][2]) // attacker
            {
                if(!ZoneAttacker[playerid])
                {
                    ZoneAttacker[playerid] = true;
                    ZoneAttackData[zoneid][0]++;
                }
            }
            else if(frac == ZoneAttackData[zoneid][3] || org == ZoneAttackData[zoneid][3]) // defender
            {
                if(!ZoneDefender[playerid])
                {
                    ZoneDefender[playerid] = true;
                    ZoneAttackData[zoneid][1]++;
                }
            }
        }
    }
}

public OnPlayerLeaveGangZone(playerid, zoneid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerLeaveGangZone - begin", GetNick(playerid), playerid);
	#endif
    if(zoneid < 0)
    {
        printf("Invalid zoneid (%d) for player %d", zoneid, playerid);
        return;
    }
    if(ZonePlayerTimer[playerid] != 0)
    {
        ZoneTXD_Hide(playerid);
        KillTimer(ZonePlayerTimer[playerid]);
        ZonePlayerTimer[playerid] = 0;
    }
    //Attack sync
    if(ZoneAttack[zoneid])
    {
        if(GetPlayerFraction(playerid) == ZoneAttackData[zoneid][2] || GetPlayerOrg(playerid) == ZoneAttackData[zoneid][2]) // attacker
        {
            if(ZoneAttacker[playerid])
            {
                ZoneAttacker[playerid] = false;
                ZoneAttackData[zoneid][0]--;
            }
        }
        else if(GetPlayerFraction(playerid) == ZoneAttackData[zoneid][3] || GetPlayerOrg(playerid) == ZoneAttackData[zoneid][3]) // defender
        {
            if(ZoneDefender[playerid])
            {
                ZoneDefender[playerid] = false;
                ZoneAttackData[zoneid][1]--;
            }
        }
    }
    SetPVarInt(playerid, "zoneid", -1);
	#if DEBUG == 1
		printf("%s[%d] OnPlayerLeaveGangZone - end", GetNick(playerid), playerid);
	#endif
}

public OnTrailerUpdate(playerid, vehicleid)
{
    return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
    return 1;
}

public MRP_ChangeVehicleColor(vehicleid, color1, color2)
{
    new bool:save=false;
    if(CarData[VehicleUID[vehicleid][vUID]][c_Color][0] != color1 || CarData[VehicleUID[vehicleid][vUID]][c_Color][1] != color2)
        save = true;
    if(color1 != -1)
        CarData[VehicleUID[vehicleid][vUID]][c_Color][0] = color1;
    if(color2 != -1)
        CarData[VehicleUID[vehicleid][vUID]][c_Color][1] = color2;
    if(save)
        Car_Save(VehicleUID[vehicleid][vUID], CAR_SAVE_TUNE);
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    return 1;
}

public OnDynamicObjectMoved(objectid)
{
	#if DEBUG == 1
		printf("%d OnDynamicObjectMoved - begin", objectid);
	#endif
    if(ScenaCreated)
    {
        if(objectid == ScenaScreenObject)
        {
            Scena_ScreenEffect();
            return 1;
        }
        for(new i=0;i<2;i++)
        {
            if(objectid == ScenaNeonData[SCNeonObj][i])
            {
                if(ScenaNeonData[SCNeonTyp] == 2)
                {
                    ScenaNeonData[SCNeonZderzacz]++;
                    if(ScenaNeonData[SCNeonZderzacz] == 2) Scena_NeonEffect();
                }
                else Scena_NeonEffect();
                return 1;
            }
        }
    }
	#if DEBUG == 1
		printf("%d OnDynamicObjectMoved - end", objectid);
	#endif
    return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	#if DEBUG == 1
		printf("%s[%d] OnVehicleRespray - begin", GetNick(playerid), playerid);
	#endif
    if(CarData[VehicleUID[vehicleid][vUID]][c_Color][0] != color1)
    {
        ChangeVehicleColor(vehicleid, CarData[VehicleUID[vehicleid][vUID]][c_Color][0], CarData[VehicleUID[vehicleid][vUID]][c_Color][1]);
        return 0;
    }
    if(CarData[VehicleUID[vehicleid][vUID]][c_Color][1] != color2)
    {
        ChangeVehicleColor(vehicleid, CarData[VehicleUID[vehicleid][vUID]][c_Color][0], CarData[VehicleUID[vehicleid][vUID]][c_Color][1]);
        return 0;
    }

	#if DEBUG == 1
		printf("%s[%d] OnVehicleRespray - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
    if(GetPVarInt(forplayerid, "tognick") == 1)
        ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);

    return 1;
}

AntiDeAMX()
{
    new a[][] = {
        "Trololo (Wpierdol)",
        "Brass K"
    };
    #pragma unused a
}

WasteDeAMXersTime()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}

//Koniec.
