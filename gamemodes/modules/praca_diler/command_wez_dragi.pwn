

diler_wez_dragi(playerid, weight)
{
    if(GetPlayerJob(playerid) != JOB_DRUG_DEALER)
    {
        MruMessageFail(playerid, "Nie jeste� dilerem narkotyk�w.");
        return 1;
    }

    if(weight <= 0)
    {
        MruMessageFail(playerid, "U�yj /wez dragi [ilosc]");
        return 1;
    }

    new skill = GetPlayerJobSkill(playerid, JOB_DRUG_DEALER);
    new currentDrugs = PlayerInfo[playerid][pDrugs];
    new maxDrugs = 6 * skill;

    if(PlayerInfo[playerid][pDrugs] >= maxDrugs)
    {
        MruMessageFailF(playerid, "Jako diler narkotyk�w skillu %d masz ju� przy sobie maksymaln� wag� narkotyk�w (%dg).", skill, maxDrugs);
        return 1;
    }

    if(!IsPlayerInDrugsTakingPoint(playerid))
    {
        MruMessageFail(playerid, "Nie jeste� w miejscu, gdzie mo�na bra� narkotyki!");
        return 1;
    }

    if(currentDrugs + weight > maxDrugs)
    {
        weight = maxDrugs - currentDrugs;
        MruMessageTipF(playerid, "Jako diler narkotyk�w skillu %d, mo�esz mie� przy sobie tylko %d narkotyk�w, wi�c bierzesz %d gram.", skill, maxDrugs, weight);
        // no return on purpose
    }
    
    new price = weight * DRUG_SELL_PRICE;
    if(kaska[playerid] < price)
    {
        MruMessageFailF(playerid, "Potrzebujesz %d$ aby kupi� tak� ilo�� narkotyk�w!", price);
        return 1;
    }

    MruMessageGoodInfoF(playerid, "Kupi�e� %d gram drag�w za $%d.", weight, price);
    ZabierzKase(playerid, price);
    PlayerInfo[playerid][pDrugs] += weight;
    return 1;
}