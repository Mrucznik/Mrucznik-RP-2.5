stock guiMsg(playerid, title[80], str[])
{
	new final_title[80];
	format(final_title, sizeof(final_title), "{49A350}Mrucznik � {FFFFFF}%s", title);
	Dialog_Show(playerid, DIALOG_STYLE_MSGBOX, final_title, str, "Ok", "");
	return 1;
}



stock highestAdminLevel()
{
	new highest = 0, playa = INVALID_PLAYER_ID;
	foreach(Player, i)
	{
		if(PlayerInfo[i][pAdmin] > highest)
		{
			highest = PlayerInfo[i][pAdmin];
			playa = i;
		}
	}
	if(highest < 1) return INVALID_PLAYER_ID;
	return playa;
}

new FabrykaMats::Actor;
new Text3D:FabrykaMats::ActorLabel;
new FabrykaMats::Timer;

new Float:FabrykaMats::ActorPos[][] =
{
	{2239.1765,-2258.2468,14.7647,208.8479},
	{2201.0283,-2198.6238,13.5547,170.1143},
	{2129.9502,-2276.1985,14.7836,145.9646}
};

new FabrykaMats::ActorSkins[] =
{
	6,
	22,
	23,
	47
};

forward FabrykaActor_ReCreate();

stock FabrykaMats::LoadLogic()
{
	// Init Actors

	FabrykaActor_ReCreate();

	// Init 3Dtexts

	CreateDynamic3DTextLabel("Wiedz� ju� o nas!\nBez obaw, nie poddamy si� tak �atwo\nPoszukaj naszych diler�w materia�ami na terenie fabryki", 0xAA3333AA, 2139.1128,-2288.9380,20.6646, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	// Init Timers

	FabrykaMats::Timer = SetTimer("FabrykaActor_ReCreate", 900000, true);
	return 1;
}


public FabrykaActor_ReCreate()
{

	new Float:ActorX, Float:ActorY, Float:ActorZ;

	new Random = random(sizeof(FabrykaMats::ActorPos));

	ActorX = FabrykaMats::ActorPos[Random][0];
	ActorY = FabrykaMats::ActorPos[Random][1];
	ActorZ = FabrykaMats::ActorPos[Random][2];

	if(FabrykaMats::Actor != INVALID_ACTOR_ID)
	{
		DestroyActor(FabrykaMats::Actor);	
	}

	FabrykaMats::Actor = CreateActor(FabrykaMats::ActorSkins[random(sizeof(FabrykaMats::ActorSkins))], ActorX, ActorY, ActorZ, FabrykaMats::ActorPos[Random][3]);

	if(FabrykaMats::ActorLabel != Text3D:INVALID_3DTEXT_ID)
	{
		Delete3DTextLabel(FabrykaMats::ActorLabel);
	}

	new Float:labelZ = ActorZ + 1;

	FabrykaMats::ActorLabel = Create3DTextLabel("Handlarz materia�ami\nNaci�nij 'Y' aby pogada�", COLOR_GRAD1,ActorX, ActorY, labelZ, 7.5, 0, 1);

	return 1;
}

stock FabrykaMats::ActorTalk(playerid)
{
	new Float:ActorX, Float:ActorY, Float:ActorZ;
	GetActorPos(FabrykaMats::Actor, ActorX, ActorY, ActorZ);

	if(IsPlayerInRangeOfPoint(playerid, 2, ActorX, ActorY, ActorZ))
	{
		return cmd_materialy(playerid, "dostarcz");
	}

	return 1;
}

stock getUnknownString(playerid) {
	new str[32];
	new uid =  PlayerInfo[playerid][pUID];
	format(str, sizeof(str), "%x", uid);
	return str;
}

stock getStringFromUnknown(hex) {

	new uid = hex >> 8;
	return uid;
}




//Tu wpisz~n~~n~~r~tekst~n~~n~~y~~h~wincyj teksta
stock showTimedMsgBox(playerid, delay, text[]) {
	CzasInformacyjnego[playerid] = delay;
	PlayerTextDrawHide(playerid, TextInformacyjny[playerid]);
	PlayerTextDrawSetString(playerid, TextInformacyjny[playerid], text);
	PlayerTextDrawShow(playerid, TextInformacyjny[playerid]);
	return true;
}


public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	if(modelid != 19142) return 1;
	//SetPlayerAttachedObject(playerid, index, modelid, bone, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0)
	//playerid,7,19142,1,0.1,0.05,0.0,0.0,0.0,0.0,1.0,1.2
    if(response)
    {
        if(fScaleX > 1.6 || fScaleY > 1.96 || fScaleZ > 1.96 || fScaleX < 0.7 || fScaleY < 0.7 || fScaleZ < 0.7) {
            RemovePlayerAttachedObject(playerid, 7);
            SetPlayerAttachedObject(playerid, 7, 19142, 1, GetPVarFloat(playerid, "k_offsetX"), GetPVarFloat(playerid, "k_offsetY"), GetPVarFloat(playerid, "k_offsetZ"), GetPVarFloat(playerid, "k_rotX"), GetPVarFloat(playerid, "k_rotY"), GetPVarFloat(playerid, "k_rotZ"), GetPVarFloat(playerid, "k_scaleX"), GetPVarFloat(playerid, "k_scaleY"), GetPVarFloat(playerid, "k_scaleZ"));
            return sendErrorMessage(playerid, "Zmiany nie zosta�y zapisane, dodatek by� zbyt du�y lub zbyt ma�y!");
        }
        if(fOffsetX > 0.35 || fOffsetY > 0.35 || fOffsetZ > 0.35 || fOffsetX < -0.35 || fOffsetY < -0.35 || fOffsetZ < -0.35) {
            RemovePlayerAttachedObject(playerid, 7);
            SetPlayerAttachedObject(playerid, 7, 19142, 1, GetPVarFloat(playerid, "k_offsetX"), GetPVarFloat(playerid, "k_offsetY"), GetPVarFloat(playerid, "k_offsetZ"), GetPVarFloat(playerid, "k_rotX"), GetPVarFloat(playerid, "k_rotY"), GetPVarFloat(playerid, "k_rotZ"), GetPVarFloat(playerid, "k_scaleX"), GetPVarFloat(playerid, "k_scaleY"), GetPVarFloat(playerid, "k_scaleZ"));
            return sendErrorMessage(playerid, "Zmiany nie zosta�y zapisane, dodatek by� zbyt oddalony od gracza!");
        }
        SetPVarFloat(playerid, "k_offsetX", fOffsetX);
		SetPVarFloat(playerid, "k_offsetY", fOffsetY);
		SetPVarFloat(playerid, "k_offsetZ", fOffsetZ);
		SetPVarFloat(playerid, "k_rotX", fRotX);
		SetPVarFloat(playerid, "k_rotY", fRotY);
		SetPVarFloat(playerid, "k_rotZ", fRotZ);
		SetPVarFloat(playerid, "k_scaleX", fScaleX);
		SetPVarFloat(playerid, "k_scaleY", fScaleY);
		SetPVarFloat(playerid, "k_scaleZ", fScaleZ);
    }
    else
    {
        RemovePlayerAttachedObject(playerid, 7);
        SetPlayerAttachedObject(playerid, 7, 19142, 1, GetPVarFloat(playerid, "k_offsetX"), GetPVarFloat(playerid, "k_offsetY"), GetPVarFloat(playerid, "k_offsetZ"), GetPVarFloat(playerid, "k_rotX"), GetPVarFloat(playerid, "k_rotY"), GetPVarFloat(playerid, "k_rotZ"), GetPVarFloat(playerid, "k_scaleX"), GetPVarFloat(playerid, "k_scaleY"), GetPVarFloat(playerid, "k_scaleZ"));
    }
    return 1;
}


Player::RemoveFromVeh(playerid)
{
	new Float:slx, Float:sly, Float:slz;
	GetPlayerPos(playerid, slx, sly, slz);
	SetPlayerPosEx(playerid, slx, sly, slz+1);
	ClearAnimations(playerid);	

	return true;
}


Player::CanUseCar(playerid, newcar)
{
	new string[128];

	if(IsACopCar(newcar))
	{
	    if(IsACop(playerid))
	    {
	        if(OnDuty[playerid] == 0)
	        {
	            if(GetVehicleModel(newcar) != 445)
	            {
	            	sendTipMessageEx(playerid, COLOR_GREY, "Musisz by� na s�u�bie aby je�dzi� autem policyjnym !");
                    return 0;
	            }
	        }
	    }
	}

	if(VehicleUID[newcar][vUID] != 0)
    {
        new lcarid = VehicleUID[newcar][vUID];
	    if(CarData[lcarid][c_OwnerType] == CAR_OWNER_FRACTION)// wszystkie auta frakcji
	    {
            if(CarData[lcarid][c_Owner] != GetPlayerFraction(playerid))
            {
                if(PlayerInfo[playerid][pAdmin] >= 5000) return 1;
                format(string, sizeof(string), " Ten pojazd nale�y do %s i nie mo�esz nim kierowa�.", FractionNames[CarData[lcarid][c_Owner]]);
                sendTipMessageEx(playerid,COLOR_GREY,string);
                return 0;
            }
	        if(PlayerInfo[playerid][pRank] < CarData[lcarid][c_Rang])
	        {
                if(PlayerInfo[playerid][pAdmin] >= 5000) return 1;
                format(string, sizeof(string), "Aby kierowa� tym pojazdem potrzebujesz %d rangi!", CarData[lcarid][c_Rang]);
		        sendTipMessageEx(playerid,COLOR_GREY,string);
		        return 0;
	        }
	    }
        else if(CarData[lcarid][c_OwnerType] == CAR_OWNER_SPECIAL) //specjalne
        {
            if(CarData[lcarid][c_Owner] == RENT_CAR)
            {
                if (CarData[lcarid][c_Rang]-1 != playerid)
    			{
    				format(string, sizeof(string), "~w~Mozesz wypozyczyc ten pojazd~n~Cena:~g~$%d~n~~w~Aby to zrobic wpisz ~g~/rentcar~w~~n~aby wyjsc wpisz ~r~/wyjdz",5000);
    				TogglePlayerControllable(playerid, 0);
    				GameTextForPlayer(playerid, string, 5000, 3);
                    HireCar[playerid] = newcar;
    			}
            }
            else if(CarData[lcarid][c_Owner] == CAR_ZUZEL)
            {
                if(zawodnik[playerid] != 1)
    		    {
    				sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Nie jeste� zawodnikiem �u�lowym, zg�o� si� do administracji je�li chcesz nim zosta�.");
    				return 0;
    			}
            }
        }
        else if(CarData[lcarid][c_OwnerType] == CAR_OWNER_JOB) //reszta do pracy
        {
            if(CarData[lcarid][c_Owner] == PlayerInfo[playerid][pJob])
            {
                new bool:wywal;
                switch(PlayerInfo[playerid][pJob])
                {
                    case JOB_LOWCA: if(PlayerInfo[playerid][pDetSkill] < CarData[lcarid][c_Rang]) wywal=true;
                    case JOB_LAWYER: if(PlayerInfo[playerid][pLawSkill] < CarData[lcarid][c_Rang]) wywal=true;
                    case JOB_MECHANIC: if(PlayerInfo[playerid][pMechSkill] < CarData[lcarid][c_Rang]) wywal=true;
                    case JOB_BUSDRIVER: if(PlayerInfo[playerid][pCarSkill] < CarData[lcarid][c_Rang]) wywal=true;
                    case JOB_TRUCKER: if(PlayerInfo[playerid][pTruckSkill] < CarData[lcarid][c_Rang]) wywal=true;
                    default: wywal=false;
                }
                if(wywal)
                {
                    if(PlayerInfo[playerid][pAdmin] >= 5000) return 1;
                    format(string, sizeof(string), "Aby prowadzi� ten pojazd potrzebujesz %d skilla w zawodzie %s.", CarData[lcarid][c_Rang], JobNames[CarData[lcarid][c_Owner]]);
                    sendTipMessageEx(playerid,COLOR_GREY,string);
                    return 0;
                }
            }
            else
            {
                if(CarData[lcarid][c_Owner] == JOB_BUSDRIVER)
                {
                    if(GetPlayerFraction(playerid) == FRAC_KT) return 1;
                }
                if(PlayerInfo[playerid][pAdmin] >= 5000) return 1;
                format(string, sizeof(string), "Aby prowadzi� ten pojazd musisz by� w zawodzie %s.", JobNames[CarData[lcarid][c_Owner]]);
                sendTipMessageEx(playerid,COLOR_GREY,string);
				return 0;
            }
            if(CarData[lcarid][c_Owner] == JOB_BUSDRIVER) sendTipMessageEx(playerid, COLOR_YELLOW, "SERVER: Wpisz /trasa aby rozpocz�� prac�");
        }
        else if(CarData[lcarid][c_OwnerType] == CAR_OWNER_FAMILY)// wszystkie auta RODZIN
	    {
            if(CarData[lcarid][c_Owner] != GetPlayerOrg(playerid))
            {
                if(PlayerInfo[playerid][pAdmin] >= 5000) return 1;
				//ERROR WUT
                //format(string, sizeof(string), " Ten pojazd nale�y do rodziny %s i nie mo�esz nim kierowa�.", OrgInfo[orgID(CarData[lcarid][c_Owner])][o_Name]);
                format(string, sizeof(string), " Ten pojazd nale�y do rodziny i nie mo�esz nim kierowa�.");
                sendTipMessageEx(playerid,COLOR_GREY,string);
                return 0;
            }
	        if(PlayerInfo[playerid][pRank] < CarData[lcarid][c_Rang])
	        {
                if(PlayerInfo[playerid][pAdmin] >= 5000) return 1;
                format(string, sizeof(string), "Aby kierowa� tym pojazdem potrzebujesz %d rangi!", CarData[lcarid][c_Rang]);
		        sendTipMessageEx(playerid,COLOR_GREY,string);
		        return 0;
	        }
	    }
        else if(CarData[lcarid][c_OwnerType] == CAR_OWNER_PLAYER) //Pojazdy graczy
        {
            if(IsCarOwner(playerid, newcar, true))
	        {
                if(CarData[lcarid][c_Keys] != 0 && CarData[lcarid][c_Owner] != PlayerInfo[playerid][pUID])
                {
                    if(CarData[lcarid][c_Keys] != PlayerInfo[playerid][pUID])
    	       	    {
                        sendTipMessageEx(playerid, COLOR_NEWS, "Kluczyki od tego pojazdu zosta�y zabrane przez w�a�ciciela.");
                        PlayerInfo[playerid][pKluczeAuta] = 0;
    				   	return 0;
    	       	    }
                }
	       	}
	       	else
	       	{
	       	    sendTipMessageEx(playerid, COLOR_NEWS, "Nie masz kluczy do tego pojazdu, a zabezpieczenia s� zbyt dobre aby� m�g� go ukra��.");
	       		return 0;
	       	}
        }
    }

	if(IsABoat(newcar))
	{
	    if(PlayerInfo[playerid][pBoatLic] < 1)
		{
		    sendTipMessageEx(playerid, COLOR_GREY, "Nie wiesz w jaki spos�b p�ywa� �odzi�, wi�c decydujesz si� j� opu�ci� !");
		    return 0;
		}
	}
	else if(IsAPlane(newcar))
	{
	    antyczolg[playerid] ++;
	    if(PlayerInfo[playerid][pFlyLic] < 1)
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie wiesz w jaki spos�b lata� samolotem, wi�c decydujesz si� go opu�ci� !");
			return 0;
		}
	}
	else
	{
		if(PlayerInfo[playerid][pCarLic] != 1)
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie masz prawa jazdy, postanawiasz opu�ci� pojazd!");
			return 0;
		}
	}

	return 1;
}
