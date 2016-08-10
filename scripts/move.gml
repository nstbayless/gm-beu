//move(dx,dy,dz,precision,ground_rest)

var DX = argument0;
var DY = argument1;
var DZ = argument2;

var dist = sqrt(DX*DX+DY*DY+DZ*DZ);
var moves = ceil(dist/argument3);

//if on ground...
if (instance_exists(argument4) && vspd<=0)
    if (argument4.z==z)
        if (argument4.slope_px!=0) {
            //slopey ground: do other move function
            move_slope(DX,DY)
            exit;
        }

collision_x=noone;
collision_y=noone;
collision_z=noone;
collision  =noone;

var gh_w = global.geohash_x
var reps = moves;
for (var i=0;i<reps;i++) {
    var dx = DX/moves * (collision_x==noone);
    var dy = DY/moves * (collision_y==noone);
    var dz = DZ/moves * (collision_z==noone);
    if (dx==0 && dy == 0 && dz ==0 )
        exit;
    
    
    var gh_x1 = floor((x-dim_x/2-dx)/gh_w)
    var gh_x2 = floor((x+dim_x/2+dx)/gh_w)
    
    var collision_found = false;
    var gr_diag = noone;
    for (var j=gh_x1;j<=gh_x2;j++) {
        var san_j = sanitize_geohash(j);
        for (var k=0;k<global.ground_n[san_j];k++) {
            var gr = global.ground_l[san_j,k];
            //check for collision:
            if collides_ag_offset(this,gr,dx,dy,dz) {
                if (gr==collision) {
                    //already seen this ground before -- error?
                    print("error: seen ground twice, "+string(gr));
                    exit;
                }
                collision_found=true;
                gr_diag=gr;
                if (collision==noone)
                    reps++; //don't increase reps if prior collision for robustness
                collision=gr;
                if (gr.slope_px!=0 && (dx!=0 || dy!=0)){
                    //switch to a slope physics function
                    var moves = reps-i;
                    move_slope(dx*moves,dy*moves);
                    exit;
                }
                break;
            }
        }
        if (collision_found)
            break;
    }

    
    if (collision_found) {
        //a collision found; figure out which axis.

        //sup_z is used in the very rare circumstance that multiple collisions
        //could occur in one dz movement.
        var sup_z= 1000000*sign(dz);
        var max_h=0;
        for (var j=gh_x1;j<=gh_x2;j++) {
            var san_j = sanitize_geohash(j);
            for (var k=0;k<global.ground_n[san_j];k++) {
                var gr = global.ground_l[san_j,k];
                //check for collision on all three axes separately
                if (collides_ag_offset(this,gr,0,0,dz)) {
                    if (dz>0) {
                        if (gr.zbot < sup_z) {
                            z=gr.zbot-dim_z;
                            sup_z=gr.zbot;
                            collision_z=gr;
                        }
                    } else if (gr.z > sup_z) {
                        z=gr.z;
                        sup_z=gr.z;
                        collision_z=gr;
                    }
                }
                if collides_ag_offset(this,gr,dx,0,0) {
                    collision_x=gr;
                }
                if collides_ag_offset(this,gr,0,dy,0) {
                    collision_y=gr;
                }
            }
        }
        if (!(collision_z||collision_y||collision_x)) {
            //didn't find any orthogonal collision, but diagonal collision known to occur.
            //set one collision flag arbitrarily.
            if (collision_y==noone)
                collision_y=gr_diag;
            else if (collision_x==noone)
                collision_x=gr_diag;
            else
                collision_z=gr_diag;
        }
    } else {
        x+=dx;
        y+=dy;
        z+=dz;   
    }
}
