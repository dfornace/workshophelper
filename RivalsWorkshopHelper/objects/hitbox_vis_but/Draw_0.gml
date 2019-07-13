/// @description Insert description here
// You can write your code in this editor

draw_self();

if (main_obj.selected_hitbox != -1){
	var hbox = ds_list_find_value(main_obj.hitbox_list, main_obj.selected_hitbox);
	draw_sprite(vis_but_spr, hbox.vis, x, y);
}