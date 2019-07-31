/// @description Main Draw Event

var c = dark_color;
draw_rectangle_color(0, 0, room_width, room_height, c, c, c, c, false);
c = med_color;
draw_rectangle_color(room_width-sidebar_w, 0, room_width, room_height, c, c, c, c, false);

//SIDE BAR
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
var left_start = room_width-sidebar_w+side_margin;
draw_text(left_start+40, top_margin+26, "Sprite: " + sprite_filename);
draw_text(left_start+40, top_margin+26+40, "Hurtbox: " + hurtbox_filename);
draw_text(left_start, top_margin+26+80, "Origin: (" + string(origin_x) + ", " + string(origin_y) + ") - Right Click");
draw_line_width_color(left_start, top_margin+114, room_width-side_margin, top_margin+114, 2, light_color, light_color);
draw_text(left_start, top_margin+140, "Hitboxes:");

var max_num_hitboxes = ds_list_size(hitbox_list);
var hitbox_list_y = hitbox_list_top+20;
for (var hitbox_index = 0; hitbox_index < max_num_hitboxes; hitbox_index++){
	draw_text(left_start, hitbox_list_y, hitbox_index);
	if (hitbox_index == selected_hitbox){
		var hbox = ds_list_find_value(hitbox_list, hitbox_index);
		var hbox_x = hbox.x - origin_x;
		var hbox_y = hbox.y - origin_y;
		draw_text(left_start+32, hitbox_list_y, "x: " + string(hbox_x) + " y: " + string(hbox_y) + " w: " + string(hbox.w) + " h: " + string(hbox.h));
		hitbox_list_y += 44;
	} else {
		var hbox = ds_list_find_value(hitbox_list, hitbox_index);
		var hbox_x = hbox.x - origin_x;
		var hbox_y = hbox.y - origin_y;
		draw_set_color(c_ltgray);
		if (hitbox_index == hover_hitbox){
			draw_set_color(c_white);
		}
		draw_text(left_start+32, hitbox_list_y, "x: " + string(hbox_x) + " y: " + string(hbox_y) + " w: " + string(hbox.w) + " h: " + string(hbox.h));
		draw_set_color(c_white);
		hitbox_list_y += 22;
	}
}

//PREVIEW PANE

//IMAGE PANE
c = light_color;
draw_rectangle_color(img_left, img_top, img_right, img_bottom, c, c, c, c, false);
c = dark_color;
draw_rectangle_color(img_left+img_line_w, img_top+img_line_w, img_right-img_line_w, img_bottom-img_line_w, c, c, c, c, false);

if (current_sprite != -1){
	var img_center_x = (img_left+img_right)*.5+pan_x*zoom;
	var img_center_y = (img_top+img_bottom)*.5+pan_y*zoom;
	draw_sprite_ext(current_sprite, current_image, img_center_x, img_center_y, zoom, zoom, 0, c_white, 1);
	if (current_hurtbox != -1){
		draw_sprite_ext(current_hurtbox, current_image, img_center_x, img_center_y, zoom, zoom, 0, c_white, .5);
	}
	//draw_surface_ext(hitbox_surface, 
	draw_sprite_ext(origin_spr, 0, relative_x(origin_x), relative_y(origin_y), zoom, zoom, 0, c_white, 1);
}