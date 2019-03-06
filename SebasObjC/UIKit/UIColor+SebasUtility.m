//
//  SebasObjC
//
//  MIT License
//
//  Copyright (c) 2018-present Hituzi Ando
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "UIColor+SebasUtility.h"

@implementation UIColor (SebasUtility)

- (NSString *)util_toHex {
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    NSInteger intR = r * 255;
    NSInteger intG = g * 255;
    NSInteger intB = b * 255;

    return [NSString stringWithFormat:@"%02zX%02zX%02zX", intR, intG, intB];
}

+ (UIColor *)util_colorWithHex:(NSString *)hex {
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringFromIndex:1];
    }

    float r, g, b;
    NSScanner *scanner;
    scanner = [NSScanner scannerWithString:[@"0x" stringByAppendingString:
                                                      [hex substringWithRange:NSMakeRange(0, 2)]]];
    [scanner scanHexFloat:&r];
    scanner = [NSScanner scannerWithString:[@"0x" stringByAppendingString:
                                                      [hex substringWithRange:NSMakeRange(2, 2)]]];
    [scanner scanHexFloat:&g];
    scanner = [NSScanner scannerWithString:[@"0x" stringByAppendingString:
                                                      [hex substringWithRange:NSMakeRange(4, 2)]]];
    [scanner scanHexFloat:&b];

    return [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
}

+ (UIColor *)util_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255.f green:green / 255.f blue:blue / 255.f alpha:alpha];
}

- (BOOL)util_isEqualToColor:(UIColor *)color {
    CGFloat r1, g1, b1, a1;
    CGFloat r2, g2, b2, a2;
    [self getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color getRed:&r2 green:&g2 blue:&b2 alpha:&a2];

    return r1 == r2 && g1 == g2 && b1 == b2 && a1 == a2;
}

@end
