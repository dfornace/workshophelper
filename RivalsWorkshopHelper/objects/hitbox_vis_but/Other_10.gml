/// @description Button Click

var hbox = ds_list_find_value(main_obj.hitbox_list, main_obj.selected_hitbox);
hbox.vis++;
if (hbox.vis == 3) hbox.vis = 0;