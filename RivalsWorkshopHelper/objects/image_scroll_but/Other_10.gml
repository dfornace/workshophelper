/// @description Button Press

if (main_obj.current_sprite != -1){
	main_obj.first_image = clamp(main_obj.first_image - image_xscale, 0, max(sprite_get_number(main_obj.current_sprite)-8,0));
}