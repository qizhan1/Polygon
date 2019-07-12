//
//  SecondViewController.m
//  PolygonProject
//
//  Created by Qi Zhan on 1/7/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "SecondViewController.h"

#import "SimpleRegularPolygon.h"
#import "SimpleRegularPolygonView.h"
#import "TileViewController.h"


// *************************************************************************************************
// # MARK: Private Interfaces


@interface SecondViewController ()

@end


// *************************************************************************************************
// # MARK: Implementation


@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    TileViewController *tileVC = [[TileViewController alloc] init];
    [self addChildViewController:tileVC];
    [tileVC didMoveToParentViewController:self];
    tileVC.view.frame = self.view.bounds;
    [self.view addSubview:tileVC.view];
}


@end
