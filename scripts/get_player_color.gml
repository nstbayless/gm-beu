//get_player_color(n)

var n = argument0;

switch (n) {
case 0: return c_red;
case 1: return c_blue;
case 2: return c_yellow;
case 3: return c_green;
case 4: return c_purple;
case 5: return c_orange;
case 6: return c_silver;
default:
    return make_color_hsv(256*(n%7)/7,200+sin(n/2)*50,230+cos(n/3)*25);
}
