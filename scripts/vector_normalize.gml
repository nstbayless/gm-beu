//vector_normalize(vector)

var vec = argument0;
len = vector_length(vec);
if (len==0)
    return argument0;
    
var to_return;
for (var i=0;i<3;i++) {
    to_return[i]=vec[i]/len;
}
return to_return;
