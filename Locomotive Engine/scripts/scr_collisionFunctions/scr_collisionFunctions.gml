/// @description Returns the absolute floor of val, that is, val floored down to its least magnitude in either direction.
/// @param {real} val The value to absolute floor.	
/// @return {real}
function math_absfloor(val) {
	return (val > 0 ? floor(val) : ceil(val));
}


/// @desc Returns true if object collision collides with a given triangle
/// @param  {real} sx The x position to check for.
/// @param  {real} sy The y position to check for.
/// @param  {real} x1 x-coordinate of 1st point of triangle.
/// @param  {real} y1 y-coordinate of 1st point of triangle.
/// @param  {real} x2 x-coordinate of 2nd point of triangle.
/// @param  {real} y2 y-coordinate of 2nd point of triangle.
/// @param  {real} x3 x-coordinate of 3rd point of triangle.
/// @param  {real} y3 y-coordinate of 3rd point of triangle.
/// @returns {bool}

function triangle_meeting(sx, sy, x1, y1, x2, y2, x3, y3) {
	var old_x = x;
	var old_y = y;
	x = sx;
	y = sy;
	
	var result = (rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom, x1, y1, x2, y2, x3, y3) > 0);
	x = old_x;
	y = old_y;	
	
	return result;
}

/// @function bbox_in_rectangle()
/// @description This function will check if an object's bounding box is in a rectangle's bounds.
function bbox_in_rectangle(obj, dx1, dy1, dx2, dy2) {	
	if (!instance_exists(obj)) {
		return false;
	}
	return rectangle_in_rectangle(obj.bbox_left, obj.bbox_top, obj.bbox_right, obj.bbox_bottom, dx1, dy1, dx2, dy2);
}

/// @description Checks for collisions in the 8 pixels adjacent to the instance.
/// @param {object} obj The object to check for collisions with.
/// @returns {boolean} True if a collision is found, false otherwise.

function place_meeting_adjacent(obj) {
    // Check each adjacent pixel for a collision.
    return(    (place_meeting(x, y, obj)) // Ontop   
			|| (place_meeting(x - 1, y, obj))  // Left
			|| (place_meeting(x + 1, y, obj))  // Right
			|| (place_meeting(x, y - 1, obj))  // Top
			|| (place_meeting(x, y + 1, obj))  // Bottom
			|| (place_meeting(x - 1, y - 1, obj))  // Top-left
			|| (place_meeting(x + 1, y - 1, obj))  // Top-right
			|| (place_meeting(x - 1, y + 1, obj))  // Bottom-left
			|| (place_meeting(x + 1, y + 1, obj))); // Bottom-right
			
	// Forgive me, for I have sinned....
}

/// @description Checks for collisions in the 8 pixels adjacent to the instance.
/// @param {object} obj The object to check for collisions with.
/// @returns {boolean} True if a collision is found, false otherwise.

function place_meeting_collision_adjacent(exclude) {
    // Check each adjacent pixel for a collision.
    return(    (place_meeting_collision(x, y, exclude)) // Ontop   
			|| (place_meeting_collision(x - 1, y, exclude))  // Left
			|| (place_meeting_collision(x + 1, y, exclude))  // Right
			|| (place_meeting_collision(x, y - 1, exclude))  // Top
			|| (place_meeting_collision(x, y + 1, exclude))  // Bottom
			|| (place_meeting_collision(x - 1, y - 1, exclude))  // Top-left
			|| (place_meeting_collision(x + 1, y - 1, exclude))  // Top-right
			|| (place_meeting_collision(x - 1, y + 1, exclude))  // Bottom-left
			|| (place_meeting_collision(x + 1, y + 1, exclude))); // Bottom-right
			
	// Forgive me, for I have sinned....
}

/// @desc Check if a flag is set
/// @param flags The combined flags
/// @param flagToCheck The flag to check
function isCollisionFlagSet(flags, flagToCheck) {
    return (flags & flagToCheck) == flagToCheck;
}
