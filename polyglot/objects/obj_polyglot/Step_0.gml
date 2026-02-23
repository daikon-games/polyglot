var _desiredLocale = _localeListener();
if (!is_undefined(_desiredLocale) && _currLocale != _desiredLocale) {
	setLocale(_desiredLocale);
}