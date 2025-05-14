// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_check_bot_left() {
	if x-1 >= 0 && global.cell[x - 1, y + 1] = 0 {
		global.cell[x - 1, y + 1] = 1;
		global.cell[x, y] = 0;
		global.idle[x, y] = 0;
		
		//reset idle of adjacent cells
		global.idle[x - 1, y + 2] = 0;
		global.idle[x - 1, y] = 0;
		global.idle[x, y + 1] = 0;
		if x-2 >= 0 global.idle[x - 2, y + 1] = 0;
		
		if y > 0 {
			if x+1 < room_width global.idle[x+1, y-1] = 0;
			if x-1 >= 0 global.idle[x-1, y-1] = 0;
			global.idle[x, y - 1] = 0;
		}
		
		x--;
		y++;
		
		return 1;
	}
}