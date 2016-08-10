//vector_difference(vec1,vec2)

var vec1 = argument0;
var vec2 = argument1;
var to_return;
for (var i=0;i<3;i++) {
    to_return[i]=vec1[i]-vec2[i];
}
return to_return;
