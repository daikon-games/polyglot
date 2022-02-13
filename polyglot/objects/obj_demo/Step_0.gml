msg = str("general.greeting");
waveFrame = (waveFrame + 1) % waveFrames;

for (var i = 0; i < array_length(locales); i++) {
	var x1 = 10 + (i * 50);
	var x2 = 55 + (i * 50);
	var y1 = 265;
	var y2 = 285;
	var _mouseX = window_view_mouse_get_x(0);
	var _mouseY = window_view_mouse_get_y(0);
	if (_mouseX > x1 && _mouseX < x2 &&
		_mouseY > y1 && _mouseY < y2 &&
		mouse_check_button_pressed(mb_left)) {
		obj_polyglot.setLocale(locales[i]);	
		waveAmount = 20;
		waveFrames = 100;
		currentBgColor = choose(make_color_rgb(252, 105, 13),
					make_color_rgb(13, 129, 252),
					make_color_rgb(12, 201, 50),
					make_color_rgb(120, 55, 148));
		bgBlendAmt = 0;
	}
}

waveAmount = lerp(waveAmount, baseWaveAmt, 0.01);
waveFrames = lerp(waveFrames, baseWaveFrames, 0.01);
bgBlendAmt = lerp(bgBlendAmt, 1.0, 0.03);

var bgCol = merge_color(currentBgColor, c_black, bgBlendAmt);
layer_background_blend(layer_background_get_id(layer_get_id("Background")),
	bgCol);