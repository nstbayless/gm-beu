//dialogue_enqueue(obj_line)

dialogue.queue_v[dialogue.queue_n++]=argument0;
if (dialogue.current_line==noone)
    dialogue_advance();
