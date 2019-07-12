//
//  SimpleRegularPolygonView.h
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Forward Declaration


@class SimpleRegularPolygon;


// *************************************************************************************************
// # MARK: Public Interface


@interface SimpleRegularPolygonView : UIView


// *************************************************************************************************
// # MARK: Public Properties


@property (nonatomic, strong, readwrite) SimpleRegularPolygon *polygon;


// *************************************************************************************************
// # MARK: Public Methods


- (void)runRotateAnimation;


@end
