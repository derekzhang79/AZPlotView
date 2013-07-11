//
//  BarViewController.h
//  AZPlotDemo
//
//  Created by Aleksey Zunov on 12.05.13.
//  Copyright (c) 2013 aleksey.zunov@gmail.com. All rights reserved.
//

#import "PlotViewController.h"

@interface BarViewController : PlotViewController <AZPlotViewDataSource>

@property (weak, nonatomic) IBOutlet AZPlotView *plotView;

@end
