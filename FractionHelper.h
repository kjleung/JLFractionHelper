//
//  FractionHelper.h
//  Fraction
//
//  Created by Joe Leung on 9/14/15.
//  Copyright (c) 2015 Joe Leung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FractionHelper : NSObject

+ (NSString*) multiply:(NSString*) fraction withWholeMultiplier:(NSString*) multiplier;

+ (NSString*) multiply:(NSString*) fraction withFractionalMultiplier:(NSString*) multiplier;

+ (NSString*) add:(NSString*) fraction withWholeNumber:(NSString*) wholeNumber;

+ (NSString*) add:(NSString*) fraction withFractionalNumber:(NSString*) fractionalNumber;

+ (NSString*) reduce:(NSString*) fractionNumber;

+ (NSString*) minus:(NSString*) fraction withWholeNumber:(NSString*) wholeNumber;

+ (NSString*) minus:(NSString*) fraction withFractionalNumber:(NSString*) fractionalNumber;

+ (NSString*) divide:(NSString*) fraction withWholeDivider:(NSString*) divider;

+ (NSString*) divide:(NSString*) fraction withFractionalDivider:(NSString*) divider;

@end
