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

#import <UIKit/UIKit.h>

@interface UIColor (SebasUtility)
/**
 * Converts to hex color code.
 */
@property (nonatomic, copy, readonly) NSString *util_toHex;

/**
 * Creates UIColor object from given hex color code.
 *
 * @param hex e.g.) @"FF0000", @"#FF0000"
 */
+ (UIColor *)util_colorWithHex:(NSString *)hex;
/**
 * Creates UIColor object with RGBA values.
 *
 * @param red 0~255
 * @param green 0~255
 * @param blue 0~255
 * @param alpha 0~1.0
 */
+ (UIColor *)util_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 * Tests the receiver color is equal to given color comparing with RGBA values, ignoring color space.
 */
- (BOOL)util_isEqualToColor:(UIColor *)color;

@end
