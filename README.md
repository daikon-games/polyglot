# polyglot
Polyglot is a library for GameMaker Studio 2.3+ for loading localized strings easily and efficiently.

#### Table of Contents
* [Setup](#setup)
* [Usage](#usage)
* [Licensing](#licensing)
* [Attribution](#attribution)

## Setup

Integrating Polyglot into your project is simple: just [download the latest release](https://github.com/daikon-games/polyglot/releases), and then in GameMaker Studio click on the **Tools** menu and select **Import Local Package**. Choose the `.yymps` file you downloaded, and import all assets.

Alternatively you can install polyglot from the [Game Maker Marketplace]() (coming soon).

The `obj_polyglot` object is persistent, so you only need to include or create it once.
There isn't much configuration needed for Polyglot, by default its locale is set to `en_US`, and its work memory cache stores 100 strings.
If you need to change either of these properties, you could do so after object creation.

You will need to create `.ini` files in a directory called `i18n` in your game's "Included Files" directory. Each `.ini` file will contain all of the strings for a given locale.

For instance, create `your-project/datafiles/i18n/en_US.ini` to store all of your strings for the American English locale.

## Usage

Polyglot exposes two functions for your use:

```
obj_polyglot.str(section, key)
obj_polyglot.setLocale(locale)
```

Let's quickly discuss each:

### str

This method will return the localized value of a section/key pair from the current locale. It caches these results in its work memory (100 strings by default),
so you can freely call this method every frame without worrying about a performance penalty. `.ini` files are organized into sections, denoted by square brackets.
Underneath each section can be a number of key/value pairs.

Let's say we wanted to store a string called "hello" under a section called "dialog", with the value "Hello there!". The `.ini` contents would look like this:
```
[dialog]
hello = Hello there!
```
Then to get this localized string in our game we can invoke Polyglot like so:
```
var localStr = obj_polyglot.str("dialog", "hello");
```

Simply use `obj_polyglot.str` any time you would previously have hard-coded a string.

### setLocale

This method's purpose is to change the current locale. Polyglot doesn't have any hard requirements for the names of the locales,
just that they must be strings, and that the `.ini` files you create must have the exact names of the locale you set Polyglot to use.

To change the locale, simple invoke Polyglot like so:
```
obj_polyglot.setLocale("es_ES");
```

## Licensing

Polyglot is licensed under Creative Commons BY 4.0. Essentially, you may use it, change it, ship it, and share it, with attribution.
Just make sure to somewhere mention the use of **Polyglot by Daikon Games**!

## Attribution
### Fonts
Demo font, [Peaberry](https://emhuo.itch.io/peaberry-pixel-font) by emhuo
