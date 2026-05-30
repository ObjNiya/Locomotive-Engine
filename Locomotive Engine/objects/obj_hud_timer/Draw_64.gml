draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(global.minifont);

var save_timer_yoff = -8;
if (global.levelTimer.state == TIMER_STATES.STARTED)
{
    var time_str = global.levelTimer.Draw(AlignToGuiX(fa_right, -148), AlignToGuiY(fa_bottom, -8), 3, 3, false);
    save_timer_yoff -= string_height(time_str) + 8;
}

if (global.saveTimer.state == TIMER_STATES.STARTED)
    global.saveTimer.Draw(AlignToGuiX(fa_right, -148), AlignToGuiY(fa_bottom, save_timer_yoff), 3, 3, false);

draw_set_valign(fa_top);