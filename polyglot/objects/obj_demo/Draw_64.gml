var fontset = fontSet();
draw_set_color(c_white);
draw_set_font(fontset.demo);

var screen_center_x = display_get_gui_width()/2;
var screen_center_y = display_get_gui_height()/2;

draw_set_halign(fa_center);

var stringCharCount = string_length(msg);
for (var i = 1; i <= stringCharCount; i++) {
	var char = string_char_at(msg, i);
	var xOffset = -15 * ((stringCharCount/2) - i);
	var waveDeg = (((waveFrame + (3 * i)) % waveFrames)/waveFrames) * 360;
	var yOffset = dsin(waveDeg) * waveAmount;
	draw_text(screen_center_x + xOffset, screen_center_y + yOffset, char);
}

draw_set_font (fontset.menu);
draw_text(screen_center_x, 20, str("general.swap-count", {count: swaps}));

draw_set_halign(fa_left);

draw_text(10, 250, str("menu.set-locale"));
for (var i = 0; i < array_length(locales); i++) {
	var pressed = (obj_polyglot._currLocale == locales[i])
	draw_sprite_stretched(pressed ? spr_button_pressed : spr_button, 0, 10 + (i * 50), 265, 45, 20);
	draw_text(18 + (i * 50), 268, locales[i]);
}

