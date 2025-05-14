if global.idle[x, y] < 5 && y+1 < room_height && y-1 >= 0 {
	global.idle[x, y]++;
	
	if global.cell[x, y + 1] = 0 {
		global.cell[x, y + 1] = 1;
		global.cell[x, y] = 0;
		global.idle[x, y] = 0;
		
		//reset idle of adjacent cells
		global.idle[x, y + 2] = 0;
		if x-1 >= 0 global.idle[x - 1, y + 1] = 0;
		if x+1 < room_width global.idle[x + 1, y + 1] = 0;
		
		y++;
		exit;
	}
	
	if irandom(1) = 1 {
		if sc_check_bot_left() = 1 exit;
		sc_check_bot_right();
	} else {
		if sc_check_bot_right() = 1 exit;
		sc_check_bot_left();
	}
	
}