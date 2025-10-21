#include <a_samp>

new bool:IsWaterCar[MAX_PLAYERS];

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp("/watercar", cmdtext, true) == 0)
    {
        IsWaterCar[playerid] = !IsWaterCar[playerid];

        if (IsWaterCar[playerid])
        {
            SendClientMessage(playerid, 0x00FF00FF, "[WaterCar] You can now drive on water!");
        }
        else
        {
            SendClientMessage(playerid, 0xFF0000FF, "[WaterCar] WaterCar mode deactivated.");
        }
        return 1;
    }
    return 0;
}

public OnPlayerUpdate(playerid)
{
    if (IsWaterCar[playerid])
    {
        if (IsPlayerInAnyVehicle(playerid))
        {
            new vehicleid = GetPlayerVehicleID(playerid);
            new Float:x, Float:y, Float:z;
            GetVehiclePos(vehicleid, x, y, z);

            if (z < 0.0) // Kalau menyentuh air
            {
                SetVehiclePos(vehicleid, x, y, 0.5); // Biar naik ke permukaan
            }
        }
    }
    return 1;
}
