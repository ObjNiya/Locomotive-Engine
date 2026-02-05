event_inherited();

depth = -1;

flicker_timer = new Timer(0.035, time_source_units_seconds, function() {
    visible = !visible;
})

flicker_timer.set_ext(1, true);
flicker_timer.start();