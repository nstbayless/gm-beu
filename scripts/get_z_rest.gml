//find_z_rest(x1,y1,x2,y2,z) -> ground_rest,z_rest,on_ground

var grounds=get_grounds_in(x1,y1,x2,y2);
//highest ground encountered below z:
var maxz=-10000
var argmaxz=noone;
for (i=0;grounds[i]!=noone;i++) {
    if (grounds[i].z<=z  && grounds[i].z>maxz) {
        maxz=grounds[i].z;
        argmaxz=grounds[i];
    }
}
ground_rest=argmaxz;
z_rest=maxz;
on_ground=(z==z_rest);
