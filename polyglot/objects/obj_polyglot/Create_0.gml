_workMemory = ds_map_create();
_currLocale = "en_US";

_undef = "ERROR: NO LOCALIZED STRING";

// If another instance of polyglot already exists, destroy ourself
// Must do after initializing work memory so our clean-up step succeeds
if (instance_number(object_index) > 1) {
	instance_destroy();
}

/// @function str(section, key)
/// @param section The section of the ini file to read a string from
/// @param key The key of the string whose localized value to read
/// @description Returns the localized string value for a given section and key, 
///				 for the currently set locale
function str(section, key) {
	var cacheKey = section + ":" + key;
	if (!is_undefined(_workMemory[?cacheKey])) {
		// If we have the value of this string cached, 
		// return it rather than re-opening the ini file
		return _workMemory[?cacheKey];
	} else {
		// Open the correct i18n file and read the value
		ini_open("i18n/" + _currLocale + ".ini");
		result = ini_read_string(section, key, _undef);
		ini_close();
		
		if (ds_map_size(_workMemory) >= _workMemorySize) {
			// If our cache is full, delete a random item (ds_maps are not ordered)
			// before storing the new string
			ds_map_delete(_workMemory, ds_map_find_first(_workMemory));
		}
		
		// Cache the value in our work memory
		_workMemory[?cacheKey] = result;
		
		return result;
	}
}

/// @function setLocale(locale)
/// @param locale The new locale to set
/// @description Changes the current locale, and clears the working memory
function setLocale(locale) {
	_currLocale = locale;
	ds_map_clear(_workMemory)
}