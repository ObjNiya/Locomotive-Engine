global.secrets_found++;

fmod_studio_system_set_parameter_by_name("Secret", true, false);
trace("You've found ", global.secrets_found, " out of 3 secrets!");