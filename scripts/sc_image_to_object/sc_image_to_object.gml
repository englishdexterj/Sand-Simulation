// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_image_to_object(_spr){
	//=== Determine Width and Height ==//
	var _ww = sprite_get_width(_spr),
		_hh = sprite_get_height(_spr);

	//=== Create Surface ===//
	var _surf=surface_create(_ww, _hh);
	surface_set_target(_surf);
	draw_clear_alpha(0, 0);		
	draw_sprite(_spr, -1, 0, 0);
	surface_reset_target();

	//=== Surface to Buffer ===//
	_buff=buffer_create(4 * _ww * _hh, buffer_fixed, 1);
	buffer_get_surface(_buff, _surf, 0);
	surface_free(_surf);// we don't need the surface anymore

	//=== Extracting Color Info ===//
	// this is an example for a single pixel, you can of course loop all pixels, or access only specific ones!
	// Pixel coordinates [x,y] start at [0,0] and should not exceed [_ww-1,_hh-1]
	for (var _x = 0; _x < _ww-1; _x++) {
		for (var _y = 0; _y < _hh-1; _y++) {
			var pixel = buffer_peek(_buff, 4 * (_x + _y * _ww), buffer_u32),	// extracts info in ABGR Format
			a = (pixel >> 24) & $ff,	// Alpha [0-255]	
			r = pixel & $ff,			// Red [0-255]	
			g = (pixel >> 8) & $ff,		// Green [0-255]	
			b = (pixel >> 16) & $ff;	// Blue [0-255]
		
			if r = 255 && g = 125 && b = 0 {
			//WALL
				instance_create_layer(_x, _y, "Instances", o_wall);
			} else if r = 255 && g = 200 && b = 150 {
			//BACKGROUND IS IT NEEDED IF THERE ARE HOLES?
				instance_create_layer(_x, _y, "Instances", o_background);
			} else if r = 255 && g = 0 && b = 255 {
			//HOLE
				ds_list_add(hole_list, _x+_y*room_width);
				//OR!!!
				instance_create_layer(_x, _y, "Instances", o_hole);
				//AND UPDATE EVERY SECOND BUT IF TOUCHING WATER SET TO ACTIVE
			} else if r = 0 && g = 255 && b = 0 {
			//WATER
				instance_create_layer(_x, _y, "Instances", o_water);
			} else if r = 255 && g = 255 && b = 0 {
			//SAND
				instance_create_layer(_x, _y, "Instances", o_sand);
			}
		}
	}


	// === Cleanup ===//
	buffer_delete(_buff);
}