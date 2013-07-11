//
//  LinearViewController.m
//  AZPlotDemo
//
//  Created by Aleksey Zunov on 12.05.13.
//  Copyright (c) 2013 aleksey.zunov@gmail.com. All rights reserved.
//

#import "LinearViewController.h"

#define PLOTS_COUNT 2

@interface LinearViewController ()

@property (nonatomic, strong) NSMutableDictionary *data;
@property (nonatomic) NSInteger base;

@end

@implementation LinearViewController

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
    
//    // FIXME: не обновляются оси
//    self.plotView.plotAreaPaddingBottom = 60;
}

#pragma mark - Private Functions

- (void)generateData
{
    [self.data removeAllObjects];
    
    self.base = arc4random() % 10 + 1;
    
    for (int i = 0; i < PLOTS_COUNT; i++)
    {
        NSMutableArray *values = [self.data objectForKey:[NSNumber numberWithInteger:i]];
        if (values == nil) values = [NSMutableArray array];
        
        for (int j = 0; j < 50; j++)
        {
            NSNumber *y = [NSNumber numberWithDouble:self.base * i + 120 * rand() / (double)RAND_MAX + 0.5];
            [values addObject:y];
        }
        
        [self.data setObject:values forKey:[NSNumber numberWithInteger:i]];
    }
}

- (void)setupPlotView
{
    // delegate
    self.plotView.dataSource = self;
    
    // external background
    self.plotView.backgroundColor = [UIColor whiteColor];
    
    // internal background
    self.plotView.plotAreaBackgroundColor = [UIColor whiteColor];
    
    // paddings
    self.plotView.plotAreaPaddingLeft = 80;
    self.plotView.plotAreaPaddingRight = 80;
    
    // title
    self.plotView.graphTitle = @"Linear plot";
        
    // extra plot enable
    self.plotView.verticalPlotEnable = YES;
}

#pragma mark - AZPlotView DataSource

- (NSUInteger)numberOfPlotsInAZPlotView:(AZPlotView *)plotView
{
    return PLOTS_COUNT;
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

- (NSNumber *)AZPlotView:(AZPlotView *)plotView valueForXAtIndex:(NSInteger)index inPlotWithIndex:(NSInteger)plotIndex
{
    return [NSNumber numberWithInteger:index - 2];
}

- (NSString *)AZPlotView:(AZPlotView *)plotView titleForXAtIndex:(NSInteger)index
{
    return [NSString stringWithFormat:@"%d", self.base * index - 2];
}

#pragma mark Graph Properties

- (id)AZPlotView:(AZPlotView *)plotView valueForGraphProperty:(AZPlotViewGraphProperty)graphProperty
{
    id value = nil;
    
    switch (graphProperty)
    {
        case AZPlotViewGraphPropertyHorizontalPlotColor:
            value = [UIColor redColor];
            break;
            
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
        case AZPlotViewPlotPropertyFillType:
        {
            if (plotIndex == 0)
                value = [NSNumber numberWithInteger:AZPlotViewPlotFillTypeGradient];
            else
                value = [NSNumber numberWithInteger:AZPlotViewPlotFillTypeGradient];
        }
            break;
            
        case AZPlotViewPlotPropertyLinearInterpolationType:
        {
            if (plotIndex == 0)
                value = [NSNumber numberWithInteger:AZPlotViewPlotInterpolationTypeLinear];
            else
                value = [NSNumber numberWithInteger:AZPlotViewPlotInterpolationTypeCurved];
        }
            break;
            
        case AZPlotViewPlotPropertyLinearSymbolType:
        {
            if (plotIndex == 0)
                value = [NSNumber numberWithInteger:AZPlotViewPlotSymbolTypeEllipse];
            else
                value = [NSNumber numberWithInteger:AZPlotViewPlotSymbolTypeNone];
        }
            break;
            
        default:
            break;
    }
    
    return value;
}

#pragma mark Axis Properties

- (id)AZPlotView:(AZPlotView *)plotView valueForAxisProperty:(AZPlotViewAxisProperty)axisProperty
{
    id value = nil;
        
    switch (axisProperty)
    {
        case AZPlotViewAxisPropertyYPreferredNumberOfMajorTicks:
            value = [NSNumber numberWithInteger:10];
            break;
            
        case AZPlotViewAxisPropertyYLabelExtraSymbol:
            value = @"%";
            break;
            
        case AZPlotViewAxisPropertyYTitleOffset:
            value = [NSNumber numberWithFloat:40.0f];
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
