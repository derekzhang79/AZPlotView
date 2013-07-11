//
//  PlotViewController.h
//  AZPlotDemo
//
//  Created by Aleksey Zunov on 12.05.13.
//  Copyright (c) 2013 aleksey.zunov@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AZPlotView-iOS/AZPlotView.h>

#define COLOR_LIGHT_GREEN [UIColor colorWithRed:134.0f / 255.0f green:170.0f / 255.0f blue:50.0f / 255.0f alpha:1.0f]
#define COLOR_LIGHT_PURPLE [UIColor colorWithRed:167.0f / 255.0f green:81.0f / 255.0f blue:167.0f / 255.0f alpha:1.0f]
#define COLOR_DARK_PURPLE [UIColor colorWithRed:98.0f / 255.0f green:18.0f / 255.0f blue:98.0f / 255.0f alpha:1.0f]

@interface PlotViewController : UIViewController

- (void)reloadData;

@end
