/*
* Author: Ampers
* Place a grass cutter
*
* Arguments:
* -
*
* Return Value:
* -
*
* Example:
* [] call bcna_main_fnc_clearGrass
*/

private _position0 = eyePos player;
private _position1 = _position0 vectorAdd (getCameraViewDirection player vectorMultiply 1.5);

private _intersections = lineIntersectsSurfaces [_position0, _position1, cameraOn, objNull, true, 1, "VIEW"];

if (_intersections isEqualTo []) exitWith {};

(_intersections # 0) params ["_intersectPosASL", "_surfaceNormal", "_intersectObj", "_parentObject"];

if (_intersectObj isEqualTo objNull && {_parentObject isEqualTo objNull}) then {
	//terrain, spawn grass cutter
	createVehicle ["Land_ClutterCutter_small_F", ASLtoAGL _intersectPosASL, [], 0, "CAN_COLLIDE"];
};
