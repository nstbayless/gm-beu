//dialogue_unlock()

dialogue_free();
with (obj_line) //free all lines
    instance_destroy();
dialogue.current_line=noone;
dialogue.queue_n=0;
dialogue.is_locked=false;
dialogue._box_open=false;
