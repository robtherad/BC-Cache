/* An array containing the names of all the caches.
   Used in: s_cacheMarkersBlufor.sqf,
        fn_cacheMarkers.sqf, 
        s_watchCaches.sqf, 
        c_cacheMarkersBlufor.sqf
*/ 

_cacheArray = [cacheAlphaCrate,cacheBravoCrate,cacheCharlieCrate,cacheDeltaCrate,cacheEchoCrate,cacheFoxCrate];

/*
   Each variable is an array containing first the name of the cache object, and then the rest of the entries are marker names where that cache can be spawned in at.
        ex: _cacheNAMEArray = [cacheNAMECrate, "cacheNAME", "cacheNAME_2", "cacheNAME_3"];
   The variable at the bottom, _cacheList, is an array containing all of the variables you have defined above it.
        ex: _cacheList = [_cacheAlphaArray, _cacheBravoArray, _cacheCharlieArray];
   Used in: fn_createCatches.sqf
*/
_cacheAlphaArray = [cacheAlphaCrate,"cacheAlpha","cacheAlpha_2","cacheAlpha_3","cacheAlpha_4","cacheAlpha_5","cacheAlpha_6","cacheAlpha_7","cacheAlpha_8","cacheAlpha_9","cacheAlpha_10"];
_cacheBravoArray = [cacheBravoCrate,"cacheBravo","cacheBravo_2","cacheBravo_3","cacheBravo_4","cacheBravo_5","cacheBravo_6","cacheBravo_7","cacheBravo_8","cacheBravo_9"];
_cacheCharlieArray = [cacheCharlieCrate,"cacheCharlie","cacheCharlie_2","cacheCharlie_3","cacheCharlie_4","cacheCharlie_5","cacheCharlie_6","cacheCharlie_7","cacheCharlie_8","cacheCharlie_9","cacheCharlie_10","cacheCharlie_11","cacheCharlie_12","cacheCharlie_13"];
_cacheDeltaArray = [cacheDeltaCrate,"cacheDelta","cacheDelta_2","cacheDelta_3","cacheDelta_4","cacheDelta_5","cacheDelta_6","cacheDelta_7","cacheDelta_8","cacheDelta_9","cacheDelta_10","cacheDelta_11","cacheDelta_12","cacheDelta_13"];
_cacheEchoArray = [cacheEchoCrate,"cacheEcho","cacheEcho_2","cacheEcho_3","cacheEcho_4","cacheEcho_5","cacheEcho_6","cacheEcho_7","cacheEcho_8","cacheEcho_9","cacheEcho_10","cacheEcho_11","cacheEcho_12"];
_cacheFoxArray = [cacheFoxCrate,"cacheFox","cacheFox_2","cacheFox_3","cacheFox_4","cacheFox_5","cacheFox_6","cacheFox_7","cacheFox_8","cacheFox_9","cacheFox_10","cacheFox_11","cacheFox_12","cacheFox_13"];

_cacheList = [_cacheAlphaArray,_cacheBravoArray,_cacheCharlieArray,_cacheDeltaArray,_cacheEchoArray,_cacheFoxArray];