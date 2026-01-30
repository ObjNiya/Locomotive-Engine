function draw_set_mask_begin()
{
    gpu_push_state()
    gpu_set_stencil_enable(true);
    draw_clear_stencil(0);
    gpu_set_stencil_func(cmpfunc_always);
    gpu_set_stencil_pass(stencilop_replace);
    gpu_set_stencil_ref(2);
    gpu_push_state()
    gpu_set_alphatestenable(true) gpu_set_colourwriteenable(false, false, false, false)
}

function draw_set_mask_end(inv)
{
    gpu_pop_state()
    gpu_set_stencil_func(inv ? cmpfunc_greaterequal : cmpfunc_lessequal);
    gpu_set_stencil_ref(1);
}

function draw_set_mask(spr, ind, x, y, inv = false)
{
    draw_set_mask_begin()
    draw_sprite(spr, ind, x, y)
    draw_set_mask_end(inv)
}

function draw_reset_mask()
{
    gpu_pop_state()
}