//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                  gotojob                                                  //
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
// Data utworzenia: 21.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_gotojob_Impl(playerid, job, index, type)
{

    if(PlayerInfo[playerid][pAdmin] < 1)
    {
        noAccessMessage(playerid);
        return 1;
    }

    if(job <= 0 || job >= Jobs)
    {
        MruMessageFailF(playerid, "Praca musi by� wi�ksza ni� 0 i mniejsza ni� %d", Jobs-1);
        return 1;
    }

    if(index < 0)
    {
        MruMessageFail(playerid, "Index musi by� wi�kszy lub r�wny 0.");
        return 1;
    }

    switch(type)
    {
        case 0: // join
        {
            if(index >= MAX_JOB_JOINS)
            {
                MruMessageFailF(playerid, "Index musi by� mniejszy ni� %d.", MAX_JOB_JOINS);
                return 1;
            }

            SetPlayerPos(playerid, JobJoinPositions[job][index][JOB_JOIN_X], JobJoinPositions[job][index][JOB_JOIN_Y], JobJoinPositions[job][index][JOB_JOIN_Z]);
        }
        case 1: // spawn
        {
            if(index >= MAX_JOB_SPAWNS)
            {
                MruMessageFailF(playerid, "Index musi by� mniejszy ni� %d.", MAX_JOB_SPAWNS);
                return 1;
            }

            SetPlayerPos(playerid, JobSpawns[job][index][JOB_SPAWN_X], JobSpawns[job][index][JOB_SPAWN_Y], JobSpawns[job][index][JOB_SPAWN_Z]);
            SetPlayerFacingAngle(playerid, JobSpawns[job][index][JOB_SPAWN_A]);
        }
        case 2: // icon
        {
            if(index >= MAX_JOB_JOINS)
            {
                MruMessageFailF(playerid, "Index musi by� mniejszy ni� %d.", MAX_JOB_JOINS);
                return 1;
            }

            SetPlayerPos(playerid, JobJoinPositions[job][index][0], JobIconPositions[job][index][1], JobJoinPositions[job][index][2]);
        }
        default:
        {
            MruMessageFail(playerid, "Niepoprawny typ. U�yj: 0 - pozycja do��czenia do pracy, 1 - spawn pracy, 2 - ikonka pracy.");
            return 1;
        }
    }
    MruMessageGoodInfoF(playerid, "Teleportowa�e� si� do pracy %s", GetJobName(job));
    return 1;
}

//end