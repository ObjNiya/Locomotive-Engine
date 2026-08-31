var prefix, color = c_white;

switch (sign(number))
{
    case 1:
        prefix = "+";
        break;
    case -1:
        color = c_red;
        prefix = "-";
        break;
    default:
        prefix = "";
}

draw_set_font(global.fntPointsnum);
draw_set_color(color);
draw_set_halign(fa_center);
draw_text(x, y, prefix + string(number));
draw_set_halign(fa_left);
draw_set_color(c_white);