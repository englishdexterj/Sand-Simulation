if mouse_check_button(mb_left) {
	for (var i = 0; i < brush_size; i++) {
		for (var j = 0; j < brush_size; j++) {
			if mouse_x + i >= 0 && mouse_x + i < room_width 
				&& mouse_y + j >= 0 && mouse_y + j < room_height &&
				global.cell[mouse_x+i, mouse_y+j] = 0 {
					
				instance_create_layer(mouse_x+i, mouse_y+j, "Instances", o_sand);
			}
		}
	}
}

if keyboard_check_pressed(ord("R")) game_restart();