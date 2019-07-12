//
//  NSError+Polygon.h
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Type Definiton


typedef NS_ENUM(NSInteger, PolygonErrorCode) {
    PolygonErrorCodeSidesMinimumCount,
    PolygonErrorCodeSidesMaximumCount
};


// *************************************************************************************************
// # MARK: Public Interface


@interface NSError (Polygon)


// *************************************************************************************************
// # MARK: Class Methods


+ (NSError *)sidesMaximumCountError;
+ (NSError *)sidesMinimumCountError;


@end
