//
//  SimpleRegularPolygonViewCell.m
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "SimpleRegularPolygonViewCell.h"

#import "SimpleRegularPolygonView.h"


// *************************************************************************************************
// # MARK: Implementation


@implementation SimpleRegularPolygonViewCell


// *************************************************************************************************
// # MARK: Init


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    
    return self;
}


-(void)commonInit {
    _polygonView = [SimpleRegularPolygonView new];
    [self addSubview:_polygonView];
    _polygonView.frame = self.bounds;
    _polygonView.backgroundColor = [UIColor clearColor];
}


@end
