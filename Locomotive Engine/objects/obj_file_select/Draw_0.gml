draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 1; i <= 3; i++)
{
    var xx = 225 * i;
    
    if (i != cur_file)
        draw_set_color(c_gray);
    else
        draw_set_color(c_white);
    
    draw_text_scribble(xx, GAME_HEIGHT / 2, "[spr_bigfont]FILE " + string(i))
}

draw_set_color(c_white);

draw_text_scribble(GAME_WIDTH / 2, GAME_HEIGHT / 1.2, "[fa_middle][fa_center][spr_bigfont] LOCOMOTIVE ENGINE V0.7")