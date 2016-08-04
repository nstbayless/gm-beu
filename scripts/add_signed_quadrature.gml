//add_signed_quadrature(a,b)

var a=argument0;
var b=argument1;

if (sign(a)!=sign(b))
    return a+b;

var sg = sign(a+b);

return sg*sqrt(a*a+b*b);
