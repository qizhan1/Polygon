//
//  SimpleRegularPolygon.h
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Public Interface


@interface SimpleRegularPolygon : NSObject


// *************************************************************************************************
// # MARK: Public Properties


@property (nonatomic, strong, readwrite) UIColor *color;
@property (nonatomic, assign, readwrite) BOOL rotatable;
@property (nonatomic, assign, readwrite) CGFloat radius;
@property (nonatomic, assign, readwrite) BOOL shouldFillColor;


// *************************************************************************************************
// # MARK: Delegate Property


//@property (nonatomic, weak, readwrite) id <SimpleRegularPolygonDelegate> delegate;


// *************************************************************************************************
// # MARK: Getter Methods


- (CGFloat)angle;
- (NSUInteger)sides;


// *************************************************************************************************
// # MARK: Getter Methods


- (void)setSides:(NSUInteger)sides error:(NSError **)error;


// *************************************************************************************************
// # MARK: Public Methods


- (CGMutablePathRef)createPath:(CGContextRef)context
                        center:(CGPoint)center
                        offset:(CGFloat)offset;


@end
