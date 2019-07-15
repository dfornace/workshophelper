/// @description Insert description here
// You can write your code in this editor

if (main_obj.current_sprite != -1){
	var preview_xscale = 96 / sprite_get_width(main_obj.current_sprite);
	var preview_yscale = 96 / sprite_get_height(main_obj.current_sprite);
	var preview_scale = min(preview_xscale, preview_yscale);
	draw_sprite_ext(main_obj.current_sprite, main_obj.first_image+index, x+2, y+2, preview_scale, preview_scale, 0, c_white, 1);
	event_inherited();
	draw_text(x+10,y+10,main_obj.first_image+index);
}