/// @description Button Clicked
if (main_obj.current_sprite != -1 && ds_list_size(main_obj.hitbox_list) < 20){
	var new_hitbox = instance_create_depth(0,0,-1,hitbox_obj);
	new_hitbox.x = floor(sprite_get_width(main_obj.current_sprite)*.5);
	new_hitbox.y = floor(sprite_get_height(main_obj.current_sprite)*.5);
	new_hitbox.w = 60;
	new_hitbox.h = 60;
	ds_list_add(main_obj.hitbox_list, new_hitbox);
	main_obj.selected_hitbox = ds_list_size(main_obj.hitbox_list) - 1;
}