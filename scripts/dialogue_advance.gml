//dialogue_advance()
//advances through dialogue queue

assert(instance_exists(dialogue))
with (dialogue) {
    assert(is_locked);
    var line = current_line;
    if (line!=noone) {
        //clean up after old dialogue:
        if (line.f_close_box)
            _box_open=false;
        with (line) instance_destroy();
    }
    line = dialogue_dequeue();
    current_line = line;
    _text_buffer="";
    _can_advance=false;
    if (line!=noone) {
        //add in new line:
        _box_open=true;
    }
}
