//collides_ag_offset(actor,ground,offset_x,offset_y,offset_z)

var g = argument1;
var dx = argument2;
var dy = argument3;
var dz = argument4;

with (argument0) {
    if (g.x<x+dim_x/2+dx)
        if (g.x+g.width > x-dim_x/2 + dx)
            if (g.y<y+dim_y/2+dy)
                if (g.y+g.height > y-dim_y/2 + dy)
                    if (g.zbot<z+dim_z+dz)
                        if (g.z>z+dz)
                            return true;
}

return false;
