//get_draw_x(x,y)

var lx;
var ly;
if argument_count<2
    lx=x
else
    lx=argument[0]
if argument_count<1
    ly=y
else
    ly=argument[1]

return lx+(ly)*camera.skew
