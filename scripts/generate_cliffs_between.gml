//generate_cliffs_between(x,len_prev,len_after): ys_prev, ys_after; both arrays sorted
//!deprecated

var lx = argument0;
var len_prev=argument1;
var len_after=argument2;

if (len_after==0&&len_prev==0)
    return noone;

if (len_after==1)
    return generate_cliffs_between(lx,len_prev,0);
if (len_prev==1)
    return generate_cliffs_between(lx,0,len_after);

if (len_after==0) {
    var gr = instance_create(lx,ys_prev[len_prev-2],cliff);
    gr.length=ys_prev[len_prev-1]-ys_prev[len_prev-2];
    gr.dir=1;
    with (gr) {event_user(0)}
    return generate_cliffs_between(lx,len_prev-1,0); 
} 
if (len_prev==0) {
    var gr = instance_create(lx,ys_after[len_after-2],cliff);
    gr.length=ys_after[len_after-1]-ys_after[len_after-2];
    gr.dir=-1;
    with (gr) {event_user(0)}
    return generate_cliffs_between(lx,len_after-1,0); 
}
    
yprev=ys_prev[len_prev-1];
yafter=ys_after[len_after-1];
if (yprev==yafter) {
    return generate_cliffs_between(lx,len_prev-1,len_after-1);
}

if (yprev>yafter) {
    var gr = instance_create(lx,yafter,cliff);
    gr.length=yprev-yafter;
    gr.dir=1;
    with (gr) {event_user(0)}
    return generate_cliffs_between(lx,len_prev-1,len_after); 
}

if (yprev<yafter) {
    var gr = instance_create(lx,yprev,cliff);
    gr.length=yafter-yprev;
    gr.dir=-1;
    with (gr) {event_user(0)}
    return generate_cliffs_between(lx,len_prev,len_after-1); 
}
