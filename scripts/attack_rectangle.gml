//attack_rectangle(x1,y1,z1,x2,y2,z2,definition,[faction])

var x1=argument[0];
var y1=argument[1];
var z1=argument[2];
var x2=argument[3];
var y2=argument[4];
var z2=argument[5];
var defn = argument[6];
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
var __defn7_return_=0;

with (obj_actor) {
    if faction!=afaction {
        
        if (x2>=x-dim_x/2)
         if (x1<=x+dim_x/2) 
          if (y2>=y-dim_y/2)
           if (y1<=y+dim_y/2)
            if (z2>=z)
             if (z1<=z+dim_z) {
                //attack struck!
                __defn7_return=0;
                wound(self,afaction,defn);
                __defn7_return_=__defn7_return
                hit=id
             }
          
    }
}

if (config.RENDER_HITBOX_ENABLED) {
    var n = obj_gui.hitbox_draw_n++;
    obj_gui.hitbox_draw_x[n]=x1
    obj_gui.hitbox_draw_y[n]=y1
    obj_gui.hitbox_draw_z[n]=z1
    
    obj_gui.hitbox_draw_w[n]=x2-x1
    obj_gui.hitbox_draw_h[n]=y2-y1
    obj_gui.hitbox_draw_zh[n]=z2-z1
    
    obj_gui.hitbox_draw_alpha[n]=0.5;
    obj_gui.hitbox_draw_colour[n]=c_yellow;
    if (hit!=noone)
        obj_gui.hitbox_draw_alpha[n]=0.8;
}

if (hit) //set own hit freeze time
    t_hit_freeze=__defn7_return_

return hit;
