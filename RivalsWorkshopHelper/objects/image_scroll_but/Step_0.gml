/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (clicked){
	held_down++;
	if (held_down >= 30 && held_down mod 10 == 0){
		event_user(0);
	}
}