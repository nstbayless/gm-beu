//sanitize_line(obj_line)

var line = argument0;
var len = string_length(line.text)
var measure_start=0;
draw_set_font(line.font)
var maxwidth = 1024-96*2-32;
if (line.portrait>=0)
    maxwidth-=background_get_width(line.portrait)+8;
for (var i=5;i<len;i++) {
    var width = string_width(string_copy(line.text,measure_start+1,i-measure_start))
    if (width>maxwidth){
        while (string_char_at(line.text,i+1)!=" ")
            i--;
        line.text=string_copy(line.text,1,i) + "#" + string_copy(line.text,i+2,len-i-1)
        len++;
        measure_start=i+1;
    }
}
