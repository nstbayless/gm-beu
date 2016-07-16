//get_grounds_at(x,y)

var lx=argument0;
var ly=argument1;
var ground_list;
ground_list[5]=0;
var i=0;

while (true) {
    ground_list[i]=instance_place(lx,ly,ground)
    if (ground_list[i]==noone) {
        for (var j=0;j<i;j++) {
            instance_activate_object(ground_list[j]);
        }
        return ground_list;
    }
    instance_deactivate_object(ground_list[i])
    i++;
}
