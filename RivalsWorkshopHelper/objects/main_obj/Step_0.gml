/// @description Insert description here
// You can write your code in this editor

//ZOOMING
if (mouse_check_button(mb_none)){
	if (mouse_wheel_up()){
		zoom = min(zoom+.25, 10);
	}
	if (mouse_wheel_down()){
		zoom = max(zoom-.25, 1);
	}
}

//PANNING
if (mouse_check_button_pressed(mb_middle)){
	if (mouse_x >= img_left && mouse_x <= img_right && mouse_y >= img_top && mouse_y <= img_bottom){
		pan_start_mouse_x = mouse_x;
		pan_start_mouse_y = mouse_y;
		pan_start_x = pan_x;
		pan_start_y = pan_y;
	}
}
if (mouse_check_button(mb_middle)){
	if (pan_start_mouse_x > -1){
		pan_x = pan_start_x + (mouse_x - pan_start_mouse_x)/zoom;
		pan_y = pan_start_y + (mouse_y - pan_start_mouse_y)/zoom;
	}
} else {
	pan_start_mouse_x = -1;
	pan_start_mouse_y = -1;
}

//SETTING THE ORIGIN
if (mouse_check_button(mb_right) && current_sprite != -1 && origin_locked == 0){
	if (mouse_x >= img_left && mouse_x <= img_right && mouse_y >= img_top && mouse_y <= img_bottom){
		origin_x = screen_to_img_x(mouse_x);
		origin_y = screen_to_img_y(mouse_y);
	}
}

//HOVERING OVER A HITBOX
if (mouse_x > room_width-sidebar_w+side_margin && mouse_y > hitbox_list_top){
	var max_num_hitboxes = ds_list_size(hitbox_list);
	var hitbox_list_y = hitbox_list_top;
	hover_hitbox = -1;
	for (var hitbox_index = 0; hitbox_index < max_num_hitboxes; hitbox_index++){
		var hitbox_list_h = 22;
		if (hitbox_index == selected_hitbox) hitbox_list_h = 44;
		if (mouse_y < hitbox_list_y + hitbox_list_h){
			hover_hitbox = hitbox_index;
			var hover_hitbox_obj = ds_list_find_value(hitbox_list, hover_hitbox);
			hover_hitbox_obj.hovering = true;
			break;
		}
		hitbox_list_y += hitbox_list_h;
	}
} else {
	hover_hitbox = -1;
}

// LEFT CLICK STUFF
if (mouse_check_button_pressed(mb_left)){
	if (hover_hitbox != -1){ //selecting a different hitbox
		selected_hitbox = hover_hitbox;
	}
	if (selected_hitbox != -1 && mouse_x >= img_left && mouse_x <= img_right && mouse_y >= img_top && mouse_y <= img_bottom){
		var current_hitbox = ds_list_find_value(hitbox_list, selected_hitbox);
		for (var i = -1; i < 2; i++){
			for (var j = -1; j < 2; j++){
				if (i == 0 && j == 0) continue; //no middle dot
				var dot_x = relative_x(current_hitbox.x + i*current_hitbox.w*.5);
				var dot_y = relative_y(current_hitbox.y + j*current_hitbox.h*.5);
				if (abs(mouse_x - dot_x) <= 10 && abs(mouse_y - dot_y) <= 10){
					current_hitbox.selected_resize_dot = [i,j];
					resize_mouse_x = mouse_x;
					resize_mouse_y = mouse_y;
					hitbox_start_x = current_hitbox.x;
					hitbox_start_y = current_hitbox.y;
					hitbox_start_w = current_hitbox.w;
					hitbox_start_h = current_hitbox.h;
				}
			}
		}
		if (resize_mouse_x == -1){ //no resize dot was grabbed
			if (mouse_x > relative_x(current_hitbox.x - current_hitbox.w*.5)
			&& mouse_x < relative_x(current_hitbox.x + current_hitbox.w*.5)
			&& mouse_y > relative_y(current_hitbox.y - current_hitbox.h*.5)
			&& mouse_y < relative_y(current_hitbox.y + current_hitbox.h*.5)){
				move_mouse_x = mouse_x;
				move_mouse_y = mouse_y;
				hitbox_start_x = current_hitbox.x;
				hitbox_start_y = current_hitbox.y;
			}
		}
	}
}

if (mouse_check_button_released(mb_left)){
	if (selected_hitbox != -1){
		var current_hitbox = ds_list_find_value(hitbox_list, selected_hitbox);
		current_hitbox.selected_resize_dot = [0,0];
		resize_mouse_x = -1;
		resize_mouse_y = -1;
		move_mouse_x = -1;
		move_mouse_y = -1;
	}
}

if (mouse_check_button(mb_left)){
	if (resize_mouse_x != -1){
		var current_hitbox = ds_list_find_value(hitbox_list, selected_hitbox);
		if (current_hitbox.selected_resize_dot[0] == -1){ //moving a left side dot
			current_hitbox.w = floor(hitbox_start_w - (mouse_x - resize_mouse_x)/zoom);
			current_hitbox.x = floor(hitbox_start_x + (mouse_x - resize_mouse_x)*.5/zoom);
		}
		if (current_hitbox.selected_resize_dot[0] == 1){ //moving a right side dot
			current_hitbox.w = floor(hitbox_start_w + (mouse_x - resize_mouse_x)/zoom);
			current_hitbox.x = floor(hitbox_start_x + (mouse_x - resize_mouse_x)*.5/zoom);
		}
		if (current_hitbox.selected_resize_dot[1] == -1){ //moving a up side dot
			current_hitbox.h = floor(hitbox_start_h - (mouse_y - resize_mouse_y)/zoom);
			current_hitbox.y = floor(hitbox_start_y + (mouse_y - resize_mouse_y)*.5/zoom);
		}
		if (current_hitbox.selected_resize_dot[1] == 1){ //moving a down side dot
			current_hitbox.h = floor(hitbox_start_h + (mouse_y - resize_mouse_y)/zoom);
			current_hitbox.y = floor(hitbox_start_y + (mouse_y - resize_mouse_y)*.5/zoom);
		}
	}
	if (move_mouse_x != -1){
		var current_hitbox = ds_list_find_value(hitbox_list, selected_hitbox);
		current_hitbox.x = floor(hitbox_start_x + (mouse_x - move_mouse_x)/zoom);
		current_hitbox.y = floor(hitbox_start_y + (mouse_y - move_mouse_y)/zoom);
	}
}

//SELECTED HITBOX BUTTON MOVEMENT
if (selected_hitbox != -1){
	vis_but.visible = true;
	vis_but.y = top_margin+164+selected_hitbox*22;
	shape_but.visible = true;
	shape_but.y = top_margin+164+selected_hitbox*22;
	del_but.visible = true;
	del_but.y = top_margin+164+selected_hitbox*22;
} else {
	vis_but.visible = false;
	shape_but.visible = false;
	del_but.visible = false;
}