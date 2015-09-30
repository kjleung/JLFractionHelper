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
//    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    
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
    
    /* */
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
//    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    int iWhole1 = [whole intValue];
    int iNumerator1 = [numerator intValue];
    int iDenominator1 = [denominator intValue];
    int iTotal1 = iDenominator1*iWhole1 + iNumerator1;

    /* */
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
//    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    int iWhole2 = [whole intValue];
    int iNumerator2 = [numerator intValue];
    int iDenominator2 = [denominator intValue];
    int iTotal2 = iDenominator2*iWhole2 + iNumerator2;

    
    int newTotal = iTotal1 * iTotal2;
    int newDenominator = iDenominator1 * iDenominator2;
    int newWhole = floorf(newTotal/newDenominator);
    int newNumerator = newTotal % newDenominator;
    
    NSString* fractionalPortion = [FractionHelper reduce:[NSString stringWithFormat:@"%d/%d", newNumerator, newDenominator]];
    
    if (newWhole == 0) {
        return fractionalPortion;
    }
    if (newNumerator == 0) {
        return [NSString stringWithFormat:@"%d", newWhole];
    }
    return [NSString stringWithFormat:@"%d %@", newWhole, fractionalPortion];
}

+ (NSString*) add:(NSString*) fraction withWholeNumber:(NSString*) wholeNumber {
    
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
//    NSLog(@"%@ %@ %@", wholePortion, numeratorPortion, denominatorPortion);
    
    int iWholePortion = [wholePortion intValue];
    int iNumeratorPortion = [numeratorPortion intValue];
    int iDenominatorPortion = [denominatorPortion intValue];
    int iWholeNumberToAdd = [wholeNumber intValue];
    iWholePortion += iWholeNumberToAdd;
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
//    NSLog(@"%@ %@ %@", wholePortion1, numeratorPortion1, denominatorPortion1);
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
//    NSLog(@"%@ %@ %@", wholePortion2, numeratorPortion2, denominatorPortion2);
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


+ (NSString*) minus:(NSString*) fraction withWholeNumber:(NSString*) wholeNumber {
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
//    NSLog(@"%@ %@ %@", wholePortion, numeratorPortion, denominatorPortion);
    
    int iWholePortion = [wholePortion intValue];
    int iNumeratorPortion = [numeratorPortion intValue];
    int iDenominatorPortion = [denominatorPortion intValue];
    
    int iWholeNumberSubtract = [wholeNumber intValue];
    
    if (iWholePortion != 0) {
        iNumeratorPortion += iWholePortion*iDenominatorPortion;
    }
    
    iNumeratorPortion -= iWholeNumberSubtract*iDenominatorPortion;
    
    iWholePortion = floorf(iNumeratorPortion/iDenominatorPortion);
    iNumeratorPortion = iNumeratorPortion % iDenominatorPortion;
    
    BOOL isNegative = iNumeratorPortion<0?YES:NO;
    
    NSString* fractionalPortion = [FractionHelper reduce:[NSString stringWithFormat:@"%d/%d", abs(iNumeratorPortion), abs(iDenominatorPortion)]];
    if (iWholePortion == 0) {
        if (isNegative) {
            return [NSString stringWithFormat:@"-%@", fractionalPortion];
        } else {
            return fractionalPortion;
        }
    }
    if (iNumeratorPortion == 0) {
        return [NSString stringWithFormat:@"%d", iWholePortion];
    }
    return [NSString stringWithFormat:@"%d %@", iWholePortion, fractionalPortion];
}

+ (NSString*) minus:(NSString*) fraction withFractionalNumber:(NSString*) fractionalNumber {
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
//    NSLog(@"%@ %@ %@", wholePortion1, numeratorPortion1, denominatorPortion1);
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
    int iNewNumerator = (iWholePortion1*iNewDenominator + iNumeratorPortion1*iDenominatorPortion2) - (iWholePortion2*iNewDenominator + iNumeratorPortion2*iDenominatorPortion1);
    int iNewWhole = floorf(iNewNumerator/iNewDenominator);
    iNewNumerator = iNewNumerator % iNewDenominator;
    
    BOOL isNegative = iNewNumerator<0?YES:NO;
    
    NSString* fractionalPortion = [FractionHelper reduce:[NSString stringWithFormat:@"%d/%d", abs(iNewNumerator), abs(iNewDenominator)]];

    if (iNewWhole == 0) {
        if (isNegative) {
            return [NSString stringWithFormat:@"-%@", fractionalPortion];
        } else {
            return fractionalPortion;
        }
    }
    if (iNewNumerator == 0) {
        return [NSString stringWithFormat:@"%d", iNewWhole];
    }
    return [NSString stringWithFormat:@"%d %@", iNewWhole, fractionalPortion];
}

+ (NSString*) divide:(NSString*) fraction withWholeDivider:(NSString*) divider {
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
//    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    
    int iWhole = [whole intValue];
    int iNumerator = [numerator intValue];
    int iDenominator = [denominator intValue];
    int iDivider = [divider intValue];
    int iTotal = iDenominator*iWhole + iNumerator;
    iDenominator *= iDivider;
    
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

+ (NSString*) divide:(NSString*) fraction withFractionalDivider:(NSString*) divider {
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
//    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    int iWhole1 = [whole intValue];
    int iNumerator1 = [numerator intValue];
    int iDenominator1 = [denominator intValue];
    iNumerator1 = iDenominator1*iWhole1 + iNumerator1;
    
    if ([divider containsString:@" "]) {
        token = [divider componentsSeparatedByString:@" "];
        whole = token[0];
        token = [token[1] componentsSeparatedByString:@"/"];
    } else {
        whole = @"0";
        token = [divider componentsSeparatedByString:@"/"];
    }
    numerator = token[0];
    denominator = token[1];
//    NSLog(@"%@ %@ %@", whole, numerator, denominator);
    int iWhole2 = [whole intValue];
    int iNumerator2 = [numerator intValue];
    int iDenominator2 = [denominator intValue];
    iNumerator2 = iDenominator2*iWhole2 + iNumerator2;
    
    int newNumerator = iNumerator1 * iDenominator2;
    int newDenominator = iNumerator2 * iDenominator1;
    int newWhole = floorf(newNumerator/newDenominator);
    newNumerator = newNumerator % newDenominator;
    
    NSString* fractionalPortion = [FractionHelper reduce:[NSString stringWithFormat:@"%d/%d", newNumerator, newDenominator]];
    
    if (newWhole == 0) {
        return fractionalPortion;
    }
    if (newNumerator == 0) {
        return [NSString stringWithFormat:@"%d", newWhole];
    }
    return [NSString stringWithFormat:@"%d %@", newWhole, fractionalPortion];
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
    
    if (n == 0 || m == 0) {
        return 1;
    }
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
