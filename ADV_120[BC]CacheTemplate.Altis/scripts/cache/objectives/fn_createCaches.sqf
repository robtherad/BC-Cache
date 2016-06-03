if (isServer) then {
    #include "obj_settings.sqf";
    
    { //forEach _cacheList
        _ranInt = (floor(random ((count(_x))-1)))+1;
        _vehName = _x select 0;
        _vehName setPos (getMarkerPos (_x select _ranInt));
        _vehName setVariable ["cacheMarkerName",(_x select _ranInt),true];
    } forEach _cacheList;
    bc_cachesDeployed = true;
    publicVariable "bc_cachesDeployed";
    
    { //forEach _cacheList
        _vehName = _x select 0;
        
        //Remove vanilla stuff from the caches
        clearWeaponCargoGlobal _vehName;
        clearMagazineCargoGlobal _vehName;
        clearBackpackCargoGlobal _vehName;
        clearItemCargoGlobal _vehName;
        
        // Add useful items to the cache. Use command corresponding to the item type:
        //  addItemCargoGlobal      - https://community.bistudio.com/wiki/addItemCargoGlobal
        //  addWeaponCargoGlobal    - https://community.bistudio.com/wiki/addWeaponCargoGlobal
        //  addMagazineCargoGlobal  - https://community.bistudio.com/wiki/addMagazineCargoGlobal
        //  addBackpackCargoGlobal  - https://community.bistudio.com/wiki/addBackpackCargoGlobal
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
    } forEach _cacheList;
    
    [] execVM "scripts\cache\objectives\s_watchCaches.sqf";
};