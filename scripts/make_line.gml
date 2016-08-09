//make_line(speaker,portrait,text)

assert(dialogue.is_locked);

var line = instance_create(0,0,obj_line);

line.speaker=argument0;
line.portrait=argument1;
line.text=argument2;

return line;
