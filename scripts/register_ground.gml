//register_ground(id)
with argument0 {
    if (!registered) {
        registered = true;
        var max_j = floor((x+width)/global.geohash_x)
        for (var j = floor(x/global.geohash_x);j<=max_j;j++) {
            var san_j = sanitize_geohash(j);
            
            global.ground_l[san_j,global.ground_n[san_j]++]=this;
        }
    }
}
