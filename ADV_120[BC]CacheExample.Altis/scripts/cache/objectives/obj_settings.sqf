/* An array containing the names of all the caches.
   Used in: s_cacheMarkersBlufor.sqf,
        fn_cacheMarkers.sqf, 
        s_watchCaches.sqf, 
        c_cacheMarkersBlufor.sqf
*/ 

_cacheArray = [cacheOneCrate, cacheTwoCrate, cacheGeorgeCrate];

/*
   Each variable is an array containing first the name of the cache object, and then the rest of the entries are marker names where that cache can be spawned in at.
        ex: _cacheNAMEArray = [cacheNAMECrate, "cacheNAME", "cacheNAME_2", "cacheNAME_3"];
   The variable at the bottom, _cacheList, is an array containing all of the variables you have defined above it.
        ex: _cacheList = [_cacheAlphaArray, _cacheBravoArray, _cacheCharlieArray];
   Used in: fn_createCatches.sqf
*/
_cacheOneArray = [cacheOneCrate,"cacheOne2","cacheOne2_1","cacheOne2_2","cacheOne2_3"];
_cacheTwoArray = [cacheTwoCrate,"cacheTwo","cacheTwo_1","cacheTwo_2","cacheTwo_3"];
_cacheGeorgeArray = [cacheGeorgeCrate,"cacheGeorge","cacheGeorge_1","cacheGeorge_2","cacheGeorge_3"];

_cacheList = [_cacheOneArray, _cacheTwoArray, _cacheGeorgeArray];