//
//  BarViewController.m
//  AZPlotDemo
//
//  Created by Aleksey Zunov on 12.05.13.
//  Copyright (c) 2013 aleksey.zunov@gmail.com. All rights reserved.
//

#import "BarViewController.h"

#define PLOTS_COUNT 1
#define POINTS_COUNT 30

@interface BarViewController ()

@property (nonatomic, strong) NSMutableDictionary *data;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSMutableArray *labels;

@end

@implementation BarViewController

{}

#pragma mark - View Life

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [NSMutableDictionary dictionary];
    self.labels = [NSMutableArray array];
    
    // date format
    self.dateFormatter = [[NSDateFormatter alloc] init];
    
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
    
    NSInteger base = arc4random() % 10 + 1;
    
    for (int i = 0; i < PLOTS_COUNT; i++)
    {
        NSMutableArray *values = [self.data objectForKey:[NSNumber numberWithInteger:i]];
        if (values == nil) values = [NSMutableArray array];
        
        for (int j = 0; j < POINTS_COUNT; j++)
        {
            NSNumber *y = [NSNumber numberWithDouble:base * i + 120 * rand() / (double)RAND_MAX + 0.5];
            [values addObject:y];
        }
        
        [self.data setObject:values forKey:[NSNumber numberWithInteger:i]];
    }
    
    // labels
    if (!self.labels.count)
    {
        // initial date
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.day = 1;
        dateComponents.month = 1;
        dateComponents.year = 2008;
       
        for (int i = 0; i < POINTS_COUNT; i++)
        {
            if (dateComponents.month == 13)
            {
                dateComponents.month = 1;
                dateComponents.year++;
            }
            
            if (dateComponents.month == 1 || dateComponents.month == 12)
                self.dateFormatter.dateFormat = @"LLL YY";
            else
                self.dateFormatter.dateFormat = @"LLL";
            
            [self.labels addObject:[self.dateFormatter stringFromDate:[[NSCalendar currentCalendar] dateFromComponents:dateComponents]]];
            dateComponents.month++;
        }
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
    
    // title
    self.plotView.graphTitle = @"Bar chart";
        
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

- (NSString *)AZPlotView:(AZPlotView *)plotView titleForXAtIndex:(NSInteger)index
{
    return [self.labels objectAtIndex:index];
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
            value = [NSNumber numberWithInteger:AZPlotViewPlotTypeBar];
            break;
            
        case AZPlotViewPlotPropertyFillType:
            value = [NSNumber numberWithInteger:AZPlotViewPlotFillTypeGradient];
            break;
            
        case AZPlotViewPlotPropertyFillBeginColor:
            value = COLOR_LIGHT_PURPLE;
            break;
            
        case AZPlotViewPlotPropertyFillEndColor:
            value = COLOR_DARK_PURPLE;
            break;
            
        case AZPlotViewPlotPropertyFillAngle:
            value = [NSNumber numberWithFloat:0];
            break;
            
        case AZPlotViewPlotPropertyBarCornerRadius:
            value = [NSNumber numberWithFloat:5.0];
            break;
            
        case AZPlotViewPlotPropertyBarHorizontal:
            value = [NSNumber numberWithBool:NO];
            break;
            
        case AZPlotViewPlotPropertyBarOffset:
            value = [NSNumber numberWithFloat:0];
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
