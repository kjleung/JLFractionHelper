//
//  FractionHelper.m
//  Fraction
//
//  Created by Joe Leung on 9/14/15.
//  Copyright (c) 2015 Joe Leung. All rights reserved.
//

#import "FractionHelper.h"


@implementation FractionHelper

+ (NSString*) multiply:(NSString*) fraction withWholeMultiplier:(NSString*) multiplier {

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
    
    NSString* fractionalPortion = [FractionHelper reduce:[NSString stringWithFormat:@"%d/%d", iNumerator, iDenominator]];
    if (iWhole == 0) {
        return fractionalPortion;
    }
    if (iNumerator == 0) {
        return [NSString stringWithFormat:@"%d", iWhole];        
    }
    return [NSString stringWithFormat:@"%d %@", iWhole, fractionalPortion];
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
    
    NSString* fractionalPortion = [FractionHelper reduce:[NSString stringWithFormat:@"%d/%d", iNumerator1, iDenominator1]];
    
    if (iWhole1 == 0) {
        return fractionalPortion;
    }
    if (iNumerator1 == 0) {
        return [NSString stringWithFormat:@"%d", iWhole1];
    }
    return [NSString stringWithFormat:@"%d %@", iWhole1, fractionalPortion];
}

+ (NSString*) add:(NSString*) fraction withWholeNumber:(NSString*) wholeNumber {
    
    fraction = [FractionHelper reduce:fraction];
    NSArray* token;
    NSString* wholePortion;
    NSString* numeratorPortion;
    NSString* denominatorPortion;
    if ([fraction containsString:@" "]) {
        token = [fraction componentsSeparatedByString:@" "];
        wholePortion = token[0];
        token = [token[1] componentsSeparatedByString:@"/"];
    } else {
        wholePortion = @"0";
        token = [fraction componentsSeparatedByString:@"/"];
    }
    numeratorPortion = token[0];
    denominatorPortion = token[1];
    NSLog(@"%@ %@ %@", wholePortion, numeratorPortion, denominatorPortion);
    
    int iWholePortion = [wholePortion intValue];
    int iNumeratorPortion = [numeratorPortion intValue];
    int iDenominatorPortion = [denominatorPortion intValue];
    int iWholeNumber = [wholeNumber intValue];
    iWholePortion += iWholeNumber;
    return [NSString stringWithFormat:@"%d %d/%d", iWholePortion, iNumeratorPortion, iDenominatorPortion];
}

+ (NSString*) add:(NSString*) fraction withFractionalNumber:(NSString*) fractionalNumber {
    
    NSArray* token;
    NSString* wholePortion1;
    NSString* numeratorPortion1;
    NSString* denominatorPortion1;
    if ([fraction containsString:@" "]) {
        token = [fraction componentsSeparatedByString:@" "];
        wholePortion1 = token[0];
        token = [token[1] componentsSeparatedByString:@"/"];
    } else {
        wholePortion1 = @"0";
        token = [fraction componentsSeparatedByString:@"/"];
    }
    numeratorPortion1 = token[0];
    denominatorPortion1 = token[1];
    NSLog(@"%@ %@ %@", wholePortion1, numeratorPortion1, denominatorPortion1);
    
    int iWholePortion1 = [wholePortion1 intValue];
    int iNumeratorPortion1 = [numeratorPortion1 intValue];
    int iDenominatorPortion1 = [denominatorPortion1 intValue];

    NSString* wholePortion2;
    NSString* numeratorPortion2;
    NSString* denominatorPortion2;
    if ([fractionalNumber containsString:@" "]) {
        token = [fractionalNumber componentsSeparatedByString:@" "];
        wholePortion2 = token[0];
        token = [token[1] componentsSeparatedByString:@"/"];
    } else {
        wholePortion2 = @"0";
        token = [fractionalNumber componentsSeparatedByString:@"/"];
    }
    numeratorPortion2 = token[0];
    denominatorPortion2 = token[1];
    NSLog(@"%@ %@ %@", wholePortion2, numeratorPortion2, denominatorPortion2);
    
    int iWholePortion2 = [wholePortion2 intValue];
    int iNumeratorPortion2 = [numeratorPortion2 intValue];
    int iDenominatorPortion2 = [denominatorPortion2 intValue];
    
    
    int iNewDenominator = iDenominatorPortion1 * iDenominatorPortion2;
    int iNewNumerator = iNumeratorPortion1*iDenominatorPortion2 + iNumeratorPortion2*iDenominatorPortion1;
    
    int iNewWhole = iWholePortion1 + iWholePortion2;
    
    iNewWhole += floorf(iNewNumerator/iNewDenominator);
    iNewNumerator = iNewNumerator % iNewDenominator;
    
    NSString* fractionalPortion = [FractionHelper reduce:[NSString stringWithFormat:@"%d/%d", iNewNumerator, iNewDenominator]];
    if (iNewWhole == 0) {
        return fractionalPortion;
    }
    if (iNewNumerator == 0) {
        return [NSString stringWithFormat:@"%d", iNewWhole];
    }
    return [NSString stringWithFormat:@"%d %@", iNewWhole, fractionalPortion];
}

+ (NSString*) reduce:(NSString*) fractionNumber {
    NSArray* token;
    token = [fractionNumber componentsSeparatedByString:@"/"];
    int m = (int) [token[0] integerValue];
    int n = (int) [token[1] integerValue];
    
    int commonDenominator = gcd(m, n);
    
    m = m/commonDenominator;
    n = n/commonDenominator;
    return [NSString stringWithFormat:@"%d/%d", m, n];
}

int gcd(int m, int n) {
    
    int t, r;
    
    if (m < n) {
        t = m;
        m = n;
        n = t;
    }
    
    r = m % n;
    
    if (r == 0) {
        return n;
    } else {
        return gcd(n, r);
    }
}


@end
