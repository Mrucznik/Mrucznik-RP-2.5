//enum.pwn

//bugozord 2.5.93
enum eKontakty {
	eUID,
	eNazwa[MAX_KONTAKT_NAME],
	eNumer
};
new Kontakty[MAX_PLAYERS][MAX_KONTAKTY][eKontakty];
enum muzykaURLData{
	muzykaString[64],
	Float:muzykaX,
	Float:muzykaY,
	Float:muzykaZ,
};
new muzykaURL[MAX_FRAC][muzykaURLData] = {
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0},
	{"http://www.miastomuzyki.pl/n/rmfmaxxx.pls", 0.0, 0.0, 0.0}
};

enum hqZgloszenia {
    zgloszenie_kiedy[36], // kiedy nadane zgloszenie
    zgloszenie_nadal[MAX_PLAYER_NAME], // nick ktory nadal zgloszenie
    zgloszenie_tresc[128], // tresc zgloszenia
    zgloszenie_lokacja[MAX_ZONE_NAME],
    zgloszenie_przyjal[MAX_PLAYER_NAME], // :)
    zgloszenie_status // 0 - nowe, 1 - akceptowane, 2 - odrzucone
}
enum hqZgloszeniaSasp {
    zgloszenie_kiedy[36], // kiedy nadane zgloszenie
    zgloszenie_nadal[MAX_PLAYER_NAME], // nick ktory nadal zgloszenie
    zgloszenie_tresc[128], // tresc zgloszenia
    zgloszenie_lokacja[MAX_ZONE_NAME],
    zgloszenie_przyjal[MAX_PLAYER_NAME], // :)
    zgloszenie_status // 0 - nowe, 1 - akceptowane, 2 - odrzucone
}

//23.12
enum eSupportData {
    bool:suppValid,
    suppCaller,
    suppSub[16],
    suppDesc[86]
}
//14.11
enum eMySQLCar { //1+1+1+1+3+1+1+1+2+1+1+1+1+1+2+32+1+1+1 = 54 B
    c_Owner,
    c_OwnerType,
    c_UID,
    c_Model,
    c_ID,
    Float:c_Pos[3],
    Float:c_Rot,
    Float:c_HP,
    c_Tires,
    c_Color[2],
    c_Nitro,
    bool:c_bHydraulika,
    c_Felgi,
    c_Malunek,
    c_Spoiler,
    c_Bumper[2],
    c_PlateText[32],
    c_Keys,
    c_Neon,
    c_Rang,
    c_Int,
    c_VW,
	c_Siren,
	c_Rejestracja[32]
};

new CarOwnerNames[][] = {
    "Brak",
    "Frakcja",
    "Organizacja",
    "Gracz",
    "Praca",
    "Specjalny",
    "Publiczny",
	"Do kradni�cia"
};

//30.10
enum eBoomBoxData {
    BBD_ID,
    BBD_Obj,
    BBD_Gang,
    Float:BBD_x,
    Float:BBD_y,
    Float:BBD_z,
    BBD_URL[128],
    bool:BBD_Standby,
    BBD_Carried,
    bool:BBD_Refresh
};

enum eTransportJobData {
    eTJDName[32],
    Float:eTJDStartX,
    Float:eTJDStartY,
    Float:eTJDStartZ,
    Float:eTJDEndX,
    Float:eTJDEndY,
    Float:eTJDEndZ,
    eTJDMoney,
    eTJDModel,
    eTJDMaxItems,
    eTJDMats
};

//19.06
enum eOilData {
    Float:oilPos[3],
    oilHP,
    oilObject,
    oilArea,
    oilTime
};
//13.06
enum eDoors {
    bool:d_State = true
};

enum ePat {
    patroluje[2],
    patstrefa,
    patstan,
    patname[24],
    pataktywny,
    pattyp,
    pattime
};

//Scena
enum eScenaEffect {
    SCEffectObj[5],
    SCEffectTimer,
    SCEffectDelay,
    SCEffectCount,
    SCEffectModel
};

enum eScenaNeon {
    SCNeonObj[2],
    SCNeonTimer,
    SCNeonDelay,
    SCNeonCount,
    SCNeonTyp,
    SCNeonModel,
    bool:SCNeonSlider,
    bool:SCNeonSliderRefresh,
    SCNeonZderzacz
};
//obrazenia
enum eOBRAZENIA {
	HOURS,
	MINUTES,
	SECONDS,
	ATTACKER[MAX_PLAYER_NAME],
	WEAPONID,
	Float:DAMAGE	
}
enum eOBRAZENIAZADANE {
	HOURS,
	MINUTES,
	SECONDS,
	DEFENDER[MAX_PLAYER_NAME],
	WEAPONID,
	Float:DAMAGE
}
//25.07 system stref gang�w
new Float:Zone_Data[MAX_ZONES][4] = {
    {1983.0, -1027.0, 2266.0, -933.0},
    {2019.0, -1091.0, 2266.0, -1030.0},
    {1882.0, -1127.0, 1963.0, -1044.0},
    {1984.0, -1127.0, 2052.0, -1092.0},
    {1874.0, -1256.0, 2056.0, -1143.0},
    {2084.0, -1215.0, 2166.0, -1111.0},
    {2188.0, -1210.0, 2255.0, -1127.0},
    {2276.0, -1069.0, 2392.0, -1024.0},
    {2415.0, -1035.0, 2592.0, -988.0},
    {2415.0, -1081.0, 2546.0, -1035.0},
    {2366.0, -1143.0, 2524.0, -1097.0},
    {2571.0, -1144.0, 2627.0, -1053.0},
    {2084.0, -1294.0, 2159.0, -1225.0},
    {2181.0, -1295.0, 2258.0, -1224.0},
    {2080.0, -1376.0, 2156.0, -1303.0},
    {2172.0, -1376.0, 2259.0, -1308.0},
    {1862.0, -1334.0, 2054.0, -1268.0},
    {1861.0, -1454.0, 1978.0, -1344.0},
    {1999.0, -1451.0, 2051.0, -1346.0},
    {2137.0, -1501.0, 2201.0, -1390.0},
    {2220.0, -1479.0, 2279.0, -1392.0},
    {2315.0, -1294.0, 2359.0, -1164.0},
    {2311.0, -1377.0, 2361.0, -1308.0},
    {2286.0, -1477.0, 2333.0, -1391.0},
    {2271.0, -1553.0, 2332.0, -1490.0},
    {2382.0, -1248.0, 2443.0, -1189.0},
    {2353.0, -1519.0, 2383.0, -1389.0},
    {2381.0, -1376.0, 2444.0, -1262.0},
    {2462.0, -1248.0, 2560.0, -1191.0},
    {2578.0, -1249.0, 2631.0, -1191.0},
    {2655.0, -1250.0, 2711.0, -1192.0},
    {2647.0, -1144.0, 2708.0, -1089.0},
    {2459.0, -1434.0, 2500.0, -1260.0},
    {2519.0, -1434.0, 2559.0, -1260.0},
    {2577.0, -1437.0, 2634.0, -1261.0},
    {2650.0, -1599.0, 2711.0, -1259.0},
    {2438.0, -1502.0, 2544.0, -1446.0},
    {2437.0, -1579.0, 2541.0, -1511.0},
    {1843.0, -1602.0, 1920.0, -1547.0},
    {1931.0, -1616.0, 2021.0, -1533.0},
    {2052.0, -1606.0, 2099.0, -1544.0},
    {1950.0, -1744.0, 2072.0, -1615.0},
    {1829.0, -1743.0, 1928.0, -1617.0},
    {2121.0, -1727.0, 2180.0, -1565.0},
    {2231.0, -1655.0, 2416.0, -1615.0},
    {2225.0, -1728.0, 2333.0, -1658.0},
    {2350.0, -1724.0, 2415.0, -1661.0},
    {2445.0, -1722.0, 2541.0, -1622.0},
    {2653.0, -1878.0, 2832.0, -1664.0},
    {1810.0, -2045.0, 1952.0, -1965.0},
    {1829.0, -2159.0, 1950.0, -2056.0},
    {1666.0, -2156.0, 1811.0, -2070.0},
    {2087.0, -1946.0, 2189.0, -1894.0},
    {2088.0, -1834.0, 2191.0, -1755.0},
    {2223.0, -1836.0, 2401.0, -1753.0},
    {2421.0, -1823.0, 2511.0, -1737.0},
    {2725.0, -1988.0, 2810.0, -1898.0},
    {2722.0, -2039.0, 2810.0, -1997.0},
    {2623.0, -2042.0, 2703.0, -1936.0},
    {2418.0, -2040.0, 2538.0, -1936.0},
    {2418.0, -1920.0, 2505.0, -1876.0},
    {2322.0, -1964.0, 2403.0, -1879.0},
    {2225.0, -1966.0, 2304.0, -1899.0},
    {2272.0, -2040.0, 2401.0, -1973.0},
    {2229.0, -1884.0, 2314.0, -1861.0}
}; //Strefy

new FractionNames[][40] = {
    "Brak",
    "Los Santos Police Department",
    "Federal Bureau of Investigation",
    "National Guards San Andreas",
    "Los Santos Rescue Service",
    "SA Bahamas",
    "Yakuza",
    "United States Secret Service",
    "Hitman Agency",
    "San News",
    "Korporacja Transportowa",
    "Urz�d Stanu San Andreas",//11
    "Grove Street Families",
    "Thirty deep mafia ballas",
    "Hillside Nortenos 14",
    "89 Border Society",
    "IV Saint Reich",
    "Brak",
    "Brak",
    "Brak"
};

//-----------------------------------------------------------------------------------------------------------------------------//

enum SavePlayerPosEnum
{
    Float:LastX,
    Float:LastY,
    Float:LastZ
}
new SavePlayerPos[MAX_PLAYERS][SavePlayerPosEnum];
//new SpeedMode = 1;
//new UpdateSeconds = 1;

new Music[MAX_PLAYERS];

enum eBO {
    bM, Float:bX, Float:bY, Float:bZ, Float:brX, Float:brY, Float:brZ
};

new BlinkOffset[][eBO] = {
    {400, -0.9001, 2.0490, -0.0965, -0.9605, -2.2404, -0.0965},
    {401, -0.9686, 2.5393, 0.0235, -0.9970, -2.2863, 0.0235},
    {402, -0.8788, 2.5160, -0.0565, -0.9208, -2.5936, 0.0435},
    {403, -1.3897, 3.6007, -0.2194, -1.1904, -0.9415, 1.8389},
    {404, -0.7236, 2.1715, -0.0365, -0.7906, -2.7052, 0.0635},
    {405, -0.9127, 2.2766, -0.0565, -0.8723, -2.6526, -0.0565},
    {406, -2.2165, 4.9242, -0.0332, -2.0785, -5.2054, 0.5468},
    {407, -0.9887, 4.0622, -0.0913, -1.0141, -3.4034, -0.0913},
    {408, -0.9659, 4.7615, -0.2513, -0.8430, -3.9722, -0.5113},
    {409, -0.7859, 3.5522, -0.0313, -0.8027, -3.8228, -0.0313},
    {410, -0.825, 2.105, 0.0635, -0.8723, -2.1926, 0.1235},
    {411, -0.9405, 2.6710, -0.1825, -0.9636, -2.4525, 0.0825},
    {412, -0.8965, 2.6478, -0.0575, -0.9592, -3.4870, -0.1575},
    {413, -0.8669, 2.5464, -0.0913, -0.8209, -2.5829, 0.0687},
    {414, -0.8069, 2.7473, 0.0087, -0.9058, -3.2050, 0.1094},
    {415, -0.8738, 2.4866, -0.2357, -0.7792, -2.3501, 0.0450},
    {416, -0.8469, 2.9073, 0.0087, -1.0352, -3.5937, 1.4522},
    {417, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {418, -0.9511, 2.3820, -0.2357, -1.0081, -2.4904, -0.1557},
    {419, -1.0742, 2.3978, -0.1757, -0.8127, -2.8620, -0.1557},
    {420, -1.0142, 2.2978, -0.0157, -0.9637, -2.6744, 0.0043},
    {421, -0.9013, 2.5343, -0.1357, -0.5921, -2.9228, -0.1957},
    {422, -0.7813, 2.1543, -0.2657, -0.8985, -2.4349, -0.1057},
    {423, -0.7817, 2.2093, -0.0313, -0.8340, -2.1794, 0.0596},
    {424, -0.7350, 1.4505, 0.1087, -0.7062, -1.4778, 0.2996},
    {425, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {426, -1.0006, 2.3164, -0.0100, -0.9627, -2.6930, -0.0100},
    {427, -0.8728, 2.5856, 0.1887, -0.9831, -3.8383, -0.3495},
    {428, -0.8728, 2.5856, -0.2103, -0.9045, -2.8871, 1.2466},
    {429, -0.7942, 2.2846, -0.2500, -0.8397, -2.3849, -0.0070},
    {430, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {431, -0.9771, 5.8479, 0.3497, -1.0300, -5.7043, -0.1041},
    {432, -1.7168, 4.0330, 0.4497, -1.5830, -4.3414, 0.7039},
    {433, -1.2619, 3.7708, -0.2163, -1.2966, -4.6534, -0.1051},
    {434, 0.0, 0.0, 0.0, -0.4811, -1.9838, -0.0670},
    {435, 0.0000, 0.0000, 0.0000, -1.0697, -3.9690, -1.1053}, //trailer
    {436, -0.8495, 2.2519, -0.0070, -0.8948, -2.4838, 0.1130},
    {437, -1.1156, 5.5395, -0.2163, -0.9856, -5.3099, 1.6458},
    {438, -1.1128, 2.3675, -0.2870, -1.0992, -2.4601, -0.2870},
    {439, -0.8381, 2.3101, -0.1470, -0.8221, -2.6534, -0.1070},
    {440, -0.8270, 2.5573, -0.3173, -0.8676, -2.5376, -0.0149},
    {441, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {442, -1.0354, 2.8278, -0.1870, -1.0226, -3.0877, -0.1270},
    {443, -1.0610, 5.7528, -0.9573, -1.2388, -7.1392, -0.8250},
    {444, -0.9880, 2.7188, 0.6140, -1.0722, -3.0184, 0.7248},
    {445, -0.9590, 2.3460, -0.0840, -0.9773, -2.8049, -0.0840},
    {446, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {447, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {448,  -0.1992, -0.9229, -0.1270},
    {449, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {450, 0.0000, 0.0000, 0.0000, -1.0697, -3.9690, -1.1053}, //trailer
    {451, -0.9826, 1.9642, -0.1399, -0.8894, -2.3991, -0.0199},
    {452, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {453, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {454, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {455, 0.0000, 0.0000, 0.0000, -1.3866, -4.5162, -0.7399},
    {456, 0.0000, 0.0000, 0.0000, -1.3045, -4.6123, 0.4601},
    {457, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {458, -0.9513, 2.4197, -0.1399, -0.9703, -2.7779, 0.0201},
    {459, -0.8214, 2.5716, -0.1274, -0.8760, -2.5775, 0.1127},
    {460, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {461, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {462, 0.0000, 0.0000, 0.0000, -0.2054, -0.9359, -0.1399},
    {463, -0.2276, 0.7185, 0.3201, -0.1952, -1.0037, 0.1601},
    {464, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {465, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {466, 0.0000, 0.0000, 0.0000, -1.0201, -2.7994, 0.0401},
    {467, 0.0000, 0.0000, 0.0000, -0.9401, -3.0594, 0.1601},
    {468, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {469, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {470, -1.0259, 2.1382, 0.2001, -1.0433, -2.5463, 0.1201},
    {471, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {472, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {473, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {474, 0.0000, 0.0000, 0.0000, -0.9833, -2.7663, -0.0599},
    {475, -0.8681, 2.4086, -0.3399, -0.8632, -2.7629, -0.2399},
    {476, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {477, -0.8081, 2.6686, -0.1999, -0.9945, -2.6987, 0.0801},
    {478, -1.0938, 2.0255, 0.1001, -1.0579, -2.5378, -0.2799},
    {479, -0.9671, 2.4844, 0.0201, -0.9578, -2.7556, 0.0601},
    {480, -0.5897, 2.2607, -0.4399, -0.9183, -2.3388, -0.1399},
    {481, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {482, -0.8841, 2.4094, -0.3399, -0.8685, -2.5676, 0.0201},
    {483, -0.7770, 2.6235, -0.0199, -0.6709, -2.7712, -0.1999},
    {484, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {485, -0.6104, 1.7180, 0.2201, -0.7074, -1.3681, 0.1201},
    {486, 0.0000, 0.0000, 0.0000, -0.5919, -3.2353, 0.9601},
    {487, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {488, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {489, -1.1024, 2.5796, 0.0401, -1.1261, -2.6473, 0.1601},
    {490, -1.0971, 3.1462, 0.0401, -1.1327, -3.1055, 0.1601},
    {491, -0.8495, 2.5284, -0.0799, -0.8870, -2.7776, 0.0001},
    {492, -0.7905, 2.4656, -0.0599, -0.9075, -2.8130, 0.0001},
    {493, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {494, -0.8513, 2.3630, -0.2199, -0.8275, -2.8485, 0.1401},
    {495, -1.0909, 2.3818, 0.0001, -1.1540, -2.1156, -0.0399},
    {496, -0.9219, 2.1787, 0.0401, -0.7095, -2.1087, 0.0801},
    {497, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000},
    {498, -0.8915, 3.0670, 0.2201, -0.9740, -3.0460, 0.3601},
    {499, -0.7725, 2.4576, -0.1999, -1.1318, -3.4186, 0.1401},
    {500, -0.9152, 1.9097, -0.0355, -0.7552, -1.9266, -0.0355},
    {501, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {502, -0.8723, 2.5986, -0.1770, 0.0, 0.0, 0.0},
    {503, -0.8579, 2.3582, -0.0213, 0.0, 0.0, 0.0},
    {504, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {505, -1.1068, 2.5744, 0.0086, -1.1365, -2.6250, 0.1679},
    {506, -0.7672, 2.2106, -0.3185, -0.9113, -2.3474, -0.0273},
    {507, -1.1143, 2.6057, -0.0456, -1.1410, -2.9714, -0.0456},
    {508, -0.7012, 3.0199, -0.6678, -1.3807, -3.3356, 1.2628},
    {509, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {510, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {511, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {512, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {513, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {514, -1.2341, 4.2204, 0.0806, 0.0, 0.0, 0.0},
    {515, -1.4241, 4.4811, -0.7354, -1.2973, -4.8274, -0.8974},
    {516, -0.9512, 2.7208, -0.0543, -0.9926, -2.7809, -0.0348},
    {517, -0.9401, 2.7868, -0.0726, -1.0208, -2.7461, -0.1324},
    {518, -0.9166, 2.6548, -0.0487, -1.0124, -2.8219, -0.0487}, //fake
    {519, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {520, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {521, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {522, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {523, -0.2607, 0.6038, 0.2881, -0.1973, -0.9958, 0.0638},
    {524, -0.9279, 3.6538, -0.0473, -1.3003, -3.9309, -1.0661}, //fake back
    {525, -0.8576, 2.9431, 0.1425, -1.0428, -2.9851, -0.1486}, //fake back
    {526, -0.9421, 2.3087, -0.1128, -0.9559, -2.2882, -0.0411},
    {527, -0.9351, 2.4078, -0.0242, -0.9825, -2.2344, 0.0844},
    {528, -0.8783, 2.5102, -0.1526, -0.8133, -2.5965, -0.3237}, //fake back
    {529, -1.0177, 2.5256, 0.0698, -1.0505, -2.5713, 0.2047},
    {530, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {531, -0.4216, 1.5030, -0.1191, -0.5225, -1.0517, 0.4484}, //fake
    {532, -4.0331, 3.9619, -0.9118, -1.5976, -0.3739, 0.4484}, //fake!
    {533, -0.9410, 2.3774, 0.0985, -0.9852, -2.4663, -0.0020},
    {534, -1.0159, 2.9278, -0.1698, -0.8236, -2.7548, -0.0574},
    {535, -0.8265, 2.5014, -0.2084, -0.9267, -2.6058, -0.1784},
    {536, -0.8577, 2.3943, -0.1248, -0.8736, -3.0999, -0.0900},
    {537, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {538, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {539, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {540, -0.9827, 2.5810, -0.1248, -1.0597, -2.7121, -0.0842},
    {541, -0.6055, 2.3378, -0.2108, -0.7826, -2.1992, 0.0913},
    {542, -0.9712, 2.6252, -0.0064, -0.8281, -2.9729, -0.0577},
    {543, -0.8414, 2.2904, 0.0719, -0.9831, -2.6214, -0.0116}, //fake front
    {544, -0.7346, 3.5720, 0.0200, -0.8597, -3.2242, -0.5918},
    {545, -0.4372, 1.6776, -0.0400, -0.7955, -2.0453, -0.2888},
    {546, -1.1294, 1.0702, 0.0719, -1.0580, -2.6948, 0.0719},
    {547, -0.9582, 2.5222, 0.0271, -0.9937, -2.5915, 0.0719},
    {548, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {549, -0.9264, 2.4914, 0.0271, -0.9070, -2.5802, 0.0271},
    {550, -1.0477, 2.5642, -0.1807, -1.0302, -2.6549, -0.1297},
    {551, -0.9334, 2.6344, -0.0448, -0.9785, -3.0524, 0.0366},
    {552, -0.8757, 3.0634, 0.3600, -0.9933, -2.9119, 0.4752},
    {553, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {554, -0.9409, 2.5345, 0.0600, -1.1112, -2.8095, 0.0651},
    {555, -0.9236, 1.1282, -0.0462, 0.0, 0.0, 0.0},
    {556, -0.9686, 2.5396, 0.5800, -1.1128, -2.8895, 0.7691},
    {557, -0.9886, 2.4796, 0.7000, -1.0904, -2.7699, 0.6871},
    {558, -0.9452, 2.0854, 0.0836, -0.9187, -2.4047, 0.3185},
    {559, -0.9037, 2.4333, -0.0168, -0.8819, -2.2910, 0.1482},
    {560, -0.9347, 2.5097, -0.2644, -0.9639, -2.2337, 0.1259},
    {561, -0.9157, 2.5754, -0.0857, -0.9317, -2.5444, -0.0191},
    {562, -0.9299, 2.3759, 0.0201, -0.8575, -2.2773, 0.1659},
    {563, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {564, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {565, -0.8503, 2.0545, 0.0346, -0.9249, -1.9224, 0.0816},
    {566, -0.9539, 2.7226, 0.0346, -0.9506, -2.9199, 0.0346},
    {567, -0.9942, 2.9212, -0.1543, -1.0077, -2.9164, -0.1543},
    {568, -0.2962, 2.0729, -0.0171, -0.2384, -1.2180, 0.0720},
    {569, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {570, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {571, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {572, -0.3095, 0.7291, -0.0971, -0.4318, -0.8940, -0.0510},
    {573, -0.7949, 3.0624, -0.3371, -0.8727, -3.0917, -0.4540},
    {574, -0.4348, 1.6912, -0.2171, -0.4277, -1.1358, -0.2069},
    {575, -0.9483, 2.3252, 0.1334, -0.9173, -2.7359, -0.0291},
    {576, -0.9948, 2.4505, 0.1883, -0.9983, -3.1357, -0.0291},
    {577, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {578, -1.0478, 4.3687, -0.1800, -1.1188, -5.3472, -0.5099},
    {579, -1.0598, 2.3634, 0.1013, -1.0873, -2.7596, 0.1013},
    {580, -0.7970, 2.6313, -0.2429, -1.0776, -2.8302, 0.1013},
    {581, 0.0, 0.0, 0.0, -0.1975, -1.0375, 0.3448},
    {582, -0.8583, 2.4404, -0.0571, -0.9214, -3.3625, 0.0521},
    {583, -0.5225, 1.3799, 0.2429, -0.5486, -1.5684, 0.2462},
    {584, 0.0, 0.0, 0.0, -1.0452, -4.3338, -0.7298}, //trailer
    {585, -1.0068, 2.7905, 0.0907, -0.9760, -3.0160, 0.2088},
    {586, -0.2872, 0.5383, 0.2009, -0.1703, -1.3533, 0.2784},
    {587, -1.0236, 2.1415, -0.2834, -1.0832, -2.4851, 0.1047},
    {588, -1.0116, 3.3590, 0.1029, -1.0679, -3.9639, -0.3029},
    {589, -0.8107, 2.3905, 0.1834, -0.9605, -2.2799, 0.3761},
    {590, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {591, 0.0, 0.0, 0.0, -1.0590, -3.9902, -1.0809}, //trailer
    {592, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {593, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {594, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {595, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {596, -1.0419, 2.2929, -0.0255, -1.0332, -2.6951, 0.0005},
    {597, -1.0419, 2.2929, -0.0255, -1.0332, -2.6951, 0.0005},
    {598, -1.0423, 2.3495, 0.0600, -1.0326, -2.6930, 0.0600},
    {599, -1.0837, 2.5663, 0.0301, -1.1267, -2.6290, 0.1451},
    {600, -0.8782, 2.6525, -0.0344, -1.0586, -2.6696, 0.0596},
    {601, -0.8094, 3.0084, 0.5429, -0.9321, -3.0808, 0.9071},
    {602, -1.0297, 2.0487, -0.0543, -0.8907, -2.5334, -0.3228},
    {603, -0.9069, 2.6672, -0.1335, -0.8647, -2.5991, -0.1335},
    {604, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {605, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {606, 0.0, 0.0, 0.0, -0.5702, -1.5842, 0.7956}, //trailer
    {607, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {608, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {609, -0.8972, 3.0244, 0.2629, -0.9349, -2.9809, 0.2791},
    {610, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    {611, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
    //END GTA CARS
};

new GunNames[47][] = {
	"Pi�ci",//0
	"Kastet",//1
	"Kij golfowy",//2
	"Pa�ka policyjna",//3
	"N�",//4
	"Kij Baseballowy",//5
	"�opata",//6
	"Kij bilardowy",//7
	"Katana",//8
	"Pi�a mechaniczna",//9
	"Purple Dildo",//10
	"Small White Vibrator",//11
	"Large White Vibrator",//12
	"Silver Vibrator",//13
	"Kwiaty",//14
	"Laska",//15
	"Granaty",//16
	"Gaz �zawi�cy",//17
	"Koktajl Mo�otova",//18
	"B��d",//19
	"B��d",//20
	"B��d",//21
	"Pistolet 9mm",//22
	"Pistolet z t�umikiem",//23
	"Desert Eagle",//24
	"Shotgun",//25
	"Obrzyny",//26
	"Spas-12",//27
	"UZI",//28
	"MP5",//29
	"AK-47",//30
	"M4",//31
	"TEC-9",//32
	"Gwint�wka",//33
	"Snajperka",//34
	"RPG",//35
	"Wyrzutnia rakiet",//36
	"Ogniomiotacz",//37
	"Minigun",//38
	"C4",//39
	"Detonator",//40
	"Sprej",//41
	"Ga�nica",//42
	"Aparat",//43
	"Nightvision Goggle",//44
	"Thermal Goggles",//45
	"Spadochron"//46
};

new DeathNames[9][] = {
    "Spadochron",
	"Fake Pistol",//47
	"???",//48
	"Pojazd",//49
	"�mig�o heli",//50
	"Explozja",//51
	"???",//52
	"Utoni�cie",//53
	"Upadek"//54
};

new VehicleNames[215][] = {
   "Landstalker",  "Bravura",  "Buffalo", "TIR", "Perennial", "Sentinel",
   "Wywrotka",  "Straz" ,  "Smieciarka" ,  "Limuzyna",  "Manana",  "Infernus",
   "Voodoo", "Pony",  "Mule", "Cheetah", "Karetka",  "Leviathan",  "Moonbeam",
   "Esperanto", "Taxi",  "Washington",  "Bobcat",  "Lodziarnia", "BF Injection",
   "Hunter", "Premier",  "Enforcer",  "Securicar", "Banshee", "Predator", "Bus",
   "Czolg",  "Barracks",  "Hotknife",  "Przyczepa",  "Previon", "Autobus", "Taxi",
   "Stallion", "Rumpo", "RC Bandit",  "Karawan", "Packer", "Monster",  "Admiral",
   "Squalo", "Seasparrow", "Pizzaboy", "Tramwaj", "Przyczepa",  "Turismo", "Speeder",
   "Kuter",/* Reefer */ "Tropic", "Flatbed","Yankee", "Caddy", "Solair","Berkley's RC Van",
   "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron","RC Raider","Glendale",
   "Oceanic", "Sanchez", "Sparrow",  "Hummer", "Quad",  "Coastguard", "Ponton",
   "Hermes", "Sabre", "Rustler", "ZR-350", "Walton",  "Regina",  "Comet", "BMX",
   "Burrito", "Camper", "Jacht", "Baggage", "Dozer","Maverick","Newsokopter",
   "Rancher", "Rancher FBI", "Virgo", "Greenwood","Jetmax","Hotring","Sandking",
   "Blista Compact", "Policyjny Maverick", "Boxville", "Benson","Mesa","RC Goblin",
   "Hotring Racer", "Hotring Racer", "Bloodring Banger", "Rancher",  "Super GT",
   "Elegant", "Kamping", "Rower", "Rower Gorski", "Beagle", "Cropdust", "Stunt",
   "Tanker", "RoadTrain", "Nebula", "Majestic", "Buccaneer", "Shamal",  "Hydra",
   "FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona",
   "Pancernik", "Willard", "Forklift","Traktor","Combine","Feltzer","Remington",
   "Slamvan", "Blade", "Freight", "Streak","Vortex","Vincent","Bullet","Clover",
   "Sadler",  "Straz", "Hustler", "Intruder", "Primo", "Cargobob",  "Tampa",
   "Sunrise", "Merit",  "Utility Truck",  "Nevada", "Yosemite", "Windsor",  "Monster",
   "Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger",
   "Flash","Tahoma","Savanna", "Bandito", "Freight", "Trailer", "Kart", "Turbowozek",
   "Dune", "Sweeper", "Broadway", "Tornado", "AT-400",  "DFT-30", "Huntley",
   "Stafford", "BF-400", "SANvan","Tug","Trailer","Emperor","Wayfarer","Euros",
   "Hotdog", "Club", "Trailer", "Trailer","Andromada","Dodo","RC Cam", "Launch",
   "Radiowoz (LSPD)", "Radiowoz (SFPD)","Radiowoz (LVPD)","Policyjny Jeep",
   "Picador",   "Opancerzona Armatka",  "Alpha",   "Phoenix",   "Glendale",   "Sadler",
   "Luggage Trailer","Luggage Trailer","Stair Trailer", "Boxville", "Kombajn",
   "Utility Trailer", "Brak pojazdu", "Brak �odzi", "Brak samolotu"
};

enum SAZONE_MAIN
{ //Betamaster
	SAZONE_NAME[28],
	Float:SAZONE_AREA[6]
};

new Float:PaintballSpawns[7][3] = {
{-394.8027,2232.2317,42.4297},
{-430.8412,2240.5371,42.9834},
{-369.2361,2248.3127,42.4844},
{-350.8910,2218.0215,42.4912},
{-384.0544,2206.2908,42.4235},
{-395.7100,2214.9480,42.4297},
{-445.3718,2222.5481,42.4297}
};

new Float:Cela[8][3] = {
{1557.1688,-1636.8484,28.4881},
{1557.3066,-1640.1306,28.4881},
{1557.2548,-1646.0397,28.4881},
{1557.0842,-1649.1653,28.4881},
{1562.5618,-1649.2319,28.4881},
{1562.6492,-1645.9365,28.4881},
{1562.7338,-1639.8497,28.4881},
{1562.7771,-1636.6851,28.4881}
};

new Float:SpawnStanowe[3][3] = {
    {-540.3912,2594.4626,87.3739},
    {-551.7859,2605.2214,86.1356},
    {-541.7159,2599.8838,86.1356}
};

new Float:LosowyParking[27][4] = {
{2161.2605,-1197.3385,23.5517,89.7108},//1
{2161.0071,-1192.6439,23.4812,90.5042},//2
{2160.9656,-1187.9816,23.4800,90.5042},//3
{2160.9233,-1183.1466,23.4788,90.5042},//4
{2160.8806,-1178.2858,23.4776,90.5042},//5
{2160.8352,-1173.1339,23.4763,90.5042},//6
{2160.7915,-1168.2013,23.4751,90.5042},//7
{2160.7498,-1163.4933,23.4739,90.5042},//8
{2160.7043,-1158.3149,23.4726,90.5042},//9
{2160.6587,-1153.1633,23.4713,90.5042},//10
{2160.6128,-1148.3796,23.9337,90.5042},//11
{2160.5649,-1143.8113,24.8596,90.5042},//12
{2148.7363,-1203.4053,23.5150,270.6497},//13
{2148.6887,-1199.0850,23.6128,270.6497},//14
{2148.6409,-1194.7642,23.7106,270.6497},//15
{2148.5842,-1189.6375,23.8267,270.6497},//16
{2148.5342,-1185.1234,23.9289,270.6497},//17
{2148.4814,-1180.3663,24.0366,270.6497},//18
{2148.3794,-1171.1194,24.2460,270.6497},//19
{2148.3274,-1166.4340,24.3521,270.6497},//20
{2148.2791,-1162.0425,24.4516,270.6497},//21
{2148.2290,-1157.5012,24.5544,270.6497},//22
{2148.1829,-1153.3276,24.6489,270.6497},//23
{2148.1255,-1148.1309,24.7666,270.6497},//24
{2148.0740,-1143.4689,24.8721,270.6497},//25
{2148.0215,-1138.7086,24.9799,270.6497},//26
{2148.6426,-1133.7229,25.2246,268.2947}//27
};

new Float:LosowyParkingLodz[12][4] = {
{879.3727,-2132.0442,0.3390,358.7522},//1
{871.0922,-2133.2502,0.2832,358.7522},//2
{860.1934,-2130.2979,0.2826,358.7522},//3
{848.5974,-2130.0444,0.2357,358.7522},//4
{817.7367,-2129.3699,0.1109,358.7522},//5
{807.3911,-2129.1436,0.0691,358.7522},//6
{797.1891,-2128.9204,0.0278,358.7522},//7
{785.9393,-2128.6741,-0.0177,358.7522},//8
{787.8491,-2154.8499,-0.5345,271.5586},//9
{805.8829,-2154.3594,-0.5345,271.5586},//10
{852.2579,-2153.3076,-0.1834,91.5407},//11
{872.4399,-2152.7646,-0.1834,91.5407}//12
};

new Float:LosowyParkingLot[5][4] = {
{-1333.7086,-262.3719,15.4806,308.8053},//1
{-1365.9301,-222.4119,15.5005,320.0509},//2
{-1342.7333,-528.3967,15.4839,206.4393},//3
{-1418.7594,-566.2009,15.4893,206.4396},//4
{-1262.3978,-40.7492,15.4878,136.1659}//5
};

new Float:LosowyParkingHeli[4][4] = {
{-1223.1534,-9.9876,15.1069,179.3555},//1
{-1186.3279,24.3632,14.9595,179.3555},//2
{-1127.5322,-206.1180,18.1195,78.1055},//3
{-1614.3762,-651.5762,18.1113,331.2215}//4
};

// Vice City
new Float:LosowyParkingVC[][4] = {
{3999.0532 + VICECITY_MOVE_X, -1845.7126 + VICECITY_MOVE_Y, 7.3458, 42.4283},
{3994.6670 + VICECITY_MOVE_X, -1849.8041 + VICECITY_MOVE_Y, 7.3451, 44.5398},
{4018.5742 + VICECITY_MOVE_X, -1827.5950 + VICECITY_MOVE_Y, 7.5056, 48.5730},
{4022.1338 + VICECITY_MOVE_X, -1822.2615 + VICECITY_MOVE_Y, 7.6007, 50.9378},
{4026.9375 + VICECITY_MOVE_X, -1816.6168 + VICECITY_MOVE_Y, 7.6213, 56.4418},
{4029.6555 + VICECITY_MOVE_X, -1808.4176 + VICECITY_MOVE_Y, 7.6196, 79.2455},
{4031.6287 + VICECITY_MOVE_X, -1801.9791 + VICECITY_MOVE_Y, 7.6067, 85.0286},
{4033.7290 + VICECITY_MOVE_X, -1793.4656 + VICECITY_MOVE_Y, 7.6166, 86.8988},
{4033.4697 + VICECITY_MOVE_X, -1787.5624 + VICECITY_MOVE_Y, 7.6196, 89.6386},
{4033.8403 + VICECITY_MOVE_X, -1782.0519 + VICECITY_MOVE_Y, 7.6206, 92.0314},
{4034.3508 + VICECITY_MOVE_X, -1776.9379 + VICECITY_MOVE_Y, 7.6189, 89.5326},
{4029.8894 + VICECITY_MOVE_X, -1776.6511 + VICECITY_MOVE_Y, 7.6189, 180.0216},
{4025.2881 + VICECITY_MOVE_X, -1777.4594 + VICECITY_MOVE_Y, 7.6161, 178.9343},
{4018.5806 + VICECITY_MOVE_X, -1787.5978 + VICECITY_MOVE_Y, 7.6139, 182.2216},
{3986.3330 + VICECITY_MOVE_X, -1796.7516 + VICECITY_MOVE_Y, 7.5413, 225.4961},
{3996.5195 + VICECITY_MOVE_X, -1808.2832 + VICECITY_MOVE_Y, 7.5395, 319.1858}
};

// Vice City
new Float:LosowyParkingLodzVC[][4] = {
{4718.0430 + VICECITY_MOVE_X, -2362.3933 + VICECITY_MOVE_Y, -0.3949, 106.8876},
{4718.5947 + VICECITY_MOVE_X, -2234.8137 + VICECITY_MOVE_Y, -0.1551, 96.0671},
{4422.2358 + VICECITY_MOVE_X, -2459.7659 + VICECITY_MOVE_Y, -0.1244, 249.3001}
};

// Vice City
new Float:LosowyParkingLotVC[][4] = {
{3201.7014 + VICECITY_MOVE_X, -2084.5020 + VICECITY_MOVE_Y, 9.3233, 272.5807},
{3204.7253 + VICECITY_MOVE_X, -2009.1082 + VICECITY_MOVE_Y, 9.3188, 269.6011},
{3203.9919 + VICECITY_MOVE_X, -1958.3674 + VICECITY_MOVE_Y, 9.3184, 266.9476},
{3202.5969 + VICECITY_MOVE_X, -1884.7164 + VICECITY_MOVE_Y, 9.3144, 268.0507}
};

// Vice City
new Float:LosowyParkingHeliVC[][4] = {
{3216.5085 + VICECITY_MOVE_X, -1782.0823 + VICECITY_MOVE_Y, 9.3136, 238.5242}
};

// Vice City
new Float:LosowyParkingMotorVC[][4] = {
{4417.1616 + VICECITY_MOVE_X, -296.2927 + VICECITY_MOVE_Y, 5.3076, 354.2859},
{4415.1230 + VICECITY_MOVE_X, -296.6795 + VICECITY_MOVE_Y, 5.3157, 354.8142},
{4412.8696 + VICECITY_MOVE_X, -296.4884 + VICECITY_MOVE_Y, 5.2463, 353.2339},
{4410.7666 + VICECITY_MOVE_X, -297.0619 + VICECITY_MOVE_Y, 5.2635, 355.2010},
{4408.3882 + VICECITY_MOVE_X, -297.6766 + VICECITY_MOVE_Y, 5.2915, 348.4241},
{4394.5474 + VICECITY_MOVE_X, -299.0921 + VICECITY_MOVE_Y, 5.2583, 26.8302},
{4392.6138 + VICECITY_MOVE_X, -299.3900 + VICECITY_MOVE_Y, 5.2753, 39.3740},
{4390.8569 + VICECITY_MOVE_X, -299.6509 + VICECITY_MOVE_Y, 5.2746, 37.5447},
{4388.8340 + VICECITY_MOVE_X, -300.0462 + VICECITY_MOVE_Y, 5.3014, 35.5974}
};

// Vice City
new Float:LosowyParkingWodolotVC[][4] = {
{4674.9868 + VICECITY_MOVE_X, -2667.4949 + VICECITY_MOVE_Y, 1.4676, 1.5826},
{4674.5762 + VICECITY_MOVE_X, -2653.9617 + VICECITY_MOVE_Y, 1.0766, 3.2470},
{4679.4233 + VICECITY_MOVE_X, -2693.7141 + VICECITY_MOVE_Y, 2.1052, 6.5168}
};

//respawn count
new Count = 20;

new Float:gCopPlayerSpawns[2][3] = {
{1578.2158,-1633.9244,13.3991},
{1578.2158,-1633.9244,13.3991}
};

enum pBoxingStats
{
    TitelName[128],
    TitelWins,
    TitelLoses,
};
new Titel[pBoxingStats];

enum pSpec
{
	Float:Coords[3],
	Float:sPx,
	Float:sPy,
	Float:sPz,
	sPint,
    sPvw,
	sLocal,
	sCam,
};
new Unspec[MAX_PLAYERS][pSpec];

enum eCars
{
	model_id,
	Float:pos_x,
	Float:pos_y,
	Float:pos_z,
	Float:z_angle,
};


enum hNews
{
	hTaken1,
	hTaken2,
	hTaken3,
	hTaken4,
	hTaken5,
	hAdd1[128],
	hAdd2[128],
	hAdd3[128],
	hAdd4[128],
	hAdd5[128],
	hContact1[128],
	hContact2[128],
	hContact3[128],
	hContact4[128],
	hContact5[128],
};
new News[hNews];

enum pInfo
{
	pUID,
	pNick[24],
	pKey[129],
	pSalt[SALT_LENGTH],
	pLevel,
	pAdmin,
	pDonateRank,
	pMrucznikCoins,
	gPupgrade,
	pConnectTime,
	pReg,
	pSex,
	pAge,
	pOrigin,
	pCK,
	pMuted,
	pExp,
	pCash,
	pAccount,
	pCrimes,
	pKills,
	pDeaths,
	pArrested,
	pWantedDeaths,
	pPhoneBook,
	pLottoNr,
	pFishes,
	pBiggestFish,
	pJob,
	pPayCheck,
	pHeadValue,
	pBP,
	pJailed,
	pJailTime,
	pMats,
	pContraband,
	pDrugs,//tymczasowe
	//pZiolo,
	pLider,
	pMember,
	pOrg,
	pRank,
	pChar,
	pSkin,
	pContractTime,
	pDetSkill,
	pSexSkill,
	pBoxSkill,
	pLawSkill,
	pMechSkill,
	pJackSkill,
	pCarSkill,
	pNewsSkill,
	pDrugsSkill,
	pCookSkill,
	pFishSkill,
	pGunSkill,
    pTruckSkill,
	Float:pHealth,
	Float:pSHealth,
	pInt,
	pVW,
	pDomWKJ,
	pDomT,
	//pDomW,
	pLocal,
	pTeam,
	pJobSkin,
	pPnumber,
	pDom,
	pWynajem,
	pPbiskey,
	Float:pPos_x,
	Float:pPos_y,
	Float:pPos_z,
	pCarLic,
	pFlyLic,
	pBoatLic,
	pFishLic,
	pGunLic,
	pGun0,
	pGun1,
	pGun2,
	pGun3,
	pGun4,
	pGun5,
	pGun6,
	pGun7,
	pGun8,
	pGun9,
	pGun10,
	pGun11,
	pGun12,
	pAmmo0,
	pAmmo1,
	pAmmo2,
	pAmmo3,
	pAmmo4,
	pAmmo5,
	pAmmo6,
	pAmmo7,
	pAmmo8,
	pAmmo9,
	pAmmo10,
	pAmmo11,
	pAmmo12,
	pCarTime,
	pPayDay,
	pPayDayHad,
	pCDPlayer,
	pWins,
	pLoses,
	pAlcoholPerk,
	pDrugPerk,
	pMiserPerk,
	pPainPerk,
	pTraderPerk,
	pTut,
	pMissionNr,
	pWarns,
	pBlock,
	pFuel,
	pMarried,
	pMarriedTo[32],
    pCB,
    pWL,
    pDowod,
    pTajniak,
 	pZmienilNick,
 	pWino,
 	pPiwo,
 	pCygaro,
 	pSprunk,
 	pStylWalki,
 	pNewAP,
 	pZG,
    pAuto1,
 	pAuto2,
 	pAuto3,
 	pAuto4,
 	pLodz,
 	pSamolot,
 	pGaraz,
 	pKluczeAuta,
  	pSpawn,
 	pBW,
	pInjury,
	pHealthPacks,
 	pNatrasiejest,
	pDrzwibusazamkniete,
	pPrawojazdypytania[3],
	pPrawojazdydobreodp[3],
	pPrawojazdyzleodp[3],
	pSprawdzczyzdalprawko,
	pMinalczasnazdpr,
	pWtrakcietestprawa,
	pLinia55,
	pLinia72,
	pLinia82,
	pLinia85,
	pLinia96,
	pBiletsamolotowy,
	pBiletpociag,
 	pWsamolocieLS,
  	pWlociej,
   	pMozeskakacAT,
    pRockHotelLiAc,
    pRockHotelPuAc,
	pCzystka,
    pPK,
    pCars[MAX_CAR_SLOT],
    pCarSlots,
    pHat,
	pBlokadaPisaniaFrakcjaCzas,
    Text3D:pDescLabel[128],
    pDesc[128],
	pStrong,
	pCard,
	pAdminAccess,
	pBusinessOwner,
	pBusinessMember,
	pLiderValue,
	pUniform,
	pAJreason[MAX_AJ_REASON],
	pPodPW,
	pCruiseController,
	pFixKit,
	pTurnedOnCarWithoutCarLic
};
enum StringData
{
    ID,
    Kwota,
};

new PlayerInfo[MAX_PLAYERS][pInfo];
enum pPInfo
{
	PERS_KB,//Personalizacja korzystania z konta bankowego
	PERS_AD,//Personalizacja wy�wietlania og�osze�
	PERS_LICZNIK,//Wy�wietlanie licznika
	PERS_FINFO,//Og�oszenia frakcji
	PERS_NICKNAMES,//Wy�wietlanie nick�w nad g�owami postaci
	PERS_CB,//Wy�wietlanie CB radia
	PERS_REPORT,//Wy�wietlanie report�w bez @Duty
	WARNDEATH,//Warningi o �mierciach
	PERS_KARYTXD,//Wy�wietlanie kar w TXD
	PERS_NEWNICK,//Nowe nicki w 3dtextach
	PERS_NEWBIE,//Wy�wietlanie chatu newbie
	PERS_GUNSCROLL//Wy�wietlanie GUI z bro�
};
new PlayerPersonalization[MAX_PLAYERS][pPInfo];
enum pHaul
{
	pCapasity,
	pLoad,
};

new PlayerHaul[150][pHaul];

enum Wyscigi
{
    wStworzony,
	wNazwa[20],
	wOpis[50],
	wCheckpointy,//ilo�� czekpoint�w, max 50
	wNagroda,//nagroda za wygran�
	wTypCH,//typ czekpointa
	Float:wRozmiarCH,//rozmiar czekpointa
	wRekordNick[MAX_PLAYER_NAME],
	wRekordCzas,
};

new Wyscig[20][Wyscigi];

enum hIntInfo
{
	Float:Int_X,
	Float:Int_Y,
	Float:Int_Z,
	Int,
	Pokoje,
	Kategoria,
	Cena,
};

new IntInfo[100][hIntInfo];

enum hDomy
{
	hID,
 	hDomNr,
 	hZamek,
	hWlasciciel[MAX_PLAYER_NAME],
	hKupiony,
	hBlokada,
	hOplata,
	hCena,
	hUID_W,
	hData_DD,
	Float:hWej_X,
	Float:hWej_Y,
	Float:hWej_Z,
	Float:hInt_X,
	Float:hInt_Y,
	Float:hInt_Z,
	hInterior,
	hParcela,
	hVW,
	Text3D:h3D_txt,
	hK_3D,
	hPickup,
	hIkonka,
	hPokoje,
	hPDW,
	hPW,
	hL1[MAX_PLAYER_NAME],
	hL2[MAX_PLAYER_NAME],
	hL3[MAX_PLAYER_NAME],
	hL4[MAX_PLAYER_NAME],
	hL5[MAX_PLAYER_NAME],
	hL6[MAX_PLAYER_NAME],
	hL7[MAX_PLAYER_NAME],
	hL8[MAX_PLAYER_NAME],
	hL9[MAX_PLAYER_NAME],
	hL10[MAX_PLAYER_NAME],
	hSwiatlo,
	hWynajem,
	hWW,
	hTWW,
	hCenaWynajmu,
	hKomunikatWynajmu[128],
	hKomunikatDomowy,
	hUL_Z,
	hUL_D,
	hApteczka,
	hKami,
	hZbrojownia,
	hGaraz,
	hLadowisko,
	hAlarm,
	hZamekD,
	hKomputer,
	hRTV,
	hHazard,
	hSzafa,
	hTajemnicze,
	hSejf,
	hKodSejf[20],
	hS_kasa,
	hS_mats,
	hS_ziolo,
	hS_drugs,
	hS_PG0,
	hS_PG1,
	hS_PG2,
	hS_PG3,
	hS_PG4,
	hS_PG5,
	hS_PG6,
	hS_PG7,
	hS_PG8,
	hS_PG9,
	hS_PG10,
	hS_PG11,
	hS_G0,
	hS_G1,
	hS_G2,
	hS_G3,
	hS_G4,
	hS_G5,
	hS_G6,
	hS_G7,
	hS_G8,
	hS_G9,
	hS_G10,
	hS_G11,
	hS_A1,
	hS_A2,
	hS_A3,
	hS_A4,
	hS_A5,
	hS_A6,
	hS_A7,
	hS_A8,
	hS_A9,
	hS_A10,
	hS_A11,
};

new Dom[MAX_DOM][hDomy];

enum pUIDCar
{
	vUID,
	bool:vNeon,
	vNeonObject[2],
	vSiren,
	vIntLock,
	Float:vDist,
	fare,
    duty,
    driver,
    Float:cx,
    Float:cy,
    Float:cz,
};

new VehicleUID[MAX_VEHICLES][pUIDCar];

enum pCrime
{
	pBplayer[32],
	pAccusing[32],
	pAccusedof[100],
	pVictim[32],
};

new PlayerCrime[MAX_PLAYERS][pCrime];

enum iInfo
{
	iAdmin[128],
	iMOTD[128],
	iPassword[128],
	iNeedPass,
	iLock,
	iPlayers,
};
new IRCInfo[10][iInfo];

new RandCars[18][1] = 
{
	// szansa na spawn = 1/53
	{507},//Elegant       // 0 -> [0]
	// szansa na spawn = 2/53
	{462},//Faggio        // 1, 2 -> [1]
	{572},//Turbow�zek    // 3, 4 -> [2]

	{516},//Nebula        // 5, 6 -> [3]
	{566},//Tahoma        // 7, 8 -> [4]
	// szansa na spawn = 3/53
	{549},//Tampa         // 9, 10, 11 -> [5]
	{542},//Clover        // 12, 13, 14 -> [6]
	{404},//Perennial     // 15, 16, 17 -> [7]
	{478},//Walton        // 18, 19, 20 -> [8]

	{498},//Boxville       // 21, 22, 23 -> [9]
	{585},//Emperor       // 24, 25, 26 -> [10]
	{492},//Greenwood     // 27, 28, 29 -> [11]
	{466},//Glendale      // 30, 31, 32 -> [12]
	// szansa na spawn = 4/53
	{401},//Bravura       // 33, 34, 35, 36 -> [13]
	{436},//Previon       // 37, 38, 39, 40 -> [14]
	{518},//Buccaneer     // 41, 42, 43, 44 -> [15]

	{422},//Bobcat        // 45, 46, 47, 48 -> [16]
	{543}//Sadler        // 49, 50, 51, 52 -> [17]
};

new GunPrice[30][1] = {
{500}, //parachute 0
{400}, //golfclub 1
{300}, //nightstick 2
{200}, //knife 3
{700}, //basebalbat 4
{300}, //shovel 5
{100}, //poolcue 6
{400}, //purpledildo 7
{780}, //whitedildo 8
{560}, //longwhitedildo 9
{530}, //whitedildo2 10
{200}, //flowers 11
{600}, //cane 12
{1000}, //sdpistol 13
{2000}, //colt45 14
{6000}, //deagle 15
{4000}, //Tec9 16
{6000}, //uzi 17
{5000}, //mp5 18
{6000}, //shotgun 19
{12000}, //spas12 20
{8000}, //sawnoff 21
{10000}, //ak47 22
{10000}, //m4 23
{2000}, //rifle 24
{25}, //pistolammo 25
{40}, //shotgunammo 26
{25}, //smgammo 27
{40}, //assaultammo 28
{50} //rifle 29
};

new const Przebierz[][] = {
	{247},//CIVILIANS DOWN HERE
	{248},{100},{256},{263},{262},{261},{260},{259},{258},{257},{256},{255},
	{253},{252},{251},{249},{246},{245},{244},{243},{242},{241},{239},
	{238},{237},{236},{235},{233},{232},{231},{230},{229},
	{226},{225},{173},{174},{175},{224},{223},{222},{221},{220},{219},{218},
	{216},{215},{213},{212},{210},{209},
	{207},{155},{205},{204},{203},{167},{201},{200},{199},{198},{197},{196},
	{195},{194},{193},{185},{184},{183},
	{182},{181},{180},{179},{178},{176},{172},{170},{168},{167},{162},
	{161},{160},{159},{158},{157},{156},{155},{154},{153},{152},{151},
	{146},{145},{144},{143}, {142},{140},{139},{138},{137},{136},{135},
	{134},{264},{132},{131},{130},{129},{128},{254},{99},{97},{96},{95},{94},
	{92},{90},{89},{88},{87},{85},{84},{83},{82},{81},{80},{79},{78},{77},{76},
	{75},{73},{72},{69},{68},{67},{66},{64},{63},{62},{58},{56},{55},
	{54},{53},{52},{51},{50},{49},{45},{44},{43},{41},{39},{38},{37},{36},{35},
	{34},{33},{32},{31},{30},{29},{28},{27},{26},{25},{24},{23},{22},{21},{20},
	{19},{18},{17},{16},{15},{14},{13},{12},{11},{10},{1},{2},{47},{5},{4},
	{290},//ROSE
	{171},//lider DMV
	{292},//CESAR
	{293},//OGLOC
	{187},
	{296},//JIZZY
	{297},//MADDOGG
	{298},//CAT
	{299}
};


new CarSpawns[][eCars] = {
	// ----------------------------------------------------------------
	// SF
	// ----------------------------------------------------------------
	/* ID: 1 */ {405,-2125.7424,658.0462,52.2988,93.9612},//carid 90
	/* ID: 2 */ {426,-2158.0222,657.3932,52.2775,272.8372},
	/* ID: 3 */ {445,-1926.3204,585.6179,34.9963,359.8303},
	/* ID: 4 */ {507,-2214.8047,-82.7890,35.0474,0.6476},
	/* ID: 5 */ {550,-1497.4576,845.8479,6.9382,88.5201},
	/* ID: 6 */ {551,-1741.0051,811.0620,24.5782,270.6681},
	/* ID: 7 */ {402,-1704.3132,999.7747,17.3646,90.0725},
	/* ID: 8 */ {482,-1758.3512,910.7219,24.5923,269.8633},
	/* ID: 9 */ {400,-1699.4597,1035.9624,45.0934,91.6588},
	/* ID: 10 */ {507,-1786.7155,1205.1598,24.7812,178.8758},
	/* ID: 11 */ {545,-1716.5907,1350.4829,6.8346,44.2506},
	/* ID: 12 */ {547,-2166.4534,1251.1536,27.2650,1.0352},
	/* ID: 13 */ {551,-2040.4761,1107.7072,53.4166,89.8473},
	/* ID: 14 */ {551,-2438.0784,1341.1190,7.6988,84.5107},
	/* ID: 15 */ {445,-2644.6819,1342.3251,6.8981,270.7903},
	/* ID: 16 */ {482,-2635.0933,1377.1693,6.8692,180.6415},
	/* ID: 17 */ {547,-2513.1277,1209.6135,37.1506,270.2610},
	/* ID: 18 */ {560,-2273.8679,921.3550,66.3095,0.6336},
	/* ID: 19 */ {405,-2153.0779,953.6602,79.7271,180.3209},
	/* ID: 20 */ {445,-2129.2915,787.6183,69.3346,87.1812},
	/* ID: 21 */ {507,-2151.9524,395.9857,34.9395,180.7696},//150
	/* ID: 22 */ {545,-2078.8027,265.4074,35.1672,268.0607},
	/* ID: 23 */ {540,-2034.8334,178.8471,28.5682,269.9615},
	/* ID: 24 */ {560,-2180.1323,41.8542,35.1717,269.9866},
	/* ID: 25 */ {554,-2488.1333,-133.0336,25.3507,90.1064},
	/* ID: 26 */ {426,-2499.5225,45.0666,25.2641,89.9251},
	/* ID: 27 */ {445,-2636.7976,-55.4094,4.0630,359.9826},
	/* ID: 28 */ {492,-2718.5115,-124.4794,4.3505,269.1428},
	/* ID: 29 */ {507,-1709.9131,21.0821,3.4395,271.3832},
	/* ID: 30 */ {550,-2134.1443,-453.9576,35.1479,95.0877},
	/* ID: 31 */ {560,-1639.3900,-567.5057,13.9530,80.1994},
	/* ID: 32 */ {405,-2265.1501,148.9554,34.8837,269.3405},
	/* ID: 33 */ {540,-2226.9065,292.2472,35.1172,357.9835},//179 DERBY
	/* ID: 34 */ {405,-2790.1169,-75.3305,7.1875,88.5025},//DERBY
	/* ID: 35 */ {554,-2676.5522,-55.2749,4.3359,3.3685},//DERBY
	/* ID: 36 */ {482,-2212.8013,415.9465,35.1719,85.5162},//DERBY
	// ----------------------------------------------------------------
	// Wie�
	// ----------------------------------------------------------------
	// whetstone
	/* ID: 37 */ {551,-1557.8568,-2741.5632,48.3481,144.5150},
	// blueberry
	/* ID: 38 */ {405,218.4485,-173.3024,1.3809,90.0117},
	/* ID: 39 */ {554,199.5586,-155.4912,1.3827,0.3471},
	/* ID: 40 */ {507,-113.9556,-39.4382,2.9209,164.0464},
	/* ID: 41 */ {545,115.3321,-217.1147,1.3028,89.7911},
	// flint county
	/* ID: 42 */ {566,-16.7753,-2503.6228,36.4593,121.7103},
	// dillimore
	/* ID: 43 */ {536,666.8468,-467.6579,16.0734,90.8623},
	/* ID: 44 */ {560,668.1161,-546.2436,16.0413,89.4239},
	// angel pine
	/* ID: 45 */ {405,-2200.5999,-2503.3606,30.4213,321.7648},
	/* ID: 46 */ {445,-2200.5234,-2429.3523,30.4224,51.1660},
	/* ID: 47 */ {482,-2079.6389,-2303.7983,30.3466,322.7155},
	// palomino creek
	/* ID: 48 */ {547,2317.3452,97.2653,26.4844,90.0},
	/* ID: 49 */ {482,2255.0657,-82.6012,26.5303,181.5018},
	// ----------------------------------------------------------------
	// LS
	// ----------------------------------------------------------------
	// jefferson
	/* ID: 50 */ {492,2229.2,-1170.2,25.7,86.9},
	/* ID: 51 */ {545,2217.0,-1157.2,25.7,269.8},
	/* ID: 52 */ {566,2172.0356,-1320.2755,23.9844,180.3897},
	/* ID: 53 */ {492,2148.3257,-1175.2518,24.1959,269.6909},
	/* ID: 54 */ {426,2086.2334,-1193.76,23.6042,90.0},
	/* ID: 55 */ {492,2229.2278,-1345.4033,23.6892,93.3009},
	// richman
	/* ID: 56 */ {547,405.9748,-1264.3921,50.1237,24.2110},
	// el corona
	/* ID: 57 */ {560,1781.5,-1931.1999,13.3999,0.1524},
	/* ID: 58 */ {547,1743.5837,-1844.6041,13.3557,180.3384},
	/* ID: 59 */ {550,1838.1904,-1871.3842,13.1703,358.5452},
	/* ID: 60 */ {560,1777.1376,-1910.0310,13.1681,91.0725},
	/* ID: 61 */ {445,1938.0565,-2086.8459,13.3429,268.3414},
	/* ID: 62 */ {540,1748.0751,-2084.2090,13.3324,0.4337},
	// rodeo
	/* ID: 63 */ {405,216.5521,-1431.4004,13.0853,132.5749},
	/* ID: 64 */ {554,334.2231,-1343.7405,14.3828,209.9581},
	/* ID: 65 */ {482,438.9431,-1625.4088,25.7951,0.1850},
	/* ID: 66 */ {547,453.3896,-1494.3240,30.7917,7.7513},
	/* ID: 67 */ {550,487.6469,-1516.2312,20.0235,185.5384},
	/* ID: 68 */ {551,300.5775,-1490.8882,24.3748,235.1359},
	/* ID: 69 */ {566,524.0590,-1375.0093,15.8231,193.3626},
	/* ID: 70 */ {492,492.6386,-1555.3513,17.1462,213.1128},//DERBY
	/* ID: 71 */ {545,485.9422,-1467.4543,18.3154,157.6833},//DERBY
	// vinewood
	/* ID: 72 */ {507,697.4343,-1230.9486,16.5063,298.7916},
	/* ID: 73 */ {545,723.9850,-1121.5535,18.1450,333.9010},
	/* ID: 74 */ {540,912.2176,-996.2035,38.1402,7.5764},
	// mulholland
	/* ID: 75 */ {547,981.8715,-917.3546,41.5443,88.0589},
	// mulholland intersection
	/* ID: 76 */ {445,1574.1168,-1036.7643,23.6151,145.6786},
	/* ID: 77 */ {507,1645.3188,-1036.5238,23.6027,0.7258},
	/* ID: 78 */ {540,1770.4874,-1060.9886,23.6658,179.2750},
	/* ID: 79 */ {547,1653.1766,-1134.8994,23.6110,178.6835},
	/* ID: 80 */ {550,1617.3746,-1132.8293,23.6117,91.7300},
	// glen park
	/* ID: 81 */ {554,2003.3417,-1121.4993,26.3879,357.4926},
	// ganton
	/* ID: 82 */ {547,2361.3120,-1674.6146,13.2505,357.4959},
	/* ID: 83 */ {550,2298.3535,-1633.7542,14.3849,80.8107},
	/* ID: 84 */ {551,2297.9077,-1639.9464,14.4352,94.4292},
	/* ID: 85 */ {560,2255.4045,-1664.5736,15.1304,74.6898},
	/* ID: 86 */ {566,2234.1057,-1726.9386,13.1665,271.7536},
	/* ID: 87 */ {405,2319.3833,-1716.6823,13.2518,359.8540},
	/* ID: 88 */ {554,2474.5105,-1755.9194,13.2522,270.5967},
	/* ID: 89 */ {426,2501.8213,-1754.2794,13.1208,176.4916}, //= 255
	// commerce
	/* ID: 90 */ {547,1461.6943,-1505.1688,13.2541,356.9007},
	/* ID: 91 */ {550,1426.4930,-1402.3170,13.1800,181.0290},
	/* ID: 92 */ {560,1754.3009,-1476.8170,13.2402,269.6320},
	// verdant bluffs
	/* ID: 93 */ {545,1618.0411,-1891.1044,13.3278,0.3364},
	/* ID: 94 */ {540,1623.7291,-1892.7234,13.3307,180.0126},
	// market station
	/* ID: 95 */ {492,802.0869,-1353.3212,13.1580,357.9695},
	/* ID: 96 */ {507,824.7642,-1332.6187,13.1664,268.1555},
	// conference center
	/* ID: 97 */ {554,1253.9153,-1833.3832,13.1734,175.3692},
	/* ID: 98 */ {426,1279.2875,-1814.4156,13.1657,93.6385},
	// temple
	/* ID: 99 */ {550,1188.4082,-925.1859,42.8590,277.5563},
	/* ID: 100 */ {492,1174.6599,-922.1939,43.1189,276.8927},
	/* ID: 101 */ {550,1331.9304,-1081.3899,24.9941,90.4092},
	// downtown
	/* ID: 102 */ {405,1450.2,-937.1,36.2,269.6909}, //116
	/* ID: 103 */ {551,1435.0645,-1325.6835,13.2580,270.9400},
	/* ID: 104 */ {560,1513.9486,-1272.5691,14.2685,181.0697},
	/* ID: 105 */ {566,1583.7561,-1338.7435,16.1896,359.8619},
	/* ID: 106 */ {426,1430.2316,-1054.8555,22.8693,359.3625},
	/* ID: 107 */ {551,1790.0190,-1292.9065,13.2653,267.2964},
	// east los santos
	/* ID: 108 */ {540,2348.2910,-1167.9983,27.3637,323.1586},
	/* ID: 109 */ {551,2391.1135,-1500.6554,23.6355,269.7709},
	/* ID: 110 */ {507,2332.5684,-1362.4845,23.7297,358.1198},
	/* ID: 111 */ {545,2384.1567,-1275.6326,23.9198,101.6528},
	/* ID: 112 */ {540,2432.3149,-1226.0785,24.9941,17.9805},
	/* ID: 113 */ {482,2426.9612,-1224.4158,25.0000,202.7159},
	/* ID: 114 */ {405,2485.5313,-1556.1823,23.7478,178.8338},
	/* ID: 115 */ {554,2478.7664,-1555.7006,23.7226,183.6043},
	// las colinas
	/* ID: 116 */ {482,2502.0388,-1134.9507,39.1953,150.9506},
	/* ID: 117 */ {585,2598.5410,-1126.5328,65.2360,83.0518}, //KUPKA!
	// east beach
	/* ID: 118 */ {550,2853.1858,-1326.8011,11.1511,278.9301},
	/* ID: 119 */ {533,2796.9031,-1567.2024,10.6386,272.4041},
	/* ID: 120 */ {482,2813.2175,-1673.0276,9.6638,2.3369},
	/* ID: 121 */ {547,2827.6736,-1703.9755,9.7308,77.2896},
	/* ID: 122 */ {550,2809.3872,-1837.2391,9.7398,268.9880},
	/* ID: 123 */ {560,2659.4529,-1428.4343,30.1790,266.5051},
	/* ID: 124 */ {566,2659.7053,-1422.6743,30.1714,89.8159},
	/* ID: 125 */ {445,2754.7136,-1373.0253,40.1154,91.4169},
	/* ID: 126 */ {492,2717.3662,-1468.0308,30.0894,1.0298},
	/* ID: 127 */ {507,2816.7195,-1449.4285,15.9549,268.9106},
	/* ID: 128 */ {545,2816.9937,-1441.5880,15.9544,90.7779},
	/* ID: 129 */ {540,2681.9016,-1673.3879,9.1290,0.5605},
	// los flores
	/* ID: 130 */ {551,2612.9702,-1262.6970,48.2461,269.4752},
	/* ID: 131 */ {426,2605.3967,-1365.8829,34.6461,359.9891},
	// ocean docks
	/* ID: 132 */ {566,2411.5386,-2134.7576,13.9352,0.7795},
	// los santos international airport
	/* ID: 133 */ {554,1389.7467,-2695.9370,13.4164,121.1818},
	/* ID: 134 */ {482,1560.5026,-2260.5457,13.3258,268.7398},
	// marina
	/* ID: 135 */ {405,783.1359,-1601.8208,13.2577,270.9069},
	/* ID: 136 */ {554,782.7205,-1619.3584,13.2653,93.0550},
	/* ID: 137 */ {492,646.4998,-1771.6411,13.2905,348.7706},
	// market
	/* ID: 138 */ {426,923.0841,-1361.7990,13.0324,181.1371},
	/* ID: 139 */ {507,1363.0210,-1288.3124,13.2839,180.1453},
	/* ID: 140 */ {545,1363.2723,-1260.8229,13.0954,179.5841},
	/* ID: 141 */ {426,981.7941,-1523.5115,13.3379,267.2751},
	/* ID: 142 */ {445,1014.7464,-1434.4586,13.3292,266.3129},
	/* ID: 143 */ {545,1096.1,-1379.9,13.3,270.1909},//178
	/* ID: 144 */ {482,1182.2568,-1219.2407,18.4163,0.5578},
	/* ID: 145 */ {547,1260.9978,-1187.1921,23.3559,183.3606},
	/* ID: 146 */ {551,1284.8755,-1525.5013,13.3451,269.4388},//near taxi
	/* ID: 147 */ {560,1279.1887,-1539.2032,13.3201,94.8070},//near taxi
	// willowfield
	/* ID: 148 */ {540,2383.5627,-1927.9207,13.2436,359.6281},
	/* ID: 149 */ {550,2396.6899,-1966.8123,13.2793,271.6838},
	/* ID: 150 */ {507,2684.6,-2019.0,13.3 ,0.8777},
	/* ID: 151 */ {566,1981.0780,-1986.3513,13.3275,2.1479},
	/* ID: 152 */ {426,1984.7471,-2066.7776,13.1625,359.7226},
	/* ID: 153 */ {445,2489.1560,-1952.6886,13.1366,178.1629},
	/* ID: 154 */ {492,2495.4326,-1953.2922,13.1299,356.5514},
	/* ID: 155 */ {507,2306.7168,-1989.6796,13.2639,184.8385},
	/* ID: 156 */ {482,2056.1807,-1904.7751,13.2502,2.2910},
	/* ID: 157 */ {550,2064.9871,-1919.1674,13.2504,180.8575},
	// santa maria beach
	/* ID: 158 */ {554,334.3586,-1789.3143,4.6717,178.7722},
	/* ID: 159 */ {426,343.8039,-1808.9827,4.3090,181.8368},
	// verona beach
	/* ID: 160 */ {482,888.1506,-1659.2727,13.3296,1.2414},
	/* ID: 161 */ {547,879.1024,-1669.2560,13.3305,180.5853},
	/* ID: 162 */ {551,920.4441,-1823.0966,12.3452,84.1821},
	/* ID: 163 */ {566,1023.0023,-1819.5955,13.6746,242.7003},
	/* ID: 164 */ {554,1081.8948,-1629.9564,13.4064,90.0880},
	/* ID: 165 */ {566,1275.9120,-1646.7448,13.3273,267.2669},
	// ----------------------------------------------------------------
	// Dziuple skuterki
	// ----------------------------------------------------------------
	// �uraw (deluxe)
	/* ID: 166 */ {462,-1690.1335,12.9504,3.1396,219.6734},
	/* ID: 167 */ {462,-1691.1525,12.0757,3.1675,224.2458},
	/* ID: 168 */ {462,-1692.3069,11.0177,3.1500,222.0379},
	/* ID: 169 */ {462,-1693.5436,9.9462,3.1486,224.7703},
	/* ID: 170 */ {462,-1694.7015,8.8893,3.1538,223.8524},
	// LV gara� (deluxe)
	/* ID: 171 */ {462,573.3517,1245.2573,11.3178,208.6846},
	/* ID: 172 */ {462,574.9363,1246.0355,11.3148,206.1788},
	/* ID: 173 */ {462,576.6894,1246.8197,11.3171,207.9151},
	/* ID: 174 */ {462,578.3701,1247.6726,11.2642,206.6506},
	/* ID: 175 */ {462,579.7929,1248.3885,11.3155,207.1745},
	// szopa p�noc
	/* ID: 176 */ {462,1416.7675,-142.0645,22.3422,358.5342},
	/* ID: 177 */ {462,1416.6399,-146.4921,22.1652,358.1375},
	/* ID: 178 */ {462,1401.7493,-142.4977,20.5482,2.5528},
	/* ID: 179 */ {462,1402.0184,-148.1488,20.3168,2.8677},
	// szopa zach�d
	/* ID: 180 */ {462,-409.8753,-1746.3182,7.0814,187.5621},
	/* ID: 181 */ {462,-409.1978,-1751.8682,6.6321,188.1004},
	/* ID: 182 */ {462,-408.4377,-1757.2131,5.9208,187.8504},
	/* ID: 183 */ {462,-407.6703,-1762.8436,5.2092,187.7304},
	// ----------------------------------------------------------------
	// Nieu�ywane i niesprawdzone
	// ----------------------------------------------------------------
	{482,2056.1807,-1904.7751,13.2502,2.2910},
	{550,2064.9871,-1919.1674,13.2504,180.8575},
	{551,1886.4812,-2022.9338,13.0964,179.4265},
	{560,1824.8976,-2019.8374,13.0875,272.5273},
	{566,1942.1669,-1862.6425,13.2679,264.5590},
	{405,1923.9409,-1795.5616,13.0877,90.0886},
	{554,1807.0905,-1571.7120,13.1659,125.1048},
	{426,1809.9016,-1676.0603,13.2422,180.7589},
	{445,1809.6266,-1653.3402,13.2365,180.6530},
	{492,1809.7056,-1660.3019,13.2380,180.6262},
	{507,1978.4003,-1675.0157,15.6741,269.7336},
	{545,1974.8230,-1693.5488,15.6741,92.1162},
	{540,1929.2253,-1584.6954,13.2700,185.5542},
	{482,1731.9725,-1590.8959,13.1630,77.7249},
	{547,1721.5776,-1589.2834,13.1526,80.9057},
	//new
	{521,1383.7126,-1820.6086,13.1889,1.5710},
	{533,1494.2384,-1724.1732,13.2801,179.4442},
	{576,1485.0498,-1724.2239,13.2807,180.3713},
	{605,1694.6718,-1496.0966,13.1889,180.4706},
	{550,1695.1428,-1519.2667,13.1671,0.7121},
	{551,1694.7080,-1501.7454,13.1675,357.8150}
};
	
new const gSAZones[][SAZONE_MAIN] = {  // Wi�kszo�� wsp��dnych teren�w zsta�a stworzona przez Mabako's 'Zones Script' v0.2
	// NAZWA                            AREA (Xmin,Ymin,Zmin,Xmax,Ymax,Zmax)
	{"The Big Ear",	                {-410.00,1403.30,-3.00,-137.90,1681.20,200.00}},
	{"Aldea Malvada",               {-1372.10,2498.50,0.00,-1277.50,2615.30,200.00}},
	{"Angel Pine",                  {-2324.90,-2584.20,-6.10,-1964.20,-2212.10,200.00}},
	{"Arco del Oeste",              {-901.10,2221.80,0.00,-592.00,2571.90,200.00}},
	{"Avispa Country Club",         {-2646.40,-355.40,0.00,-2270.00,-222.50,200.00}},
	{"Avispa Country Club",         {-2831.80,-430.20,-6.10,-2646.40,-222.50,200.00}},
	{"Avispa Country Club",         {-2361.50,-417.10,0.00,-2270.00,-355.40,200.00}},
	{"Avispa Country Club",         {-2667.80,-302.10,-28.80,-2646.40,-262.30,71.10}},
	{"Avispa Country Club",         {-2470.00,-355.40,0.00,-2270.00,-318.40,46.10}},
	{"Avispa Country Club",         {-2550.00,-355.40,0.00,-2470.00,-318.40,39.70}},
	{"Back o Beyond",               {-1166.90,-2641.10,0.00,-321.70,-1856.00,200.00}},
	{"Battery Point",               {-2741.00,1268.40,-4.50,-2533.00,1490.40,200.00}},
	{"Bayside",                     {-2741.00,2175.10,0.00,-2353.10,2722.70,200.00}},
	{"Bayside Marina",              {-2353.10,2275.70,0.00,-2153.10,2475.70,200.00}},
	{"Beacon Hill",                 {-399.60,-1075.50,-1.40,-319.00,-977.50,198.50}},
	{"Blackfield",                  {964.30,1203.20,-89.00,1197.30,1403.20,110.90}},
	{"Blackfield",                  {964.30,1403.20,-89.00,1197.30,1726.20,110.90}},
	{"Blackfield Chapel",           {1375.60,596.30,-89.00,1558.00,823.20,110.90}},
	{"Blackfield Chapel",           {1325.60,596.30,-89.00,1375.60,795.00,110.90}},
	{"Blackfield",     				{1197.30,1044.60,-89.00,1277.00,1163.30,110.90}},
	{"Blackfield",     				{1166.50,795.00,-89.00,1375.60,1044.60,110.90}},
	{"Blackfield",     				{1277.00,1044.60,-89.00,1315.30,1087.60,110.90}},
	{"Blackfield ",     			{1375.60,823.20,-89.00,1457.30,919.40,110.90}},
	{"Blueberry",                   {104.50,-220.10,2.30,349.60,152.20,200.00}},
	{"Blueberry",                   {19.60,-404.10,3.80,349.60,-220.10,200.00}},
	{"Blueberry Acres",             {-319.60,-220.10,0.00,104.50,293.30,200.00}},
	{"Caligula's Palace",           {2087.30,1543.20,-89.00,2437.30,1703.20,110.90}},
	{"Caligula's Palace",           {2137.40,1703.20,-89.00,2437.30,1783.20,110.90}},
	{"Calton Heights",              {-2274.10,744.10,-6.10,-1982.30,1358.90,200.00}},
	{"Chinatown",                   {-2274.10,578.30,-7.60,-2078.60,744.10,200.00}},
	{"City Hall",                   {-2867.80,277.40,-9.10,-2593.40,458.40,200.00}},
	{"Come-A-Lot",                  {2087.30,943.20,-89.00,2623.10,1203.20,110.90}},
	{"Commerce",                    {1323.90,-1842.20,-89.00,1701.90,-1722.20,110.90}},//7
	{"Commerce",                    {1323.90,-1722.20,-89.00,1440.90,-1577.50,110.90}},
	{"Commerce",                    {1370.80,-1577.50,-89.00,1463.90,-1384.90,110.90}},
	{"Commerce",                    {1463.90,-1577.50,-89.00,1667.90,-1430.80,110.90}},
	{"Commerce",                    {1583.50,-1722.20,-89.00,1758.90,-1577.50,110.90}},
	{"Commerce",                    {1667.90,-1577.50,-89.00,1812.60,-1430.80,110.90}},//7
	{"Conference Center",           {1046.10,-1804.20,-89.00,1323.90,-1722.20,110.90}},//5
	{"Conference Center",           {1073.20,-1842.20,-89.00,1323.90,-1804.20,110.90}},//5
	{"Cranberry Station",           {-2007.80,56.30,0.00,-1922.00,224.70,100.00}},
	{"Creek",                       {2749.90,1937.20,-89.00,2921.60,2669.70,110.90}},
	{"Dillimore",                   {580.70,-674.80,-9.50,861.00,-404.70,200.00}},//2
	{"Doherty",                     {-2270.00,-324.10,-0.00,-1794.90,-222.50,200.00}},
	{"Doherty",                     {-2173.00,-222.50,-0.00,-1794.90,265.20,200.00}},
	{"Downtown",                    {-1982.30,744.10,-6.10,-1871.70,1274.20,200.00}},//5
	{"Downtown",                    {-1871.70,1176.40,-4.50,-1620.30,1274.20,200.00}},
	{"Downtown",                    {-1700.00,744.20,-6.10,-1580.00,1176.50,200.00}},
	{"Downtown",                    {-1580.00,744.20,-6.10,-1499.80,1025.90,200.00}},
	{"Downtown",                    {-2078.60,578.30,-7.60,-1499.80,744.20,200.00}},
	{"Downtown",                    {-1993.20,265.20,-9.10,-1794.90,578.30,200.00}},
	{"Downtown",         			{1463.90,-1430.80,-89.00,1724.70,-1290.80,110.90}},
	{"Downtown",         			{1724.70,-1430.80,-89.00,1812.60,-1250.90,110.90}},
	{"Downtown",         			{1463.90,-1290.80,-89.00,1724.70,-1150.80,110.90}},
	{"Downtown",         			{1370.80,-1384.90,-89.00,1463.90,-1170.80,110.90}},
	{"Downtown",         			{1724.70,-1250.90,-89.00,1812.60,-1150.80,110.90}},
	{"Downtown",         			{1370.80,-1170.80,-89.00,1463.90,-1130.80,110.90}},
	{"Downtown",         			{1378.30,-1130.80,-89.00,1463.90,-1026.30,110.90}},
	{"Downtown",         			{1391.00,-1026.30,-89.00,1463.90,-926.90,110.90}},
	{"Downtown",         			{1507.50,-1385.20,110.90,1582.50,-1325.30,335.90}},//5
	{"East Beach",                  {2632.80,-1852.80,-89.00,2959.30,-1668.10,110.90}},//3
	{"East Beach",                  {2632.80,-1668.10,-89.00,2747.70,-1393.40,110.90}},
	{"East Beach",                  {2747.70,-1668.10,-89.00,2959.30,-1498.60,110.90}},
	{"East Beach",                  {2747.70,-1498.60,-89.00,2959.30,-1120.00,110.90}},//3
	{"East Los Santos",             {2421.00,-1628.50,-89.00,2632.80,-1454.30,110.90}},//4
	{"East Los Santos",             {2222.50,-1628.50,-89.00,2421.00,-1494.00,110.90}},
	{"East Los Santos",             {2266.20,-1494.00,-89.00,2381.60,-1372.00,110.90}},
	{"East Los Santos",             {2381.60,-1494.00,-89.00,2421.00,-1454.30,110.90}},
	{"East Los Santos",             {2281.40,-1372.00,-89.00,2381.60,-1135.00,110.90}},
	{"East Los Santos",             {2381.60,-1454.30,-89.00,2462.10,-1135.00,110.90}},
	{"East Los Santos",             {2462.10,-1454.30,-89.00,2581.70,-1135.00,110.90}},//4
	{"Easter Basin",                {-1794.90,249.90,-9.10,-1242.90,578.30,200.00}},
	{"Easter Basin",                {-1794.90,-50.00,-0.00,-1499.80,249.90,200.00}},
	{"Easter Bay Airport",          {-1499.80,-50.00,-0.00,-1242.90,249.90,200.00}},
	{"Easter Bay Airport",          {-1794.90,-730.10,-3.00,-1213.90,-50.00,200.00}},
	{"Easter Bay Airport",          {-1213.90,-730.10,0.00,-1132.80,-50.00,200.00}},
	{"Easter Bay Airport",          {-1242.90,-50.00,0.00,-1213.90,578.30,200.00}},
	{"Easter Bay Airport",          {-1213.90,-50.00,-4.50,-947.90,578.30,200.00}},
	{"Easter Bay Airport",          {-1315.40,-405.30,15.40,-1264.40,-209.50,25.40}},
	{"Easter Bay Airport",          {-1354.30,-287.30,15.40,-1315.40,-209.50,25.40}},
	{"Easter Bay Airport",          {-1490.30,-209.50,15.40,-1264.40,-148.30,25.40}},
	{"Easter Bay Chemicals",        {-1132.80,-768.00,0.00,-956.40,-578.10,200.00}},
	{"Easter Bay Chemicals",        {-1132.80,-787.30,0.00,-956.40,-768.00,200.00}},
	{"El Castillo del Diablo",      {-464.50,2217.60,0.00,-208.50,2580.30,200.00}},
	{"El Castillo del Diablo",      {-208.50,2123.00,-7.60,114.00,2337.10,200.00}},
	{"El Castillo del Diablo",      {-208.50,2337.10,0.00,8.40,2487.10,200.00}},
	{"El Corona",                   {1812.60,-2179.20,-89.00,1970.60,-1852.80,110.90}},//2
	{"El Corona",                   {1692.60,-2179.20,-89.00,1812.60,-1842.20,110.90}},//2
	{"El Quebrados",                {-1645.20,2498.50,0.00,-1372.10,2777.80,200.00}},
	{"Esplanade East",              {-1620.30,1176.50,-4.50,-1580.00,1274.20,200.00}},
	{"Esplanade East",              {-1580.00,1025.90,-6.10,-1499.80,1274.20,200.00}},
	{"Esplanade East",              {-1499.80,578.30,-79.60,-1339.80,1274.20,20.30}},
	{"Esplanade North",             {-2533.00,1358.90,-4.50,-1996.60,1501.20,200.00}},
	{"Esplanade North",             {-1996.60,1358.90,-4.50,-1524.20,1592.50,200.00}},
	{"Esplanade North",             {-1982.30,1274.20,-4.50,-1524.20,1358.90,200.00}},
	{"Fallen Tree",                 {-792.20,-698.50,-5.30,-452.40,-380.00,200.00}},
	{"Fallow Bridge",               {434.30,366.50,0.00,603.00,555.60,200.00}},
	{"Fern Ridge",                  {508.10,-139.20,0.00,1306.60,119.50,200.00}},
	{"Financial",                   {-1871.70,744.10,-6.10,-1701.30,1176.40,300.00}},
	{"Fisher's Lagoon",             {1916.90,-233.30,-100.00,2131.70,13.80,200.00}},
	{"Flint Intersection",          {-187.70,-1596.70,-89.00,17.00,-1276.60,110.90}},
	{"Flint Range",                 {-594.10,-1648.50,0.00,-187.70,-1276.60,200.00}},
	{"Fort Carson",                 {-376.20,826.30,-3.00,123.70,1220.40,200.00}},
	{"Foster Valley",               {-2270.00,-430.20,-0.00,-2178.60,-324.10,200.00}},
	{"Foster Valley",               {-2178.60,-599.80,-0.00,-1794.90,-324.10,200.00}},
	{"Foster Valley",               {-2178.60,-1115.50,0.00,-1794.90,-599.80,200.00}},
	{"Foster Valley",               {-2178.60,-1250.90,0.00,-1794.90,-1115.50,200.00}},
	{"Frederick Bridge",            {2759.20,296.50,0.00,2774.20,594.70,200.00}},
	{"Gant Bridge",                 {-2741.40,1659.60,-6.10,-2616.40,2175.10,200.00}},
	{"Gant Bridge",                 {-2741.00,1490.40,-6.10,-2616.40,1659.60,200.00}},
	{"Ganton",                      {2222.50,-1852.80,-89.00,2632.80,-1722.30,110.90}},//2
	{"Ganton",                      {2222.50,-1722.30,-89.00,2632.80,-1628.50,110.90}},//2
	{"Garcia",                      {-2411.20,-222.50,-0.00,-2173.00,265.20,200.00}},
	{"Garcia",                      {-2395.10,-222.50,-5.30,-2354.00,-204.70,200.00}},
	{"Garver Bridge",               {-1339.80,828.10,-89.00,-1213.90,1057.00,110.90}},
	{"Garver Bridge",               {-1213.90,950.00,-89.00,-1087.90,1178.90,110.90}},
	{"Garver Bridge",               {-1499.80,696.40,-179.60,-1339.80,925.30,20.30}},
	{"Glen Park",                   {1812.60,-1449.60,-89.00,1996.90,-1350.70,110.90}},//3
	{"Glen Park",                   {1812.60,-1100.80,-89.00,1994.30,-973.30,110.90}},//3
	{"Glen Park",                   {1812.60,-1350.70,-89.00,2056.80,-1100.80,110.90}},//3
	{"Green Palms",                 {176.50,1305.40,-3.00,338.60,1520.70,200.00}},
	{"Greenglass College",          {964.30,1044.60,-89.00,1197.30,1203.20,110.90}},
	{"Greenglass College",          {964.30,930.80,-89.00,1166.50,1044.60,110.90}},
	{"Hampton Barns",               {603.00,264.30,0.00,761.90,366.50,200.00}},
	{"Hankypanky Point",            {2576.90,62.10,0.00,2759.20,385.50,200.00}},
	{"Harry Gold Parkway",          {1777.30,863.20,-89.00,1817.30,2342.80,110.90}},
	{"Hashbury",                    {-2593.40,-222.50,-0.00,-2411.20,54.70,200.00}},
	{"Hilltop Farm",                {967.30,-450.30,-3.00,1176.70,-217.90,200.00}},
	{"Hunter Quarry",               {337.20,710.80,-115.20,860.50,1031.70,203.70}},
	{"Idlewood",                    {1812.60,-1852.80,-89.00,1971.60,-1742.30,110.90}},//3
	{"Idlewood",                    {1812.60,-1742.30,-89.00,1951.60,-1602.30,110.90}},
	{"Idlewood",                    {1951.60,-1742.30,-89.00,2124.60,-1602.30,110.90}},
	{"Idlewood",                    {1812.60,-1602.30,-89.00,2124.60,-1449.60,110.90}},
	{"Idlewood",                    {2124.60,-1742.30,-89.00,2222.50,-1494.00,110.90}},
	{"Idlewood",                    {1971.60,-1852.80,-89.00,2222.50,-1742.30,110.90}},
	{"Jefferson",                   {1996.90,-1449.60,-89.00,2056.80,-1350.70,110.90}},//3
	{"Jefferson",                   {2124.60,-1494.00,-89.00,2266.20,-1449.60,110.90}},
	{"Jefferson",                   {2056.80,-1372.00,-89.00,2281.40,-1210.70,110.90}},
	{"Jefferson",                   {2056.80,-1210.70,-89.00,2185.30,-1126.30,110.90}},
	{"Jefferson",                   {2185.30,-1210.70,-89.00,2281.40,-1154.50,110.90}},
	{"Jefferson",                   {2056.80,-1449.60,-89.00,2266.20,-1372.00,110.90}},//3
	{"Julius Thruway East",         {2623.10,943.20,-89.00,2749.90,1055.90,110.90}},
	{"Julius Thruway East",         {2685.10,1055.90,-89.00,2749.90,2626.50,110.90}},
	{"Julius Thruway East",         {2536.40,2442.50,-89.00,2685.10,2542.50,110.90}},
	{"Julius Thruway East",         {2625.10,2202.70,-89.00,2685.10,2442.50,110.90}},
	{"Julius Thruway North",        {2498.20,2542.50,-89.00,2685.10,2626.50,110.90}},
	{"Julius Thruway North",        {2237.40,2542.50,-89.00,2498.20,2663.10,110.90}},
	{"Julius Thruway North",        {2121.40,2508.20,-89.00,2237.40,2663.10,110.90}},
	{"Julius Thruway North",        {1938.80,2508.20,-89.00,2121.40,2624.20,110.90}},
	{"Julius Thruway North",        {1534.50,2433.20,-89.00,1848.40,2583.20,110.90}},
	{"Julius Thruway North",        {1848.40,2478.40,-89.00,1938.80,2553.40,110.90}},
	{"Julius Thruway North",        {1704.50,2342.80,-89.00,1848.40,2433.20,110.90}},
	{"Julius Thruway North",        {1377.30,2433.20,-89.00,1534.50,2507.20,110.90}},
	{"Julius Thruway South",        {1457.30,823.20,-89.00,2377.30,863.20,110.90}},
	{"Julius Thruway South",        {2377.30,788.80,-89.00,2537.30,897.90,110.90}},
	{"Julius Thruway West",         {1197.30,1163.30,-89.00,1236.60,2243.20,110.90}},
	{"Julius Thruway West",         {1236.60,2142.80,-89.00,1297.40,2243.20,110.90}},
	{"Juniper Hill",                {-2533.00,578.30,-7.60,-2274.10,968.30,200.00}},
	{"Juniper Hollow",              {-2533.00,968.30,-6.10,-2274.10,1358.90,200.00}},
	{"K.A.C.C. Military Fuels",     {2498.20,2626.50,-89.00,2749.90,2861.50,110.90}},
	{"Kincaid Bridge",              {-1339.80,599.20,-89.00,-1213.90,828.10,110.90}},
	{"Kincaid Bridge",              {-1213.90,721.10,-89.00,-1087.90,950.00,110.90}},
	{"Kincaid Bridge",              {-1087.90,855.30,-89.00,-961.90,986.20,110.90}},
	{"King's",                      {-2329.30,458.40,-7.60,-1993.20,578.30,200.00}},
	{"King's",                      {-2411.20,265.20,-9.10,-1993.20,373.50,200.00}},
	{"King's",                      {-2253.50,373.50,-9.10,-1993.20,458.40,200.00}},
	{"LVA Freight Depot",           {1457.30,863.20,-89.00,1777.40,1143.20,110.90}},
	{"LVA Freight Depot",           {1375.60,919.40,-89.00,1457.30,1203.20,110.90}},
	{"LVA Freight Depot",           {1277.00,1087.60,-89.00,1375.60,1203.20,110.90}},
	{"LVA Freight Depot",           {1315.30,1044.60,-89.00,1375.60,1087.60,110.90}},
	{"LVA Freight Depot",           {1236.60,1163.40,-89.00,1277.00,1203.20,110.90}},
	{"Las Barrancas",               {-926.10,1398.70,-3.00,-719.20,1634.60,200.00}},
	{"Las Brujas",                  {-365.10,2123.00,-3.00,-208.50,2217.60,200.00}},
	{"Las Colinas",                 {1994.30,-1100.80,-89.00,2056.80,-920.80,110.90}},//3
	{"Las Colinas",                 {2056.80,-1126.30,-89.00,2126.80,-920.80,110.90}},
	{"Las Colinas",                 {2185.30,-1154.50,-89.00,2281.40,-934.40,110.90}},
	{"Las Colinas",                 {2126.80,-1126.30,-89.00,2185.30,-934.40,110.90}},
	{"Las Colinas",                 {2747.70,-1120.00,-89.00,2959.30,-945.00,110.90}},
	{"Las Colinas",                 {2632.70,-1135.00,-89.00,2747.70,-945.00,110.90}},
	{"Las Colinas",                 {2281.40,-1135.00,-89.00,2632.70,-945.00,110.90}},//3
	{"Las Payasadas",               {-354.30,2580.30,2.00,-133.60,2816.80,200.00}},
	{"Las Venturas Airport",        {1236.60,1203.20,-89.00,1457.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1203.20,-89.00,1777.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1143.20,-89.00,1777.40,1203.20,110.90}},
	{"Las Venturas Airport",        {1515.80,1586.40,-12.50,1729.90,1714.50,87.50}},
	{"Last Dime Motel",             {1823.00,596.30,-89.00,1997.20,823.20,110.90}},
	{"Leafy Hollow",                {-1166.90,-1856.00,0.00,-815.60,-1602.00,200.00}},
	{"Liberty City",                {-1000.00,400.00,1300.00,-700.00,600.00,1400.00}},
	{"Lil' Probe Inn",              {-90.20,1286.80,-3.00,153.80,1554.10,200.00}},
	{"Linden Side",                 {2749.90,943.20,-89.00,2923.30,1198.90,110.90}},
	{"Linden Station",              {2749.90,1198.90,-89.00,2923.30,1548.90,110.90}},
	{"Linden Station",              {2811.20,1229.50,-39.50,2861.20,1407.50,60.40}},
	{"Little Mexico",               {1701.90,-1842.20,-89.00,1812.60,-1722.20,110.90}},//2
	{"Little Mexico",               {1758.90,-1722.20,-89.00,1812.60,-1577.50,110.90}},//2
	{"Los Flores",                  {2581.70,-1454.30,-89.00,2632.80,-1393.40,110.90}},//4
	{"Los Flores",                  {2581.70,-1393.40,-89.00,2747.70,-1135.00,110.90}},//4
	{"Lotnisko",    				{1249.60,-2394.30,-89.00,1852.00,-2179.20,110.90}},//2
	{"Lotnisko",    				{1852.00,-2394.30,-89.00,2089.00,-2179.20,110.90}},
	{"Lotnisko",    				{1382.70,-2730.80,-89.00,2201.80,-2394.30,110.90}},
	{"Lotnisko",    				{1974.60,-2394.30,-39.00,2089.00,-2256.50,60.90}},
	{"Lotnisko",    				{1400.90,-2669.20,-39.00,2189.80,-2597.20,60.90}},
	{"Lotnisko",    				{2051.60,-2597.20,-39.00,2152.40,-2394.30,60.90}},
	{"Marina",                      {647.70,-1804.20,-89.00,851.40,-1577.50,110.90}},//5
	{"Marina",                      {647.70,-1577.50,-89.00,807.90,-1416.20,110.90}},
	{"Marina",                      {807.90,-1577.50,-89.00,926.90,-1416.20,110.90}},
	{"Market",                      {787.40,-1416.20,-89.00,1072.60,-1310.20,110.90}},//5
	{"Market",                      {952.60,-1310.20,-89.00,1072.60,-1130.80,110.90}},
	{"Market",                      {1072.60,-1416.20,-89.00,1370.80,-1130.80,110.90}},
	{"Market",                      {926.90,-1577.50,-89.00,1370.80,-1416.20,110.90}},
	{"Market Station",              {787.40,-1410.90,-34.10,866.00,-1310.20,65.80}},//5
	{"Martin Bridge",               {-222.10,293.30,0.00,-122.10,476.40,200.00}},
	{"Missionary Hill",             {-2994.40,-811.20,0.00,-2178.60,-430.20,200.00}},
	{"Montgomery",                  {1119.50,119.50,-3.00,1451.40,493.30,200.00}},//2
	{"Montgomery",                  {1451.40,347.40,-6.10,1582.40,420.80,200.00}},
	{"Montgomery",     				{1546.60,208.10,0.00,1745.80,347.40,200.00}},
	{"Montgomery",     				{1582.40,347.40,0.00,1664.60,401.70,200.00}},
	{"Mulholland",                  {1414.00,-768.00,-89.00,1667.60,-452.40,110.90}},//4
	{"Mulholland",                  {1281.10,-452.40,-89.00,1641.10,-290.90,110.90}},
	{"Mulholland",                  {1269.10,-768.00,-89.00,1414.00,-452.40,110.90}},
	{"Mulholland",                  {1357.00,-926.90,-89.00,1463.90,-768.00,110.90}},
	{"Mulholland",                  {1318.10,-910.10,-89.00,1357.00,-768.00,110.90}},
	{"Mulholland",                  {1169.10,-910.10,-89.00,1318.10,-768.00,110.90}},
	{"Mulholland",                  {768.60,-954.60,-89.00,952.60,-860.60,110.90}},
	{"Mulholland",                  {687.80,-860.60,-89.00,911.80,-768.00,110.90}},
	{"Mulholland",                  {737.50,-768.00,-89.00,1142.20,-674.80,110.90}},
	{"Mulholland",                  {1096.40,-910.10,-89.00,1169.10,-768.00,110.90}},
	{"Mulholland",                  {952.60,-937.10,-89.00,1096.40,-860.60,110.90}},
	{"Mulholland",                  {911.80,-860.60,-89.00,1096.40,-768.00,110.90}},
	{"Mulholland",                  {861.00,-674.80,-89.00,1156.50,-600.80,110.90}},
	{"Mulholland",     				{1463.90,-1150.80,-89.00,1812.60,-768.00,110.90}},
	{"North Rock",                  {2285.30,-768.00,0.00,2770.50,-269.70,200.00}},
	{"Ocean Docks",                 {2373.70,-2697.00,-89.00,2809.20,-2330.40,110.90}},//2
	{"Ocean Docks",                 {2201.80,-2418.30,-89.00,2324.00,-2095.00,110.90}},
	{"Ocean Docks",                 {2324.00,-2302.30,-89.00,2703.50,-2145.10,110.90}},
	{"Ocean Docks",                 {2089.00,-2394.30,-89.00,2201.80,-2235.80,110.90}},
	{"Ocean Docks",                 {2201.80,-2730.80,-89.00,2324.00,-2418.30,110.90}},
	{"Ocean Docks",                 {2703.50,-2302.30,-89.00,2959.30,-2126.90,110.90}},
	{"Ocean Docks",                 {2324.00,-2145.10,-89.00,2703.50,-2059.20,110.90}},
	{"Ocean Flats",                 {-2994.40,277.40,-9.10,-2867.80,458.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-222.50,-0.00,-2593.40,277.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-430.20,-0.00,-2831.80,-222.50,200.00}},
	{"Octane Springs",              {338.60,1228.50,0.00,664.30,1655.00,200.00}},
	{"Old Venturas Strip",          {2162.30,2012.10,-89.00,2685.10,2202.70,110.90}},
	{"Palisades",                   {-2994.40,458.40,-6.10,-2741.00,1339.60,200.00}},
	{"Palomino Creek",              {2160.20,-149.00,0.00,2576.90,228.30,200.00}},
	{"Paradiso",                    {-2741.00,793.40,-6.10,-2533.00,1268.40,200.00}},
	{"Pershing Square",             {1440.90,-1722.20,-89.00,1583.50,-1577.50,110.90}},//15
	{"Pilgrim",                     {2437.30,1383.20,-89.00,2624.40,1783.20,110.90}},
	{"Pilgrim",                     {2624.40,1383.20,-89.00,2685.10,1783.20,110.90}},
	{"Pilson Intersection",         {1098.30,2243.20,-89.00,1377.30,2507.20,110.90}},
	{"Pirates in Men's Pants",      {1817.30,1469.20,-89.00,2027.40,1703.20,110.90}},
	{"Playa del Seville",           {2703.50,-2126.90,-89.00,2959.30,-1852.80,110.90}},//2
	{"Prickle Pine",                {1534.50,2583.20,-89.00,1848.40,2863.20,110.90}},
	{"Prickle Pine",                {1117.40,2507.20,-89.00,1534.50,2723.20,110.90}},
	{"Prickle Pine",                {1848.40,2553.40,-89.00,1938.80,2863.20,110.90}},
	{"Prickle Pine",                {1938.80,2624.20,-89.00,2121.40,2861.50,110.90}},
	{"Queens",                      {-2533.00,458.40,0.00,-2329.30,578.30,200.00}},
	{"Queens",                      {-2593.40,54.70,0.00,-2411.20,458.40,200.00}},
	{"Queens",                      {-2411.20,373.50,0.00,-2253.50,458.40,200.00}},
	{"Randolph Industrial Estate",  {1558.00,596.30,-89.00,1823.00,823.20,110.90}},
	{"Redsands East",               {1817.30,2011.80,-89.00,2106.70,2202.70,110.90}},
	{"Redsands East",               {1817.30,2202.70,-89.00,2011.90,2342.80,110.90}},
	{"Redsands East",               {1848.40,2342.80,-89.00,2011.90,2478.40,110.90}},
	{"Redsands West",               {1236.60,1883.10,-89.00,1777.30,2142.80,110.90}},
	{"Redsands West",               {1297.40,2142.80,-89.00,1777.30,2243.20,110.90}},
	{"Redsands West",               {1377.30,2243.20,-89.00,1704.50,2433.20,110.90}},
	{"Redsands West",               {1704.50,2243.20,-89.00,1777.30,2342.80,110.90}},
	{"Regular Tom",                 {-405.70,1712.80,-3.00,-276.70,1892.70,200.00}},
	{"Richman",                     {647.50,-1118.20,-89.00,787.40,-954.60,110.90}},//7
	{"Richman",                     {647.50,-954.60,-89.00,768.60,-860.60,110.90}},
	{"Richman",                     {225.10,-1369.60,-89.00,334.50,-1292.00,110.90}},
	{"Richman",                     {225.10,-1292.00,-89.00,466.20,-1235.00,110.90}},
	{"Richman",                     {72.60,-1404.90,-89.00,225.10,-1235.00,110.90}},
	{"Richman",                     {72.60,-1235.00,-89.00,321.30,-1008.10,110.90}},
	{"Richman",                     {321.30,-1235.00,-89.00,647.50,-1044.00,110.90}},
	{"Richman",                     {321.30,-1044.00,-89.00,647.50,-860.60,110.90}},
	{"Richman",                     {321.30,-860.60,-89.00,687.80,-768.00,110.90}},
	{"Richman",                     {321.30,-768.00,-89.00,700.70,-674.80,110.90}},
	{"Robada Intersection",         {-1119.00,1178.90,-89.00,-862.00,1351.40,110.90}},
	{"Roca Escalante",              {2237.40,2202.70,-89.00,2536.40,2542.50,110.90}},
	{"Roca Escalante",              {2536.40,2202.70,-89.00,2625.10,2442.50,110.90}},
	{"Rockshore East",              {2537.30,676.50,-89.00,2902.30,943.20,110.90}},
	{"Rockshore West",              {1997.20,596.30,-89.00,2377.30,823.20,110.90}},
	{"Rockshore West",              {2377.30,596.30,-89.00,2537.30,788.80,110.90}},
	{"Rodeo",                       {72.60,-1684.60,-89.00,225.10,-1544.10,110.90}},//6
	{"Rodeo",                       {72.60,-1544.10,-89.00,225.10,-1404.90,110.90}},
	{"Rodeo",                       {225.10,-1684.60,-89.00,312.80,-1501.90,110.90}},
	{"Rodeo",                       {225.10,-1501.90,-89.00,334.50,-1369.60,110.90}},
	{"Rodeo",                       {334.50,-1501.90,-89.00,422.60,-1406.00,110.90}},
	{"Rodeo",                       {312.80,-1684.60,-89.00,422.60,-1501.90,110.90}},
	{"Rodeo",                       {422.60,-1684.60,-89.00,558.00,-1570.20,110.90}},
	{"Rodeo",                       {558.00,-1684.60,-89.00,647.50,-1384.90,110.90}},
	{"Rodeo",                       {466.20,-1570.20,-89.00,558.00,-1385.00,110.90}},
	{"Rodeo",                       {422.60,-1570.20,-89.00,466.20,-1406.00,110.90}},
	{"Rodeo",                       {466.20,-1385.00,-89.00,647.50,-1235.00,110.90}},
	{"Rodeo",                       {334.50,-1406.00,-89.00,466.20,-1292.00,110.90}},//6
	{"Royal Casino",                {2087.30,1383.20,-89.00,2437.30,1543.20,110.90}},
	{"San Andreas Sound",           {2450.30,385.50,-100.00,2759.20,562.30,200.00}},
	{"Santa Flora",                 {-2741.00,458.40,-7.60,-2533.00,793.40,200.00}},
	{"Santa Maria Beach",           {342.60,-2173.20,-89.00,647.70,-1684.60,110.90}},//6
	{"Santa Maria Beach",           {72.60,-2173.20,-89.00,342.60,-1684.60,110.90}},//6
	{"Shady Cabin",                 {-1632.80,-2263.40,-3.00,-1601.30,-2231.70,200.00}},
	{"Shady Creeks",                {-1820.60,-2643.60,-8.00,-1226.70,-1771.60,200.00}},
	{"Shady Creeks",                {-2030.10,-2174.80,-6.10,-1820.60,-1771.60,200.00}},
	{"Sobell Rail Yards",           {2749.90,1548.90,-89.00,2923.30,1937.20,110.90}},
	{"Spinybed",                    {2121.40,2663.10,-89.00,2498.20,2861.50,110.90}},
	{"Starfish Casino",             {2437.30,1783.20,-89.00,2685.10,2012.10,110.90}},
	{"Starfish Casino",             {2437.30,1858.10,-39.00,2495.00,1970.80,60.90}},
	{"Starfish Casino",             {2162.30,1883.20,-89.00,2437.30,2012.10,110.90}},
	{"Temple",                      {1252.30,-1130.80,-89.00,1378.30,-1026.30,110.90}},//5
	{"Temple",                      {1252.30,-1026.30,-89.00,1391.00,-926.90,110.90}},
	{"Temple",                      {1252.30,-926.90,-89.00,1357.00,-910.10,110.90}},
	{"Temple",                      {952.60,-1130.80,-89.00,1096.40,-937.10,110.90}},
	{"Temple",                      {1096.40,-1130.80,-89.00,1252.30,-1026.30,110.90}},
	{"Temple",                      {1096.40,-1026.30,-89.00,1252.30,-910.10,110.90}},//5
	{"The Camel's Toe",             {2087.30,1203.20,-89.00,2640.40,1383.20,110.90}},
	{"The Clown's Pocket",          {2162.30,1783.20,-89.00,2437.30,1883.20,110.90}},
	{"The Emerald Isle",            {2011.90,2202.70,-89.00,2237.40,2508.20,110.90}},
	{"The Farm",                    {-1209.60,-1317.10,114.90,-908.10,-787.30,251.90}},
	{"The Four Dragons Casino",     {1817.30,863.20,-89.00,2027.30,1083.20,110.90}},
	{"The High Roller",             {1817.30,1283.20,-89.00,2027.30,1469.20,110.90}},
	{"The Mako Span",               {1664.60,401.70,0.00,1785.10,567.20,200.00}},
	{"The Panopticon",              {-947.90,-304.30,-1.10,-319.60,327.00,200.00}},
	{"The Pink Swan",               {1817.30,1083.20,-89.00,2027.30,1283.20,110.90}},
	{"The Sherman Dam",             {-968.70,1929.40,-3.00,-481.10,2155.20,200.00}},
	{"The Strip",                   {2027.40,863.20,-89.00,2087.30,1703.20,110.90}},
	{"The Strip",                   {2106.70,1863.20,-89.00,2162.30,2202.70,110.90}},
	{"The Strip",                   {2027.40,1783.20,-89.00,2162.30,1863.20,110.90}},
	{"The Strip",                   {2027.40,1703.20,-89.00,2137.40,1783.20,110.90}},
	{"The Visage",                  {1817.30,1863.20,-89.00,2106.70,2011.80,110.90}},
	{"The Visage",                  {1817.30,1703.20,-89.00,2027.40,1863.20,110.90}},
	{"Unity Station",               {1692.60,-1971.80,-20.40,1812.60,-1932.80,79.50}},//5
	{"Valle Ocultado",              {-936.60,2611.40,2.00,-715.90,2847.90,200.00}},
	{"Verdant Bluffs",              {930.20,-2488.40,-89.00,1249.60,-2006.70,110.90}},
	{"Verdant Bluffs",              {1073.20,-2006.70,-89.00,1249.60,-1842.20,110.90}},
	{"Verdant Bluffs",              {1249.60,-2179.20,-89.00,1692.60,-1842.20,110.90}},
	{"Verdant Meadows",             {37.00,2337.10,-3.00,435.90,2677.90,200.00}},
	{"Verona Beach",                {647.70,-2173.20,-89.00,930.20,-1804.20,110.90}},//4
	{"Verona Beach",                {930.20,-2006.70,-89.00,1073.20,-1804.20,110.90}},
	{"Verona Beach",                {851.40,-1804.20,-89.00,1046.10,-1577.50,110.90}},
	{"Verona Beach",                {1161.50,-1722.20,-89.00,1323.90,-1577.50,110.90}},
	{"Verona Beach",                {1046.10,-1722.20,-89.00,1161.50,-1577.50,110.90}},
	{"Vinewood",                    {787.40,-1310.20,-89.00,952.60,-1130.80,110.90}},//7
	{"Vinewood",                    {787.40,-1130.80,-89.00,952.60,-954.60,110.90}},
	{"Vinewood",                    {647.50,-1227.20,-89.00,787.40,-1118.20,110.90}},
	{"Vinewood",                    {647.70,-1416.20,-89.00,787.40,-1227.20,110.90}},
	{"Whitewood Estates",           {883.30,1726.20,-89.00,1098.30,2507.20,110.90}},
	{"Whitewood Estates",           {1098.30,1726.20,-89.00,1197.30,2243.20,110.90}},
	{"Willowfield",                 {1970.60,-2179.20,-89.00,2089.00,-1852.80,110.90}},//2
	{"Willowfield",                 {2089.00,-2235.80,-89.00,2201.80,-1989.90,110.90}},
	{"Willowfield",                 {2089.00,-1989.90,-89.00,2324.00,-1852.80,110.90}},
	{"Willowfield",                 {2201.80,-2095.00,-89.00,2324.00,-1989.90,110.90}},
	{"Willowfield",                 {2541.70,-1941.40,-89.00,2703.50,-1852.80,110.90}},
	{"Willowfield",                 {2324.00,-2059.20,-89.00,2541.70,-1852.80,110.90}},
	{"Willowfield",                 {2541.70,-2059.20,-89.00,2703.50,-1941.40,110.90}},
	{"Yellow Bell Station",         {1377.40,2600.40,-21.90,1492.40,2687.30,78.00}},
	// Vice City
	{"Vice City Beach", 			{5950.0 + VICECITY_MOVE_X, 335.0 + VICECITY_MOVE_Y, -242.0, 4697.0 + VICECITY_MOVE_X, -2705.0 + VICECITY_MOVE_Y, 900.0}},
	{"Vice City Main Land", 		{4794.0 + VICECITY_MOVE_X, 574.0 + VICECITY_MOVE_Y, -242.0, 3239.0 + VICECITY_MOVE_X, -2714.0 + VICECITY_MOVE_Y, 900.0}},
	{"Prawn Island", 				{5104.6719 + VICECITY_MOVE_X, 282.4290 + VICECITY_MOVE_Y, -242.0, 4866.2646 + VICECITY_MOVE_X, -111.6745 + VICECITY_MOVE_Y, 900.0}},
	{"Starfish Island", 			{4820.0117 + VICECITY_MOVE_X, -1183.2548 + VICECITY_MOVE_Y, -242.0, 4276.8662 + VICECITY_MOVE_X, -1587.1974 + VICECITY_MOVE_Y, 900.0}},
	// Main Zones
	{"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
	{"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
	{"Wiezienie Stanowe",           {-480.50,596.30,-242.90,869.40,2993.80,900.00}},//-100
	{"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
	{"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
	{"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
	{"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
	{"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
	{"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}},
	{"Vice City", 					{3159.508300 + VICECITY_MOVE_X, -2710.853271 + VICECITY_MOVE_Y, -242.0, 6173.678222 + VICECITY_MOVE_X, 664.557983 + VICECITY_MOVE_Y, 1100.0}}
};

// Enumeration for storing data about the player
enum noclipenum
{
	cameramode,
	flyobject,
	mode,
	lrold,
	udold,
	lastmove,
	Float:accelmul,
    fireobject
}
new noclipdata[MAX_PLAYERS][noclipenum];

new VehicleColoursTableRGBA[256] = {
// The existing colours from San Andreas
0x000000FF, 0xF5F5F5FF, 0x2A77A1FF, 0x840410FF, 0x263739FF, 0x86446EFF, 0xD78E10FF, 0x4C75B7FF, 0xBDBEC6FF, 0x5E7072FF,
0x46597AFF, 0x656A79FF, 0x5D7E8DFF, 0x58595AFF, 0xD6DAD6FF, 0x9CA1A3FF, 0x335F3FFF, 0x730E1AFF, 0x7B0A2AFF, 0x9F9D94FF,
0x3B4E78FF, 0x732E3EFF, 0x691E3BFF, 0x96918CFF, 0x515459FF, 0x3F3E45FF, 0xA5A9A7FF, 0x635C5AFF, 0x3D4A68FF, 0x979592FF,
0x421F21FF, 0x5F272BFF, 0x8494ABFF, 0x767B7CFF, 0x646464FF, 0x5A5752FF, 0x252527FF, 0x2D3A35FF, 0x93A396FF, 0x6D7A88FF,
0x221918FF, 0x6F675FFF, 0x7C1C2AFF, 0x5F0A15FF, 0x193826FF, 0x5D1B20FF, 0x9D9872FF, 0x7A7560FF, 0x989586FF, 0xADB0B0FF,
0x848988FF, 0x304F45FF, 0x4D6268FF, 0x162248FF, 0x272F4BFF, 0x7D6256FF, 0x9EA4ABFF, 0x9C8D71FF, 0x6D1822FF, 0x4E6881FF,
0x9C9C98FF, 0x917347FF, 0x661C26FF, 0x949D9FFF, 0xA4A7A5FF, 0x8E8C46FF, 0x341A1EFF, 0x6A7A8CFF, 0xAAAD8EFF, 0xAB988FFF,
0x851F2EFF, 0x6F8297FF, 0x585853FF, 0x9AA790FF, 0x601A23FF, 0x20202CFF, 0xA4A096FF, 0xAA9D84FF, 0x78222BFF, 0x0E316DFF,
0x722A3FFF, 0x7B715EFF, 0x741D28FF, 0x1E2E32FF, 0x4D322FFF, 0x7C1B44FF, 0x2E5B20FF, 0x395A83FF, 0x6D2837FF, 0xA7A28FFF,
0xAFB1B1FF, 0x364155FF, 0x6D6C6EFF, 0x0F6A89FF, 0x204B6BFF, 0x2B3E57FF, 0x9B9F9DFF, 0x6C8495FF, 0x4D8495FF, 0xAE9B7FFF,
0x406C8FFF, 0x1F253BFF, 0xAB9276FF, 0x134573FF, 0x96816CFF, 0x64686AFF, 0x105082FF, 0xA19983FF, 0x385694FF, 0x525661FF,
0x7F6956FF, 0x8C929AFF, 0x596E87FF, 0x473532FF, 0x44624FFF, 0x730A27FF, 0x223457FF, 0x640D1BFF, 0xA3ADC6FF, 0x695853FF,
0x9B8B80FF, 0x620B1CFF, 0x5B5D5EFF, 0x624428FF, 0x731827FF, 0x1B376DFF, 0xEC6AAEFF, 0x000000FF,
// SA-MP extended colours (0.3x)
0x177517FF, 0x210606FF, 0x125478FF, 0x452A0DFF, 0x571E1EFF, 0x010701FF, 0x25225AFF, 0x2C89AAFF, 0x8A4DBDFF, 0x35963AFF,
0xB7B7B7FF, 0x464C8DFF, 0x84888CFF, 0x817867FF, 0x817A26FF, 0x6A506FFF, 0x583E6FFF, 0x8CB972FF, 0x824F78FF, 0x6D276AFF,
0x1E1D13FF, 0x1E1306FF, 0x1F2518FF, 0x2C4531FF, 0x1E4C99FF, 0x2E5F43FF, 0x1E9948FF, 0x1E9999FF, 0x999976FF, 0x7C8499FF,
0x992E1EFF, 0x2C1E08FF, 0x142407FF, 0x993E4DFF, 0x1E4C99FF, 0x198181FF, 0x1A292AFF, 0x16616FFF, 0x1B6687FF, 0x6C3F99FF,
0x481A0EFF, 0x7A7399FF, 0x746D99FF, 0x53387EFF, 0x222407FF, 0x3E190CFF, 0x46210EFF, 0x991E1EFF, 0x8D4C8DFF, 0x805B80FF,
0x7B3E7EFF, 0x3C1737FF, 0x733517FF, 0x781818FF, 0x83341AFF, 0x8E2F1CFF, 0x7E3E53FF, 0x7C6D7CFF, 0x020C02FF, 0x072407FF,
0x163012FF, 0x16301BFF, 0x642B4FFF, 0x368452FF, 0x999590FF, 0x818D96FF, 0x99991EFF, 0x7F994CFF, 0x839292FF, 0x788222FF,
0x2B3C99FF, 0x3A3A0BFF, 0x8A794EFF, 0x0E1F49FF, 0x15371CFF, 0x15273AFF, 0x375775FF, 0x060820FF, 0x071326FF, 0x20394BFF,
0x2C5089FF, 0x15426CFF, 0x103250FF, 0x241663FF, 0x692015FF, 0x8C8D94FF, 0x516013FF, 0x090F02FF, 0x8C573AFF, 0x52888EFF,
0x995C52FF, 0x99581EFF, 0x993A63FF, 0x998F4EFF, 0x99311EFF, 0x0D1842FF, 0x521E1EFF, 0x42420DFF, 0x4C991EFF, 0x082A1DFF,
0x96821DFF, 0x197F19FF, 0x3B141FFF, 0x745217FF, 0x893F8DFF, 0x7E1A6CFF, 0x0B370BFF, 0x27450DFF, 0x071F24FF, 0x784573FF,
0x8A653AFF, 0x732617FF, 0x319490FF, 0x56941DFF, 0x59163DFF, 0x1B8A2FFF, 0x38160BFF, 0x041804FF, 0x355D8EFF, 0x2E3F5BFF,
0x561A28FF, 0x4E0E27FF, 0x706C67FF, 0x3B3E42FF, 0x2E2D33FF, 0x7B7E7DFF, 0x4A4442FF, 0x28344EFF
};

enum MessageType
{
	TOME,
	FROMME
}

enum VEH_PRICES_ENUM
{
	VEH_PRICES_MODEL_ID,
	VEH_PRICES_PRICE
}

new const veh_prices[][VEH_PRICES_ENUM] =
{
	{451, 10000000}, // Turismo
	{411, 12500000}, // Infernus
	{541, 8000000}, // Bullet
	{506, 7500000}, // Super GT
	{415, 7000000}, // Cheetah
	{429, 6000000}, // Banshee
	{480, 5000000}, // Comet
	{402, 3000000}, // Buffalo
	{477, 2500000}, // ZR-350
	{603, 750000}, // Phoenix
	{587, 4000000}, // Euros
	{560, 5000000}, // Sultan
	{559, 4500000}, // Jester
	{562, 4000000}, // Elegy
	{558, 3250000}, // Uranus
	{602, 900000}, // Alpha
	{565, 3520000}, // Flash
	{434, 1300000}, // Hotknife
	{401, 160000}, // Bravura
	{410, 180000}, // Manana
	{419, 200000}, // Esperanto
	{426, 280000}, // Premier
	{436, 150000}, // Previon
	{516, 320000}, // Nebula
	{458, 350000}, // Solair
	{466, 280000}, // Glendale
	{467, 340000}, // Oceanic
	{474, 275000}, // Hermes
	{475, 300000}, // Sabre
	{479, 375000}, // Regina
	{492, 275000}, // Greenwood
	{496, 500000}, // Blista Compact
	{517, 250000}, // Majestic
	{518, 140000}, // Buccaneer
	{526, 400000}, // Fortune
	{527, 375000}, // Cadrona
	{529, 340000}, // Willard
	{546, 385000}, // Intruder
	{547, 340000}, // Primo
	{566, 390000}, // Tahoma
	{585, 230000}, // Emperor
	{589, 700000}, // Club
	{550, 395000}, // Sunrise
	{409, 5000000}, // Limuzyna
	{491, 680000}, // Virgo
	{421, 750000}, // Washington
	{580, 1800000}, // Stafford
	{405, 600000}, // Sentinel
	{445, 800000}, // Admiral
	{507, 750000}, // Elegant
	{551, 500000}, // Merit
	{561, 2850000}, // Stratum
	{540, 700000}, // Vincent
	{489, 600000}, // Rancher
	{579, 350000}, // Huntley
	{400, 200000}, // Landstalker
	{500, 700000}, // Mesa
	{424, 800000}, // BF Injection
	{495, 4000000}, // Sandking
	{470, 7000000}, // Hummer
	{554, 350000}, // Yosemite
	{422, 160000}, // Bobcat
	{600, 220000}, // Picador
	{543, 180000}, // Sadler
	{478, 80000}, // Walton
	{555, 5550000}, // Windsor
	{533, 1400000}, // Feltzer
	{439, 250000}, // Stallion
	{536, 1280000}, // Blade
	{567, 1330000}, // Savanna
	{534, 1400000}, // Remington
	{576, 1230000}, // Tornado
	{412, 1220000}, // Voodoo
	{575, 1210000}, // Broadway
	{542, 45000}, // Clover
	{549, 40000}, // Tampa
	{404, 60000}, // Perennial
	{604, 28000}, // Glendale Shit
	{605, 25000}, // Sadler Shit
	{572, 7500}, // Turbowozek
	{462, 17000}, // Faggio
	{522, 11500000}, // NRG-500
	{521, 8000000}, // FCR-900
	{581, 4500000}, // BF-400
	{463, 900000}, // Freeway
	{586, 750000}, // Wayfarer
	{468, 1500000}, // Sanchez
	{471, 600000}, // Quad
	{498, 250000}, // Boxville
	{482, 350000}, // Burrito
	{568, 1300000}, // Bandito
	{483, 350000}, // Camper
	{508, 700000}, // Kamping
	{545, 550000}, // Hustler
	{473, 2250000}, // Ponton
	{453, 3700000}, // Kuter
	{472, 8500000}, // Coastguard
	{595, 11000000}, // Launch
	{452, 13500000}, // Speeder
	{493, 20000000}, // Jetmax
	{454, 25000000}, // Tropic
	{446, 25000000}, // Squalo
	{484, 40000000}, // Jacht
	{593, 30000000}, // Dodo
	{512, 35000000}, // Cropdust
	{511, 170000000}, // Beagle
	{513, 185000000}, // Stunt
	{553, 280000000}, // Nevada
	{519, 515250000}, // Shamal
	{469, 125000000}, // Sparrow
	{487, 200000000}, // Maverick
	{417, 265000000}, // Leviathan
	{563, 325000000} // Raindanc
};

//EOF
