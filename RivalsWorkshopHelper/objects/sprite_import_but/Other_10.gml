/// @description Button clicked

var sprite_file = get_open_filename("Sprite strips (.png)|*.png", "");
if (sprite_file != ""){
	var full_filename = sprite_file;
	while (string_pos("\\", sprite_file) != 0){
		sprite_file = string_copy(sprite_file, string_pos("\\", sprite_file)+1, string_length(sprite_file) - string_pos("\\", sprite_file));
	}
	var num_frames = 1;
	if (string_pos("_strip", sprite_file) != 0){
		num_frames = real(string_digits(string_copy(sprite_file, string_pos("_strip", sprite_file), 11)));
	}
	if (type == "sprite"){
		main_obj.current_sprite = sprite_add(full_filename, num_frames, 0, 0, 0, 0);
		zoom = 1;
		pan_x = -sprite_get_width(main_obj.current_sprite)*.5;
		pan_y = -sprite_get_height(main_obj.current_sprite)*.5
		main_obj.sprite_filename = sprite_file;
		main_obj.origin_locked = false;
		main_obj.first_image = 0;
		main_obj.current_image = 0;
	} else if (type == "hurtbox"){
		main_obj.current_hurtbox = sprite_add(full_filename, num_frames, 0, 0, 0, 0);
	}
}