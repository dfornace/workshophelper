var orig_x = argument0;

var x_value = orig_x - (main_obj.img_left+main_obj.img_right)*.5;
x_value /= main_obj.zoom;
x_value -= main_obj.pan_x;

return floor(x_value);