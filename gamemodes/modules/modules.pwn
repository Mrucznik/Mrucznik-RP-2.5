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
#include "frakcje\frakcje.def"
#include "names\names.def"
#include "admin\admin.def"
#include "pojazdy\pojazdy.def"
#include "actors\actors.def"
#include "chaty\chaty.def"
#include "praca_przemytnik\praca_przemytnik.def"
#include "biznesy\biznesy.def"
#include "debug\debug.def"
#include "fishing\fishing.def"
#include "prace\prace.def"
#include "bramy\bramy.def"
#include "kajdanki\kajdanki.def"
#include "animacje\animacje.def"
#include "bw\bw.def"
#include "praca_zlodziej_aut\praca_zlodziej_aut.def"
#include "wypadek\wypadek.def"
#include "convoy\convoy.def"
#include "przedmioty\przedmioty.def"
#include "logi\logi.def"
#include "graffiti\graffiti.def"
#include "weryfikacje\weryfikacje.def"
#include "adminduty\adminduty.def"
#include "oferty\oferty.def"
#include "redis\redis.def"
#include "praca_diler\praca_diler.def"
#include "gunshoppanel\gunshoppanel.def"
#include "player_attachments\player_attachments.def"
#include "napady\napady.def"
#include "wejscia\wejscia.def"
#include "sannews\sannews.def"
#include "frakcja_lspd\frakcja_lspd.def"
#include "antyspam\antyspam.def"
#include "bijatyki\bijatyki.def"
#include "cooking\cooking.def"
#include "03DL\03DL.def"
#include "vehicle_attachments\vehicle_attachments.def"
#include "money\money.def"
#include "sila\sila.def"
#include "organizacje\organizacje.def"
#include "premium\premium.def"
#include "discord\discord.def"
#include "urzadls\urzadls.def"
#include "ibiza\ibiza.def"
#include "budki\budki.def"
#include "antycheat\antycheat.def"
#include "komendy\komendy.def"
#include "praca_mechanik\praca_mechanik.def"
#include "vicecity\vicecity.def"
#include "choroby\choroby.def"
#include "listaip\listaip.def"
#include "praca_kierowca\praca_kierowca.def"


//-------<[ .hwn ]>-------
#include "frakcje\frakcje.hwn"
#include "names\names.hwn"
#include "admin\admin.hwn"
#include "pojazdy\pojazdy.hwn"
#include "actors\actors.hwn"
#include "chaty\chaty.hwn"
#include "praca_przemytnik\praca_przemytnik.hwn"
#include "biznesy\biznesy.hwn"
#include "debug\debug.hwn"
#include "fishing\fishing.hwn"
#include "prace\prace.hwn"
#include "bramy\bramy.hwn"
#include "kajdanki\kajdanki.hwn"
#include "animacje\animacje.hwn"
#include "bw\bw.hwn"
#include "praca_zlodziej_aut\praca_zlodziej_aut.hwn"
#include "wypadek\wypadek.hwn"
#include "convoy\convoy.hwn"
#include "przedmioty\przedmioty.hwn"
#include "logi\logi.hwn"
#include "graffiti\graffiti.hwn"
#include "weryfikacje\weryfikacje.hwn"
#include "adminduty\adminduty.hwn"
#include "oferty\oferty.hwn"
#include "redis\redis.hwn"
#include "praca_diler\praca_diler.hwn"
#include "gunshoppanel\gunshoppanel.hwn"
#include "player_attachments\player_attachments.hwn"
#include "napady\napady.hwn"
#include "wejscia\wejscia.hwn"
#include "sannews\sannews.hwn"
#include "frakcja_lspd\frakcja_lspd.hwn"
#include "antyspam\antyspam.hwn"
#include "bijatyki\bijatyki.hwn"
#include "cooking\cooking.hwn"
#include "03DL\03DL.hwn"
#include "vehicle_attachments\vehicle_attachments.hwn"
#include "money\money.hwn"
#include "sila\sila.hwn"
#include "organizacje\organizacje.hwn"
#include "premium\premium.hwn"
#include "discord\discord.hwn"
#include "urzadls\urzadls.hwn"
#include "ibiza\ibiza.hwn"
#include "budki\budki.hwn"
#include "antycheat\antycheat.hwn"
#include "komendy\komendy.hwn"
#include "praca_mechanik\praca_mechanik.hwn"
#include "vicecity\vicecity.hwn"
#include "choroby\choroby.hwn"
#include "listaip\listaip.hwn"
#include "praca_kierowca\praca_kierowca.hwn"


//-------<[ .pwn ]>-------
#include "frakcje\frakcje.pwn"
#include "names\names.pwn"
#include "admin\admin.pwn"
#include "pojazdy\pojazdy.pwn"
#include "actors\actors.pwn"
#include "chaty\chaty.pwn"
#include "praca_przemytnik\praca_przemytnik.pwn"
#include "biznesy\biznesy.pwn"
#include "debug\debug.pwn"
#include "fishing\fishing.pwn"
#include "prace\prace.pwn"
#include "bramy\bramy.pwn"
#include "kajdanki\kajdanki.pwn"
#include "animacje\animacje.pwn"
#include "bw\bw.pwn"
#include "praca_zlodziej_aut\praca_zlodziej_aut.pwn"
#include "wypadek\wypadek.pwn"
#include "convoy\convoy.pwn"
#include "przedmioty\przedmioty.pwn"
#include "logi\logi.pwn"
#include "graffiti\graffiti.pwn"
#include "weryfikacje\weryfikacje.pwn"
#include "adminduty\adminduty.pwn"
#include "oferty\oferty.pwn"
#include "redis\redis.pwn"
#include "praca_diler\praca_diler.pwn"
#include "gunshoppanel\gunshoppanel.pwn"
#include "player_attachments\player_attachments.pwn"
#include "napady\napady.pwn"
#include "wejscia\wejscia.pwn"
#include "sannews\sannews.pwn"
#include "frakcja_lspd\frakcja_lspd.pwn"
#include "antyspam\antyspam.pwn"
#include "bijatyki\bijatyki.pwn"
#include "cooking\cooking.pwn"
#include "03DL\03DL.pwn"
#include "vehicle_attachments\vehicle_attachments.pwn"
#include "money\money.pwn"
#include "sila\sila.pwn"
#include "organizacje\organizacje.pwn"
#include "premium\premium.pwn"
#include "discord\discord.pwn"
#include "urzadls\urzadls.pwn"
#include "ibiza\ibiza.pwn"
#include "budki\budki.pwn"
#include "antycheat\antycheat.pwn"
#include "komendy\komendy.pwn"
#include "praca_mechanik\praca_mechanik.pwn"
#include "vicecity\vicecity.pwn"
#include "choroby\choroby.pwn"
#include "listaip\listaip.pwn"
#include "praca_kierowca\praca_kierowca.pwn"


//-------<[ timers ]>-------
#include "pojazdy\pojazdy_timers.pwn"
#include "prace\prace_timers.pwn"
#include "kajdanki\kajdanki_timers.pwn"
#include "praca_zlodziej_aut\praca_zlodziej_aut_timers.pwn"
#include "wypadek\wypadek_timers.pwn"
#include "convoy\convoy_timers.pwn"
#include "graffiti\graffiti_timers.pwn"
#include "weryfikacje\weryfikacje_timers.pwn"
#include "praca_diler\praca_diler_timers.pwn"
#include "napady\napady_timers.pwn"
#include "sannews\sannews_timers.pwn"
#include "frakcja_lspd\frakcja_lspd_timers.pwn"
#include "antyspam\antyspam_timers.pwn"
#include "bijatyki\bijatyki_timers.pwn"
#include "money\money_timers.pwn"
#include "organizacje\organizacje_timers.pwn"
#include "premium\premium_timers.pwn"
#include "urzadls\urzadls_timers.pwn"
#include "praca_mechanik\praca_mechanik_timers.pwn"
#include "vicecity\vicecity_timers.pwn"
#include "choroby\choroby_timers.pwn"
#include "praca_kierowca\praca_kierowca_timers.pwn"


//-------<[ mysql ]>-------
#include "pojazdy\pojazdy_mysql.pwn"
#include "biznesy\biznesy_mysql.pwn"
#include "fishing\fishing_mysql.pwn"
#include "prace\prace_mysql.pwn"
#include "graffiti\graffiti_mysql.pwn"
#include "gunshoppanel\gunshoppanel_mysql.pwn"
#include "player_attachments\player_attachments_mysql.pwn"
#include "cooking\cooking_mysql.pwn"
#include "vehicle_attachments\vehicle_attachments_mysql.pwn"
#include "organizacje\organizacje_mysql.pwn"
#include "premium\premium_mysql.pwn"
#include "choroby\choroby_mysql.pwn"


//-------<[ others ]>-------
#include "03DL\resources.pwn"
#include "choroby\choroby_effects.pwn"


//-------<[ callbacks ]>-------
#include "pojazdy\pojazdy_callbacks.pwn"
#include "biznesy\biznesy_callbacks.pwn"
#include "fishing\fishing_callbacks.pwn"
#include "prace\prace_callbacks.pwn"
#include "kajdanki\kajdanki_callbacks.pwn"
#include "praca_zlodziej_aut\praca_zlodziej_aut_callbacks.pwn"
#include "wypadek\wypadek_callbacks.pwn"
#include "convoy\convoy_callbacks.pwn"
#include "logi\logi_callbacks.pwn"
#include "weryfikacje\weryfikacje_callbacks.pwn"
#include "redis\redis_callbacks.pwn"
#include "praca_diler\praca_diler_callbacks.pwn"
#include "gunshoppanel\gunshoppanel_callbacks.pwn"
#include "player_attachments\player_attachments_callbacks.pwn"
#include "napady\napady_callbacks.pwn"
#include "frakcja_lspd\frakcja_lspd_callbacks.pwn"
#include "bijatyki\bijatyki_callbacks.pwn"
#include "cooking\cooking_callbacks.pwn"
#include "vehicle_attachments\vehicle_attachments_callbacks.pwn"
#include "money\money_callbacks.pwn"
#include "sila\sila_callbacks.pwn"
#include "organizacje\organizacje_callbacks.pwn"
#include "premium\premium_callbacks.pwn"
#include "antycheat\antycheat_callbacks.pwn"
#include "vicecity\vicecity_callbacks.pwn"
#include "choroby\choroby_callbacks.pwn"
#include "listaip\listaip_callbacks.pwn"
#include "praca_kierowca\praca_kierowca_callbacks.pwn"


//-------<[ commands ]>-------
#include "frakcje\commands\frakcje_commands.pwn"
#include "admin\commands\admin_commands.pwn"
#include "pojazdy\commands\pojazdy_commands.pwn"
#include "chaty\commands\chaty_commands.pwn"
#include "praca_przemytnik\commands\praca_przemytnik_commands.pwn"
#include "biznesy\commands\biznesy_commands.pwn"
#include "debug\commands\debug_commands.pwn"
#include "fishing\commands\fishing_commands.pwn"
#include "prace\commands\prace_commands.pwn"
#include "bramy\commands\bramy_commands.pwn"
#include "kajdanki\commands\kajdanki_commands.pwn"
#include "animacje\commands\animacje_commands.pwn"
#include "bw\commands\bw_commands.pwn"
#include "praca_zlodziej_aut\commands\praca_zlodziej_aut_commands.pwn"
#include "wypadek\commands\wypadek_commands.pwn"
#include "convoy\commands\convoy_commands.pwn"
#include "graffiti\commands\graffiti_commands.pwn"
#include "weryfikacje\commands\weryfikacje_commands.pwn"
#include "oferty\commands\oferty_commands.pwn"
#include "praca_diler\commands\praca_diler_commands.pwn"
#include "gunshoppanel\commands\gunshoppanel_commands.pwn"
#include "player_attachments\commands\player_attachments_commands.pwn"
#include "napady\commands\napady_commands.pwn"
#include "sannews\commands\sannews_commands.pwn"
#include "frakcja_lspd\commands\frakcja_lspd_commands.pwn"
#include "bijatyki\commands\bijatyki_commands.pwn"
#include "cooking\commands\cooking_commands.pwn"
#include "vehicle_attachments\commands\vehicle_attachments_commands.pwn"
#include "money\commands\money_commands.pwn"
#include "sila\commands\sila_commands.pwn"
#include "organizacje\commands\organizacje_commands.pwn"
#include "premium\commands\premium_commands.pwn"
#include "urzadls\commands\urzadls_commands.pwn"
#include "ibiza\commands\ibiza_commands.pwn"
#include "antycheat\commands\antycheat_commands.pwn"
#include "komendy\commands\komendy_commands.pwn"
#include "praca_mechanik\commands\praca_mechanik_commands.pwn"
#include "vicecity\commands\vicecity_commands.pwn"
#include "choroby\commands\choroby_commands.pwn"
#include "listaip\commands\listaip_commands.pwn"
#include "praca_kierowca\commands\praca_kierowca_commands.pwn"
