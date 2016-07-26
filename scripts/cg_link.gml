//cg_link(camera1,camera2)

var cg1 = argument0;
var cg2 = argument1;

cg1.next=cg2;
cg2.prev=cg1;
