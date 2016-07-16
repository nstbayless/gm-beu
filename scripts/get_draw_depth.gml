//get_draw_depth(x,y,z)

var lx;
var ly;
var lz;
if argument_count<1
    lx=x
else
    lx=argument[0]
if argument_count<2
    ly=y
else
    ly=argument[1]
if argument_count<3
    lz=z
else
    lz=argument[2]
    

return (-ly)/room_height
