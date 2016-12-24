//EXTERNAL
//GET
forward MRP_GetPlayerMoney(playerid);
forward MRP_GetPlayerMC(playerid);
forward MRP_GetPlayerCarSlots(playerid);
forward MRP_GetPlayerPhone(playerid);
forward MRP_GetPlayerNickChanges(playerid);
forward MRP_GetPlayerAge(playerid);
forward MRP_GetPlayerUID(playerid);
forward MRP_GetPlayerKP(playerid);
forward MRP_IsInPolice(playerid);
forward MRP_IsInGang(playerid);

//SET
forward MRP_SetPlayerMoney(playerid, val);
forward MRP_SetPlayerMC(playerid, val);
forward MRP_SetPlayerCarSlots(playerid, val);
forward MRP_SetPlayerPhone(playerid, val);
forward MRP_SetPlayerNickChanges(playerid, val);
forward MRP_SetPlayerAge(playerid, val);
forward MRP_SetPlayerKP(playerid, val);

forward MRP_ShopPurchaseCar(playerid, model, cena);
forward MRP_ForceDialog(playerid, dialogid);

forward MRP_CreatePlayerAttachedItem(playerid, model);

//CALLBACKS
//GET
public MRP_GetPlayerMoney(playerid) return kaska[playerid];
public MRP_GetPlayerMC(playerid) return PlayerMC[playerid];
public MRP_GetPlayerCarSlots(playerid) return PlayerInfo[playerid][pCarSlots];
public MRP_GetPlayerPhone(playerid) return PlayerInfo[playerid][pPnumber];
public MRP_GetPlayerNickChanges(playerid) return PlayerInfo[playerid][pZmienilNick];
public MRP_GetPlayerAge(playerid) return PlayerInfo[playerid][pAge];
public MRP_GetPlayerUID(playerid) return PlayerInfo[playerid][pUID];
public MRP_GetPlayerKP(playerid) return PlayerInfo[playerid][pDonateRank];
public MRP_IsInPolice(playerid)
{
    if(GetPlayerFraction(playerid) == FRAC_LSPD || GetPlayerFraction(playerid) == FRAC_FBI || GetPlayerFraction(playerid) == FRAC_NG) return 1;
    return 0;
}
public MRP_IsInGang(playerid)
{
    if(GetPlayerOrgType(playerid) == ORG_TYPE_GANG) return 1;
    return 0;
}

//SET
public MRP_SetPlayerMoney(playerid, val)  kaska[playerid] = val;
public MRP_SetPlayerMC(playerid, val)
{
    PlayerMC[playerid] = val;
    MRP_SaveMC(playerid);
    return 1;
}
public MRP_SetPlayerCarSlots(playerid, val)  PlayerInfo[playerid][pCarSlots] = val;
public MRP_SetPlayerPhone(playerid, val)  PlayerInfo[playerid][pPnumber] = val;
public MRP_SetPlayerNickChanges(playerid, val)  PlayerInfo[playerid][pZmienilNick] = val;
public MRP_SetPlayerAge(playerid, val)  PlayerInfo[playerid][pAge] = val;
public MRP_SetPlayerKP(playerid, val)  PlayerInfo[playerid][pDonateRank] = val;

public MRP_CreatePlayerAttachedItem(playerid, model)
{
    new str[128];
    format(str, 128, "INSERT INTO `mru_playeritems` (`model`, `UID`) VALUES ('%d ', '%d')", model, PlayerInfo[playerid][pUID]);
    mysql_query(str);
    new id = mysql_insert_id();
    return id;
}

forward MRPWeryfikacja(index, response_code, data[]);
public MRPWeryfikacja(index, response_code, data[])
{
    print("Kubi aka Smigol: Moj skarb!! Nie oddam mojego skarbu!");
	return 1;
}

//END
