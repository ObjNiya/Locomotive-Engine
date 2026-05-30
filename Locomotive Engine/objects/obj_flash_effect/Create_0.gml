event_inherited();

lifespan = new Timer(8, time_source_units_frames, function() {
    instance_destroy();
})
lifespan.Start();

has_vh = false;