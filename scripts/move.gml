//move(dx,dy,dz,precision)

var DX = argument0;
var DY = argument1;
var DZ = argument2;

var dist = sqrt(DX*DX+DY*DY+DZ*DZ);
var moves = ceil(dist/argument3);

collision_x=noone;
collision_y=noone;
collision_z=noone;
collision  =noone;

var max_down_slope=2;
var max_up_slope = -2;

var gh_w = global.geohash_x
var reps = moves;
for (var i=0;i<reps;i++) {
    var dx = DX/moves * (collision_x==noone);
    var dy = DY/moves * (collision_y==noone);
    var dz = DZ/moves * (collision_z==noone);
    var dxy = dist/moves;
    
    
    var gh_x1 = floor((x-dim_x/2-dx)/gh_w)
    var gh_x2 = floor((x+dim_x/2+dx)/gh_w)
    
    var collision_found = false;
    
    for (var j=gh_x1;j<=gh_x2;j++) {
        var san_j = sanitize_geohash(j);
        for (var k=0;k<global.ground_n[san_j];k++) {
            var gr = global.ground_l[san_j,k];
            //check for collision:
            if collides_ag_offset(this,gr,dx,dy,dz) {
                collision_found=true;
                collision=gr;
                reps++;
                break;
            }
        }
        if (collision_found)
            break;
    }
    
    if (collision_found) {
        for (var j=gh_x1;j<=gh_x2;j++) {
            var san_j = sanitize_geohash(j);
            for (var k=0;k<global.ground_n[san_j];k++) {
                var gr = global.ground_l[san_j,k];
                //check for collision on all three axes separately
                if collides_ag_offset(this,gr,0,0,dz) {
                    if (dz>0)
                        z=gr.zbot-dim_z;
                    else
                        z=gr.z;
                    collision_z=gr;
                }
                if collides_ag_offset(this,gr,dx,0,0) {
                    collision_x=gr;
                }
                if collides_ag_offset(this,gr,0,dy,0) {
                    collision_y=gr;
                }
            }
        }
    } else {
        x+=dx;
        y+=dy;
        z+=dz;   
    }
}
