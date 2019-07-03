#define FILTERSCRIPT

//----------------------------------------------<< Source >>-------------------------------------------------//
//-----------------------------------[ Filterscript: scosaBudowa.pwn ]--------------------------------------//
//Opis:
/*
	Epizodyczne obiekty, jedna komenda + kilku aktor�w do odgrywania remontu budynku s�du.
*/
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

//


#include <a_samp>
#include <zcmd>
#include <streamer>	

new scosafs;
new craneObj;
new craneState = 0;
public OnFilterScriptInit()
{
	print("\n--scosaBudowa zaladowana\n");
	
	scosafs = CreateDynamicObject(4514, 1258.058959, -1379.069091, 13.984230, 0.000000, 0.000000, 180.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(scosafs, 1, 981, "helixbarrier", "bridgehzrd_kb_128", 0x00000000);
	scosafs = CreateDynamicObject(4514, 1258.058959, -1298.806274, 14.124234, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	SetDynamicObjectMaterial(scosafs, 1, 981, "helixbarrier", "bridgehzrd_kb_128", 0x00000000);
	scosafs = CreateDynamicObject(9618, 1280.929321, -1347.052612, 24.115032, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(1391, 1258.825683, -1326.858764, 44.513481, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	craneObj = CreateDynamicObject(1394, 1258.904174, -1326.908325, 57.008861, 0.000000, 0.000000, -63, 0, 0, -1, 500.00, 500.00); // zuraw1state
	scosafs = CreateDynamicObject(8885, 1280.378417, -1299.792236, 15.720217, 0.000000, 0.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(3172, 1273.123779, -1316.475463, 12.492575, 0.000000, 0.000000, 180.000000, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(3577, 1310.918090, -1379.468750, 13.426674, 0.000000, 0.000000, -23.899997, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(923, 1276.139160, -1323.938476, 13.202400, 0.000000, 0.000000, 71.599990, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(18260, 1278.538940, -1345.737426, 13.867022, 0.000000, 0.000000, 49.899993, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(2935, 1310.162963, -1369.207275, 14.063199, 0.000000, 0.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(1431, 1312.380737, -1368.517578, 16.053586, 1.100000, 0.000000, 19.300003, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(1431, 1310.061279, -1368.533569, 16.053586, 1.100000, 0.000000, 0.400002, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(1431, 1307.986694, -1368.302124, 16.025564, 1.100000, 0.000000, -50.799995, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(9618, 1329.788940, -1350.042480, 24.115032, 0.000000, 0.000000, 0.000000, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(3630, 1285.662841, -1335.420898, 14.038045, 0.000000, 0.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 
	scosafs = CreateDynamicObject(9618, 1297.138916, -1293.552978, 24.075035, 0.000000, 0.000000, 90.000000, 0, 0, -1, 500.00, 500.00); 

	
	CreateActor(27,1284.9761,-1306.6624,13.5392,162.9118);
	CreateActor(27,1284.9761,-1306.6624,13.5392,162.9118);
	CreateActor(27,1313.3710,-1379.7638,13.7060,72.6710);
	CreateActor(260,1279.0250,-1343.2664,13.3712,180.7486);
	CreateActor(260,1276.3459,-1304.7395,13.3215,213.3122);
	CreateActor(260,1284.7268,-1359.4451,13.5547,326.1133);
	CreateActor(260,1255.8334,-1332.3978,12.9624,277.2327);
	CreateActor(27,1257.9969,-1331.7865,12.9640,88.9409);

  
	
	return 1;
}


CMD:zuraw(playerid, params[]) {
	switch(craneState)
	{
	case 0:
		{
			MoveDynamicObject(craneObj, 1258.904174, -1326.908325, 57.008861, 0.6, 0.000000, 0.000000, -63);
			craneState = 1;
		}
	case 1:
		{
			MoveDynamicObject(craneObj, 1258.904174, -1326.908325, 57.008861, 0.6, 0.000000,  0.000000, -100);
			craneState = 2;
		}
	case 2:
		{
			MoveDynamicObject(craneObj, 1258.904174, -1326.908325, 57.008861, 0.6, 0.000000,  0.000000, -138);
			craneState = 3;
		}
	case 3:
		{
			MoveDynamicObject(craneObj, 1258.904174, -1326.908325, 57.008861, 0.6, 0.000000,  0.000000, -100);
			craneState = 0;
		}
	}
}

