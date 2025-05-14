brush_size = 32;

for (var i = 0; i < room_width; i++) {
	for (var j = 0; j < room_height; j++) {
		global.cell[i, j] = 0;
		global.idle[i, j] = 0;
	}
}