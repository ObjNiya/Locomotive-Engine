shader_set(shd_flash_effect);

shader_set_uniform_f(shader_get_uniform(shd_flash_effect, "u_fLifespanStart"), 8);
shader_set_uniform_f(shader_get_uniform(shd_flash_effect, "u_fLifespan"), lifespan.time);

draw_self();
shader_reset();