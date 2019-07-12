//
//  SimpleRegularPolygon.m
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "SimpleRegularPolygon.h"

#import "NSError+Polygon.h"


// *************************************************************************************************
// # MARK: Marco


#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)


// *************************************************************************************************
// # MARK: Private Interfaces


@interface SimpleRegularPolygon() {
    CGFloat _exteriorAngle;
    NSUInteger _sides;
}


@end


// *************************************************************************************************
// # MARK: Implementation


@implementation SimpleRegularPolygon


// *************************************************************************************************
// # MARK: Setters


- (void)setSides:(NSUInteger)sides error:(NSError **)error {
    if (sides < 3) {
        if (error) {
            *error = [NSError sidesMinimumCountError];
        }
    } else if (sides > ULONG_MAX) {
        if (error) {
            *error = [NSError sidesMaximumCountError];
        }
    } else {
        _sides = sides;
    }
}


// *************************************************************************************************
// # MARK: Getters


- (CGFloat)angle {
    
    return _exteriorAngle;
}


- (NSUInteger)sides {
    
    return _sides;
}


// *************************************************************************************************
// # MARK: Private Methods


- (NSMutableArray *)polygonPoints:(NSUInteger)sides
                                x:(CGFloat)x
                                y:(CGFloat)y
                           radius:(CGFloat)radius
                           offset:(CGFloat)offset {
    NSMutableArray *points = [NSMutableArray new];
    _exteriorAngle = DEGREES_TO_RADIANS((360/(CGFloat)sides));
    NSUInteger i = 0;
    
    while (i <= sides) {
        CGFloat xpo = x + radius * cos(_exteriorAngle * (CGFloat)i - DEGREES_TO_RADIANS(offset));
        CGFloat ypo = y + radius * sin(_exteriorAngle * (CGFloat)i - DEGREES_TO_RADIANS(offset));
        [points addObject:[NSValue valueWithCGPoint:CGPointMake(xpo, ypo)]];
        i++;
    }
    
    return points;
}


- (NSArray *)polygonPointsWithCenter:(CGPoint)center
                              offset:(CGFloat)offset {
    NSMutableArray *points = [self polygonPoints:_sides
                                               x:center.x
                                               y:center.y
                                          radius:self.radius
                                          offset:offset];
    
    return points;
}


// *************************************************************************************************
// # MARK: Public Methods


- (CGMutablePathRef)createPath:(CGContextRef)context
                        center:(CGPoint)center
                        offset:(CGFloat)offset {
    NSArray *points = [self polygonPointsWithCenter:center offset:offset];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint startPoint = [(NSValue *)points[0] CGPointValue];
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    for (NSValue *eachPoint in points) {
        CGPoint point = [eachPoint CGPointValue];
        CGPathAddLineToPoint(path, NULL, point.x, point.y);
    }
    
    return path;
}


@end
