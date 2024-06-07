# HeroiconsToLib

This is a very rough-around-the-edges utility script that transforms a directory filled with SVG files into a single SVG file, 
where the contents of the input files are wrapped in a <g> tag with a title corresponding to their original filename.

I am using it to vendor icons for hexpm. The "read" side of this case is in the hexpm project: `lib/hexpm_web/views/icons.ex`

Sample usage:
```
HeroiconsToLib.generate_library_file("./src/outline", "heroicons.svg")
```

So far it is only tested on Heroicons. In theory it would work for any svg files provided they:
- use one or more `path` tags to define the shape.
- the path tag contains attributes: d, stroke, stroke-linecap, stroke-width, stroke-linejoin (only)


