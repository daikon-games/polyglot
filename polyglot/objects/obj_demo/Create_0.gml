waveAmount = 10;
waveFrame = 0;
waveFrames = 180;

baseWaveAmt = 5;
baseWaveFrames = 200;

msg = "";

locales = ["en", "es", "fr", "kr"];
fonts = {
	def: {menu: font_menu, demo: font_demo},
	kr: {menu: font_menu_kr, demo: font_demo_kr}
}

currentBgColor = c_black;
bgBlendAmt = 0;

swaps = 0;

function fontSet() {
	if (current_locale() == "kr") {
		return fonts.kr;
	} else {
		return fonts.def;
	}
}