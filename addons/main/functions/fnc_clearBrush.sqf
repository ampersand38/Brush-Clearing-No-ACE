/*
* Author: Ampers
* Destroy a bush or place a grass cutter
*
* Arguments:
* -
*
* Return Value:
* -
*
* Example:
* [] call bcna_main_fnc_clearBrush
*/

private _position0 = eyePos player;
private _position1 = _position0 vectorAdd (getCameraViewDirection player vectorMultiply 1.5);

private _intersections = lineIntersectsSurfaces [_position0, _position1, cameraOn, objNull, true, 1, "VIEW"];

if (_intersections isEqualTo []) exitWith {};

(_intersections # 0) params ["_intersectPosASL", "_surfaceNormal", "_intersectObj", "_parentObject"];

if (_intersectObj isEqualTo objNull && {_parentObject isEqualTo objNull}) then {
	//terrain, spawn grass cutter
    private _existing = _intersectPosASL nearestObject "Land_ClutterCutter_small_F";
    private _distance = 1;
    private _cutter = "Land_ClutterCutter_small_F";
    if (_existing != objNull) then {
        _distance = _existing distance ASLtoAGL _intersectPosASL;
    };
    if (_distance < 0.5) then {
        _cutter = "Land_ClutterCutter_medium_F";
    };

	createVehicle [_cutter, ASLtoAGL _intersectPosASL, [], 0, "CAN_COLLIDE"];
} else {
	//not terrain
	private _bushes = nearestTerrainObjects [_intersectObj, ["Bush"], 0];
	if (!(_bushes isEqualTo []) && {_intersectObj in _bushes}) then {
		//map bush, destroy
		_intersectObj setDamage 1;
	};
};
(_intersections # 0)
