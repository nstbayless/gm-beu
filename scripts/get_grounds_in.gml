//get_grounds_in(x1,y1,x2,y2)

var lx1=argument0;
var ly1=argument1;
var lx2=argument2;
var ly2=argument3;
var ground_list;
ground_list[7]=0;
var i=0;

while (true) {
    ground_list[i]=collision_rectangle(lx1,ly1,lx2,ly2,ground,false,true)
    if (ground_list[i]==noone) {
        for (var j=0;j<i;j++) {
            instance_activate_object(ground_list[j]);
        }
        return ground_list;
    }
    instance_deactivate_object(ground_list[i])
    i++;
}
