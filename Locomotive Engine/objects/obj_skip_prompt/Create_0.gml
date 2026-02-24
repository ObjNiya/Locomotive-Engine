SINGLETON;

depth = DEPTHS.FRONT;

input_verb = INPUT_VERB.JUMP;
verb_bind_name = InputVerbGetBindingName(input_verb);

skip_func = function() {};

lifespan = new Timer(2, time_source_units_seconds, function() { instance_destroy() });
lifespan.start();