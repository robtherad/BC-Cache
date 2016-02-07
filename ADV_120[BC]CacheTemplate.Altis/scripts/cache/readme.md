# How to use
This file will guide you through setting up the cache script in an arma mission. If you want to see the different features of the cache script scroll down to the section named `How it all works`.
****
#### Caches
I recommend you read through the steps fully before you follow them so you don't end up doing more work than necessary.

0. Decide how many caches you want to place and what names you want to give them. 

0. Place the cache in the editor. Name the cache and place the following line in the initialization field of the cache: ```missionNamespace setVariable ["[NAMEOFCACHE]MarkVar","DISPLAYED NAME OF CACHE"];``` Make sure you replace `[NAMEOFCACHE]` with the name you gave the object you are using as a cache and `DISPLAYED NAME OF CACHE` with the name for the cache you want players to see.

0. Now place markers in the editor that will be locations that the cache can spawn at. Multiple caches should NOT share the same markers. The easiest way to create the markers is to create a single marker named after the cache and then copy it by pressing `CTRL` and `C` at the same time with it selected. Then press `CTRL` and `V` together to paste a copy of that marker with an underscore and a number after it. You can continue to paste the same marker over and over again to increment the number attached to the end.

0. Open `objective_settings.sqf` and add the name of the cache variable to `_cacheArray`. 

0. In that same file, create a variable with a name similar to the cache's name. I use `_[NAMEOFCACHE]Array` in the examples given. This variable will be an array with the first entry containing the name of the cache and all following entries containing the names of the markers where the cache should be able to spawn. ex: ```_cacheAlpaArray = [cacheAlphaCrate,"cacheAlpha","cacheAlpha_2","cacheAlpha_3","cacheAlpha_4","cacheAlpha_5","cacheAlpha_6"];```

0. In that same file, below where you defined the above variable, create a variable named `_cacheList` if it doesn't already exist. If it does already exist, add the variable you created above to it. An example of a fully filled out `_cacheList` variable is: ```_cacheList = [_cacheAlphaArray, _cacheBravoArray, _cacheCharlieArray, _cacheDeltaArray, _cacheEchoArray, _cacheFoxArray];```

0. Repeat the above steps (2-7) as many times as you need to, to create as many caches as you would like to have in your mission.

0. Now you will want to customize what items spawn in the inventory of the caches. You can edit this in `fn_createCaches.sqf` under the line that says `Add useful items to the cache`. Once this is done, preview the mission and make sure everything is working as intended.

****
#### Vehicle Lock
* Define vehicles/helicopters that should be locked in `veh_settings.sqf`.

Only BLUFOR can enter these vehicles. Only crewmen can drive/gun the ground vehicles. Only pilots can fly/gun the helicopters.
****
#### Vehicle Repair/Refuel
* Place a marker named `repair`.
* Define vehicles/helicopters that should be repair/refuelable in `veh_settings.sqf`.

It can be any icon/shape/size, it just needs to have the correct name. Only defined vehicles will be repiar/refuelable.
****
#### Vehicle Cargo
* Define vehicles/helicopters whose cargo will be edited in `veh_settings.sqf`.
* Edit the list of items in `s_vehCargo.sqf` to match what you want added to vehicles/helicopters.

****

# How it all works
For an overview of the script flow take a look at the readme files inside the two folders. The below information is more to describe the different features.

****

#### Caches
* Cache locations are marked only for OPFOR at the start of the mission. After the mission has been running for 1/4th of it's alotted time the BLUFOR forces will have markers added to their map that indicate the rough locations of the caches. These markers start out very large with the center of the circle randomly offset from the true location of the cache. As the mission progresses even further the size and offset of the markers will decrease every few minutes. Once there are only 10 minutes left in the mission the markers will reach their final size (25m radius) and offset (up to 12.5m in any direction).
* Once a cache is destroyed it's exact location is marked for BLUFOR players and it is marked as destroyed. A message will pop up warning all players that the cache has been destroyed and display how many caches remain to be destroyed.
* Once all caches are destroyed a message will be displayed saying that BLUFOR are victorious.
* Caches are only able to be destroyed by satchel charges. 
* Caches are randomly placed at one of several markers that are defined in the settings file in the objectives folder. Each marker has an equal chance of being selected.
* Caches are cleared of their default cargo and filled with cargo as defined in `fn_createCaches.sqf`.

****
#### Vehicle Lock
Vehicles defined in the vehicle settings file are the only ones affected by this feature. Only BLUFOR can enter these vehicles. Only crewmen can drive/gun the ground vehicles. Only pilots can fly/gun the helicopters. If a player isn't a crewman or pilot they will only be able to enter the vehicle as what the game defines as 'cargo'.
****
#### Vehicle Repair/Refuel
Vehicles defined in the vehicle settings file are the only ones affected by this feature. The mission needs to contain a marker named `repair`. If it doesn't contain this marker it is unknown what happens. Any vehicles defined in the settings file that get within 150 meters of the repair marker that are touching the ground will be slowly repaired and refueled.
****
#### Vehicle Cargo
Vehicles defined in the vehicle settings file are the only ones affected by this feature. These vehicles will have their default cargo cleared and will have cargo that is defined in the `s_vehCargo.sqf` script added to them. Helicopters and ground vehicles have different sets of cargo.
