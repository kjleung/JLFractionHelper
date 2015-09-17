//
//  FractionHelper.m
//  Fraction
//
//  Created by Joe Leung on 9/14/15.
//  Copyright (c) 2015 Joe Leung. All rights reserved.
//

#import "FractionHelper.h"

@implementation FractionHelper

+ (NSString*) multiply:(NSString*) fraction withMultiplier:(NSString*) multiplier {

    NSArray* token;
    NSString* whole;
    NSString* numerator;
    NSString* denominator;
    if ([fraction containsString:@" "]) {
        token = [fraction componentsSeparatedByString:@" "];
        whole = token[0];
        token = [token[1] componentsSeparatedByString:@"/"];
    } else {
        whole = @"0";
        token = [fraction componentsSeparatedByString:@"/"];
    }
    numerator = token[0];
    denominator = token[1];
    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    
    int iWhole = [whole intValue];
    int iNumerator = [numerator intValue];
    int iDenominator = [denominator intValue];
    int iMultipler = [multiplier intValue];
    int iTotal = iDenominator*iWhole + iNumerator;
    iTotal *= iMultipler;
    
    iWhole = floorf(iTotal/iDenominator);
    iNumerator = iTotal % iDenominator;
    if (iWhole == 0) {
        return [NSString stringWithFormat:@"%d/%d", iNumerator, iDenominator];
    }
    if (iNumerator == 0) {
        return [NSString stringWithFormat:@"%d", iWhole];        
    }
    return [NSString stringWithFormat:@"%d %d/%d", iWhole, iNumerator, iDenominator];
}

+ (NSString*) multiply:(NSString*) fraction withFractionalMultiplier:(NSString*) multiplier {
    
    NSArray* token;
    NSString* whole;
    NSString* numerator;
    NSString* denominator;
    
    if ([fraction containsString:@" "]) {
        token = [fraction componentsSeparatedByString:@" "];
        whole = token[0];
        token = [token[1] componentsSeparatedByString:@"/"];
    } else {
        whole = @"0";
        token = [fraction componentsSeparatedByString:@"/"];
    }
    numerator = token[0];
    denominator = token[1];
    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    int iWhole1 = [whole intValue];
    int iNumerator1 = [numerator intValue];
    int iDenominator1 = [denominator intValue];
    int iTotal1 = iDenominator1*iWhole1 + iNumerator1;


    if ([multiplier containsString:@" "]) {
        token = [multiplier componentsSeparatedByString:@" "];
        whole = token[0];
        token = [token[1] componentsSeparatedByString:@"/"];
    } else {
        whole = @"0";
        token = [multiplier componentsSeparatedByString:@"/"];
    }
    numerator = token[0];
    denominator = token[1];
    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    int iWhole2 = [whole intValue];
    int iNumerator2 = [numerator intValue];
    int iDenominator2 = [denominator intValue];
    int iTotal2 = iDenominator2*iWhole2 + iNumerator2;

    
    iTotal1 = iTotal1 * iTotal2;
    iDenominator1 = iDenominator1 * iDenominator2;
    iWhole1 = floorf(iTotal1/iDenominator1);
    iNumerator1 = iTotal1 % iDenominator1;
    if (iWhole1 == 0) {
        return [NSString stringWithFormat:@"%d/%d", iNumerator1, iDenominator1];    
    }
    if (iNumerator1 == 0) {
        return [NSString stringWithFormat:@"%d", iWhole1];
    }
    return [NSString stringWithFormat:@"%d %d/%d", iWhole1, iNumerator1, iDenominator1];
}

@end
