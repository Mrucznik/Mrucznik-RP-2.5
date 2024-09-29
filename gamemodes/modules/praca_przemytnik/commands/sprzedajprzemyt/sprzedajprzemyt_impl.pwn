//-----------------------------------------------<< Source >>------------------------------------------------//
//                                              sprzedajprzemyt                                              //
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
// Data utworzenia: 06.04.2024


//

//------------------<[ Implementacja: ]>-------------------
command_sprzedajprzemyt_Impl(playerid, giveplayerid, nazwa[], price)
{
    if(GetPlayerJob(playerid) != JOB_SMUGGLER)
    {
		MruMessageFail(playerid, "Nie jeste� przemytnikiem.");
		return 1;
    }

    if(!ProxDetectorS(8.0, playerid, giveplayerid))
    {
        MruMessageFail(playerid, "Ten gracz nie jest przy tobie.");
        return 1;
    }

    new item = GetSmugglingItemFromString(nazwa);
    if(item == SMUGGLING_ITEM_UNKNOWN)
    {
        MruMessageFail(playerid, "Niepoprawna nazwa przedmiotu, dost�pne nazwy: pancerz, jetpack, paliwo");
        return 1;
    }

    new contraband = GetContraband(playerid);
    new neededContraband = SmugglingItemsData[item][Cost];
    if(contraband < neededContraband)
    {
        MruMessageFailF(playerid, "Potrzebujesz %d paczek kontrabandy by zaoferowa� komu� %s.", neededContraband, SmugglingItemsData[item][Name]);
        return 1;
    }

	if(price < 0 || price > 100_000_000)
    { 
        MruMessageFail(playerid, "Cena od 0 do 100 000 000!");
        return 1;
    }

    if(gettime() < GetPVarInt(playerid, "sprzedajprzemyt_cooldown"))
    {
        MruMessageFail(playerid, "Mo�esz oferowa� przedmioty z przemytu co 15 sekund");
        return 1;
    }
    SetPVarInt(playerid, "sprzedajprzemyt_cooldown", gettime() + 15);

    if(giveplayerid == playerid)
    {
        MruMessageGoodInfoF(playerid, "Da�e� sobie %s i wykorzysta�e� %d paczek kontrabandy, masz ich teraz %d.",  SmugglingItemsData[item][Name], neededContraband, GetContraband(playerid));
        CreateAndGiveSmugglingItem(playerid, playerid, item);
        return 1;
    }
    
    MruMessageGoodInfoF(playerid, "Oferujesz %s graczowi %s za $%d.", SmugglingItemsData[item][Name], GetNick(giveplayerid), price);
    MruMessageGoodInfoF(giveplayerid, "Przemytnik %s oferuje ci %s za $%d, (wpisz /akceptuj przemyt) aby akceptowa�", GetNick(playerid), SmugglingItemsData[item][Name], price);
    
    SmugglingOffer[giveplayerid] = playerid;
    SmugglingOfferPrice[giveplayerid] = price;
    SmugglingOfferItem[giveplayerid] = item;
    return 1;
}

command_akceptuj_przemyt(playerid)
{
    new smugglerid = SmugglingOffer[playerid];
    new itemPrice = SmugglingOfferPrice[playerid];
    new item = SmugglingOfferItem[playerid];
    new itemCost = SmugglingItemsData[item][Cost];

    if(smugglerid >= 999)
    {
        MruMessageFail(playerid, "Nikt nie zaoferowa� ci przemiotu z przemytu.");
        return 1;
    }

    if(!IsPlayerConnected(smugglerid))
    {
        MruMessageFail(playerid, "Gracz kt�ry zaoferowa� ci przedmiot jest ju� offline.");
        return 1;
    }

    if(itemPrice < 0 || kaska[playerid] < itemPrice)
    {
        MruMessageFailF(playerid, "Nie sta� ci�, potrzebujesz %d$.", itemPrice);
        return 1;
    }

    if(GetContraband(smugglerid) < itemCost)
    {
        MruMessageFailF(playerid, "Przemytnik ju� nie ma tyle paczek kontrabandy by wykona� %s.", SmugglingItemsData[item][Name]);
        MruMessageFailF(smugglerid, "Gracz %s akcepowa� ofert�, ale nie masz ju� tyle kontrabandy by wykona� %s.", GetNick(playerid), SmugglingItemsData[item][Name]);
        return 1;
    }

    MruMessageGoodInfoF(playerid, "Akceptowa�e� %s, zap�aci�e� $%d przemytnikowi %s.", SmugglingItemsData[item][Name], itemPrice, GetNick(smugglerid));
    MruMessageGoodInfoF(smugglerid, "%s akceptowa� %s, dostajesz $%d.", GetNick(playerid), SmugglingItemsData[item][Name], itemPrice);

    CreateAndGiveSmugglingItem(playerid, smugglerid, item);

    DajKase(smugglerid, itemPrice);
    ZabierzKase(playerid, itemPrice);

    Log(payLog, INFO, "%s kupi� %s od przemytnika %s za $%d", SmugglingItemsData[item][ShortName], GetPlayerLogName(playerid), GetPlayerLogName(smugglerid), itemPrice);
    SmugglingOffer[playerid] = 999;
    SmugglingOfferPrice[playerid] = 0;
    return 1;
}

//end