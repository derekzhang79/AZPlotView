//
//  PieViewController.m
//  AZPlotDemo
//
//  Created by Aleksey Zunov on 12.05.13.
//  Copyright (c) 2013 aleksey.zunov@gmail.com. All rights reserved.
//

#import "PieViewController.h"

@interface PieViewController ()

@property (nonatomic, strong) NSMutableDictionary *data;

@end

@implementation PieViewController

{}

#pragma mark - View Life

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [NSMutableDictionary dictionary];
    
    // data
    [self generateData];
    
    // setup of plot
    [self setupPlotView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

#pragma mark - Parent Functios

- (void)reloadData
{
    [self generateData];
    [self.plotView reloadData];
}

#pragma mark - Private Functions

- (void)generateData
{
    [self.data removeAllObjects];
    
    NSMutableArray *values = [self.data objectForKey:[NSNumber numberWithInteger:0]];
    if (values == nil) values = [NSMutableArray array];
        
    for (int j = 0; j < 5; j++)
    {
        NSNumber *y = [NSNumber numberWithDouble:10 + 120 * rand() / (double)RAND_MAX + 0.5];
        [values addObject:y];
    }
        
    [self.data setObject:values forKey:[NSNumber numberWithInteger:0]];
}

- (void)setupPlotView
{
    // delegate
    self.plotView.dataSource = self;
    
    // external background
    self.plotView.backgroundColor = [UIColor whiteColor];
    
    // internal background
    self.plotView.plotAreaBackgroundColor = [UIColor whiteColor];
    
    // title
    self.plotView.graphTitle = @"Pie chart";
}

#pragma mark - AZPlotView DataSource

- (NSUInteger)numberOfPlotsInAZPlotView:(AZPlotView *)plotView
{
    return 1;
}

- (NSUInteger)numberOfPointsInAZPlotView:(AZPlotView *)plotView inPlotWithIndex:(NSInteger)plotIndex
{
    NSMutableArray *values = [self.data objectForKey:[NSNumber numberWithInteger:plotIndex]];
    return values.count;
}

- (NSNumber *)AZPlotView:(AZPlotView *)plotView valueForYAtIndex:(NSInteger)index inPlotWithIndex:(NSInteger)plotIndex
{
    NSMutableArray *values = [self.data objectForKey:[NSNumber numberWithInteger:plotIndex]];
    return [values objectAtIndex:index];
}

#pragma mark Graph Properties

- (id)AZPlotView:(AZPlotView *)plotView valueForGraphProperty:(AZPlotViewGraphProperty)graphProperty
{
    id value = nil;
    
    switch (graphProperty)
    {
        case AZPlotViewGraphPropertyGraphTitleColor:
            value = COLOR_LIGHT_PURPLE;
            break;
            
        default:
            break;
    }
    
    return value;
}

#pragma mark Plot Properties

- (id)AZPlotView:(AZPlotView *)plotView valueForPlotProperty:(AZPlotViewPlotProperty)plotProperty inPlotWithIndex:(NSInteger)plotIndex
{
    id value = nil;
    
    switch (plotProperty)
    {
        case AZPlotViewPlotPropertyType:
            value = [NSNumber numberWithInteger:AZPlotViewPlotTypePie];
            break;
            
        default:
            break;
    }
    
    return value;
}

#pragma mark Legend Properties

- (id)AZPlotView:(AZPlotView *)plotView valueForLegendProperty:(AZPlotViewLegendProperty)legendProperty
{
    id value = nil;
    
    switch (legendProperty)
    {
        case AZPlotViewLegendPropertyFillColor:
            value = [UIColor darkGrayColor];
            break;
            
        case AZPlotViewLegendPropertyFontSize:
            value = [NSNumber numberWithFloat:16];
            break;
            
        case AZPlotViewLegendPropertyCornerRadius:
            value = [NSNumber numberWithFloat:5.0];
            break;
            
        default:
            break;
    }
    
    return value;
}

@end
