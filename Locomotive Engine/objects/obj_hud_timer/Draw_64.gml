draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(global.minifont);
global.saveTimer.Draw(AlignToGuiX(fa_right, -200), AlignToGuiY(fa_bottom, -8), 3, 2);
draw_set_valign(fa_top);