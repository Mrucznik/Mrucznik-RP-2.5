//-----------------------------------------------<< MySQL >>-------------------------------------------------//
//                                                  groups                                                   //
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
// Autor: Creative
// Data utworzenia: 22.03.2020
//Opis:
/*
	System grup.
*/

//


//------------------<[ MySQL: ]>--------------------
forward MruMySQL_LoadGroups();
public MruMySQL_LoadGroups()
{
	new query[144], i = 0;
    format(query, sizeof(query), "SELECT * FROM `mru_groups`");
	mysql_query(query);

    mysql_store_result();

    while(mysql_fetch_row_format(query, "|") == 1)
	{
	    new uid;
    	sscanf(query, "p<|>d", uid);
		sscanf(query,  "p<|>dds[32]s[6]ffffddd", 
			GroupInfo[uid][UID],
			GroupInfo[uid][Type],
			GroupInfo[uid][Name],
			GroupInfo[uid][Color],
			GroupInfo[uid][SpawnX],
			GroupInfo[uid][SpawnY],
			GroupInfo[uid][SpawnZ],
			GroupInfo[uid][SpawnA],
			GroupInfo[uid][SpawnVW],
			GroupInfo[uid][SpawnINT],
			GroupInfo[uid][Balance]
		);
		i++;
	}
	mysql_free_result();
	printf("Załadowano %d grup (GRUPY)", i);
}

forward MruMySQL_LoadRanks();
public MruMySQL_LoadRanks()
{
	new query[450], i = 0;
    format(query, sizeof(query), "SELECT * FROM `mru_groups_rank`");
	mysql_query(query);

    mysql_store_result();

    while(mysql_fetch_row_format(query, "|") == 1)
	{
		new recordid, group_id, level, name[32];
		sscanf(query,  "p<|>ddds[32]", 
			recordid,
			group_id,
			level,
			name
		);

		RankInfo[group_id][level][Name] = name;
		RankInfo[group_id][level][Level] = level;
		i++;
	}
	mysql_free_result();
	printf("Załadowano łącznie %d rang (GRUPY)", i);
}

forward MruMySQL_LoadRanksPerms();
public MruMySQL_LoadRanksPerms()
{
	new query[450], i = 0;
    format(query, sizeof(query), "SELECT * FROM `mru_groups_perm`");
	mysql_query(query);

    mysql_store_result();

    while(mysql_fetch_row_format(query, "|") == 1)
	{
		new recordid, group_id, level, name[32], permissions[MAX_PERMISSION];
		sscanf(query,  "p<|>ddds[32]dd", 
			recordid,
			group_id,
			level,
			name,
			permissions[GROUP_PERM_TEST],
			permissions[GROUP_PERM_ARREST]
		);

		PermsInfo[group_id][level][GROUP_PERM_TEST] = permissions[GROUP_PERM_TEST];
		PermsInfo[group_id][level][GROUP_PERM_ARREST] = permissions[GROUP_PERM_ARREST];
		i++;
	}
	mysql_free_result();
	printf("Załadowano uprawnienia rang - %d (GRUPY)", i);
}

//end