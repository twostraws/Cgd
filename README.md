# Cgd

A small Swift package exposing libgd to Swift, allowing for basic graphic rendering on server-side Swift. This was created to be used alongside [swiftgd](https://github.com/twostraws/swiftgd) but you can also use the libgd functions directly if you prefer.

All of GD's functions are exposed directly from C, so if you can use GD then you can use this package.

Here's a simple example to get you started. This code creates a new 800x600 image, fills it with red, draws a blue ellipse in the center, then saves it to output.png:

	#if os(Linux)
		import Glibc
		import Cgdlinux
	#else
		import Darwin
		import Cgdmac
	#endif

	let width = 800
	let height = 600

	let image = gdImageCreateTrueColor(800, 600)

	let red = gdImageColorAllocateAlpha(image, 255, 0, 0, 0)
	let blue = gdImageColorAllocateAlpha(image, 0, 0, 255, 0)

	gdImageFill(image, 0, 0, red)
	gdImageFilledEllipse(image, 400, 300, 200, 100, blue)

	let outputFile = fopen("output.png", "wb")
	defer { fclose(outputFile) }

	gdImagePng(image, outputFile)

## License

This package is released under the MIT License, which is copied below.

Copyright (c) 2016 Paul Hudson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
