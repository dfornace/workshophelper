/// @description Button Click

var hbox = ds_list_find_value(main_obj.hitbox_list, main_obj.selected_hitbox);
ds_list_delete(main_obj.hitbox_list, ds_list_find_index(main_obj.hitbox_list, hbox));
with (hbox) instance_destroy();

main_obj.selected_hitbox = -1;