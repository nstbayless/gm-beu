//find_z_rest(x1,y1,x2,y2,z) -> [ground_rest,z_rest,on_ground]

var x1=argument0;
var y1=argument1;
var x2=argument2;
var y2=argument3;
var z1=argument4;

var grounds=get_grounds_in(x1,y1,x2,y2);
//highest ground encountered below z:
var maxz=-100000
var argmaxz=noone;
for (i=0;grounds[i]!=noone;i++) {
    if (grounds[i].z<=z1  && grounds[i].z>maxz) {
        maxz=grounds[i].z;
        argmaxz=grounds[i];
    }
}
var retval;
retval[0]=argmaxz
retval[1]=maxz;
retval[2]=(z1==maxz)
return retval;
