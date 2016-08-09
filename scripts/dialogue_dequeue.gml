//dialogue_dequeue() -> obj_line
//retrieves and removes first item from queue, not including the current line

assert(instance_exists(dialogue));

with dialogue {
    if (queue_n==0) //empty queue
        return noone;
    
    queue_n--;
    var tmp_line = queue_v[0];
    //pull out of queue
    for (var i=0;i<queue_n;i++)
        queue_v[i]=queue_v[i+1];
    return tmp_line;
}
