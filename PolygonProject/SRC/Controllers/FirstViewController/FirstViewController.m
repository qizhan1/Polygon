//
//  FirstViewController.m
//  PolygonProject
//
//  Created by Qi Zhan on 1/7/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "FirstViewController.h"

#import "SimpleRegularPolygon.h"
#import "SimpleRegularPolygonView.h"
#import "TileViewController.h"
#import "PolygonViewController.h"


// *************************************************************************************************
// # MARK: Private Interfaces


@interface FirstViewController ()


@end


// *************************************************************************************************
// # MARK: Implementation


@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    PolygonViewController *polygonVC = [[PolygonViewController alloc] init];
    polygonVC.view.frame = self.view.bounds;
    [self.view addSubview:polygonVC.view];
}


@end
