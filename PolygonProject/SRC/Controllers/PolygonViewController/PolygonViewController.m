//
//  PolygonViewController.m
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "PolygonViewController.h"

#import "SimpleRegularPolygon.h"
#import "SimpleRegularPolygonView.h"


// *************************************************************************************************
// # MARK: Private Interfaces


@interface PolygonViewController ()


@property (nonatomic, strong, readwrite) SimpleRegularPolygon *polygon;
@property (nonatomic, strong, readwrite) SimpleRegularPolygonView *polygonView;
@property (nonatomic, assign, readwrite) NSUInteger polygonSides;


@end


// *************************************************************************************************
// # MARK: Implementation


@implementation PolygonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.polygonSides = 3;
    self.polygon = [SimpleRegularPolygon new];
    NSError *error = nil;
    
    [self.polygon setSides:self.polygonSides error:&error];
    self.polygon.radius = 100;
    self.polygon.color = [UIColor redColor];
    if (!error) {
        self.polygonView = [[SimpleRegularPolygonView alloc] initWithFrame:self.view.frame];
        self.polygonView.polygon = self.polygon;
        [self.view addSubview:self.polygonView];
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(timerDidTick:)
                                       userInfo:nil
                                        repeats:YES];
    } else {
        NSLog(@"%@", error);
    }
}


// *************************************************************************************************
// # MARK: Private Methods


- (void)timerDidTick:(NSTimer *)timer {
    self.polygonSides++;
    NSError *error = nil;
    
    [self.polygon setSides:self.polygonSides error:&error];
    if (error) {
        [timer invalidate];
        timer = nil;
        NSLog(@"%@", error);
    }
    if (self.polygonSides > 9) {
        self.polygonSides = 2;
    }
    [self.polygonView setNeedsDisplay];
}


@end
