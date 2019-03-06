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

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SebasUtility)
/**
 * Converts the receiver string to the QR Code image.
 */
@property (nonatomic, readonly) UIImage *util_toQRCodeImage;
/**
 * Converts the receiver hexadecimal character string to hexadecimal positive number.
 */
@property (nonatomic, readonly) unsigned int util_toHexInt;
/**
 * Returns MD5 hash value. If the number of characters is 0, the receiver string returns nil.
 */
@property (nonatomic, readonly, nullable) NSString *util_toMD5;

/**
 * Converts NSData to hexadecimal character string.
 */
+ (instancetype)util_hexStringWithData:(NSData *)data;

/**
 * Returns a new string entirely replaced `aString` with `bString`.
 */
- (NSString *)util_replacedString:(NSString *)aString withString:(NSString *)bString;
/**
 * Returns the size of the receiver string when specified font is applied.
 */
- (CGSize)util_sizeWithFont:(UIFont *)font;

/**
 * Returns the height when specified font is applied.
 */
+ (CGFloat)util_heightWithFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
