//
//  SimpleRegularPolygonView.m
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "SimpleRegularPolygonView.h"

#import "SimpleRegularPolygon.h"


// *************************************************************************************************
// # MARK: Definitions


#define POLYGON_ANGLE_OFFSET 270


// *************************************************************************************************
// # MARK: Private Interface


@interface SimpleRegularPolygonView ()


@end


// *************************************************************************************************
// # MARK: Implementation


@implementation SimpleRegularPolygonView


// *************************************************************************************************
// # MARK: Init


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    
    return self;
}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    
    return self;
}


-(void)commonInit {
    self.backgroundColor = [UIColor whiteColor];
    self.clearsContextBeforeDrawing = YES;
}


// *************************************************************************************************
// # MARK: Overrides


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path
    = [self.polygon createPath:context
                        center:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
                        offset:POLYGON_ANGLE_OFFSET];
    CGPathCloseSubpath(path);
    CGContextAddPath(context, path);
    if (self.polygon.shouldFillColor) {
        CGContextSetFillColorWithColor(context,self.polygon.color.CGColor);
        CGContextFillPath(context);
    } else {
        CGContextSetStrokeColorWithColor(context,self.polygon.color.CGColor);
        CGContextStrokePath(context);
    }
    CGPathRelease(path);
}


// *************************************************************************************************
// # MARK: Public Methods


- (void)runRotateAnimation {
    if (self.polygon.rotatable) {
        [self runRotateAnimationWithDuration:1.f rotations:1.f repeat:NO];
    }
}


// *************************************************************************************************
// # MARK: Private Methods


- (void)runRotateAnimationWithDuration:(CGFloat)duration
                             rotations:(CGFloat)rotations
                                repeat:(BOOL)repeat {
    CABasicAnimation* rotationAnimation
        = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * rotations * duration];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat ? HUGE_VALF : 0;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


@end
