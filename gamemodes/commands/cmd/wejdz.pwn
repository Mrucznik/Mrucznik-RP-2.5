//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wejdz ]-------------------------------------------------//
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

YCMD:wejdz(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		PlayerPlaySound(playerid, 1, 0.0, 0.0, 0.0);
		
//======================================================================
//=================[Przeniesione - na nowy system]======================
//======================================================================
		

		if(DoorInfo[FRAC_LCN][d_State])
		{
			WejdzInt(playerid, 725.6371, -1440.3321, 13.5360, 734.0619, -1451.6720, 22.5920, 3.0, 0, 255, "Dania, alkohole, fortuna!", PLOCAL_DEFAULT, "~w~Witamy w Jetty Lounge by ~n~~h~~g~Albert ~w~& ~h~~y~Patryk");//Jetty
		}
		
//======================================================================
//=================[Wczytanie - nowego systemu]=====================
//======================================================================
        if(GetPVarInt(playerid, "AC-izolacja") != 0) return sendTipMessageEx(playerid, COLOR_PANICRED, "Jeste� odizolowany, nie mo�esz u�ywa� tej komendy.");
        
        if(SprawdzWejscia(playerid))
            return 1;
        
//======================================================================
//==================[Windy pod /wejdz]==================================
//======================================================================
		
        else if(IsPlayerInRangeOfPoint(playerid, 5.0, 694.27490234375,-569.04272460938,-79.225189208984) || IsPlayerInRangeOfPoint(playerid, 3.0, 700.6748046875,-502.41955566406,23.515483856201) || IsPlayerInRangeOfPoint(playerid, 5.0, 707.06085205078,-508.38107299805,27.871946334839))//rada miasta dillimore (miasteczko) windy
        {
            ShowPlayerDialogEx(playerid, 121, DIALOG_STYLE_LIST, "Wybierz pomieszczenie", "Salka Konferencyjna\nBiura\nPiwnice", "Wybierz", "Wyjd�");
        }
        else if(IsPlayerInRangeOfPoint(playerid,3,1450.6615,-1819.2279,77.9613) 
			||  IsPlayerInRangeOfPoint(playerid,5,1412.3348388672, -1790.5777587891, 15.370599746704) && IsAUrzednik(playerid))
        {
            ShowPlayerDialogEx(playerid,122,DIALOG_STYLE_LIST,"Winda: Wybierz Pi�tro","[Poziom 0] Zaplecze\n[Poziom 9] G��wna sala urz�du","Wybierz","Wyjd�");
        }
        else if (IsPlayerInRangeOfPoint(playerid, 3.0, 1745.8119, -1129.8972, 24.0781) 
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 1746.0676, -1127.9219, 46.5746) 
		|| IsPlayerInRangeOfPoint(playerid, 3.0, 1746.2399, -1128.2211, 227.8059))
		{
            ShowPlayerDialogEx(playerid, D_WINDA_LSFD, DIALOG_STYLE_LIST, "Winda", "Gara�\nPierwsze pi�tro\nDrugie pi�tro\nDach", "Wybierz", "Wyjd�");
		}
        else if(IsPlayerInRangeOfPoint(playerid,4,1568.7660,-1691.4886,5.8906) && IsACop(playerid)//parking Dolny LSPD 1568.7660,-1691.4886,5.8906
        || IsPlayerInRangeOfPoint(playerid,4,-1645.1858, 883.1620, -45.4112)//z glownego wejscia
        || IsPlayerInRangeOfPoint(playerid,4,-1621.7272, 834.5807, -26.1115)//sale przesluchan
        || IsPlayerInRangeOfPoint(playerid,4,-1745.1101, 824.0737, -48.0110)//biura LSPD
        || IsPlayerInRangeOfPoint(playerid,4,-1695.1617, 1046.9861, -65.4119)//stolowka
        || IsPlayerInRangeOfPoint(playerid,4,1568.1061, 2205.3196, -50.9522)//treningowe miejsca
        || IsPlayerInRangeOfPoint(playerid,4,1565.0798, -1665.6580, 28.4782) && IsACop(playerid)//dach lspd
        || IsPlayerInRangeOfPoint(playerid,4,1570.9799,-1636.7758,13.5713) && IsACop(playerid))//gorny LSPD
        {
            ShowPlayerDialogEx(playerid,WINDA_LSPD,DIALOG_STYLE_LIST,"Winda","[Poziom -1]Parking Dolny\n[Poziom 0] Parking G�rny\n[Poziom 1]Komisariat\n[Poziom 2]Pokoje Przes�ucha�\n[Poziom 3]Biura\n[Poziom 4]Sale Treningowe\n[Poziom 5]Dach","Jedz","");
        }
        //else if(IsPlayerInRangeOfPoint(playerid,3,-2089.55835, -414.24173, 36.32352)//Podziemia BOR
        else if((IsPlayerInRangeOfPoint(playerid,3,1498.9341,-1537.0797,67.3069) && IsABOR(playerid))//Podziemia BOR
        || IsPlayerInRangeOfPoint(playerid,3,1772.1613,-1547.9675,9.9067)
        || IsPlayerInRangeOfPoint(playerid,3,1496.9330, -1457.8887, 64.5854)
        || IsPlayerInRangeOfPoint(playerid,3, 1482.2319, -1531.1719, 70.0080)
        || IsPlayerInRangeOfPoint(playerid,3, 1795.4104,-1551.2864,22.9192)&& IsABOR(playerid))//dach BOR
        {
            ShowPlayerDialogEx(playerid, 696, DIALOG_STYLE_LIST, "Winda:", "[Poziom -1] Parking podziemny\n[Poziom 0] Parking zewn�trzny\n[Poziom 1] Centrala GSA\n[Poziom 2] Sale Treningowe\n[Poziom 3] Dach", "Wybierz", "Anuluj");
        }
		else if(IsPlayerInRangeOfPoint(playerid,5,288.0914,-1609.7465,17.9994)//parking SAN News
        || IsPlayerInRangeOfPoint(playerid, 3, 287.7476,-1609.9395,33.0723)//PARTER
        || IsPlayerInRangeOfPoint(playerid,3,292.0818,-1610.0715,124.7512)//recepcja Winda
        || IsPlayerInRangeOfPoint(playerid,3,296.9033,-1598.3610,117.0619)/* Studia */
        || IsPlayerInRangeOfPoint(playerid,3,295.1328,-1609.4705,115.6818)/*Akademia */
        || IsPlayerInRangeOfPoint(playerid,3,297.7128,-1612.1783,114.4219)/*Dach*/
        || IsPlayerInRangeOfPoint(playerid,3,290.7577,-1604.3273,134.6113)/*Biura SAN NEWS*/)
        {
            ShowPlayerDialogEx(playerid,WINDA_SAN,DIALOG_STYLE_LIST,"Winda - San News","[Pietro - 0] Parking\n[Pietro 1] Wejscie do budynku\n[Pietro - 2] Recepcja\n[Pietro - 3] Studia\n[Pietro - 4] Akademia\n[Pietro - 5]Biura San News\n[Pietro - 6]Dach","Jedz","Anuluj");
        }
        //winda FBI
		else if(IsPlayerInRangeOfPoint(playerid,2,586.83704, -1473.89270, 89.30576)//przy recepcji
		|| IsPlayerInRangeOfPoint(playerid,2,592.65466, -1486.76575, 82.10487)//szatnia
		|| IsPlayerInRangeOfPoint(playerid,2,591.37579, -1482.26672, 80.43560)//zbrojownia
		|| IsPlayerInRangeOfPoint(playerid,2,596.21857, -1477.92395, 84.06664)//biura federalne
		|| IsPlayerInRangeOfPoint(playerid,2,589.23029, -1479.66357, 91.74274)//Dyrektorat
		|| IsPlayerInRangeOfPoint(playerid,2,613.4404,-1471.9745,73.8816)//DACH
		|| IsPlayerInRangeOfPoint(playerid,2,596.5255, -1489.2544, 15.3587)//Parking
		|| IsPlayerInRangeOfPoint(playerid,2,1093.0625,1530.8715,6.6905)//Parking podziemny
		|| IsPlayerInRangeOfPoint(playerid,2,585.70782, -1479.54211, 99.01273)//CID/ERT
		|| IsPlayerInRangeOfPoint(playerid,2,594.05334, -1476.27490, 81.82840)//stanowe
		|| IsPlayerInRangeOfPoint(playerid,2,590.42767, -1447.62939, 80.95732))//Sale Treningowe
		{
			ShowPlayerDialogEx(playerid,19,DIALOG_STYLE_LIST,"Winda FBI","[Poziom -1]Parking podziemny \n[Poziom 0]Parking\n[Poziom 0.5] Stanowe\n[Poziom 1]Recepcja\n[Poziom 2] Szatnia\n[Poziom 3] Zbrojownia \n[Poziom 4]Biura federalne \n[Poziom 5] Dyrektorat\n[Poziom 6]CID/ERT\n[Poziom 7]Sale Treningowe \n [Poziom X] Dach","Jedz","Anuluj");
        }
		else if (IsPlayerInRangeOfPoint(playerid, 5.0, 1271.0920,-1667.8794,19.7344)) // strzelnica wej�cie
        {
            if(GUIExit[playerid] == 0)
            {
                ShowPlayerDialogEx(playerid, 324, DIALOG_STYLE_LIST, "Tory szkoleniowe", "Strzelnica w budynku\nStrzelnica w terenie\nSkoki spadochronowe\nTor szkoleniowy ' Porwanie w domu '\nTor szkoleniowy ' Terrory�ci na statku '", "Wybierz", "Anuluj");
                return 1;
            }
        }
        //SAD
        else if(IsPlayerInRangeOfPoint(playerid,3,1311.5483,-1361.2096,62.8567)
        || IsPlayerInRangeOfPoint(playerid,3,1305.9991,-1326.1344,52.5659)
        || IsPlayerInRangeOfPoint(playerid,3,1309.9982,-1364.2216,59.6271)
        || IsPlayerInRangeOfPoint(playerid,3,1310.1989,-1328.8876,82.5859)
        || IsPlayerInRangeOfPoint(playerid,3,1310.2946,-1321.2517,74.6955)
        || IsPlayerInRangeOfPoint(playerid,3,1310.3961,-1319.0530,35.6587))
        { //WINDA
            ShowPlayerDialogEx(playerid, DIALOG_ELEVATOR_SAD, DIALOG_STYLE_LIST, "Winda:", "{660000}[-1] {D2CFA6} Archiwum\n{660000}[0] {D2CFA6} Recepcja\n{660000}[1] {D2CFA6} Sale Rozpraw\n{660000}[2] {D2CFA6} Biura\n{660000}[3] {D2CFA6} Pomieszczenia Socjalne\n{660000}[4] {D2CFA6} Dach", "Wybierz", "Anuluj");
        }
		else if(IsPlayerInRangeOfPoint(playerid,2.0, 1144.4740, -1333.2556, 13.8348) ||
        IsPlayerInRangeOfPoint(playerid,2.0, -2805.0967,2596.0566,-98.0829) ||
        IsPlayerInRangeOfPoint(playerid,2.0,1134.0449,-1320.7128,68.3750)||
        IsPlayerInRangeOfPoint(playerid,2.0,1183.3129,-1333.5684,88.1627)||
        IsPlayerInRangeOfPoint(playerid,2.0,1168.2112,-1340.6785,100.3780)||
        IsPlayerInRangeOfPoint(playerid,2.0,1158.6868,-1339.4423,120.2738)||
        IsPlayerInRangeOfPoint(playerid,2.0,1167.7832,-1332.2727,134.7856)||
        IsPlayerInRangeOfPoint(playerid,2.0,1177.4791,-1320.7749,178.0699)||
        IsPlayerInRangeOfPoint(playerid,2.0,1178.2081,-1330.6317,191.5315)||
        IsPlayerInRangeOfPoint(playerid,2.0, 1161.8228, -1337.0521, 31.6112))
        {
            ShowPlayerDialogEx(playerid, D_ELEVATOR_LSMC, DIALOG_STYLE_LIST, "Winda szpitalna:", "{660000}[-1] {D2CFA6}Kostnica i laboratorium\n{660000}[0] {D2CFA6}Parking wewn�trzny\n{660000}[1] {D2CFA6}Izba przyj��\n{660000}[2] {D2CFA6}Strefa pracownika\n{660000}[3] {D2CFA6}Sale operacyjne\n{660000}[4] {D2CFA6}Sale pooperacyjne\n{660000}[5] {D2CFA6}Sale specjalistyczne\n{660000}[6] {D2CFA6}Akademia medyczna\n{660000}[7] {D2CFA6}Gabinety ordynator�w\n{660000}[8] {D2CFA6}Dach szpitala", "Wybierz", "Anuluj");
        }
		
//======================================================================
//=================[SAMOLOT DLA KORPORACJI TRANSP.]=====================
//======================================================================

        //Wejscie do kokpitu at400
        else if (PlayerToPoint(2.0, playerid,0.1389+KTAir_Offsets[0],33.2975+KTAir_Offsets[1],0.5391+100+KTAir_Offsets[2]))
        {
            if(!IsPlayerInFraction(playerid, FRAC_KT, 5000)) return GameTextForPlayer(playerid, "Tylko piloci!", 2000, 3);
            new seat, lVeh;
            for(new i=0;i<MAX_VEHICLES;i++)
            {
                if(GetVehicleModel(i) == 577)
                {
                    lVeh = i;
                    break;
                }
            }
            foreach(new i : Player)
            {
                if(GetPlayerVehicleID(i) == lVeh)
                {
                    seat++;
                }
            }
            if(seat > 1) return GameTextForPlayer(playerid, "Brak miejsc", 2000, 3);
            new Float:PosX,Float:PosY,Float:PosZ;

            GetVehiclePos(lVeh,PosX,PosY,PosZ);
            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerPosEx(playerid, PosX, PosY, PosZ);
            PutPlayerInVehicleEx(playerid, lVeh, seat);
            GameTextForPlayer(playerid, "Chwytaj za stery!", 2000, 5);
        }
        //Lotnisko LS wej�cie do AT400
        else if (PlayerToPoint(2.0, playerid,1937.5,-2275.8,16.9) || PlayerToPoint(2.0, playerid,-1360.0999755859, -239.89999389648, 17.60000038147) || PlayerToPoint(2.0, playerid,1581.6999511719, 1444.5, 14.10000038147))//LS
        {
            new Float:PosX,Float:PosY,Float:PosZ;
            for(new i=0;i<MAX_VEHICLES;i++)
            {
                if(GetVehicleModel(i) == 577)
                {
                    GetVehiclePos(i,PosX,PosY,PosZ);
                    break;
                }
            }
            if(IsPlayerInRangeOfPoint(playerid, 25, PosX,PosY,PosZ))
            {
                if(planeisstopped == 1 || IsPlayerInFraction(playerid, FRAC_KT, 5000))
                {
                    if(PlayerInfo[playerid][pBiletsamolotowy]==1 || IsPlayerInFraction(playerid, FRAC_KT, 5000))
                    {
                        GameTextForPlayer(playerid, "Witamy w samolocie! Znajd� swoje miejsce", 4000, 3);
                        SetPlayerPosEx(playerid, 3.5040+KTAir_Offsets[0],30.7375+KTAir_Offsets[1],0.5391+100+KTAir_Offsets[2]);
                        SetPlayerVirtualWorld(playerid, 2);
                        //PlayerInfo[playerid][pBiletsamolotowy]=0;
                        PlayerInfo[playerid][pWsamolocieLS]=1;
                        osoby++;
                        Wchodzenie(playerid);
                    }
                    else
                    {
                        GameTextForPlayer(playerid, "~r~Nie masz biletu", 5000, 1);
                    }
                }
                else
                {
                    sendTipMessageEx(playerid, COLOR_GREY, "Drzwi samolotu s� zamkni�te !");
                }
            }
            else
            {
                 sendTipMessageEx(playerid, COLOR_GREY, "Nie ma w pobli�u samolotu !");
            }
        }
        //Wejcie do srodka int z biletem
        else if (PlayerToPoint(3.0, playerid,1886.1,-2286.4,14))
        {
            SetPlayerPosEx(playerid, 1605,-2282.9,-74.90);
            Wchodzenie(playerid);
        }
//====================================[SAMOLOT END]=================================================
        
        
//======================================================================
//=================[Nieznane - nieokre�lone - nieprzeniesione]==========
//======================================================================

        
       //chwilowe do vinyl
        else if(PlayerToPoint(1.5, playerid, 814.4426,-1378.2600,23.6475))
        {
            if(GetPVarInt(playerid, "Vinyl-bilet") < 1 && PlayerInfo[playerid][pMember] != 9 && PlayerInfo[playerid][pLider] != 9)
            {
                sendErrorMessage(playerid, "Nie posiadasz biletu do Vinyla!"); 
                return 1;
            }
            if(vinylStatus == 0)
            {
                sendTipMessage(playerid, "Vinyl jest aktualnie zamkni�ty! Skontaktuj si� z w�a�cicielem klubu."); 
                return 1;
            }
            SetPLocal(playerid, PLOCAL_ORG_SN); 
            SetPlayerPosEx(playerid, 817.0987,-1375.1685,23.6475);
            GameTextForPlayer(playerid, "~w~Witamy w klubie", 5000, 1);
            Wchodzenie(playerid);
            return 1;
        }
        //san news biura
        else if(PlayerToPoint(1.0, playerid, 286.0645,-1602.0117,134.4274) && posDrzwiSN[playerid] == 0)
        {
            sendTipMessageEx(playerid, COLOR_RED, "Witaj w biurze dyrektorki!"); 
            SetPlayerPosEx(playerid, 285.8782,-1604.2446,134.4756); 
            posDrzwiSN[playerid] = 1; 
            return 1;
        }
        else if(PlayerToPoint(1.0, playerid, 285.8782,-1604.2446,134.4756) && posDrzwiSN[playerid] == 1)
        {
            SetPlayerPosEx(playerid, 286.0645,-1602.0117,134.4274); 
            posDrzwiSN[playerid] = 0; 
            return 1;
        }
        else if(PlayerToPoint(1.0, playerid, 298.0779,-1603.7250,134.4482) && posDrzwiSN[playerid] == 0)
        {
            sendTipMessageEx(playerid, COLOR_RED, "Witaj w biurze v-dyrektora!"); 
            SetPlayerPosEx(playerid, 297.9890,-1605.9541,134.4645); 
            posDrzwiSN[playerid] = 1; 
            return 1;
        }
        else if(PlayerToPoint(1.0, playerid, 297.9890,-1605.9541,134.4645) && posDrzwiSN[playerid] == 1)
        {
            SetPlayerPosEx(playerid, 298.0779,-1603.7250,134.4482); 
            posDrzwiSN[playerid] = 0; 
            return 1;
        }
       //reszta
        else if (PlayerToPoint(4.0, playerid,738.8545, -1428.7880, 13.5927)) //biura LCN
        {
            SetPlayerPosEx(playerid,738.5865, -1427.7610, 23.5927); //biura LCN wej�cie
            GameTextForPlayer(playerid,"~w~Witamy w biurach Jetty Lounge ~n~ ~b~ By ~r~_DywaniK_",5000,1);
            SetPlayerVirtualWorld(playerid, 2);
            Wchodzenie(playerid);
            return 1;
        }
        else if (PlayerToPoint(2.0, playerid,-2170.0593,641.1239,1052.3817)) //Zak�ad bukmaherski WEJSCIE NA GORE
        {
            SetPlayerPosEx(playerid,-2168.7502,636.2642,1052.7642); 
            GameTextForPlayer(playerid, "~w~Witamy NA GORZE", 5000, 1);
            SetPlayerInterior(playerid, 1);
            return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid,5,648.4412, -1357.3232, 13.8579))//recepcja wejscie glowne
        {
            SetPlayerPosEx(playerid,648.9127, -1367.4266, 29.2878);
            SetPlayerVirtualWorld(playerid,20);
            TogglePlayerControllable(playerid,0);
            Wchodzenie(playerid);
        }
        else if (PlayerToPoint(5.0, playerid,2420.9360,112.8245,29.0433)) //taras PD w PC
        {
            SetPlayerPosEx(playerid,214.9873,121.0619,999.0156); //Komisariat piwnice
            GameTextForPlayer(playerid, "~w~Witamy w Komisariacie.", 5000, 1);
            SetPlayerInterior(playerid,10);
            PlayerInfo[playerid][pInt] = 10;
            return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid,5,-1674.5769,903.1641,-48.9141) )//nowe komi wejscie prawnicze
        {
            if(ApprovedLawyer[playerid] == 1 || PlayerInfo[playerid][pMember] == FRAC_FBI)
                SetPlayerPosEx(playerid,-1674.4122,917.7183,-52.4141); //nowe komi drzwi w celach
            else
                SendClientMessage(playerid, COLOR_GRAD1, "Musisz mie� pozwolenie prawnicze aby przej��");

        }
		else if (IsPlayerInRangeOfPoint(playerid, 2.0, -2065.5505,575.6121,1173.0511)) // wejscie na balkon
        {
            SetPlayerPosEx(playerid, -2473.8140,2231.9236,8.9133); // balkon bay side
            SetPlayerInterior(playerid, 0);
            TogglePlayerControllable(playerid, 0);
            Wchodzenie(playerid);
            return 1;
        }
        else if (IsPlayerInRangeOfPoint(playerid, 5.0, 276.32934570313,122.20029449463,1004.1166992188)) // Pok�j przes�ucha� wejs
        {
            if(IsACop(playerid))
            {
                SetPlayerPosEx(playerid, 2371.5246582031, 586.56274414063, 4893.2431640625); // Pok�j przes�ucha� sro
                TogglePlayerControllable(playerid, 0);
                Wchodzenie(playerid);
                SetPlayerInterior(playerid, 10);
                return 1;
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "Tylko dla policjant�w i wi�ni�w w kajdankach");
                return 1;
            }
        }
		//AirTower LS
        else if(IsPlayerInRangeOfPoint(playerid,3.0,1635.3210, -2286.5698, 13.4162) && IsPlayerInFraction(playerid, FRAC_KT, 5000))
        {
            INT_AirTowerLS_Init(playerid);
            SetPlayerPosEx(playerid, 1627.3157,-2279.6157,75.0);
            GameTextForPlayer(playerid, "~w~/wieza", 2000, 1);
            Wchodzenie(playerid);
        }
       
//======================================================================
//=================[BASEN TSUNAMI WEJ�CIA]==============================
//======================================================================
        else if (IsPlayerInRangeOfPoint(playerid, 5.0,  1205.45874, -1765.66833, 13.54815)) // basen wej�cie
        {
			if(poolStatus == 1)
			{
				if(Kredyty[playerid] >= 200)
				{
					SetPlayerPosEx(playerid, 1213.3364,-1807.0619,70.0682); // basen �rodek
					GameTextForPlayer(playerid, "~w~Szatnie~n~ ~r~by Simeone & Sergio", 5000, 1);
					sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Aby si� przebra� podejd� do szafek i wpisz /przebierz");
					SetPlayerVirtualWorld(playerid, 43);
					TogglePlayerControllable(playerid, 0);
					Wchodzenie(playerid);
					Kredyty[playerid] -= 200;
					ResetPlayerWeapons(playerid);
					SetPVarInt(playerid, "mozeUsunacBronie", 1);
					
					new string[128];
					format(string, sizeof(string), "Pozosta�o Ci %d kredyt�w", Kredyty[playerid]);
					sendTipMessage(playerid, string);
					poolStats = poolStats+1;
					return 1;
				}
				else
				{
					sendTipMessageEx(playerid, COLOR_GREY, "Nie masz wystarczaj�cej ilo�ci kredyt�w.");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, -1, "Pani Janina m�wi: Przykro mi! Szef jeszcze nie otworzy�, przyjd� p�niej.");
				return 1;
			}
        }
        else if (IsPlayerInRangeOfPoint(playerid, 5.0, 1213.28540, -1790.80505, 70.25735)) // sauny wej�cie
        {
            if(Kredyty[playerid] >= 75)
            {
                SetPlayerPosEx(playerid, 1274.3020,-1756.0800,48.5812); // sauny �rodek
                GameTextForPlayer(playerid, "~w~Wypoc swoje ~r~Problemy", 5000, 1);
                SetPlayerVirtualWorld(playerid, 43);
                TogglePlayerControllable(playerid, 0);
                Wchodzenie(playerid);
                Kredyty[playerid] -=75;
				
				new string[128];
				format(string, sizeof(string), "Pozosta�o Ci %d kredyt�w", Kredyty[playerid]);
				sendTipMessage(playerid, string);
				poolSaunaStats = poolSaunaStats+1;
                return 1;
            }
            else
            {
                sendTipMessageEx(playerid, COLOR_GREY, "Nie masz wystarczaj�cej ilo�ci kredyt�w.");
                return 1;
            }
        }
        else if (IsPlayerInRangeOfPoint(playerid, 3.0, 598.6794,-2204.8613,1.8190)) // tylko dla personelu bar
        {
            SetPlayerPosEx(playerid, 1193.2720,-1774.8802,13.7282); // recepcja
            TogglePlayerControllable(playerid, 0);
            SetPlayerVirtualWorld(playerid, 43);
            Wchodzenie(playerid);
            return 1;
        }

        
//======================================================================
//=================[IBIZA WEJS�IA I SKRYPT==============================
//======================================================================
        //IBIZA
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 397.6700,-1811.8844,14.7359) && GetPlayerVirtualWorld(playerid) == 0)
        {
            if(!IbizaDach) return sendTipMessageEx(playerid, 0xB52E2BFF, "Wyj�cie na dach jest zamkni�te");
            Wchodzenie(playerid);
            SetPlayerPosEx(playerid, 1892.9077,-2451.8071,21.6559);
            SetPlayerFacingAngle(playerid, 178.8724);
            SetPlayerVirtualWorld(playerid, 1);
            SetPVarInt(playerid, "IbizaWejdz", 1);
            PlayAudioStreamForPlayer(playerid, IbizaStream[IbizaStreamID], 1942.0912,-2468.7349,15.5266, 50.0, 1);
            if(IbizaSwiatla) WlaczSwiatlaP(playerid);
            else WylaczSwiatlaP(playerid);
            return 1;

        }
        //wej�cie do bileterki
        else if(IsPlayerInRangeOfPoint(playerid, 12.0, 1740.8485,-2471.0625,14.2266) && GetPlayerOrg(playerid) == FAMILY_IBIZA && GetPlayerVirtualWorld(playerid) == 1) //RANGA
        {
            SetPlayerPosEx(playerid, 397.6122,-1806.0079,7.8381);
            SetPlayerFacingAngle(playerid, 0.8024);
            SetPlayerVirtualWorld(playerid, 0);
            SetPVarInt(playerid, "IbizaWejdz", 0);
            StopAudioStreamForPlayer(playerid);
            IbizaWyjscie(playerid);
            return 1;
        }

        //Wejscie gflowne prawe
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 394.2784,-1805.9104,7.8302) && GetPlayerVirtualWorld(playerid) == 0 )
        {
            if(IbizaZamek) return sendTipMessageEx(playerid, 0xB52E2BFF, "Klub jest w tej chwili zamkni�ty");
            if(!GetPVarInt(playerid, "IbizaBilet") && GetPlayerOrg(playerid) != FAMILY_IBIZA) return sendTipMessageEx(playerid, 0xB52E2BFF, "Nie posiadasz biletu, kup go w kasie"); //RANGA
            TogglePlayerControllable(playerid, false);
            Wchodzenie(playerid);
            SetPlayerPosEx(playerid, 1741.5828,-2473.1572,14.2266);
            SetPlayerFacingAngle(playerid, 271.2026);
            SetPlayerVirtualWorld(playerid, 1);
            SetPVarInt(playerid, "IbizaWejdz", 1);
            PlayAudioStreamForPlayer(playerid, IbizaStream[IbizaStreamID], 1942.0912,-2468.7349,15.5266, 250.0, 1);
            if(IbizaSwiatla) WlaczSwiatlaP(playerid);
            else WylaczSwiatlaP(playerid);
            SendClientMessage(playerid, -1, "=====Witamy w {00FF00}I{FFFFFF}biza {DE00FF}C{FFFFFF}lub=====");
            SendClientMessage(playerid, 0x88aa62FF, "((UWAGA! W naszym klubie cz�sto mo�na si� spotka� z wiadomo�ciami typu: Audio stream.. aby wy��czy� ten komunikat wpisz /audiomsg))");
            GameTextForPlayer(playerid, "~y~Projekt by Macias & Sonix", 5000, 1);
            return 1;
        }
        // Wejscie do glownej sali klubu
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1761.7330,-2471.2756,19.7275) && GetPlayerVirtualWorld(playerid) == 1 )
        {
            TogglePlayerControllable(playerid, false);
            SetPlayerPosEx(playerid, 1890.3613,-2494.6675,14.2266);
            SetPlayerFacingAngle(playerid, 268.8783);
            PlayAudioStreamForPlayer(playerid, IbizaStream[IbizaStreamID]);
            Wchodzenie(playerid);
            return 1;
        }
        // BAR - wejscie
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1898.4817,-2494.8752,13.6266) && GetPlayerVirtualWorld(playerid) == 1 && GetPlayerOrg(playerid) == FAMILY_IBIZA) //RANGA
        {
            SetPlayerPosEx(playerid, 1900.5961,-2494.9373,13.6266);
            SetPlayerFacingAngle(playerid, 271.5300);
            return 1;
        }
        // Dyrekcja - wejscie
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1915.1454,-2468.3472,15.4266) && GetPlayerVirtualWorld(playerid) == 1)
        {
            if(!IbizaBiuro) return sendTipMessageEx(playerid, 0xB52E2BFF, "Biuro jest w tej chwili zamkni�te");
            SetPlayerPosEx(playerid, 1911.5500,-2466.1172,17.9850);
            SetPlayerFacingAngle(playerid, 181.9157);
            PlayAudioStreamForPlayer(playerid, IbizaStream[IbizaStreamID], 1942.0912,-2468.7349,15.5266, 50.0, 1);
            return 1;
        }
        //wejscie od Zaplecza
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 386.2871,-1817.9784,7.8410) && GetPlayerVirtualWorld(playerid) == 0)
        {
            if(IbizaZamek) return sendTipMessageEx(playerid, 0xB52E2BFF, "Klub jest w tej chwili zamkni�ty");
            if(GetPlayerOrg(playerid) != FAMILY_IBIZA) return sendTipMessageEx(playerid, 0xB52E2BFF, "Nie mo�esz t�dy przej��, nie jeste� z Ibiza Club!"); //RANGA
            TogglePlayerControllable(playerid, false);
            SetPlayerPosEx(playerid, 1917.3785,-2465.4368,15.4266);
            SetPlayerFacingAngle(playerid, 180.7695);
            SetPlayerVirtualWorld(playerid, 1);
            SetPVarInt(playerid, "IbizaWejdz", 1);
            PlayAudioStreamForPlayer(playerid, IbizaStream[IbizaStreamID]);
            if(IbizaSwiatla) WlaczSwiatlaP(playerid);
            else WylaczSwiatlaP(playerid);
            Wchodzenie(playerid);
            return 1;
        }
        //wejscie ubikacja prawa
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1910.2588,-2474.8745,13.6266) && GetPlayerVirtualWorld(playerid) == 1)
        {
            SetPlayerPosEx(playerid, 1534.3746,-2553.6333,13.5890);
            SetPlayerFacingAngle(playerid, 268.5209);
            SetPVarInt(playerid, "IbizaKibel", 1);
            WlaczSwiatlaP(playerid);
            PlayAudioStreamForPlayer(playerid, IbizaStream[IbizaStreamID], 1942.0912,-2468.7349,15.5266, 500.0, 1);
            return 1;
        }
        //wejscie ubikacja lewa
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1906.1383,-2474.4417,13.6266) && GetPlayerVirtualWorld(playerid) == 1)
        {
            SetPlayerPosEx(playerid, 1534.2446,-2550.8020,13.5890);
            SetPlayerFacingAngle(playerid ,268.5209);
            SetPlayerVirtualWorld(playerid, 2);
            SetPVarInt(playerid, "IbizaKibel", 1);
            WlaczSwiatlaP(playerid);
            PlayAudioStreamForPlayer(playerid, IbizaStream[IbizaStreamID], 1942.0912,-2468.7349,15.5266, 500.0, 1);
            return 1;
        }
        else
        {
		
//======================================================================
//=================[Biznesy, domy i inny syf]===========================
//======================================================================
            Wejdz(playerid, 1285.5999755859,-981.79998779297,32.700000762939, 1300.0999755859,-1094.5999755859,5972.2001953125, 5.0);//int z flagami
            Wejdz(playerid, 1302.8000488281,-988.20001220703,38.299999237061, 1301.8000488281,-1083.9000244141,5972.2001953125, 5.0);//g��wne wej�cie
            Wejdz(playerid, -1716.1999511719,1018.200012207,17.60000038147, -1825.4000244141,1151.6999511719,6803.2998046875, 5.0);//WEJSCIE DO KRYJOWKI
            Wejdz(playerid, -1858.3000488281,1158.3000488281,6799, -1865.6999511719,1116.8000488281,6799.10009765, 2.0);//drzwi 1
            Wejdz(playerid, -1858.5,1160.5999755859,6799, -1877.1999511719,1178,6799.2998046875, 2.0);//drzwi 2
            
			//BIZNESY
            for(new i=0;i<MAX_BIZNES;i++)
			{
				if(IsPlayerInRangeOfPoint(playerid, 5.0, BizData[i][eBizWejX], BizData[i][eBizWejY], BizData[i][eBizWejZ]))
				{
					if(BizOpenStatus[i] == 0)
					{
						WejdzInt(playerid, BizData[i][eBizWejX],BizData[i][eBizWejY],BizData[i][eBizWejZ], BizData[i][eBizWyjX],BizData[i][eBizWyjY],BizData[i][eBizWyjZ], 3.0, BizData[i][eBizInt], BizData[i][eBizVw],"",BizData[i][epLocal]);
						//WejdzInt(playerid, BizData[2][eBizWejX],BizData[2][eBizWejY],BizData[2][eBizWejZ], BizData[2][eBizWyjX],BizData[2][eBizWyjY],BizData[2][eBizWyjZ], 3.0, BizData[2][eBizInt]);//biz 1
					}
					else
					{
						sendTipMessage(playerid, "Ten biznes jest zamkni�ty! Nie masz wytrycha"); 
						return 1;
					}
				}
			}

            for(new i; i<=dini_Int("Domy/NRD.ini", "NrDomow"); i++)
            {
                if(IsPlayerInRangeOfPoint(playerid, 3.0, Dom[i][hWej_X], Dom[i][hWej_Y], Dom[i][hWej_Z]))
                {
                    if(PlayerInfo[playerid][pDom] == i)
                    {
                        new deem = Dom[i][hDomNr];
                        new h, m;
                        GetPlayerTime(playerid, h, m);
                        SetPlayerPosEx(playerid, IntInfo[deem][Int_X], IntInfo[deem][Int_Y], IntInfo[deem][Int_Z]);
                        SetPlayerInterior(playerid, IntInfo[deem][Int]);
                        SetPlayerVirtualWorld(playerid, Dom[i][hVW]);
                        SetPlayerTime(playerid, Dom[i][hSwiatlo], 0);
                        PlayerInfo[playerid][pDomT] = h;
                        PlayerInfo[playerid][pDomWKJ] = i;
                        GameTextForPlayer(playerid, "~g~Witamy w domu", 5000, 1);
                    }
                    else if(Dom[i][hZamek] == 1)
					{
						new deem = Dom[i][hDomNr];
						new h, m;
						GetPlayerTime(playerid, h, m);
						SetPlayerPosEx(playerid, IntInfo[deem][Int_X], IntInfo[deem][Int_Y], IntInfo[deem][Int_Z]);
						SetPlayerInterior(playerid, IntInfo[deem][Int]);
						SetPlayerVirtualWorld(playerid, Dom[i][hVW]);
						SetPlayerTime(playerid, Dom[i][hSwiatlo], 0);
						PlayerInfo[playerid][pDomT] = h;
						PlayerInfo[playerid][pDomWKJ] = i;
						GameTextForPlayer(playerid, "~g~Witamy w domu", 5000, 1);
					}
					else if(PlayerInfo[playerid][pAdmin] >= 1000)
					{
						new deem = Dom[i][hDomNr];
						new h, m;
						GetPlayerTime(playerid, h, m);
						SetPlayerPosEx(playerid, IntInfo[deem][Int_X], IntInfo[deem][Int_Y], IntInfo[deem][Int_Z]);
						SetPlayerInterior(playerid, IntInfo[deem][Int]);
						SetPlayerVirtualWorld(playerid, Dom[i][hVW]);
						SetPlayerTime(playerid, Dom[i][hSwiatlo], 0);
						PlayerInfo[playerid][pDomT] = h;
						PlayerInfo[playerid][pDomWKJ] = i;
						GameTextForPlayer(playerid, "~g~Witamy w domu", 5000, 1);
					}
					else
					{
						sendErrorMessage(playerid, "Drzwi s� zamkni�te.");
						GameTextForPlayer(playerid, "~r~Zamkniete", 5000, 1);
						return 1;
					}
					
					if(Dom[i][hVW] == 2001)
						Wchodzenie(playerid);
					return 1;
                }
            }
        }
    }
    return 1;
}
