if (!isDedicated) then {
    phx_cacheMarkersEH = [F_fnc_cacheMarkers, 0, []] call CBA_fnc_addPerFrameHandler;
};