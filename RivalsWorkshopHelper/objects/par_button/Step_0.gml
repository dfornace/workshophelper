/// @description Call user0 when clicked
if (visible){
	depth = -100;
	if (mouse_x >= min(x,x+sprite_width) && mouse_x < max(x,x+sprite_width) && mouse_y >= y && mouse_y <= y+sprite_height){
		if (mouse_check_button_pressed(mb_left)){
			clicked = true;
		}
		if (clicked && mouse_check_button_released(mb_left)){
			clicked = false;
			event_user(0);
		}
		if (!clicked){
			image_index = 1;
		} else {
			image_index = 2;
		}
	} else {
		clicked = false;
		image_index = 0;
	}
}