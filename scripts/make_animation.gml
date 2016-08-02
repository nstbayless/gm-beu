//make_animation(idx_start,duration,[k,[image_index]])
//creates an animation; idx_start is starting frame number,
//duration is number of frames, k is gamespeed:framerate ratio,
// image index is sprite to use (default sprite if none provided)
assert(argument_count>=2)
var anim;
anim[0]=argument[0];
anim[1]=argument[1];
anim[2]=1;
anim[3]=image_index;

if (argument_count>=3)
    anim[2]=argument[2]

if argument_count>=4
    anim[3]=argument[3]

return anim;
