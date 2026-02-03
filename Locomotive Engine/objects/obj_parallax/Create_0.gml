camera_x_previous = 0;
camera_y_previous = 0;

camera_x = 0;
camera_y = 0;

function parallax_calculate_still_position(camera_position, size, game_size, room_size)
{
    size = max(0, size);
    
    var size_difference = size - game_size;
    var camera_position_scalar = camera_position / room_size;
    
    return camera_position - (size_difference * camera_position_scalar);
}