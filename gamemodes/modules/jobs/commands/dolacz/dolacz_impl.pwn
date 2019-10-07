//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   dolacz                                                  //
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
// Autor: Simeone
// Data utworzenia: 07.10.2019


//

//------------------<[ Implementacja: ]>-------------------
command_dolacz_Impl(playerid)
{
    new jobPosID; 
    if(GetPlayerJobID(playerid) != JOB_DEFAULT)
    {
        sendErrorMessage(playerid, "Posiadasz ju� jak�� prac�!"); 
        sendTipMessage(playerid, "Wpisz /quitjob - aby zerwa� kontrakt poprzedniej pracy!"); 
        return 1;
    }
    if(!IsPlayerInJobPoint(playerid, 5.0))
    {
        sendErrorMessage(playerid, "Nie jeste� w miejscu, w kt�rym otrzyma� prac� dorywcz�!"); 
        sendTipMessage(playerid, "Wpisz /prace - aby wy�wietli� list� dost�pnych na serwerze prac dorywczych."); 
        return 1;
    }
    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLider] > 0)
    {
        sendErrorMessage(playerid, "Jako cz�onek organizacji nie mo�esz wzi�� pracy dorywczej!"); 
        return 1;
    }
    if(PlayerInfo[playerid][pDowod] != 1)
    {
        sendErrorMessage(playerid, "Nie posiadasz dowodu osobistego!");
        sendTipMessage(playerid, "Dow�d osobisty mo�esz naby� w Urz�dzie Miasta Los Santos"); 
        return 1;
    }
    jobPosID = GetJobPointFromPlayerPos(playerid); 
    if(jobPosID == JOB_DEFAULT)
    {
        sendErrorMessage(playerid, "Wyst�pi� b��d!"); 
    }
    if(playerInputDolacz[playerid] == 0)
    {
        ShowArgForJob(playerid, jobPosID); 
        sendTipMessage(playerid, "Wpisz ponownie /dolacz, je�eli akceptujesz powy�ej przedstawione warunki!"); 
        playerInputDolacz[playerid] = 1;
        return 1;
    }
    if(!CheckArgForJob(playerid, jobPosID))
    {
        sendErrorMessage(playerid, "Nie spe�niasz wszystkich podanych warunk�w!"); 
        return 1;
    }
    SetPlayerJob(playerid, jobPosID); 
    SendClientMessage(playerid, COLOR_P@, "Gratulacje! W�a�nie podpisa�e� kontrakt w nowej pracy!"); 
    playerInputDolacz[playerid] = 0; 
    return 1;
}

//end