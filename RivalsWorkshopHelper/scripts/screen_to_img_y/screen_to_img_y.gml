var orig_y = argument0;

var y_value = orig_y - (main_obj.img_top+main_obj.img_bottom)*.5;
y_value /= main_obj.zoom;
y_value -= main_obj.pan_y;

return floor(y_value);