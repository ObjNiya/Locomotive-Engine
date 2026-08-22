if (jvinda)
{
    draw_self();
    exit;
}

var color_to_static = c_lime; 
var static_back_color = #5078b0;
var static_color = #88a8c8;

if (floor(image_index) >= 4 && floor(image_index) < 8)
{
    color_to_static = #F80000;
    static_back_color = #682800;
    static_color = #e03000;
}

NautaStaticSet(color_to_static, static_color, static_back_color);
NautaStaticSetUvs(sprite_index, image_index);
draw_self();
shader_reset();