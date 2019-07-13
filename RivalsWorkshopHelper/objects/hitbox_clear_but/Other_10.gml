/// @description Button Clicked

ds_list_clear(main_obj.hitbox_list);
main_obj.selected_hitbox = -1;
with (hitbox_obj) instance_destroy();