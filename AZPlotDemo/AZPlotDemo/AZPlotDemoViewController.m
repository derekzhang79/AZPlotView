//
//  AZPlotDemoViewController.m
//  AZPlotDemo
//
//  Created by Aleksey Zunov on 09.05.13.
//  Copyright (c) 2013 aleksey.zunov@gmail.com. All rights reserved.
//

#import "AZPlotDemoViewController.h"
#import "PlotViewController.h"

@interface AZPlotDemoViewController ()

@property (nonatomic) NSMutableDictionary *plotViewControllers;
@property (nonatomic) NSInteger currentPlotIndex;

@end

@implementation AZPlotDemoViewController

{}

#pragma mark - Setters

- (void)setCurrentPlotIndex:(NSInteger)currentPlotIndex
{
    if (_currentPlotIndex != currentPlotIndex)
    {
        _currentPlotIndex = currentPlotIndex;
        
        // clean view
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        PlotViewController *plotViewController = [self.plotViewControllers objectForKey:[NSNumber numberWithInteger:currentPlotIndex]];
        
        if (plotViewController == nil)
        {
            if (currentPlotIndex == 0)
                plotViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LinearViewController"];
            else if (currentPlotIndex == 1)
                plotViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BarViewController"];
            else
                plotViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PieViewController"];
            
            [self.plotViewControllers setObject:plotViewController forKey:[NSNumber numberWithInteger:currentPlotIndex]];
        }
        
        // add plot view
        [self.view addSubview:plotViewController.view];
        plotViewController.view.frame = self.view.frame;
    }
}

#pragma mark - View Life

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    
    // controllers
    self.plotViewControllers = [NSMutableDictionary dictionary];
    
    // buttons: type of plot
    NSMutableArray *barButtons = [NSMutableArray array];
    
    UIBarButtonItem *linearBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Linear Plot" style:UIBarButtonItemStylePlain target:self action:@selector(showLinearPlot)];
    [barButtons addObject:linearBarButtonItem];
    
    UIBarButtonItem *barBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Bar Chart" style:UIBarButtonItemStylePlain target:self action:@selector(showBarChart)];
    [barButtons addObject:barBarButtonItem];
    
    UIBarButtonItem *pieBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Pie Chart" style:UIBarButtonItemStylePlain target:self action:@selector(showPieChart)];
    [barButtons addObject:pieBarButtonItem];
    
    self.navigationItem.leftBarButtonItems = barButtons;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.plotViewControllers.count)
    {
        PlotViewController *plotViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LinearViewController"];
        [self.plotViewControllers setObject:plotViewController forKey:[NSNumber numberWithInteger:self.currentPlotIndex]];
        [self.view addSubview:plotViewController.view];
        plotViewController.view.frame = self.view.frame;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    PlotViewController *plotViewController = [self.plotViewControllers objectForKey:[NSNumber numberWithInteger:self.currentPlotIndex]];
    plotViewController.view.frame = self.view.frame;
}

#pragma mark - Private Functions

#pragma mark - Actions

- (IBAction)reloadData:(id)sender
{
    PlotViewController *plotViewController = [self.plotViewControllers objectForKey:[NSNumber numberWithInteger:self.currentPlotIndex]];
    [plotViewController reloadData];
}

- (void)showLinearPlot
{
    self.currentPlotIndex = 0;
}

- (void)showBarChart
{
    self.currentPlotIndex = 1;
}

- (void)showPieChart
{
    self.currentPlotIndex = 2;
}

@end
