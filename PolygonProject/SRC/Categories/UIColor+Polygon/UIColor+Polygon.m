//
//  UIColor+Polygon.m
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "UIColor+Polygon.h"


// *************************************************************************************************
// # MARK: Implementation


@implementation UIColor (Polygon)


+ (UIColor *)randomColor {
    
     return [UIColor colorWithHue:(( 19 * arc4random()) % 255)/255.f
                       saturation:1.f
                       brightness:1.f
                            alpha:1.f];
}


@end
