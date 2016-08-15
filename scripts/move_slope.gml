var DX = argument0;
var DY = argument1;
var dist = sqrt(DX*DX+DY*DY);
var moves = ceil(dist);

collision_x=noone;
collision_y=noone;

repeat (moves) {
    dx = DX/moves;
    dy = DY/moves;
    var gr = get_ground_at(x+dx,y+dy,z)
    if (gr==noone) {
        x+=dx;
        y+=dy;
    } else {
        var slope_px = gr.slope_px;
        for (var h=-slope_px;h<=slope_px;h++) {
            var free = false;
            var grx = get_ground_at(x+dx,y,z+h)
            var gry = get_ground_at(x,y+dy,z+h)
            if (grx==noone && gry == noone) {
                z+=h;
                x+=dx;
                y+=dy;
                var prev_col_z = collision_z;
                //move one pixel to land on ground firmly.
                move(0,0,-1,1,noone);
                collision_x=noone;
                collision_y=noone;
                collision_z = prev_col_z;
                break;
            } else {
                collision_x=grx;
                collision_y=gry;
            }
        }
    }
}
