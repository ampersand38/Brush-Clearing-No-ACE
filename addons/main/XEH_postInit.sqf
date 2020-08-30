#include "script_component.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"

["Brush Clearing", "bcna_main_clearBrush", "Clear Brush","",
    FUNC(clearBrush),
[DIK_RALT, [false, false, false]]] call CBA_fnc_addKeybind; // Right Alt

["Brush Clearing", "bcna_main_clearGrass", "Clear Grass Only","",
    FUNC(clearGrass)
] call CBA_fnc_addKeybind;

["Brush Clearing", "bcna_main_clearBush", "Clear Bush Only","",
    FUNC(clearBush)
] call CBA_fnc_addKeybind;
