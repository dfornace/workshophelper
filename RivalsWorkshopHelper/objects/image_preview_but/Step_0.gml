/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (main_obj.current_sprite != -1){
	if (index + main_obj.first_image == main_obj.current_image)
		image_index = 1;
	if (index + main_obj.first_image >= sprite_get_number(main_obj.current_sprite)){
		visible = false;
	} else {
		visible = true;
	}
}