/// @description Button Click

var hbox = ds_list_find_value(main_obj.hitbox_list, main_obj.selected_hitbox);
hbox.shape++;
if (hbox.shape == 3) hbox.shape = 0;