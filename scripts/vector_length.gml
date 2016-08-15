//vector_length(vec)
var vec = argument0;
var sq = 0;
for (var i=0;i<3;i++)
    sq+=vec[i]*vec[i];

var len = sqrt(sq);
return len;
