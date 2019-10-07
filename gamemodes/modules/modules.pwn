//------------------------------------------<< Generated source >>-------------------------------------------//
//-----------------------------------------------[ Modules ]-------------------------------------------------//
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
// Kod wygenerowany automatycznie narz�dziem Mrucznik CTL

// ================= UWAGA! =================
//
// WSZELKIE ZMIANY WPROWADZONE DO TEGO PLIKU
// ZOSTAN� NADPISANE PO WYWO�ANIU KOMENDY
// > mrucznikctl build
//
// ================= UWAGA! =================


//-------<[ .def ]>-------
#include "03DL\03DL.def"
#include "actors\actors.def"
#include "admin\admin.def"
#include "adminduty\adminduty.def"
#include "animacje\animacje.def"
#include "antycheat\antycheat.def"
#include "antyspam\antyspam.def"
#include "biznesy\biznesy.def"
#include "bramy\bramy.def"
#include "budki\budki.def"
#include "chaty\chaty.def"
#include "debug\debug.def"
#include "discord\discord.def"
#include "frakcje\frakcje.def"
#include "jobs\jobs.def"
#include "komendy\komendy.def"
#include "logi\logi.def"
#include "money\money.def"
#include "names\names.def"
#include "organizacje\organizacje.def"
#include "player_attachments\player_attachments.def"
#include "pojazdy\pojazdy.def"
#include "prace\prace.def"
#include "premium\premium.def"
#include "sannews\sannews.def"
#include "sila\sila.def"
#include "urzadls\urzadls.def"
#include "vehicle_attachments\vehicle_attachments.def"
#include "wejscia\wejscia.def"
#include "wypadek\wypadek.def"


//-------<[ .hwn ]>-------
#include "03DL\03DL.hwn"
#include "actors\actors.hwn"
#include "admin\admin.hwn"
#include "adminduty\adminduty.hwn"
#include "animacje\animacje.hwn"
#include "antycheat\antycheat.hwn"
#include "antyspam\antyspam.hwn"
#include "biznesy\biznesy.hwn"
#include "bramy\bramy.hwn"
#include "budki\budki.hwn"
#include "chaty\chaty.hwn"
#include "debug\debug.hwn"
#include "discord\discord.hwn"
#include "frakcje\frakcje.hwn"
#include "jobs\jobs.hwn"
#include "komendy\komendy.hwn"
#include "logi\logi.hwn"
#include "money\money.hwn"
#include "names\names.hwn"
#include "organizacje\organizacje.hwn"
#include "player_attachments\player_attachments.hwn"
#include "pojazdy\pojazdy.hwn"
#include "prace\prace.hwn"
#include "premium\premium.hwn"
#include "sannews\sannews.hwn"
#include "sila\sila.hwn"
#include "urzadls\urzadls.hwn"
#include "vehicle_attachments\vehicle_attachments.hwn"
#include "wejscia\wejscia.hwn"
#include "wypadek\wypadek.hwn"


//-------<[ .pwn ]>-------
#include "03DL\03DL.pwn"
#include "actors\actors.pwn"
#include "admin\admin.pwn"
#include "adminduty\adminduty.pwn"
#include "animacje\animacje.pwn"
#include "antycheat\antycheat.pwn"
#include "antyspam\antyspam.pwn"
#include "biznesy\biznesy.pwn"
#include "bramy\bramy.pwn"
#include "budki\budki.pwn"
#include "chaty\chaty.pwn"
#include "debug\debug.pwn"
#include "discord\discord.pwn"
#include "frakcje\frakcje.pwn"
#include "jobs\jobs.pwn"
#include "komendy\komendy.pwn"
#include "logi\logi.pwn"
#include "money\money.pwn"
#include "names\names.pwn"
#include "organizacje\organizacje.pwn"
#include "player_attachments\player_attachments.pwn"
#include "pojazdy\pojazdy.pwn"
#include "prace\prace.pwn"
#include "premium\premium.pwn"
#include "sannews\sannews.pwn"
#include "sila\sila.pwn"
#include "urzadls\urzadls.pwn"
#include "vehicle_attachments\vehicle_attachments.pwn"
#include "wejscia\wejscia.pwn"
#include "wypadek\wypadek.pwn"


//-------<[ timers ]>-------
#include "admin\admin_timers.pwn"
#include "antyspam\antyspam_timers.pwn"
#include "jobs\jobs_timers.pwn"
#include "money\money_timers.pwn"
#include "organizacje\organizacje_timers.pwn"
#include "pojazdy\pojazdy_timers.pwn"
#include "prace\prace_timers.pwn"
#include "premium\premium_timers.pwn"
#include "sannews\sannews_timers.pwn"
#include "urzadls\urzadls_timers.pwn"
#include "wypadek\wypadek_timers.pwn"


//-------<[ mysql ]>-------
#include "admin\admin_mysql.pwn"
#include "biznesy\biznesy_mysql.pwn"
#include "organizacje\organizacje_mysql.pwn"
#include "player_attachments\player_attachments_mysql.pwn"
#include "pojazdy\pojazdy_mysql.pwn"
#include "prace\prace_mysql.pwn"
#include "premium\premium_mysql.pwn"
#include "vehicle_attachments\vehicle_attachments_mysql.pwn"


//-------<[ others ]>-------


//-------<[ callbacks ]>-------
#include "admin\admin_callbacks.pwn"
#include "antycheat\antycheat_callbacks.pwn"
#include "biznesy\biznesy_callbacks.pwn"
#include "logi\logi_callbacks.pwn"
#include "money\money_callbacks.pwn"
#include "organizacje\organizacje_callbacks.pwn"
#include "player_attachments\player_attachments_callbacks.pwn"
#include "pojazdy\pojazdy_callbacks.pwn"
#include "prace\prace_callbacks.pwn"
#include "premium\premium_callbacks.pwn"
#include "vehicle_attachments\vehicle_attachments_callbacks.pwn"
#include "wypadek\wypadek_callbacks.pwn"


//-------<[ commands ]>-------
#include "admin\commands\admin_commands.pwn"
#include "animacje\commands\animacje_commands.pwn"
#include "antycheat\commands\antycheat_commands.pwn"
#include "biznesy\commands\biznesy_commands.pwn"
#include "bramy\commands\bramy_commands.pwn"
#include "chaty\commands\chaty_commands.pwn"
#include "debug\commands\debug_commands.pwn"
#include "frakcje\commands\frakcje_commands.pwn"
#include "jobs\commands\jobs_commands.pwn"
#include "komendy\commands\komendy_commands.pwn"
#include "logi\commands\logi_commands.pwn"
#include "organizacje\commands\organizacje_commands.pwn"
#include "player_attachments\commands\player_attachments_commands.pwn"
#include "pojazdy\commands\pojazdy_commands.pwn"
#include "prace\commands\prace_commands.pwn"
#include "premium\commands\premium_commands.pwn"
#include "sannews\commands\sannews_commands.pwn"
#include "sila\commands\sila_commands.pwn"
#include "urzadls\commands\urzadls_commands.pwn"
#include "vehicle_attachments\commands\vehicle_attachments_commands.pwn"
#include "wypadek\commands\wypadek_commands.pwn"
