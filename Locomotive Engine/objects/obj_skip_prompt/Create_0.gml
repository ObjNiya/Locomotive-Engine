SINGLETON;

depth = DEPTHS.FRONT;

skip_txt = -1;
skip_bind_txt = -1;

input_verb = INPUT_VERB.JUMP;
skip_func = function() {};

fade_out = false;
lifespan = new Timer(2, time_source_units_seconds, function() { fade_out = true xstart -= skip_txt.get_width() });
lifespan.start();