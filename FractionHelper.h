//
//  FractionHelper.h
//  Fraction
//
//  Created by Joe Leung on 9/14/15.
//  Copyright (c) 2015 Joe Leung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FractionHelper : NSObject

+ (NSString*) multiply:(NSString*) fraction withMultiplier:(NSString*) multiplier;

+ (NSString*) multiply:(NSString*) fraction withFractionalMultiplier:(NSString*) multiplier;

@end
