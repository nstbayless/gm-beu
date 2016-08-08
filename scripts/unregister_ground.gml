//unregister_ground(ground)

with argument0 {
    if (registered) {
        registered = false;
        var max_j = floor((x+width)/global.geohash_x)
        for (var j = floor(x/global.geohash_x);j<=max_j;j++) {
            var san_j = sanitize_geohash(j);
            global.ground_n[san_j]--;
            removing = false;
            for (var k=0;k<global.ground_n[san_j];k++) {
                if (global.ground_l[san_j,k]==this)
                    removing=true;
                if (removing)
                    global.ground_l[san_j,k]=global.ground_l[san_j,k+1];
            }
        }
    }
}
