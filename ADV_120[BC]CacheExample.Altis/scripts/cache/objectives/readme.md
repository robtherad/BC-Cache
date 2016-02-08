#### obj_settings.sqf
Contains settings that are used throughout the following scripts.
***
### fn_cacheMarkersInit.sqf
Called using CfgFunctions in the description.ext file. Adds a CBA event that calls `fn_cacheMarkers` on every frame on all clients.

#### fn_cacheMarkers.sqf
Checks to see if the caches have been moved yet. Once the caches have been moved it removes the event handler called in `fn_cacheMarkersInit.sqf`, adds an event handler on the client that detects if the cache has been destroyed by a satchel, and creates a marker for each cache. Markers are only be visible to OPFOR players until the caches are destroyed.

***
### fn_createCaches.sqf - postInit
Runs only on the server. For each cache, selects a point to move it to. When done moving all the caches, it clears the inventory of all the caches and adds in any items defined in the script file. It also adds an event handler to each cache that will detect when a cache is destroyed by satchels. Finally, it calls `s_watchCaches.sqf` on the server.

#### s_watchCaches.sqf
Handles notifying players when a cache is destroyed by making the cache markers visible and displaying a popup hint. It also notifies players once all caches have been destroyed, letting them know that BLUFOR have completed their mission.

***
### s_cacheMarkersBlufor.sqf - cache_init.sqf
Runs only on the server. Generates the size and offset for the markers used to indicate the rough location of caches to players. Passes this info to all players and tells them to use `c_cacheMarkersBlufor.sqf`.

#### c_cacheMarkersBlufor.sqf
Uses information passed from `s_cacheMarkersBlufor.sqf` to resize and reposition the markers indicating the rough area of caches. Only BLUFOR players see these markers.
