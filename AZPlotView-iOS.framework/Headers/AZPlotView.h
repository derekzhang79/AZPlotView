//
//  AZPlotView.h
//  AZPlotView
//
//  Created by Aleksey Zunov on 09.05.13.
//  Copyright (c) 2013 aleksey.zunov@gmail.com. All rights reserved.
//

// v. 1.0.0

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "AZPlotViewConstants.h"

@class AZPlotView;

@protocol AZPlotViewDataSource <NSObject>

- (NSUInteger)numberOfPlotsInAZPlotView:(AZPlotView*)plotView;
- (NSUInteger)numberOfPointsInAZPlotView:(AZPlotView*)plotView inPlotWithIndex:(NSInteger)plotIndex;

// value Y
- (NSNumber*)AZPlotView:(AZPlotView*)plotView valueForYAtIndex:(NSInteger)index inPlotWithIndex:(NSInteger)plotIndex;

@optional

// value X
- (NSNumber*)AZPlotView:(AZPlotView*)plotView valueForXAtIndex:(NSInteger)index inPlotWithIndex:(NSInteger)plotIndex;

// title X
- (NSString*)AZPlotView:(AZPlotView*)plotView titleForXAtIndex:(NSInteger)index;

// title Y
- (NSString*)AZPlotView:(AZPlotView*)plotView titleForYAtIndex:(NSInteger)index;

// graph properties
- (id)AZPlotView:(AZPlotView*)plotView valueForGraphProperty:(AZPlotViewGraphProperty)graphProperty;

// axis properties
- (id)AZPlotView:(AZPlotView*)plotView valueForAxisProperty:(AZPlotViewAxisProperty)axisProperty;

// plot properties
- (id)AZPlotView:(AZPlotView*)plotView valueForPlotProperty:(AZPlotViewPlotProperty)plotProperty inPlotWithIndex:(NSInteger)plotIndex;

// legend properties
- (id)AZPlotView:(AZPlotView*)plotView valueForLegendProperty:(AZPlotViewLegendProperty)legendProperty;

@end

@interface AZPlotView : UIView <CPTPlotDataSource, CPTPlotSpaceDelegate, CPTAxisDelegate,
                                CPTScatterPlotDataSource, CPTScatterPlotDelegate,
                                CPTBarPlotDelegate, CPTPieChartDataSource, CPTPieChartDelegate>

@property (nonatomic, weak) id<AZPlotViewDataSource> dataSource;

- (void)reloadData;

/* General properties */

// Number of visible points. Default: 20
@property (nonatomic) NSUInteger numberOfVisiblePoints;

// Vertical plot. Default: NO
@property (nonatomic) BOOL verticalPlotEnable;
@property (nonatomic) NSInteger verticalPlotPosition;

// Horizontal plot. Default: YES
@property (nonatomic) BOOL horizontalPlotEnable;


/* Graph properties */

// Graph paddings. Default: 0
@property (nonatomic) CGFloat graphPaddingLeft;
@property (nonatomic) CGFloat graphPaddingRight;
@property (nonatomic) CGFloat graphPaddingTop;
@property (nonatomic) CGFloat graphPaddingBottom;

// Graph title
@property (nonatomic, strong) NSString *graphTitle;


/* Plot area properties */

// Plot area paddings. Default: 50
@property (nonatomic) CGFloat plotAreaPaddingLeft;
@property (nonatomic) CGFloat plotAreaPaddingRight;
@property (nonatomic) CGFloat plotAreaPaddingTop;
@property (nonatomic) CGFloat plotAreaPaddingBottom;

// Plot area background color. Default: [UIColor lightGrayColor]
@property (nonatomic, strong) UIColor *plotAreaBackgroundColor;

@end
