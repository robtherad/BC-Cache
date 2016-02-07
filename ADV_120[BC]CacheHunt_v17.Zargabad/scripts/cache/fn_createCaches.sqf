if (isServer) then {
    _cacheAlphaArray = [cacheAlphaCrate,"cacheAlpha","cacheAlpha_2","cacheAlpha_3","cacheAlpha_4","cacheAlpha_5","cacheAlpha_6","cacheAlpha_7","cacheAlpha_8","cacheAlpha_9","cacheAlpha_10"];
    _cacheBravoArray = [cacheBravoCrate,"cacheBravo","cacheBravo_2","cacheBravo_3","cacheBravo_4","cacheBravo_5","cacheBravo_6","cacheBravo_7","cacheBravo_8","cacheBravo_9"];
    _cacheCharlieArray = [cacheCharlieCrate,"cacheCharlie","cacheCharlie_2","cacheCharlie_3","cacheCharlie_4","cacheCharlie_5","cacheCharlie_6","cacheCharlie_7","cacheCharlie_8","cacheCharlie_9","cacheCharlie_10","cacheCharlie_11","cacheCharlie_12","cacheCharlie_13"];
    _cacheDeltaArray = [cacheDeltaCrate,"cacheDelta","cacheDelta_2","cacheDelta_3","cacheDelta_4","cacheDelta_5","cacheDelta_6","cacheDelta_7","cacheDelta_8","cacheDelta_9","cacheDelta_10","cacheDelta_11","cacheDelta_12","cacheDelta_13"];
    _cacheEchoArray = [cacheEchoCrate,"cacheEcho","cacheEcho_2","cacheEcho_3","cacheEcho_4","cacheEcho_5","cacheEcho_6","cacheEcho_7","cacheEcho_8","cacheEcho_9","cacheEcho_10","cacheEcho_11","cacheEcho_12"];
    _cacheFoxArray = [cacheFoxCrate,"cacheFox","cacheFox_2","cacheFox_3","cacheFox_4","cacheFox_5","cacheFox_6","cacheFox_7","cacheFox_8","cacheFox_9","cacheFox_10","cacheFox_11","cacheFox_12","cacheFox_13"];

    _cacheArray = [_cacheAlphaArray,_cacheBravoArray,_cacheCharlieArray,_cacheDeltaArray,_cacheEchoArray,_cacheFoxArray];
    { //forEach _cacheArray
        _ranInt = (floor(random ((count(_x))-1)))+1;
        _vehName = _x select 0;
        _vehName setPos (getMarkerPos (_x select _ranInt));
        _vehName setVariable ["cacheMarkerName",(_x select _ranInt),true];
    } forEach _cacheArray;
    bc_cachesDeployed = true;
    publicVariable "bc_cachesDeployed";
    
    { //forEach _cacheArray
        _vehName = _x select 0;
        
        //Remove vanilla stuff from the caches
        clearWeaponCargoGlobal _vehName;
        clearMagazineCargoGlobal _vehName;
        clearBackpackCargoGlobal _vehName;
        clearItemCargoGlobal _vehName;
        
        //Add useful items to the cache
        _vehName addItemCargoGlobal ["FirstAidKit", 30];
        _vehName addItemCargoGlobal ["rhs_mag_an_m8hc", 20];
        _vehName addWeaponCargoGlobal ["rhs_weap_rpg26",3];
        _vehName addWeaponCargoGlobal ["rhs_weap_rsp30_white",20];
        _vehName addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR", 10];
        _vehName addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK", 30];
        _vehName addMagazineCargoGlobal ["rhs_30Rnd_762x39mm", 60];
        
        //_vehName enableSimulation false;
        _vehName addEventHandler["handleDamage",{ 
            if (_this select 4 == "SatchelCharge_Remote_Ammo") then{(_this select 0) enableSimulation true; (_this select 0) setDamage 1; 1} else{(_this select 0) setDamage 0;0};
        }]; 
    } forEach _cacheArray;
    
    [] execVM "scripts\cache\s_watchCaches.sqf";
};