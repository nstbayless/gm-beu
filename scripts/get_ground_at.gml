//get_ground_at(x,y,z)

var lx=argument0;
var ly=argument1;
var lz=argument2;

var gh_w = global.geohash_x;
var gh_x1 = floor((x-dim_x/2-dx)/gh_w)
var gh_x2 = floor((x+dim_x/2+dx)/gh_w)
    
for (var j=gh_x1;j<=gh_x2;j++) {
    var san_j = sanitize_geohash(j);
    for (var k=0;k<global.ground_n[san_j];k++) {
        var gr = global.ground_l[san_j,k];
        if collides_ag_offset(this,gr,lx-x,ly-y,lz-z) {
            return gr;
        }
    }
}

return noone;
