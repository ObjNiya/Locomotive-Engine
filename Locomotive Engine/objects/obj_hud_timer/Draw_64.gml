draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(global.fntSmall);

var subsec_prec = (global.speedrunTimer) ? 3 : 1;
var save_timer_yoff = -8;

if (global.levelTimer.state == TIMER_STATES.STARTED)
{
    var time_str = global.levelTimer.Draw(GuiCalcX(fa_right) - 148, GuiCalcY(fa_bottom) - 8, subsec_prec, 3, false);
    save_timer_yoff -= string_height(time_str) + 8;
}

if (global.saveTimer.state == TIMER_STATES.STARTED)
    global.saveTimer.Draw(GuiCalcX(fa_right) - 148, GuiCalcY(fa_bottom) - save_timer_yoff, subsec_prec, 3, false);

draw_set_valign(fa_top);