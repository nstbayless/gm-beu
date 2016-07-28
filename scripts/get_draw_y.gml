//get_draw_y(y,z)
var lz;
var ly;
if argument_count<2
    lz=z
else
    lz=argument[1]
if argument_count<1
    ly=y
else
    ly=argument[0]

//var ycentre = view_yview[0] + view_hview[0]/2
//return ycentre-lz+camera.z+(ly-ycentre)*camera.aot;

return ly*camera.aot-lz;
