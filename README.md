AZPlotView
==========

AZPlotView is a light-weight layer above a powerful framework Coreplot.

## Requirements

AZPlotView works on iOS version >= 5.0 and is compatible only with ARC projects. It depends on the following Apple frameworks:

* QuartzCore.framework
* UIKit.framework
* Foundation.framework
* CoreGraphics.framework

## Prepare to use AZPlotView in your project

1. Download the [latest code version](https://github.com/willingheart/AZPlotView/archive/master.zip) or add the repository as a git submodule. 
2. Open your project in Xcode, then add `AZPlotView-iOS.framework` in your project.
3. Add Apple framework `QuartzCore.framework` in "Build Phases" of your target settings.
4. Add flag `-ObjC` to field "Other Linker Flags" in "Build Settings" of your target settings.
5. Include AZPlotView wherever you need it with `#import <AZPlotView-iOS/AZPlotView.h>`.

## Usage

Full list of AZPlotView capabilities you can see in project `AZPlotDemo`.
In next weekend (13-14 July 2013) I'll describe all properties of AZPlotView framework.

## Change log

A brief summary of each release can be found on the [Change log](CHANGELOG.md).

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE.md).
