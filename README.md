AZPlotView
==========

AZPlotView is a lightweight layer above a powerful framework [Coreplot](http://code.google.com/p/core-plot/).

[![](https://dl.dropboxusercontent.com/s/dfm89vo5naezp8y/1-thumb.png)](https://dl.dropboxusercontent.com/s/u3eiir3eox4774f/1.png)
[![](https://dl.dropboxusercontent.com/s/bf4aviqeikswjg4/2-thumb.png)](https://dl.dropboxusercontent.com/s/nr7ko7g7lun6qmy/2.png)
[![](https://dl.dropboxusercontent.com/s/2qdcljpkh645tfx/3-thumb.png)](https://dl.dropboxusercontent.com/s/stsr701avaddofj/3.png)
[![](https://dl.dropboxusercontent.com/s/zs9dom90ijbvhnm/4-thumb.png)](https://dl.dropboxusercontent.com/s/h1spzk41po9sf5i/4.png)

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

Full list of AZPlotView capabilities you can see in project "AZPlotDemo".

Setup of X and Y plot values - via data source methods:

* [AZPlotView: valueForXAtIndex: inPlotWithIndex:]
* [AZPlotView: valueForYAtIndex: inPlotWithIndex:]

Almost all optional properties are initialized via methods of data source `AZPlotViewDataSource`:

* [AZPlotView: valueForGraphProperty:]
* [AZPlotView: valueForAxisProperty:]
* [AZPlotView: valueForPlotProperty: inPlotWithIndex:]
* [AZPlotView: valueForLegendProperty:]

Names of properties and constants can be found in header file `AZPlotViewConstants.h`.
Also there you can see type of return value of optional 'properties' methods.

For example, record 'AZPlotViewAxisPropertyAxisTitleColor - Value: UIColor' in header file `AZPlotViewConstants.h`
say, that you must return `UIColor` object for method [AZPlotView: valueForAxisProperty:].

## Change log

A brief summary of each release can be found on the [Change log](CHANGELOG.md).

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE.md).
