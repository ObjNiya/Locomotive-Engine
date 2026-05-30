lifespan.Step();

x = approach(x, xstart, 2);
image_alpha = approach(image_alpha, real(!fade_out), 0.1);

skip_txt.blend(image_blend, image_alpha);
skip_txt.transform(image_xscale, image_yscale, image_angle);
skip_bind_txt.blend(c_black, image_alpha);
skip_bind_txt.transform(image_xscale, image_yscale, image_angle);

if (fade_out)
{
    if (image_alpha <= 0)
       instance_destroy();
    exit;
}

if (InputPressed(input_verb))
    skip_func();