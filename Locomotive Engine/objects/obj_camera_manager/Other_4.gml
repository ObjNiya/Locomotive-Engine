if (!view_enabled)
    view_enabled = true;

array_foreach(global.cameras, function(value, index) {
    value.room_start();
});