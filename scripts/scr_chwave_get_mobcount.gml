var wave = argument0;
var n = 0;
switch(wave_mod) {
case 1:
    n = 5;
    break;
case 2:
    n = 12;
    break;
case 3: n = 35;
    break;
case 4: n =  7;
    break;
case 5: n = 4;
}

n*=floor((wave-1)/total_waves*.4)+1

return n;
