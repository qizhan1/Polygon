//
//  NSError+Polygon.m
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "NSError+Polygon.h"


// *************************************************************************************************
// # MARK: Constants


#define POLYGON_ERROR_DOMAIN @"PolygonErrorDomain"


// *************************************************************************************************
// # MARK: Implementation


@implementation NSError (Polygon)


+ (NSError *)sidesMaximumCountError {
    NSDictionary *userInfo
    = @{
        NSLocalizedDescriptionKey:
            NSLocalizedString(@"Setting count of sides is unsuccessful.", nil),
        NSLocalizedFailureReasonErrorKey:
            NSLocalizedString(@"The count of sides is larger than the maximum unsigned integer.", nil),
        NSLocalizedRecoverySuggestionErrorKey:
            NSLocalizedString(@"The count of sides should be less than or equal to the maximum unsigned integer.", nil)
        };
    return [NSError errorWithDomain:POLYGON_ERROR_DOMAIN
                               code:PolygonErrorCodeSidesMaximumCount
                           userInfo:userInfo];
}


+ (NSError *)sidesMinimumCountError {
    NSDictionary *userInfo
    = @{
        NSLocalizedDescriptionKey:
            NSLocalizedString(@"Setting count of sides is unsuccessful.", nil),
        NSLocalizedFailureReasonErrorKey:
            NSLocalizedString(@"The count of sides is less than 3.", nil),
        NSLocalizedRecoverySuggestionErrorKey:
            NSLocalizedString(@"The count of sides should be greater or equal to 3.", nil)
        };
    return [NSError errorWithDomain:POLYGON_ERROR_DOMAIN
                               code:PolygonErrorCodeSidesMinimumCount
                           userInfo:userInfo];
}


@end
