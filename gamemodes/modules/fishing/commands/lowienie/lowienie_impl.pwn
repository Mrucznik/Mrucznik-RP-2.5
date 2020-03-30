//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  lowienie                                                 //
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
// Autor: mrucznik
// Data utworzenia: 03.03.2020


//

//------------------<[ Implementacja: ]>-------------------
command_lowienie_Impl(playerid)
{
    new string[128];
    if(PlayerInfo[playerid][pFishes] >= 5)
    {
        sendTipMessageEx(playerid, COLOR_GREY, sprintf("Odczekaj ~%d minut zanim znowu zaczniesz �owi�!", (15 - FishCount[playerid])));
        return 1;
    }
    if(PlayerFishes[playerid][pWeight1] > 0 && PlayerFishes[playerid][pWeight2] > 0 && PlayerFishes[playerid][pWeight3] > 0 && PlayerFishes[playerid][pWeight4] > 0 && PlayerFishes[playerid][pWeight5] > 0)
    {
        sendTipMessageEx(playerid, COLOR_GREY, "Masz ju� 5 ryb, ugotuj je / sprzedaj / wywal !");
        return 1;
    }
    new Veh = GetPlayerVehicleID(playerid);
    if(IsAtFishPlace(playerid) || IsABoat(Veh))
    {
        if(Veh && !IsABoat(Veh)) return sendTipMessageEx(playerid, COLOR_GREY, "Wysi�d� z pojazdu. �owi� mo�na tylko pieszo lub na kutrze rybackim !");
        new Caught;
        new rand;
        new fstring[MAX_PLAYER_NAME];
        new skill_lvl = PlayerInfo[playerid][pFishSkill];
        new Float:health;
        if(skill_lvl >= 0 && skill_lvl <= 50) { Caught = random(200)-70; }
        else if(skill_lvl >= 51 && skill_lvl <= 100) { Caught = random(500)-200; }
        else if(skill_lvl >= 101 && skill_lvl <= 200) { Caught = random(1000)-500; }
        else if(skill_lvl >= 201 && skill_lvl <= 400) { Caught = random(1600)-600; }
        else if(skill_lvl >= 401) { Caught = random(1800)-700; }
        rand = random(sizeof(FishNames));
        
        SetTimerEx("Lowienie", 30000 ,0,"d",playerid);
        FishGood[playerid] = 1;
        
        if(Caught <= 0)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "�y�ka p�k�a !");
            return 1;
        }
        else if(rand == 0)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Z�owi�e� Kie�bas� wi�c j� zjadasz !");
            GetPlayerHealth(playerid, health);
            SetPlayerHealth(playerid, health + 1.0);
            return 1;
        }
        else if(rand == 4)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Z�owi�e� stare gacie wi�c je zak�adasz !");
            return 1;
        }
        else if(rand == 7)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Z�owi�e� mu� wi�c go wyrzucasz !");
            return 1;
        }
        else if(rand == 10)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Z�owi�e� Stare Kalosze wi�c je zak�adasz !");
            return 1;
        }
        else if(rand == 13)
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Z�owi�e� smalec wi�c go zjadasz !");
            GetPlayerHealth(playerid, health);
            SetPlayerHealth(playerid, health + 1.0);
            return 1;
        }
        else if(rand == 20)
        {
            new mrand = random(3500);
            format(string, sizeof(string), "* Z�apa�e� sakiewk� pieni�dzy, w �rodku znalaz�e� $%d.", mrand);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            DajKase(playerid, mrand);
            return 1;
        }
        if(PlayerInfo[playerid][pFishLic] < 1)
        {
            SetPlayerCriminal(playerid,INVALID_PLAYER_ID, "Nielegany po��w ryb");
        }
        if(PlayerFishes[playerid][pWeight1] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(PlayerFishes[playerid][pFish1], fstring, 0, strlen(fstring));
            PlayerFishes[playerid][pWeight1] = Caught;
            format(string, sizeof(string), "* Z�apa�e� %s, wa��c� %d kg.", PlayerFishes[playerid][pFish1], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            PlayerFishes[playerid][pLastWeight] = Caught;
            PlayerFishes[playerid][pLastFish] = 1;
            PlayerFishes[playerid][pFid1] = rand;
            PlayerFishes[playerid][pFishID] = rand;
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Tw�j stary rekord wynosi� %d kg, zosta� on pobity i tw�j rekord wynosi teraz: %d KG.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else if(PlayerFishes[playerid][pWeight2] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(PlayerFishes[playerid][pFish2], fstring, 0, strlen(fstring));
            PlayerFishes[playerid][pWeight2] = Caught;
            format(string, sizeof(string), "* Z�apa�e� %s, wa��c� %d kg.", PlayerFishes[playerid][pFish2], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            PlayerFishes[playerid][pLastWeight] = Caught;
            PlayerFishes[playerid][pLastFish] = 2;
            PlayerFishes[playerid][pFid2] = rand;
            PlayerFishes[playerid][pFishID] = rand;
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Tw�j stary rekord wynosi� %d kg, zosta� on pobity i tw�j rekord wynosi teraz: %d KG.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else if(PlayerFishes[playerid][pWeight3] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(PlayerFishes[playerid][pFish3], fstring, 0, strlen(fstring));
            PlayerFishes[playerid][pWeight3] = Caught;
            format(string, sizeof(string), "* Z�apa�e� %s, wa��c� %d kg.", PlayerFishes[playerid][pFish3], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            PlayerFishes[playerid][pLastWeight] = Caught;
            PlayerFishes[playerid][pLastFish] = 3;
            PlayerFishes[playerid][pFid3] = rand;
            PlayerFishes[playerid][pFishID] = rand;
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Tw�j stary rekord wynosi� %d kg, zosta� on pobity i tw�j rekord wynosi teraz: %d KG.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else if(PlayerFishes[playerid][pWeight4] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(PlayerFishes[playerid][pFish4], fstring, 0, strlen(fstring));
            PlayerFishes[playerid][pWeight4] = Caught;
            format(string, sizeof(string), "* Z�apa�e� %s, wa��c� %d kg.", PlayerFishes[playerid][pFish4], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            PlayerFishes[playerid][pLastWeight] = Caught;
            PlayerFishes[playerid][pLastFish] = 4;
            PlayerFishes[playerid][pFid4] = rand;
            PlayerFishes[playerid][pFishID] = rand;
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Tw�j stary rekord wynosi� %d kg, zosta� on pobity i tw�j rekord wynosi teraz: %d KG.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else if(PlayerFishes[playerid][pWeight5] == 0)
        {
            PlayerInfo[playerid][pFishes] += 1;
            PlayerInfo[playerid][pFishSkill] += 1;
            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
            strmid(PlayerFishes[playerid][pFish5], fstring, 0, strlen(fstring));
            PlayerFishes[playerid][pWeight5] = Caught;
            format(string, sizeof(string), "* Z�apa�e� %s, wa��c� %d kg.", PlayerFishes[playerid][pFish5], Caught);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
            PlayerFishes[playerid][pLastWeight] = Caught;
            PlayerFishes[playerid][pLastFish] = 5;
            PlayerFishes[playerid][pFid5] = rand;
            PlayerFishes[playerid][pFishID] = rand;
            if(Caught > PlayerInfo[playerid][pBiggestFish])
            {
                format(string, sizeof(string), "* Tw�j stary rekord wynosi� %d kg, zosta� on pobity i tw�j rekord wynosi teraz: %d KG.", PlayerInfo[playerid][pBiggestFish], Caught);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                PlayerInfo[playerid][pBiggestFish] = Caught;
            }
        }
        else
        {
            sendTipMessageEx(playerid, COLOR_GREY, "Nie masz ju� miejsca na nowe ryby !");
            return 1;
        }
        if(PlayerInfo[playerid][pFishSkill] == 50)
        { SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci rybaka wynosz� teraz 2, mo�esz �owi� wi�ksze ryby."); }
        else if(PlayerInfo[playerid][pFishSkill] == 100)
        { SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci rybaka wynosz� teraz 3, mo�esz �owi� wi�ksze ryby."); }
        else if(PlayerInfo[playerid][pFishSkill] == 200)
        { SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci rybaka wynosz� teraz 4, mo�esz �owi� wi�ksze ryby."); }
        else if(PlayerInfo[playerid][pFishSkill] == 400)
        { SendClientMessage(playerid, COLOR_YELLOW, "* Twoje umiej�tno�ci rybaka wynosz� teraz 5, mo�esz �owi� wi�ksze ryby."); }
    }
    else
    {
        sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� w miejscu gdzie mo�na �owi� (Molo z ko�em) ani na kutrze rybackim !");
        return 1;
    }
    return 1;
}

//end