//attack_rectangle(x1,y1,z1,x2,y2,z2,definition,faction)

var x1=argument0;
var y1=argument1;
var z1=argument2;
var x2=argument3;
var y2=argument4;
var z2=argument5;
var defn = argument6;
var afaction;
if (argument_count>7)
    afaction = argument[7];
else
    afaction=faction;

if (z1>z2) {
    var tmp = z2;
    z2=z1;
    z1=tmp;
}

var hit=noone;

with (obj_actor) {
    if faction!=afaction {
        
        if (x2>=x-dim_w/2)
         if (x1<=x+dim_w/2) 
          if (y2>=y-dim_h/2)
           if (y1<=y+dim_h/2)
            if (z2>=z)
             if (z1<=z+dim_z) {
                //attack struck!
                wound(self,afaction,defn);
                hit=id
             }
          
    }
}

return hit;
