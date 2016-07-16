//scale_gp_axis(val)

var val = argument0

sigval=sign(val);
val=abs(val);
val*=1.3;
val-=0.2;

if (val>1)
    val=1
if (val<0)
    val=0;

return val*sigval;
