if x < 0 || x >= room_width || y < 0 || y >= room_height instance_destroy(); exit;
global.cell[x, y] = 1;