//dialogue_unlock()

dialogue_free();
if (dialogue.current_line!=noone)
    with (dialogue.current_line) instance_destroy();
        dialogue.current_line=noone;
dialogue.is_locked=false;
dialogue._box_open=false;
