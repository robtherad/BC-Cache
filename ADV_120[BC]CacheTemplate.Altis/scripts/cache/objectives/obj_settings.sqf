/* An array containing the names of all the caches.
   Used in: s_cacheMarkersBlufor.sqf,
        fn_cacheMarkers.sqf, 
        s_watchCaches.sqf, 
        c_cacheMarkersBlufor.sqf
*/ 

_cacheArray = [cacheV, cacheW, cacheX,cacheY,cacheZ];

/*
   Each variable is an array containing first the name of the cache object, and then the rest of the entries are marker names where that cache can be spawned in at.
        ex: _cacheNAMEArray = [cacheNAMECrate, "cacheNAME", "cacheNAME_2", "cacheNAME_3"];
   The variable at the bottom, _cacheList, is an array containing all of the variables you have defined above it.
        ex: _cacheList = [_cacheAlphaArray, _cacheBravoArray, _cacheCharlieArray];
   Used in: fn_createCatches.sqf
*/
_cacheVArray = [cacheV,"cacheVMark","cacheVMark_1","cacheVMark_2","cacheVMark_3","cacheVMark_4", "cacheVMark_5","cacheVMark_6","cacheVMark_7","cacheVMark_8","cacheVMark_9", "cacheVMark_10", "cacheVMark_11"]; //v11
_cacheWArray = [cacheW,"cacheWMark","cacheWMark_1","cacheWMark_2","cacheWMark_3","cacheWMark_4", "cacheWMark_5","cacheWMark_6","cacheWMark_7","cacheWMark_8","cacheWMark_9", "cacheWMark_10"]; //w10
_cacheXArray = [cacheX,"cacheXMark","cacheXMark_1","cacheXMark_2","cacheXMark_3","cacheXMark_4","cacheXMark_5", "cacheXMark_6","cacheXMark_7","cacheXMark_8","cacheXMark_9","cacheXMark_10", "cacheXMark_11"]; //11
_cacheYArray = [cacheY,"cacheYMark","cacheYMark_1","cacheYMark_2","cacheYMark_3","cacheYMark_4", "cacheYMark_5","cacheYMark_6","cacheYMark_7","cacheYMark_8","cacheYMark_9", "cacheYMark_10","cacheYMark_11"]; //11
_cacheZArray = [cacheZ,"cacheZMark","cacheZMark_1","cacheZMark_2","cacheZMark_3","cacheZMark_4", "cacheZMark_5","cacheZMark_6","cacheZMark_7","cacheZMark_8","cacheZMark_9", "cacheZMark_10","cacheZMark_11","cacheZMark_12","cacheZMark_13","cacheZMark_14", "cacheZMark_15"]; //15?

_cacheList = [_cacheZArray,_cacheYArray,_cacheXArray,_cacheWArray,_cacheVArray];